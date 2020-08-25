class ItemsController < ApplicationController
  require "payjp"
  before_action :set_item, only: [:buy, :pay, :show, :edit, :update, :destroy]
  before_action :set_item_buy, only: [:buy, :pay]

  def index
    @items = Item.includes(:item_images).order('created_at DESC')
    @items = Item.includes(:user)
    @items = Item.all.order(created_at: :desc)
    @items = Item.all.order(updated_at: :desc)
  end

  def new
    @item = Item.new
    @item_image = @item.item_images.build
    @category_parent_array = Category.where(ancestry: nil)
  end
  
  def get_category_children
    @category_children = Category.find("#{params[:parent_id]}").children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else 
      @category_parent_array = Category.where(ancestry: nil)
      render "/items/new"
    end
  end
  
  def edit
    if user_signed_in? && current_user.id == @item.seller_id
      @category_parent_array = Category.where(ancestry: nil)
      @category_child_array = @item.category.parent.siblings
      @category_grandchild_array = @item.category.siblings
    else
      redirect_to root_path
    end
  end

  def update
    @category_parent_array = Category.where(ancestry: nil)
    @category_child_array = @item.category.parent.siblings
    @category_grandchild_array = @item.category.siblings
    if user_signed_in? && current_user.id == @item.seller_id
        @item.update(item_params)
        redirect_to root_path
    else
      render "/items/edit", alert: "更新できませんでした"
    end
  end

  def show
    @seller = @item.seller.nickname
    @condition = @item.item_condition.condition
    @postage_payer = @item.postage_payer.payer
    @item_prefecture = @item.prefecture.name
    @preparation_day = @item.preparation_day.day
    @grandchild = Category.find(@item.category_id)
    @child = @grandchild.parent
    @parent = @child.parent
  end

  def destroy
    if user_signed_in? && current_user.id == @item.seller_id
      @item.destroy
    else
      redirect_to root_path
    end
  end

  def favorites
    @items = current_user.favorite_items.includes(:user)
  end


  def buy
    if user_signed_in? && current_user.credit_card.present?
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
      @card = CreditCard.find_by(user_id: current_user.id)
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @customer_card = customer.cards.retrieve(@card.card_id)
      @card_brand = @customer_card.brand
      case @card_brand
      when "Visa"
        @card_src = "visa.png"
      when "JCB"
        @card_src = "jcb.png"
      when "MasterCard"
        @card_src = "master.png"
      when "American Express"
        @card_src = "amex.png"
      when "Diners Club"
        @card_src = "diners.png"
      when "Discover"
        @card_src = "discover.png"
      end
      @exp_month = @customer_card.exp_month.to_s
      @exp_year = @customer_card.exp_year.to_s.slice(2,3)
    else
      redirect_to item_path(@item.id), alert: "クレジットカードを登録してください"
      return false
    end
  end
  
  
  def pay
    @item.with_lock do
      if current_user.credit_card.present?
        @card = CreditCard.find_by(user_id: current_user.id)
        Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
        charge = Payjp::Charge.create(
          amount: @item.price,
          customer: Payjp::Customer.retrieve(@card.customer_id),
          currency: 'jpy'
        )
      else
        Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
        Payjp::Charge.create(
          amount: @item.price,
          card: params['payjp-token'],
          currency: 'jpy'
        )
      end
      @item.update(buyer_id: current_user.id)
    end
  end
  
  def search
    if params[:q].present?
      @search = Item.ransack(search_params)
      @q = Item.ransack(params[:q])
      @items = @search.result
    else
      params[:q] = { sorts: 'id desc' }
      @search = Item.ransack()
      @items = Item.all
    end
    render "/searches/index"
  end

  def search_params
    params.require(:q).permit(:sorts, :name_cont, :price_lteq, :price_gteq, :item_condition_id)
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :item_introduction, :item_condition_id, :brand, :postage_payer_id, :preparation_day_id, :prefecture_id, :category_id, item_images_attributes: [:id, :url, :_destroy]).merge(seller_id: current_user.id)
  end
  
  def set_item
    @item = Item.find(params[:id])
  end

  def set_item_buy
    if current_user.id == @item.seller_id
      redirect_to item_path(@item.id), alert: "出品した商品は購入できません"
      return false
    end
    if @item.buyer_id.present?
      redirect_to item_path(@item.id), alert: "この商品は売り切れています"
      return false
    end
  end

end
class ItemsController < ApplicationController
  def index
    @items = Item.includes(:item_images).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.item_images.new
    @item.build_brand
  end

  def edit
    
  end

  def destroy
    
  end

  def create
    brand = Brand.new(brand_params)
    brand.save
    @item = Item.new(item_params.merge(brand_id: brand.id))
    if @item.save
      redirect_to root_path
    else
      render "/items/new"
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render "/items/new"
    end
  end

  def show
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :item_introduction, :item_condition_id, :postage_payer_id, :preparation_day_id, :prefecture_id).merge(seller_id: current_user.id)
  end

  def brand_params
    params.require(:item).permit(:brand_name)
  end

  def buy
  end

  def pay
  end
end
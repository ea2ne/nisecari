class ItemsController < ApplicationController
  require "payjp"
  before_action :set_item, only: [:buy, :pay]
  def index
    @items = Item.includes(:item_images).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.item_images.new
    @category_parent_array = Category.where(ancestry: nil)

  end
  
    def get_category_children
      @category_children = Category.find("#{params[:parent_id]}").children
    end

    def get_category_grandchildren
      @category_grandchildren = Category.find("#{params[:child_id]}").children
    end

  def create
    
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  
  def create
    @item = Item.new(item_params)
    if @item.save!
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
    # @category_id = @item.category_id
    # @category_parent = Category.find(@category_id).parent.parent
    # @category_child = Category.find(@category_id).parent
    # @category_grandchild = Category.find(@category_id)
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :item_introduction, :item_condition_id, :postage_payer_id, :preparation_day_id, :prefecture_id).merge(seller_id: current_user.id)
  end
end
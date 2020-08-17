class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    # @parents = Category.all.order("id ASC").limit(13)
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
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :item_introduction, :item_condition_id, :postage_payer_id, :preparation_day_id, :prefecture_id).merge(seller_id: current_user.id)
  end
end

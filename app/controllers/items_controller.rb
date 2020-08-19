class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]

  def index
    @items = Item.includes(:item_images).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.item_images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path      
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path      
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end
  
  def show
  end

  def buy
  end

  def pay
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :trading_status,  item_images_attributes: [:url, :_destroy, :id])
  end

  def set_item
    @item = Item.find(params[:id])
  end
end

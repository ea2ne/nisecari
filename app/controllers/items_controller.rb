class ItemsController < ApplicationController
  def index
  end

  def new
  end
  
  def show
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
  end
end

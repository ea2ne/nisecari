class ItemsController < ApplicationController
  def index
  end

  def new
  end
  
  def show
  end

  def destroy
    item = Item.find(params[:id])
      if item.user_id == current_user.id
        item.destroy
      end
  end
end

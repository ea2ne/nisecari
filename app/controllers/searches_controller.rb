class SearchesController < ApplicationController
  before_action :set_ransack

  def index
    @items = Item.search(params[:search]).limit(132)
    @search = params[:search]
    @items = Item.all.order(created_at: :desc)
    @items = Item.all.order(updated_at: :desc)
  end

  def set_ransack
    @q = Item.ransack(params[:q])
  end
end

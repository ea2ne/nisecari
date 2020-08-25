class SearchesController < ApplicationController
  before_action :set_ransack

  def index
    @items = Item.search(params[:q][:name_cont]).limit(132).order(created_at: :desc)
    @search = params[:search]
  end

  def detail_search
    @search_item = Item.ransack(params[:q]) 
    @items = @search_item.result.page(params[:page])
  end

  def set_ransack
    @q = Item.ransack(params[:q])
  end
end

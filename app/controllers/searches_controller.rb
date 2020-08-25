class SearchesController < ApplicationController
  before_action :set_ransack

  def index
    @items = Item.search(params[:search]).limit(132)
    @search = params[:search]
  end
end

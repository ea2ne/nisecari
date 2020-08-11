class ItemsController < ApplicationController
before_action :category_parent_array, only: [:new, :create, :edit]
before_action :set_item, only:[:show, :edit, :update, :destroy]
before_action :show_all_instance, only: [:show, :edit, :destroy]

  def index
  end

  def edit
    grandchild = @item.category
    child = grandchild.parent
    if @catefory_id == 46 or @category_id ==74 or @category_id == 134 or @category_id == 142 or @category_id == 147 or @category_id == 150 or @category_id == 158      
    else
      @parent_arrey = []
      @parent_arrey << @item.category.parent.parent.name
      @parent_arrey << @item.category.parent.parent.id
    end
    @category_children_array = Category/where(ancestry: child.ancestry)
    @child_arrey = []
    @child_arrey << child.name
    @child_arrey << child.id

    @category_grandchildren_array = Category.where(ancestry: grandchild.ancestry)
    @grandchild_arrey = []
    @grandchild_arrey << grandchild.name
    @grandchild_arrey << grandchild.id

  end

  def update
    if item_params[:images_attributes].nil?
      flash.now[:alert] = '更新できませんでした。【画像を１枚以上入れてください】'
      render :edit
    else
      edit_ids = []
      item_params[:images_attributes].each do |a,b|
        edit_ids << item_params[:images_attributes].dig(:"#{a}",:id).to_i
      end
      ids = Image.where(item_id:params[:id]).map{|image| image.id }
      delete_db = ids - exit_ids
      Image.where(id:delete_db).destroy_all
      @item.touch
      if @item.update(item_params)
        redirect_to update_done_items_path
      else
        flashu.now[:alert] = '更新できませんでした'
        render :edit
      end
    end
  end

  def update_done
    @item_update = Item.order("updated_at DESC").first
  end

  private
  def item_params
    params.require(:item).permit(:name, :item_explanation, :category_id, :item_status, :auction_status, :delivery_fee, :shopping_origin, :exhibition_price, :brand_name, :days_until_shopping, images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def category_parent_array
    @category_parent_array = Category.where(ancestry: nil).each do |parent|
    end
  end

  def show_all_instance
    @user = User.find(@item.user_id)
    @images = Images.where(item_id: params[:id])
    @images_first= Image.where(item_id: params[:id]).first
    @category_id = @item.category_id
    @category_parent = Category.find(@category_id).parent.parent
    @category_child = Category.find(@category_id).parent
    @category_grandchild = Category.find(@category_id)
  end
end

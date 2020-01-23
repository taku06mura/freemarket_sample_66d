class ItemsController < ApplicationController
  before_action :set_parent, only: [:new, :create, ]
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @saler_other_items = Item.where(saler_id: @item.saler.id) 
    @same_category_items = Item.where(category_id: @item.category.id)
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end

  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
  
  private

  def set_parent
    @category_parent_array = Category.where(ancestry: nil).pluck(:name)
  end
  
  def item_params
    params.require(:item).permit(:name, :item_discription, :category_id, :size, :brand_name, :quolity, :prefecture, :price, :carriage_fee, :delivery, :days, images_attributes: [:source]).merge(saler_id: current_user.id)
  end
 
end

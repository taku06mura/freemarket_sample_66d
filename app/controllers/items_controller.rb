class ItemsController < ApplicationController
  before_action :set_parent, only: [:new, :create, ]
  def index
  end

  def show
  end

  def new
    @item = Item.new
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
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

 # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
  
  private

  def set_parent
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end
  
  def item_params
    params.require(:item).permit(:name, :item_discription, :category_id, :size, :brand_name, :quolity, :prefecture, :price, :carriage_fee, :delivery, :days, images_attributes: [:source]).merge(saler_id: current_user.id)
  end
 
end

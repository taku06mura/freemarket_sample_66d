class ItemsController < ApplicationController
  before_action :set_parent, only: [:new, :create, :edit]
  before_action :set_item, only: [:edit, :update, :destroy]
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


  def search
    @items = Item.search(params[:keyword])
  end

  def pay
    @item = Item.find(params[:id])
    card = current_user.card
    id = card.customer_id
    @item.update(buyer_id: current_user.id)
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    charge = Payjp::Charge.create(
    amount: @item.price,
    customer: current_user.card.customer_id,
    currency: 'jpy'
    )
    redirect_to done_purchase_index_path
    
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end

  end

   def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :edit
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

  def set_item
    @item = Item.find(params[:id])
  end
  
  def item_params
    params.require(:item).permit(:name, :item_discription, :category_id, :size, :brand_name, :quolity, :prefecture, :price, :carriage_fee, :delivery, :days, images_attributes: [:source, :_destroy, :id]).merge(saler_id: current_user.id)
  end
 
end

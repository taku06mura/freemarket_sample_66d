class MypagesController < ApplicationController
  before_action :set_user

  def show
  end

  def edit
  end

  def logout
  end

  def on_sale
    @items = Item.where(saler_id: params[:id])
  end

  private
  
  def set_user
    @user = User.find(params[:id])
  end

end

class MypagesController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def logout
  end

  def on_sale
    @user = User.find(params[:id])
    @items = Item.where(saler_id: params[:id])
  end

end

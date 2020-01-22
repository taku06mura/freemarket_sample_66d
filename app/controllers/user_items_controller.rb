class UserItemsController < ApplicationController

  def index
    @user = current_user.id
    @items = Item.where(saler_id: current_user.id)
  end
end

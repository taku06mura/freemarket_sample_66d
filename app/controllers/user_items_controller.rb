class UserItemsController < ApplicationController

  def index
    @items = Item.where(saler_id: current_user.id)
  end
end

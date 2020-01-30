class PurchaseController < ApplicationController
  
  def index
    card = Card.find_by(user_id: current_user.id)
    @item = Item.find(params[:item_id])
  end

  def done
  
 
  end
end


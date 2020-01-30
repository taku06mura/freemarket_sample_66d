class PurchaseController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
  end

  def done
  end
end


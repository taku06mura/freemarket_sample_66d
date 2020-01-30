class CardsController < ApplicationController

  before_action :get_payjp_info, only: [:new, :create, :delete, :show]

  def new
  end

  def create
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.create(card: params["payjp-token"])
    @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
    if @card.save
      redirect_to action: "show", id: current_user.id
    else
      redirect_to cards_path
    end
  end

  def show
    card = Card.find_by(user_id: current_user.id)
    if card.present?
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    else
      redirect_to cards_path
    end
  end

  private

  def get_payjp_info
    if Rails.env == 'development'
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    end
  end

  def card_params
    params.permit('payjp-token',:item_id)
  end
end

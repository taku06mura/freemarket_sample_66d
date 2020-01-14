class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    devise_parameter_sanitizer.permit(:sign_up, keys: [personal_datum_attributes:  [:first_name, 
                                                                                    :last_name, 
                                                                                    :kana_first_name, 
                                                                                    :kana_last_name, 
                                                                                    :birthday_year, 
                                                                                    :birthday_month, 
                                                                                    :birthday_day, 
                                                                                    :phone_number, 
                                                                                    :user_id]])
    devise_parameter_sanitizer.permit(:sign_up, keys: [address_attributes: [:prefecture, 
                                                                            :postal_code, 
                                                                            :municipality,
                                                                            :house_number,
                                                                            :building_name,
                                                                            :user_id]])
  before_action :basic_auth, if: :production?

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end

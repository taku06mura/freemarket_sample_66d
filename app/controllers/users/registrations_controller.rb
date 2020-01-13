# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:new, :new_phone, :create_user, :create_phone, :create_address]
  before_action :create_user, only: :new_phone
  before_action :create_phone, only: :new_address
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
 
  def new
    @user = User.new
    @user.build_personal_datum
  end
  
  def create_user
    @user = User.new(user_params)
    # unless @user.valid?
    #   flash.now[:alert] = @user.errors.full_messages
    #   render :new and return
    # end
    session[:user_params] = user_params
    session[:after_new_user] = user_params[:personal_datum_attributes]
    @user = User.new(session[:user_params])
    @user.build_personal_datum(session[:after_new_user])
    render :new_phone
  end

  def new_phone
    @user = User.new
    @user.build_personal_datum
  end

  def create_phone
    session[:after_create_phone]= user_params[:personal_datum_attributes]
    session[:after_create_phone].merge!(session[:after_new_user])
    @user = User.new
    @user.build_personal_datum(session[:after_create_phone])
    binding.pry
    render :new_address
  end

  def new_address
    # @user.build_address
  end

  def create_address
    @user = User.new(session["devise.regist_data"]["user"])
    @address = Address.new(address_params)
    unless @address.valid?
      flash.now[:alert] = @address.errors.full_messages
      render :new_address and return
    end
    @user.build_address(@address.attributes)
    @user.save
    sign_in(:user, @user)
  end
    
  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  private

  def user_params
    params.require(:user).permit(:nickname, 
                                 :email, 
                                 :password, 
                                 :password_confirmation,
                                  personal_datum_attributes: [:first_name, 
                                                              :last_name, 
                                                              :kana_first_name, 
                                                              :kana_last_name, 
                                                              :birthday_year, 
                                                              :birthday_month, 
                                                              :birthday_day, 
                                                              :phone_number, 
                                                              :user_id]
                                )
  end

  def personal_datum_params
    params.require(:personal_datum_attributes).permit(:first_name, 
                                           :last_name, 
                                           :kana_first_name, 
                                           :kana_last_name, 
                                           :birthday_year, 
                                           :birthday_month, 
                                           :birthday_day, 
                                           :phone_number,
                                           :user_id
                                          )
  end

  def address_params
    params.require(:address).permit(:prefectures, :postal_code, :municipality, :address, :building_name, :user_id)
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [personal_datum_attributes:  [:first_name, 
                                                                                    :last_name, 
                                                                                    :kana_first_name, 
                                                                                    :kana_last_name, 
                                                                                    :birthday_year, 
                                                                                    :birthday_month, 
                                                                                    :birthday_day, 
                                                                                    :phone_number, 
                                                                                    :user_id]])
  end

end

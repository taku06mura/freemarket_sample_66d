# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
 
  # POST /resource
  # def new
  #   super
  # end
  
  def create
    @user = User.new(sign_up_params)
    @personal_data = Personal_data.new
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
    unless @personal_data.valid?
      flash.now[:alert] = @personal.errors.full_messages
      render :new and return
    end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    session["personal_data"] = @personal_data

    @address = @user.build_address
    render :new_address
  end

  # POST /resource
  # def create
  #   super
  # end

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

  def sign_up_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation)
  end

  def personal_data_params
    params.require(:personal_data).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, 
                                          :birthday_year, :birthday_month, :birthday_day, :phone_number,
                                          :user_id)
  end

  def address_params
    params.require(:address).permit(:prefectures, :postal_code, :municipality, :address, :building_name, :user_id)
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

end

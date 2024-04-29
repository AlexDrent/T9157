# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_permitted_parameters
  before_action :configure_account_update_params, only: [:update]
  #
  # GET /resource/sign_up
  def new
    super
    #resource.update(role_id: Role.find_by(name: 'unregistered').id)



  end

  # POST /resource
  # def create
  #   resource.update(role_id: Role.find_by(name: 'unregistered').id)
  #     #(role_id: Role.find_by(name: 'unregistered').id)
  #   super
  #
  #
  # end
  #
  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end
  #
  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # # Forces the session data which is usually expired after sign
  # # in to be expired now. This is useful if the user wants to
  # # cancel oauth signing in/up in the middle of the process,
  # # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :role_id])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute, :role_id])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:attribute, :role_id])
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    resource.update(role_id: Role.find_by(name: 'unregistered').id)

    super(resource)
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end

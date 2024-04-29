# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   resource.update(role_id: Role.find_by(name: 'unregistered').id)
  #
  # super
  #
  # end
  # def create
  #   super
  #   if resource.persisted?
  #     flash[:notice] = "Signed in successfully."
  #     redirect_to root_path  # Redirect to the desired path after sign-in
  #   end
  #
  # end

  # POST /resource/sign_in
  # def create
  #   super
  #   resource.update(role_id: Role.find_by(name: 'unregistered').id)
  #
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute, :role_id])
  end
end

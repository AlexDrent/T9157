class ChangeController < ApplicationController
  # authorize_resource :class => false
  # include ChangeHelper
  #
  # def users
  #   @users = User.where.not(:id => current_user.id)
  # end
  #
  # def new
  #   @user = User.new
  # end
  # def create
  #
  # end
  # def edit
  #   @user = User.find(params[:id])
  #
  # end
  # def update
  #   @user = User.find(params[:id])
  #   if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
  #     params[:user].delete(:password)
  #     params[:user].delete(:password_confirmation)
  #   end
  #
  #   if @user.update(user_params)
  #     flash[:notice] = "Updated User"
  #     redirect_to root_path
  #   else
  #     render :action => :edit
  #   end
  # end
  #
  # private
  #
  # def user_params
  #   params.require(:user).permit(:attribute, :role_id)
  # end
end

































# class ManagerController < ApplicationController
#   authorize_resource :class => false
#   include ManagerHelper
#
#   def users
#     @users = User.where.not(:id => current_user.id)
#   end
#
#   def new
#     @user = User.new
#   end
#
#   def create
#     @user = User.new(user_params)
#     if @user.save
#       flash[:notice] = "Successfully created User."
#       redirect_to root_path
#     else
#       render :action => 'new'
#     end
#   end
#
#   def edit
#     @user = User.find(params[:id])
#     @companies = Company.all
#
#   end
#
#   def update
#     @user = User.find(params[:id])
#     params[:user][:id].delete(:password) if params[:user][:password].blank?
#     params[:user][:id].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
#
#     if @user.update(user_params)
#       flash[:notice] = "Successfully updated User."
#       redirect_to root_path
#     else
#       render :action => 'edit'
#     end
#   end
#
# end
# private
#
# def user_params
#   params.require(:user).permit(:email, :first_name, :last_name, :company_id, :role, :password, :password_confirmation)
# end
# end


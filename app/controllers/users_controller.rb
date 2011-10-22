class UsersController < ApplicationController
  
  def show
    @user = current_user
  end
  
  def change_role
    current_user.update_attribute(:role, params[:role])
    redirect_to user_path(current_user)
  end
end

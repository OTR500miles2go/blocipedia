class UsersController < ApplicationController

  def update 
    update_role("standard")
    redirect_to root_path
  end 

  private
  def update_role(new_role)
    current_user.update_attribute(:role, new_role)
  end 
end
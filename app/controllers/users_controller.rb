class UsersController < ApplicationController
  before_action :authenticate_user!

  def downgrade
    current_user.standard!
  end

end
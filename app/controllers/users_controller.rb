class UsersController < ApplicationController
  before_action :authenticate_user!

  def downgrade
    current_user.standard!

    @wikis = Wiki.all

    if current_user.standard?
      @wikis = Wiki.where(private: true)
      #binding.pry
      @wikis.each do |wiki|
        wiki.private = false
        wiki.save! 
      end
    end
 
  end

end

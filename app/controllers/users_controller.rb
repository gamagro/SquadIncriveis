  class UsersController < ApplicationController
  def index
    @full_width_layout = true
    @users = User.all
  end
end

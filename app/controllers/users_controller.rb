  class UsersController < ApplicationController
  def index
    @full_width_layout = true
    @logo_listar = true
    @users = User.all
  end
end

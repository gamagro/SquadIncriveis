  class UsersController < ApplicationController
  def index
    @full_width_layout = true
    @logo_listar = true
    @users = User.all
  end

  def delete
    @user.destroy
    respond_to do |format|
      format.html { redirect_to new_user_session, notice: 'Login desfeito com sucesso!' }
      format.json { head :no_content }
    end
  end
end

class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:emailcheck, :cpfcheck, :cnpjcheck]
  skip_before_action :verify_authenticity_token, only: [:emailcheck, :cpfcheck, :cnpjcheck]

  def index
    @users = User.all
  end
  
  def delete
    @user.destroy
    respond_to do |format|
      format.html { redirect_to new_user_session, notice: 'Login desfeito com sucesso!' }
      format.json { head :no_content }
    end
  end

  def emailcheck
    @user = User.search_by(:email, params[:email])
    respond_to do |format|
      format.json {render :json => {email_exists: @user.present?}}
    end  
  end

  def cpfcheck
    @user = User.search_by(:cpf, params[:cpf])
    respond_to do |format|
      format.json {render :json => {cpf_exists: @user.present?}}
    end  
  end

  def cnpjcheck
    @user = User.search_by(:cnpj, params[:cnpj])
    respond_to do |format|
      format.json {render :json => {cnpj_exists: @user.present?}}
    end  
  end
end

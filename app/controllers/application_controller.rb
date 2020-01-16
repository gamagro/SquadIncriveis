class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :

  def inactive_message
    account_active? ? super : :account_inactive
  end

  def index
  end
  
  def create
    # save post
    flash[:notice] = "Post successfully created"
    redirect_to @post
  end

  def show
    # doesn't need to assign the flash notice to the template, that's done automatically
  end
  
  def after_sign_out_path_for(resource_or_scope)
    '/users/sign_in'
  end
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password_confirmation, :password, :fullname, :razaosocial, :pf_pj, :cpf, :cnpj, :rua, :cep, :bairro, :cidade, :estado, :numero)}
    
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password_confirmation, :password, :current_password, :fullname, :razaosocial, :pf_pj, :cpf, :cnpj, :rua, :cep, :bairro, :cidade, :estado, :numero)}
  end
end
    
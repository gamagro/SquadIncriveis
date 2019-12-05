class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

#
#          validates_presence_of :name, message: 'não pode ser deixado em branco'
#          validates_presence_of :email, message: 'não pode ser deixado em branco'
#          validates_presence_of :password, message: 'não pode ser deixado em branco'
#    

     protected

          def configure_permitted_parameters
               devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :fullname, :razaosocial, :pf_pj, :cpf, :cnpj, :rua, :cep, :bairro, :cidade, :estado)}

               devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :fullname, :razaosocial, :pf_pj, :cpf, :cnpj, :rua, :cep, :bairro, :cidade, :estado)}
          end

end

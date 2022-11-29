

class Clientes::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  def create
    super do |resource|
      if resource.save
        Conta.create!(
          cliente_id: resource.id,
          agencia: rand(100..999).to_s,
          numero: (10000 + resource.id).to_s,
          status: 0,
        )
      end
    end
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nome, :tipo, :cpf, :cnpj, :razão_social, :endereco])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:nome, :tipo, :cpf, :cnpj, :razão_social, :endereco])
  end

  def after_sign_up_path_for(resource)
    conta = Conta.find_by(cliente: resource)
    conta_path(conta)
  end

end


class Clientes::SessionsController < Devise::SessionsController
 

  protected

  def after_sign_in_path_for(resource)
    conta = Conta.find_by(cliente: resource)
		conta_path(conta)
  end

end

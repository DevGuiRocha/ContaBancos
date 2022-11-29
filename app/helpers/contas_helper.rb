
module ContasHelper

  def deposito_or_extrato extrato
    extrato.class == Deposito ? '' : 'red-text text-darken-2'
  end

  def sinal extrato
    extrato.class == Deposito ? '+' : '-'
  end

end

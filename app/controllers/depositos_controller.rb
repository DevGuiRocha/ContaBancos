
class DepositosController < ApplicationController
  before_action :set_deposito, only: [:show]

  def show
  end

  def new
    @conta    = current_cliente.conta if current_cliente
    @deposito = Deposito.new
  end

  def create
    @deposito = Deposito.new(deposito_params)
    @conta    = Conta.find_by(numero: @deposito.numero_conta)

    respond_to do |format|
      if @deposito.save
        format.html { redirect_to conta_path(@conta), notice: 'Deposito realizado com sucesso!' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def set_deposito
    @deposito = Deposito.find(params[:id])
  end

  def deposito_params
    params.require(:deposito).permit(:valor, :nome, :sobrenome, :cpf, :ddd, :telefone, :numero_conta)
  end
end

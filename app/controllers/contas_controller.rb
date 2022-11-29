
class ContasController < ApplicationController
  include ContasHelper

  before_action :set_conta, only: [:show, :edit, :update, :extrato]
  skip_before_action :authenticate_cliente!, only: [:new, :create]

  def show
  end

  def new
    @conta = Conta.new
  end

  def edit
  end

  def create
    @conta = Conta.new(conta_params)

    respond_to do |format|
      if @conta.save
        format.html { redirect_to @conta, notice: 'Conta was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @conta.update(conta_params)
        msg = @conta.encerrar? ? 'Conta encerrada com sucesso!' : 'Selecione a opção encerrar'
        format.html { redirect_to @conta, notice: msg }
      else
        format.html { render :edit }
      end
    end
  end

  def extrato
    if params[:search] and params[:search][:dt_inicial] and params[:search][:dt_final]
        @extratos = @conta.extrato(params[:search][:dt_inicial], params[:search][:dt_final])
    end

    respond_to do |format|
      format.js { render layout: false }
    end
  end

  private

  def set_conta
    @conta = Conta.find(params[:id])
  end

  def conta_params
    params.require(:conta).permit(:cliente_id, :saldo, :agencia, :numero, :status)
  end
end

# ContaBancária

Aplicação de simulação de um banco. 
Feito reenvio em novo repositório devido a problemas no repositório original.



A aplicação trata as movimentações que um cliente pode fazer ao chegar no caixa de um banco.
O cliente pode fazer:
- Cadastrar, Editar e Encerrar sua Conta
- Realizar Depósitos
- Realizar Saques
- Realizar Transferências entre Contas
- Solicitar Saldo
- Solicitar Extrato Filtrando por Data Início e Final

Regras:
- Uma conta não pode ser excluída
- Para realizar saques e transferências é necessário autenticar o usuário
- O saldo de uma conta nunca pode ficar negativo
- Taxa de transferência:
    * De segunda a sexta das 9 às 18 horas a taxa é 5 reais por transferência
    * Fora desse horário a taxa é 7 reais
    * Acima de 1000 reais há um adicional de 10 reais na taxa

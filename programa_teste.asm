# Arquivo: programa_teste.asm
# Código de teste para o processador RISC-V do Grupo 07.
# Este programa testa as instruções de carga, armazenamento,
# aritmética, lógica e desvio condicional.

# --- Início do Código ---

# Assume que a memória de dados no endereço 0 contém um valor inicial.
# A instrução 'lb' irá carregar este valor.
lb x1, 0(x0)      # Carrega o byte do endereço de memória 0 para o registrador x1.
sb x2, 4(x0)      # Armazena o byte do registrador x2 (valor inicial 0) no endereço de memória 4.

# Seção de testes lógicos e aritméticos
add x1, x1, x0    # x1 = x1 + x0 (não deve alterar x1)
add x1, x1, x2    # x1 = x1 + x2 (ainda não altera x1, pois x2=0)
add x1, x1, x2    # x1 = x1 + x2 (idem)
and x1, x1, x2    # x1 = x1 & x2. Como x2=0, o resultado em x1 será 0.
beq x1, x2, SAIDA # Compara x1 e x2. Como ambos são 0, o desvio para SAIDA deve ocorrer.

# O código a seguir não deve ser executado se o BEQ funcionar.
# Foi colocado aqui como uma salvaguarda.
add x1, x0, 1     # Se o fluxo chegar aqui, x1 se tornará 1, indicando um erro no BEQ.

SAIDA:
or x1, x1, x0     # x1 = x1 | x0 (não deve alterar x1, que ainda é 0)
sb x1, 0(x0)      # Armazena o valor final de x1 (que deve ser 0) de volta no endereço de memória 0.

# Fim do programa
.data
eol: .string "\n"  # Define uma string para uma nova linha

.text

main:
    li a7, 5         # Carrega o código do sistema 5 (sys_read) em a7
    ecall            # Faz uma chamada de sistema para ler a quantidade de números
    mv t0, a0        # Move o valor de retorno (quantidade de números) para t0

    addi t1, zero, 0 # Inicializa o contador t1 com 0
    li t3, -2147483648 # Inicializa t3 com o menor valor possível de int32

for: 
    beq t1, t0, done # Verifica se o contador atingiu a quantidade total de números

    li a7, 5         # Carrega o código do sistema 5 (sys_read) em a7
    ecall            # Faz uma chamada de sistema para ler o próximo número
    mv t2, a0        # Move o número lido para t2

    addi t1, t1, 1   # Incrementa o contador

    bgt t2, t3, sai  # Verifica se o número lido é maior que o máximo atual
    j for            # Volta para o início do loop

sai:
    mv t3, t2        # Atualiza o máximo atual com o número lido
    j for            # Volta para o início do loop

done:
    mv a0, t3        # Move o máximo encontrado para a0 (retorno)
    li a7, 1         # Carrega o código do sistema 1 (sys_exit) em a7
    ecall            # Faz uma chamada de sistema para sair do programa

    la a0, eol       # Carrega o endereço da string de nova linha em a0
    li a7, 4         # Carrega o código do sistema 4 (sys_write) em a7
    ecall            # Faz uma chamada de sistema para escrever a nova linha

    li a0, 0         # Define o código de saída como 0
    li a7, 10        # Carrega o código do sistema 10 (sys_exit) em a7
    ecall            # Faz uma chamada de sistema para sair do programa

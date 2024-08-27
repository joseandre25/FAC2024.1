.data 
input1: .asciz # Reserva espaço na memória para o primeiro número
input2: .asciz # Reserva espaço na memória para o segundo número
quebra: .string "\n" # Quebra de linha

.text 

# Leitura do Primeiro Numero
li a7, 5 # Carrega o imediato 5 para o registrador a7 (o 5 é o identificador da instrução para ler inteiros)
la a0, input1 # Define a0 para o endereço do input1
ecall

mv t0, a0 # Move o input1 (o primeiro número] para o registrador temporário t0

# Leitura do Segundo Numero
li a7, 5 # Carrega o imediato 5 para o registrador a7 
la a0, input2 # Define a0 para o endereço do input2
ecall

mv t1, a0 # Move o input2 (o segundo número) para o registrador temporário t1

# Soma
add t2, t0, t1 # Soma os números inteiros armazenados em t0 e t1 e coloca o resultado em t2

# Impressão do resultado da soma
li a7, 1 # Carrega o imediato 1 para o registrador a7 (o 1 é o identificador da instrução para imprimir inteiros)
mv a0, t2 # Move o resultado que está armazenado em t2 para a0 e imprime
ecall

li a7, 4 # Impressão da quebra de linha no final
la a0, quebra
ecall
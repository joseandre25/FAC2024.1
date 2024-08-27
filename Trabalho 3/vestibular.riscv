.data
eol:      .string "\n"       
string1:  .space 1000         # Espaço para a primeira string (respostas corretas)
string2:  .space 1000         # Espaço para a segunda string (respostas do aluno)

.text

main:
    li a7, 5                   # Chamada de sistema para ler um inteiro da entrada padrão
    ecall
    mv t0, a0                  # t0 = Quantidade de questões
    
    addi t0, t0, 1             # Incrementa t0 em 1 para considerar o índice 0
    addi t1, zero, 0           # t1 = Quantidade de acertos
    addi t2, zero, 0           # t2 = Contador de iteração (índice)
   
    la a0, string1             # Carrega o endereço de string1 em a0
    mv a1, t0                  # Define o tamanho máximo da string (quantidade de questões + 1)
    li a7, 8                   # Chamada de sistema para ler uma string da entrada padrão
    ecall
    
    la a0, eol                 # Carrega o endereço de eol em a0
    li a7, 4                   # Chamada de sistema para imprimir uma string na saída padrão
    ecall
    
    la a0, string2             # Carrega o endereço de string2 em a0
    mv a1, t0                  # Define o tamanho máximo da string (quantidade de questões + 1)
    li a7, 8                   # Chamada de sistema para ler uma string da entrada padrão
    ecall
    
    la a0, eol                 # Carrega o endereço de eol em a0
    li a7, 4                   # Chamada de sistema para imprimir uma string na saída padrão
    ecall
    
    la t3, string1             # Carrega o endereço de string1 em t3
    la t4, string2             # Carrega o endereço de string2 em t4

# Comparando as respostas do aluno com o gabarito
loop:
    bgt t2, t0, done           # Se t2 > t0, termina o loop

    lb t5, 0(t3)               # Carrega o byte de string1 no índice atual (t3)
    lb t6, 0(t4)               # Carrega o byte de string2 no índice atual (t4)

    beqz t5, done              # Se t5 (caractere de string1) for nulo ('\0'), termina o loop
    beqz t6, done              # Se t6 (caractere de string2) for nulo ('\0'), termina o loop

    beq t5, t6, igual          # Se t5 e t6 são iguais, vai para o rótulo igual

    j volta                    # Senão, pula para o rótulo volta
  
igual:
    addi t1, t1, 1             # Incrementa t1 (quantidade de acertos)
    j volta                    # Vai para o rótulo volta

volta:        
    addi t3, t3, 1             # Incrementa t3 para apontar para o próximo byte em string1
    addi t4, t4, 1             # Incrementa t4 para apontar para o próximo byte em string2
    addi t2, t2, 1             # Incrementa t2 (contador de iteração)
    
    j loop                     # Volta para o início do loop
    
done:
# Finalizando o programa
    mv a0, t1                  # Move a quantidade de acertos para a0
    li a7, 1                   # Chamada de sistema para imprimir um inteiro
    ecall
    
    la a0, eol                 # Carrega o endereço de eol em a0
    li a7, 4                   # Chamada de sistema para imprimir uma string na saída padrão
    ecall

    li a0, 0                   # Define a0 como 0
    li a7, 10                  # Chamada de sistema para terminar o programa
    ecall

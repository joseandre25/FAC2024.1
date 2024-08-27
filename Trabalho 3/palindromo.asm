.data
endl: .string "\n"
palindromo: .ascii ""  # Aloca espaço para a string do palíndromo

.text
main:
    # Leitura do tamanho da sequência
    li a7, 5           # Syscall para ler um inteiro
    ecall
    mv t0, a0          # t0 armazena o tamanho do palíndromo

    # Leitura da sequência de caracteres
    la a0, palindromo  # Endereço onde a string será armazenada
    mv a1, t0
    addi a1, a1, 1
    # li a1, 256         # Limite do buffer
    li a7, 8           # Syscall para ler a string
    ecall

    # Inicializando ponteiros para comparação
    la t1, palindromo  # t1 aponta para o início da string
    add t2, t1, t0     # t2 aponta para o final da string
    addi t2, t2, -1    # Ajusta t2 para apontar para o último caractere

    # Comparação dos caracteres
    li t3, 1           # t3 armazena o resultado (1 = palíndromo)
    
compare_loop:
    blt t2, t1, end_compare  # Se os ponteiros se cruzarem, fim da comparação
    lb a1, 0(t1)             # Caractere no início
    lb a2, 0(t2)             # Caractere no final
    bne a1, a2, not_palindrome  # Se os caracteres forem diferentes, não é palíndromo
    addi t1, t1, 1           # Move ponteiro do início para frente
    addi t2, t2, -1          # Move ponteiro do final para trás
    j compare_loop           # Continua a comparação

not_palindrome:
    li t3, 0                 # Não é palíndromo

end_compare:
    mv a0, t3                # A resposta final (0 ou 1)
    li a7, 1                 # Syscall para imprimir inteiro
    ecall
    
    li a7, 4
    la a0, endl
    ecall

    # Finalizar o programa
    li a7, 10                # Syscall para encerrar o programa
    ecall
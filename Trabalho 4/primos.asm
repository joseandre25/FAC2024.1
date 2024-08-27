.data
a:  .word 0
msg_invalid: .string "Entrada invalida.\n"
msg_sim:     .string "sim\n"
msg_nao:     .string "nao\n"

.text
.globl _start

_start:
    # Lê um número inteiro da entrada
    li      a7, 5              # syscall read_int
    ecall
    la      t1, a              # Carrega o endereço de 'a' em t1
    sw      a0, 0(t1)          # Armazena a0 no endereço de 'a'

    # Carrega o valor de 'a'
    lw      t0, 0(t1)

    # Verifica se 'a' é menor que 1
    li      t2, 1
    blt     t0, t2, invalid_input

    # Verifica se 'a' é igual a 1
    beq     t0, t2, print_nao

    # Verifica se 'a' é igual a 2
    li      t2, 2
    beq     t0, t2, print_sim

    # Inicializa variáveis
    li      t2, 2              # t2 = i (inicializado com 2)

check_loop:
    mul     t3, t2, t2         # t3 = i * i
    bgt     t3, t0, print_sim  # se i * i > a, a é primo

    rem     t4, t0, t2         # t4 = a % i
    beq     t4, zero, print_nao # se a % i == 0, a não é primo

    addi    t2, t2, 1          # i = i + 1
    j       check_loop

print_sim:
    la      a0, msg_sim        # Carrega o endereço de msg_sim
    li      a7, 4              # syscall print_string
    ecall
    j       exit

print_nao:
    la      a0, msg_nao        # Carrega o endereço de msg_nao
    li      a7, 4              # syscall print_string
    ecall
    j       exit

invalid_input:
    la      a0, msg_invalid    # Carrega o endereço de msg_invalid
    li      a7, 4              # syscall print_string
    ecall

exit:
    li      a7, 10             # syscall exit
    ecall

.data

inValida: .string "Entrada invalida."
espaco: .string "\n"

.text

main:

    li a7, 5  # código do ecall para ler um inteiro
    ecall
    mv t0, a0  # move o valor lido para t0

    li a7, 5  # código do ecall para ler um inteiro
    ecall
    mv t1, a0  # move o valor lido para t1

    li t2, 2  # em t2 será guardado o valor para a condicional

    blt t0, t2, saidaInva  # se t0 (A) menor que 2, pule para saidaInva
    blt t1, t2, saidaInva  # se t1 (B) menor que 2, pule para saidaInva

    mv s1, t0  # move para s1 o valor de t0 para ser utilizado no MDC
    mv s2, t1  # move para s2 o valor de t1 para ser utilizado no MDC

loopMDC:

    divu t6, s1, s2  # div = s1 / s2
    rem t3, s1, s2   # restoM = s1 % s2

    mv s1, s2        # s1 = s2
    mv s2, t3        # s2 = restoM

    beqz t3, imprimeMDC  # se o restoM for zero, pula para imprimeMDC
    j loopMDC

imprimeMDC:

    li a7, 1  # código do ecall para imprimir inteiro
    mv a0, s1  # move o valor de s1 para a0
    ecall

    li a7, 4  # código do ecall para imprimir string
    la a0, espaco  # carrega o endereço de espaco em a0
    ecall

    j loopMMC  # pula para o loop do MMC

loopMMC:

    mul t3, t0, t1
    divu t4, t3, s1  # t4 = (t0 * t1) / s1

    j imprimeMMC

imprimeMMC:

    li a7, 1  # código do ecall para imprimir inteiro
    mv a0, t4  # move o valor de t4 para a0
    ecall

    li a7, 4  # código do ecall para imprimir string
    la a0, espaco  # carrega o endereço de espaco em a0
    ecall

    j saida  # pula para saida

saida:

    li a7, 10  # código do ecall para encerrar o programa
    ecall

saidaInva:

    li a7, 4  # código do ecall para imprimir string
    la a0, inValida  # carrega o endereço de inVali em a0
    ecall

    li a7, 4  # código do ecall para imprimir string
    la a0, espaco  # carrega o endereço de espaco em a0
    ecall

    li a7, 10  # código do ecall para encerrar o programa
    ecall

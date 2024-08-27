.data

add:  .asciz   "ADD: "   # String para representar a operação de soma
sub:  .asciz   "SUB: "   # String para representar a operação de subtração
and:  .asciz   "AND: "   # String para representar a operação AND lógica
or:   .asciz   "OR: "    # String para representar a operação OR lógica
xor:  .asciz   "XOR: "   # String para representar a operação XOR lógica
mask: .asciz   "MASK: "  # String para representar a operação de máscara
sll:  .asciz   "SLL"     # String para representar o deslocamento à esquerda
srl:  .asciz  "SRL"     # String para representar o deslocamento à direita
par1: .asciz   "("        # Parêntese esquerdo para formatação
par2: .asciz   "): "      # Parêntese direito para formatação
eol:  .asciz   "\n"       # Nova linha para formatação de saída

.text

main:
    li a7, 5        # Chamada do sistema para ler um inteiro
    ecall
    mv t0, a0       # Move o valor lido para t0
    
    li a7, 5        # Chamada do sistema para ler um inteiro
    ecall
    mv t1, a0       # Move o valor lido para t1
    
    li a7, 5        # Chamada do sistema para ler um inteiro
    ecall
    mv t2, a0       # Move o valor lido para t2
    
operacao1:
    la a0, add      # Carrega o endereço da string "ADD: "
    li a7, 4        # Chamada do sistema para imprimir uma string
    ecall

    add a0, t0, t1 # Soma os valores de t0 e t1
    li a7, 1        # Chamada do sistema para imprimir um inteiro
    ecall
    
    la a0, eol      # Carrega o endereço da string de nova linha
    li a7, 4        # Chamada do sistema para imprimir uma string
    ecall
    
# As outras operações seguem um padrão semelhante com diferentes operadores e operações.

#Subtração    
operacao2:
    la a0, sub
    li a7, 4
    ecall
    
    sub a0, t0, t1 
    li a7, 1
    ecall
    
    la a0, eol
    li a7, 4
    ecall

# E lógico
operacao3:
    la a0, and
    li a7, 4
    ecall
    
    and a0, t0, t1
    li a7, 1
    ecall
    
    la a0, eol
    li a7, 4
    ecall

# Ou lógico
operacao4:
    la a0, or
    li a7, 4
    ecall
    
    or a0, t0, t1
    li a7, 1
    ecall
    
    la a0, eol
    li a7, 4
    ecall
    
# Ou exclusivo lógico
operacao5:
    la a0, xor
    li a7, 4
    ecall
    
    xor a0, t0, t1
    li a7, 1
    ecall
    
    la a0, eol
    li a7, 4
    ecall

# Máscara entre c e 31    
operacao6:
    la a0, mask
    li a7, 4
    ecall
    
    andi a0, t2, 31
    andi t3, t2, 31
    li a7, 1
    ecall
    
    la a0, eol
    li a7, 4
    ecall

# Deslocamento de m bits à esquerda de a
operacao7:
    la a0, sll
    li a7, 4
    ecall
    
    la a0, par1
    li a7, 4
    ecall
    
    mv a0, t3
    li a7, 1
    ecall
    
    la a0, par2
    li a7, 4
    ecall
    
    sll a0, t0, t3
    li a7, 1
    ecall
    
    la a0, eol
    li a7, 4
    ecall

# Deslocamento de m bits à direita de b
operacao8:
    la a0, srl
    li a7, 4
    ecall
    
    la a0, par1
    li a7, 4
    ecall
    
    mv a0, t3
    li a7, 1
    ecall
    
    la a0, par2
    li a7, 4
    ecall
    
    srl a0, t1, t3
    li a7, 1
    ecall
    
    la a0, eol
    li a7, 4
    ecall
    
    li a0, 0
    li a7, 10
    ecall
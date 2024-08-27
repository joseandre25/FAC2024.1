.data
	olaMundo: .asciz "Ola Mundo\n" #Criação de uma sequência na memória armazenando a String "Ola Mundo"
	
.text

li a7, 4 # Carrega o imediado 4 para o registrador a7
la a0, olaMundo # Carrega a string armazenada na sequencia de memória para o registrador a0
ecall # Chamada de sistema
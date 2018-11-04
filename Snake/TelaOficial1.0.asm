.text
main:   addi $11, $0, 256
	addi $17, $0, 0  #Registrador que quarda o objeto que vai movimentar
	jal backG
	jal borda
	jal ponto
	jal sair
	jal Entrada
#	jal cobra
#	jal comer
mover:  	
	jal cobra
#	jal ponto
	addi $17, $17, -256	#Delocamento vertical para cima
	
espera:
	addi $25, $25, 1
	bne $25, 30000, espera
	addi $25, $0, 0
	j mover
fimMover:
	
#
	addi $2, $0, 10		#Sair do jogo
	syscall


backG:  lui $9, 0x1000
	lui $10, 0x00		#00
	ori $10, 0xff00		#ff00
	addi $11, $0, 16384	#Tela completa 256*64
	laco: beq $11, $0, fim 	#la�o enquanto $11 != 0
		sw $10, 0($9)
		addi $9, $9, 4 	#pixel pindado de 4 em 4
		addi $11, $11, -1
		j laco
	fim:
	jr $31

borda:  lui $9, 0x1000		#define posi��o do pixel
	lui $10, 0x80		#define cor
	ori $10, 0x3200		#define cor
	addi $11, $0, 64
	lacoT: beq $11, $0 fim1 #Borda superior
		sw $10,0($9)
		addi $9, $9, 4
		addi $11, $11, -1
	j lacoT
	fim1:
	
	lui $9, 0x1000		#define posi��o do pixel
	lui $10, 0x80		#define cor
	ori $10, 0x3200		#define cor
	addi $11, $0, 64
	lacoL: beq $11, $0 fim2 #Borda Esquerda
		sw $10,0($9)
		addi $9, $9, 256 
		addi $11, $11, -1
	j lacoL
	fim2:
	
	addi $9, $9, -256
	addi $11, $0, 128#64
	lacoB: beq $11, $0 fim3
		sw $10, 0($9)
		addi $9, $9, 4
		addi $11, $11, -1
	j lacoB
	fim3:
	
	lui $9, 0x1000
	addi $9, $9, 16380
	addi $11, $0, 64
	lacoR: beq $11, $0 fim4
		sw $10, 0($9)
		addi $9, $9, -256
		addi $11, $11, -1
	j lacoR
	fim4:
	
#Funcao sair 1	
sair:
	addi $10, $0, 0x803200		#Cor da borada
	addi $10, $0, 0x996633		#Cor da cobra
	beq $10, $10, Fimsair
		nop
	Fimsair:	
	jr $31
	
cobra: 
	lui $9, 0x1000
	addi $9, $9, 8284
	add $9, $9, $17
	lui $10, 0x99
	ori $10, 0x6633
	addi $11, $0, 11
	lacoC: beq $11, $0, fim5
		sw $10, 0($9)
		addi $9, $9, 256 #4
		addi $11, $11, -1
		j lacoC
	fim5:
	lui $9, 0x1000
	addi $9, $9, 8280
	add $9, $9, $17
	addi $11, $0, 11
	lacoC1: beq $11, $0, fim6
		sw $10, 0($9)
		addi $9, $9, 256 #4
		addi $11, $11, -1
		j lacoC1
	fim6:
	lui $9, 0x1000
	addi $9, $9, 8288
	add $9, $9, $17
	addi $11, $0, 11
	lacoC2: beq $11, $0, fim7 #ok
		sw $10, 0($9)
		addi $9, $9, 256
		addi $11, $11, -1
		j lacoC2
	fim7:
	
	lui $9, 0x1000 		#Olho
	addi $9, $9, 8536
	add $9, $9, $17
	lui $10, 0xff
	ori $10, 0x0000
	sw $10, 0($9)
	addi $9, $9, 4
	
	lui $9, 0x1000 		#Olho
	addi $9, $9, 8544
	add $9, $9, $17
	lui $10, 0xff
	ori $10, 0x0000
	sw $10, 0($9)
	addi $9, $9, 4
	
	lui $9, 0x1000		#frente da cobra, cor verde
	addi $9, $9, 8024
	add $9, $9, $17
	lui $10, 0x00
	ori $10, 0xff00
	addi $11, $0, 3
	lacoS1: beq $11, $0, fimS1
		sw $10, 0($9)
		addi $9, $9, 4 #4
		addi $11, $11, -1
		j lacoS1
	fimS1:
	
	lui $9, 0x1000		#Lateral direita, cor verde
	addi $9, $9, 8036
	add $9, $9, $17
	lui $10, 0x00
	ori $10, 0xff00
	addi $11, $0, 12
	lacoS2: beq $11, $0, fimS2
		sw $10, 0($9)
		addi $9, $9, 256 #4
		addi $11, $11, -1
		j lacoS2
	fimS2:
	
	lui $9, 0x1000		#Lateral esquerda, cor verde
	addi $9, $9, 8020
	add $9, $9, $17
	lui $10, 0x00
	ori $10, 0xff00
	addi $11, $0, 12
	lacoS3: beq $11, $0, fimS3
		sw $10, 0($9)
		addi $9, $9, 256 #4
		addi $11, $11, -1
		j lacoS3
	fimS3:
	
	lui $9, 0x1000		#Apos o rabo, cor verde
	addi $9, $9, 11096
	add $9, $9, $17
	lui $10, 0x00
	ori $10, 0xff00
	addi $11, $0, 3
	lacoS: beq $11, $0, fimS
		sw $10, 0($9)
		addi $9, $9, 4 #4
		addi $11, $11, -1
		j lacoS
	fimS:
	
#Funcao sair 2
	addi $10, $0, 0x996633		#Cor da cobra
	addi $10, $0, 0x996633		#Cor da cobra
	beq $10, $10, sair1
		nop
	sair1:
	jr $31			
ponto:
	lui $19, 0x1000
	lui $20, 0xff
	ori $20, 0xffff
	addi $19, $19, 2392
	add $19,$19,$8
	addi $22, $0, 3
	lacoP: beq $22, $0, fimP
		sw $20,0($19)
		addi $19, $19, 256
		addi $22, $22, -1
		j lacoP
	fimP:
	lui $19, 0x1000
	addi $19, $19, 2388#2140
	addi $22, $0, 3
	lacoP1: beq $22, $0, fimP1
		sw $20,0($19)
		addi $19, $19, 256
		addi $22, $22, -1
		j lacoP1
	fimP1:
	lui $19, 0x1000
	addi $19, $19, 2384#2140
	addi $22, $0, 3
	lacoP2: beq $22, $0, fimP2
		sw $20,0($19)
		addi $19, $19, 256
		addi $22, $22, -1
		j lacoP2
	fimP2:	
	addi $2, $0, 41
	syscall	
#	jr $31
	
	lui $19, 0x1000		#Borda verde do Ponto (ritgh)
	lui $20, 0x00
	ori $20, 0xff00
	addi $19, $19, 2140
	addi $22, $0, 5
	lacoPVr: beq $22, $0, fimPVr
		sw $20,0($19)
		addi $19, $19, 256
		addi $22, $22, -1
		j lacoPVr
	fimPVr:
	
	lui $19, 0x1000		#Borda verde do Ponto (top)
	lui $20, 0x00
	ori $20, 0xff00
	addi $19, $19, 2124
	addi $22, $0, 4
	lacoPVt: beq $22, $0, fimPVt
		sw $20,0($19)
		addi $19, $19, 4
		addi $22, $22, -1
		j lacoPVt
	fimPVt:

	lui $19, 0x1000		#Borda verde do Ponto (left)
	lui $20, 0x00
	ori $20, 0xff00
	addi $19, $19, 2124
	addi $22, $0, 5
	lacoPVl: beq $22, $0, fimPVl
		sw $20,0($19)
		addi $19, $19, 256
		addi $22, $22, -1
		j lacoPVl
	fimPVl:

	lui $19, 0x1000		#Borda verde do Ponto (bottom)
	lui $20, 0x00
	ori $20, 0xff00
	addi $19, $19, 3148
	addi $22, $0, 4
	lacoPVb: beq $22, $0, fimPVb
		sw $20,0($19)
		addi $19, $19, 4
		addi $22, $22, -1
		j lacoPVb
	fimPVb:
	jr $31
	
Entrada:
	lui $12, 0xffff
	lw  $13, 0($12)
	beq $13, $0, ponto

	addi $12 , $12 , 4  #4
	lw $13, 0($12)
	
	beq $13, 65, moveLeft #move a cobra para a esquerda
	beq $13, 68, moveRight # move cobra para a direita
	
	jr $31

moveLeft:
	 addi $11, $11, -4
	 jr $31
moveRight:
	 addi $11, $11, 4
	 jr $31
	 	
#funcao comer		
	addi $20, $0, 0xffffff
	addi $10, $0, 0x996633
comer:  beq $10, $20, fimCC #Emcrementar a cobra
	sw $10, 0($9)
	addi $9, $9, 256
	j comer
	fimCC:
	jr $31
	 		
#Se cobra for igual a ponto, cobra ++
#Se cobra for igual a parede :nop	
#Se cobra for igual a cobra  :nop

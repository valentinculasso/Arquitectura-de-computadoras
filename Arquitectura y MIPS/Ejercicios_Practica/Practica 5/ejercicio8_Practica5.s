.data
cadena1: .asciiz "Hola"
cadena2: .asciiz "Hola"
resultado: .word 0

.code
DADDI $a0, $0, cadena1 
DADDI $a1, $0, cadena2
JAL subrutina
SD $v0, resultado($0)
HALT

subrutina: dadd $v0, $0, $0
LOOP: LBU $t0, 0($a0)
LBU $t1, 0($a1)
BNE $t0, $t1, FIN1
;si llego hasta aca son iguales, por lo tanto paso al siguiente caracter.
DADDI $a0, $a0, 1
DADDI $a1, $a1, 1
DADDI $v0, $v0, 1
BNEZ $t1, LOOP
DADDI $v0, $0, -1
J FIN
FIN1: DADDI $v0, $v0, 1
FIN: JR $ra
 
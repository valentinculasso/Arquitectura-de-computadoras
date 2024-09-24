.data 
cadena: .asciiz "adbdcdedfdgdhdid" ; cadena a analizar
car: .asciiz "d" ; caracter buscado
cant: .word 0 ; cantidad de veces que se repite el caracter car en cadena.
long: .word 16

.code
DADD R5, R0, R0
LBU R2, car(R0)
LD R3, cant(R0)
LD R6, long(R0)
;
LOOP: LBU R1, cadena(R5)
BEQ R1, R2, IGUALES
NOP
J SIGUIENTE
NOP
IGUALES: DADDI R3, R3, 1
SIGUIENTE: DADDI R6, R6, -1
DADDI R5, R5, 1
BNEZ R6, LOOP
NOP
SD R3, cant(R0)
HALT



.data
CONTROL: .word 0x10000
DATA: .word 0x10008
caracter: .asciiz "0"
CERO: .asciiz "CERO"
UNO: .asciiz "UNO"
DOS: .asciiz "DOS"
TRES: .asciiz "TRES"
CUATRO: .asciiz "CUATRO"
CINCO: .asciiz "CINCO"
SEIS: .asciiz "SEIS"
SIETE: .asciiz "SIETE"
OCHO: .asciiz DB "OCHO"
NUEVE: .asciiz DB "NUEVE" 

;Para moverme en los numeros debo moverme ingreso un numero, y cuando salgo, lo multiplico por 8
;Entonces si ingreso 3, hago 3x8(cero) y me iria a la direccion del ascii "TRES"

.code
LD $s0, CONTROL($0)
LD $s1, DATA($0)
DADDI $sp, $0, 0x400
JAL ingreso ; Debe solicitar el ingreso por teclado de un digito y verificar que sea un numero entero.
DADDI $t0, $0, 1
BEQ $v0, $t0, TERMINA
JAL muestra ; Mostrar en la salida estandar el valor del numero en letras
TERMINA: HALT

ingreso: DADD $v0, $0, $0
DADDI $sp, $sp, -24 ; -8 de ra, -8 de s0 y -8 de s1
SD $ra, 0($sp)
SD $s1, 8($sp)
SD $s0, 16($sp)
DADDI $t0, $0, 9
SD $t0, 0($s0) ; CONTROL = 9

LBU $a1, 0($s1) ; $a1 = numero
SB $a1, caracter($0) ; Guardo en variable

SLTI $a2, $a1, 0x30
BNEZ $a2, NO_ES
SLTI $a2, $a1, 0x3A
BEQZ $a2, NO_ES
FIN: LD $ra, 0($sp)
LD $s1, 8($sp)
LD $s0, 16($sp)
DADDI $sp, $sp, 24
JR $ra
NO_ES: DADDI $v0, $0, 1
J FIN

muestra: ingreso: DADDI $sp, $sp, -24
SD $ra, 0($sp)
SD $s1, 8($sp)
SD $s0, 16($sp)
DADDI $t0, $0, 6
SD $t0, 0($s0) ; Limpio pantalla

LD $t5, caracter($0) ; si pongo el 6 en ingreso, voy a tener 36h
DADDI $t5, $t5, -0x30
DADDI $t1, $0, 8 ; t1 = 8
DMUL $t2, $t5, $t1
DADDI $t3, $t2, CERO; Obtengo la direccion del numero a imprimir

SD $t3, 0($s1) ; Mando la direccion a DATA
DADDI $t0, $0, 4
SD $t0, 0($s0) ; CONTROL = 4 (imprimo caracter)

LD $ra, 0($sp)
LD $s1, 8($sp)
LD $s0, 16($sp)
DADDI $sp, $sp, 24
JR $ra

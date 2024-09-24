;Ejercicio 4
.data
CONTROL: .word 0x10000
DATA: .word 0x10008
clave: .asciiz "hola"
contra: .asciiz ""
mensaje1: .asciiz "Bienvenido"
mensaje2: .asciiz "Error"

.code
LD $s0, CONTROL($0)
LD $s1, DATA($0)
DADDI $t0, $0, 4
DADDI $a0, $0, contra
DADD $s3, $0, $0 ; Con s3 me muevo en la cadena clave
repito: JAL char ; Ingreso 1 caracter
LBU $t5, clave($s3) ; Cargo en t5 el primer caracter de clave
LD $t6, contra($0)
BNE $t5, $t6, NO_ES 
DADDI $s3, $s3, 1
DADDI $t0, $t0, -1 ; 4-1 , 3-1 , 2-1, 1-1 -> me salgo
BNEZ $t0, repito

DADDI $t0, $0, 6
SD $t0, 0($s0) ; Limpio pantalla

iguales: DADDI $a0, $0, mensaje1
JAL respuesta ; Muestra Bienvenido
J FIN
NO_ES: DADDI $t0, $0, 6
SD $t0, 0($s0) ; Limpio pantalla
DADDI $a0, $0, mensaje2
JAL respuesta ; Muestro error
FIN: HALT

char: DADDI $t1, $0, 9
SD $t1, 0($s0) ; CONTROL = 9
LBU $t1, 0($s1) ; Tomo el caracter (ingreso)
SB $t1, contra($0) ; Guardo el caracter en la variable
DADDI $a0, $a0, 1 ; Me muevo para que el proximo caracter "se ponga al lado"

DADDI $s2, $0, contra ; tomo la direccion de caracter en $s2
SD $s2, 0($s1) ; Mando direccion de caracter a DATA
DADDI $t7, $0, 4
SD $t7, 0($s0) ; CONTROL = 4
JR $ra

respuesta: SD $a0, 0($s1)
DADDI $t0, $0, 4
SD $t0, 0($s0)
JR $ra

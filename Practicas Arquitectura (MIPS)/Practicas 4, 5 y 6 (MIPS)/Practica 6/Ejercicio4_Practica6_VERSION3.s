.data
CONTROL: .word 0x10000
DATA: .word 0x10008
caracter: .byte 0
clave: .asciiz "hola"
contra: .asciiz ""
msj1: .asciiz "Bienvenido"
msj2: .asciiz "Error"

.code
LD $s0, CONTROL($0)
LD $s1, DATA($0)
LOOP: DADDI $t0, $0, 4
JAL ingresar
LD $t1, clave($0) ; $t1 = h (primer caracter)
BNE $t1, $v0, error 
DADDI $t0, $t0, -1
BNEZ $t0, LOOP
; Si llego aca es porque todos los caracteres son iguales
;imprimo bienvenido

;error: imprimo error
error: HALT

ingresar: DADD $v0, $0, $0
DADDI $t2, $0, 9
SD $t2, 0($s0) ; CONTROL = 9
LBU $t2, 0($s1) ; Tomo caracter en $t2
SB $t2, caracter($0) ; Guardo en variable
DADD $v0, $0, $t2 ; Guardo en $v0 el caracter para cuando salgo compararlo
DADDI $s2, $0, caracter ; tomo la direccion de caracter en $s2
SD $s2, 0($s1) ; Mando direccion de caracter a DATA
DADDI $t4, $0, 4
SD $t4, 0($s0) ; CONTROL = 4

JR $ra
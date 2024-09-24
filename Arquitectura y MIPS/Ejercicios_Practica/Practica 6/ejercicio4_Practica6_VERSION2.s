.data
CONTROL: .word 0x10000
clave: .asciiz "hola"
contra: .ascii "0" ; no poner ascii si no mas bien .byte o algo y ver q onda
msj1: .asciiz "Bienvenido"
msj2: .asciiz "Error"

.code
LD $s0, CONTROL($0) ;$s0 = 0x10000 (CARACTER)
LD $s1, 8($s0) ; $s1 = 0x10008 (DATA)
DADDI $a1, $0, clave

ingresar: DADDI $t1, $0, 9
SD $t1, 0($s0) ; CONTROL = 9

LD $t1, 0($s1) ; Tomo caracter en $t1

;BNE $t1, $a1, FIN2

SD $t1, contra($0) ; Guardo en variable

DADDI $s3, $0, contra ; Tomo direccion de contra y la pongo en $s3
SD $s3, 0($s1) ; Mando el caracter a data
DADDI $t1, $0, 4
SD $t1, 0($s0) ; CONTROL = 4

;DADDI $a1, $a1, 1 ; $a1 = $a1 + 1
;BEQZ $a1, ingresar
J ingresar

FIN2: JR $ra
.data
cadena: .asciiz "abceiouuuu"
cero: .word 0
vocales: .asciiz "AEIOUaeiou"
resultado: .word 0

.code
DADDI $sp, $0, 0x400
DADD $t3, $0, $0
JAL CONTAR_VOC ; Al hacer un CALL en $ra tengo la direccion de retorno
SD $v1, resultado($0)
HALT
;
CONTAR_VOC: DADDI $sp, $sp, -8 ; Aca antes deberia salvar $ra
SD $ra, 0($sp)
LOOP: LBU $a1, cadena($t3)
BEQZ $a1, FIN1
JAL ES_VOCAL
BEQZ $v0, siguientecar
DADDI $v1, $v1, 1
siguientecar: DADDI $t3, $t3, 1
J LOOP
FIN1: LD $ra, 0($sp)
DADDI $sp, $sp, 8
JR $ra
;
ES_VOCAL: DADD $t0, $0, $0
DADD $v0, $0, $0
LOOP1: LBU $t2, vocales($t0)
BEQ $t2, $a1, esvocal
DADDI $t0, $t0, 1
BNEZ $t2, LOOP1
J FIN
esvocal: DADDI $v0, $v0, 1
FIN: JR $ra

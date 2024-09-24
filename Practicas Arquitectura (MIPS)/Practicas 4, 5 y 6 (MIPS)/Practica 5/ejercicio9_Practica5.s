.data
letra: .ascii "I"
vocales: .asciiz "AEIOUaeiou"
resultado: .word 0

.code
DADD $t0, $0, $0
LBU $a1, letra($0)
DADDI $t1, $0, resultado
JAL ES_VOCAL
SD $v0, resultado($0)
HALT

ES_VOCAL: DADD $v0, $0, $0
LOOP: LBU $t2, vocales($t0)
BEQ $t2, $a1, esvocal
DADDI $t0, $t0, 1
BNE $t2, $t1, LOOP
J FIN
esvocal: DADDI $v0, $v0, 1
FIN: JR $ra


;FORMAS DE VER LAS TABLAS/CADENAS
;Una es agarrar las dos direcciones y restarlas. (Luego debo decrementarla hasta que sea cero)
;Otra es poner una variable que sea 0, comparo si es cero, si es cero termina.
;
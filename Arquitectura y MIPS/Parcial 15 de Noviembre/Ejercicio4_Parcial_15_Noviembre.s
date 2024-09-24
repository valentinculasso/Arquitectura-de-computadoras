.data
CONTROL: .word 0x10000
DATA: .word 0x10008
valor: .double 3.6
MSJ: .asciiz "El resultado es: "

.code
LD $s0, CONTROL($0)
LD $s1, DATA($0)
DADDI $t0, $0, 8
SD $t0, 0($s0) ; Control = 8
L.D F1, 0($s1)
L.D F2, valor($0)
C.LT.D F1, F2
BC1T ES_MENOR
SUB.D F3, F1, F2
MUL.D F4, F3, F2
J imprimo
ES_MENOR: ADD.D F3, F1, F2
DIV.D F4, F3, F1
imprimo: DADDI $t0, $0, MSJ
SD $t0, 0($s1)
DADDI $t0, $0, 4
SD $t0, 0($s0) ; Control = 4
S.D F4, 0($s1)
DADDI $t0, $0, 3
SD $t0, 0($s0) ; Control = 3
HALT
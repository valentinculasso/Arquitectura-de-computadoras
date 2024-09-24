.data
CONTROL: .word 0x10000
DATA: .word 0x10008
Azul: .byte 0,0,255,0
Cant: .word 10
Tabla1: .word 1, 2, 3, 4, 5, 6, 7, 8 ,9, 10
;Cant: .word 10

.code
LD $s0, CONTROL($0)
LD $s1, DATA($0)
DADDI $a0, $0, Tabla1
LD $a1, Cant($0)
JAL MIN_MAX
SB $v0, 5($s1)
SB $v1, 4($s1)
LWU $t0, Azul($0)
SW $t0, 0($s1)
DADDI $t0, $0, 5
SD $t0, 0($s0)
HALT

MIN_MAX: LD $v0, 0($a0)
DADD $v1, $0, $v0
DADDI $a0, $a0, 8
DADDI $a1, $a1, -1
LOOP: LD $t0, 0($a0)
SLT $t1, $t0, $v0
BNEZ $t1, ES_MENOR
SLT $t1, $t0, $v1
BNEZ $t1, SIGUIENTE
DADD $v1, $0, $t0
J SIGUIENTE
ES_MENOR: DADD $v0, $0, $t0
SIGUIENTE: DADDI $a0, $a0, 8
DADDI $a1, $a1, -1
BNEZ $a1, LOOP
JR $ra
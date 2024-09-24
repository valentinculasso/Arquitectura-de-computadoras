.data
CONTROL: .word 0x10000
DATA: .word 0x10008
CARACTER: .byte 0

.code
LD $s0, CONTROL($0)
LD $s1, DATA($0)

LOOP: DADDI $t1, $0, 9
SD $t1, 0($s0)

LBU $t1, 0($s1)
SB $t1, CARACTER($0)

DADDI $s2, $0, CARACTER
SD $s2, 0($s1)

DADDI $t1, $0, 4
SD $t1, 0($s0)

J LOOP
HALT
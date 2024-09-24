.data
CONTROL: .word 0x10000
DATA: .word 0x10008
CAR1: .asciiz ""
CAR2: .asciiz ""

.code
LD $s0, CONTROL($0)
LD $s1, DATA($0)
DADDI $sp, $0, 0x400
DADDI $a1, $0, CAR1
JAL ingreso
LD $a0, CAR1($0)
DADDI $a1, $0, CAR2
JAL ingreso
LD $a1, CAR2($0)
JAL resultado ; tengo que mandar los dos numeros
HALT

ingreso: DADD $v0, $0, $0
DADDI $sp, $sp, -24 ; -8 de ra, -8 de s0 y -8 de s1
SD $ra, 0($sp)
SD $s1, 8($sp)
SD $s0, 16($sp)

DADDI $t0, $0, 9
SD $t0, 0($s0) ; CONTROL = 9

LBU $t0, 0($s1) ; $t0 = numero
DADDI $t0, $t0, -0x30
SB $t0, 0($a1) ; Guardo en variable

SLTI $a2, $t0, 0x30
BNEZ $a2, NO_ES
SLTI $a2, $t0, 0x3A
BEQZ $a2, NO_ES

FIN: LD $ra, 0($sp)
LD $s1, 8($sp)
LD $s0, 16($sp)
DADDI $sp, $sp, 24
JR $ra
NO_ES: DADDI $v0, $0, 1
J FIN

resultado: DADDI $sp, $sp, -24 ; -8 de ra, -8 de s0 y -8 de s1
SD $ra, 0($sp)
SD $s1, 8($sp)
SD $s0, 16($sp)

DADD $t1, $a0, $a1
SD $t1, 0($s1) ; Imprimo un numero
DADDI $t0, $0, 1
SD $t0, 0($s0)

LD $ra, 0($sp)
LD $s1, 8($sp)
LD $s0, 16($sp)
DADDI $sp, $sp, 24
JR $ra

.data
tabla: .word 1,2,3,4,0
;fin: .word 0
cant_impar: .word 0

.code
daddi $a0, $0, tabla
dadd $t0, $0, $0
ld $a1, cant_impar($0)
JAL subrutina
sd $v0, cant_impar($0)
HALT

subrutina: dadd $v0, $0, $0
daddi $sp, $sp, -8
sd $ra, 0($sp)
loop: ld $t1, 0($a0)
beq $t1, $0 ,fin1
JAL ES_IMPAR
beqz $v1, no_es
daddi $v0, $v0, 1
no_es: daddi $a0, $a0, 8
J loop
fin1: ld $ra, 0($sp)
daddi $sp,$sp, 8
JR $ra

ES_IMPAR: dadd $v1, $0, $0
ANDI $t3, $t1, 1
beqz $t3, no_es2
daddi $v1, $0, 1
no_es2: JR $ra
.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
A: .word 0
B: .word 0
C: .word 0
RES: .word 0

.code
LWU $s0, CONTROL($0)
LWU $s1, DATA($0) ; usamos 32 bits con LWU
DADDI $t0, $0, 8
SD $t0, 0($s0) ; CONTROL = 8
LD $a0, 0($s1) ; Copio el valor en $a0
SD $a0, A($0) ; Guardo en variable
;
DADDI $t0, $0, 8
SD $t0, 0($s0) ; CONTROL = 8
LD $a1, 0($s1) ; Copio el valor en $a0
SD $a1, B($0) ; Guardo en variable
;
DADDI $t0, $0, 8
SD $t0, 0($s0) ; CONTROL = 8
LD $a2, 0($s1) ; Copio el valor en $a0
SD $a2, C($0) ; Guardo en variable
; Hasta aca anda perfecto
JAL calculo
SD $v0, RES($0)
SD $v0, 0($s1) ; Le paso a DATA el resultado
;
ANDI $t0, $a2, 1
BEQ $t0, $0, PAR
;
DADDI $t0, $0, 2
SD $t0, CONTROL($s0) ; CONTROL = 2
J FIN
PAR: DADDI $t0, $0, 1
SD $t0, CONTROL($s0) ; CONTROL = 1
FIN: HALT

calculo: DADD $v0, $0, $0
DSUB $a0, $a0, $a1 ; (A-B)
DADD $t1, $a0, $0 ; $t1 = (A-B)
BEQZ $a2, es_uno
SLT $t0, $a2, $0 ; Veo si C (la potencia) es menor que 0, si es menor termina
BEQZ $t0, sigo
J FIN2
; Hasta aca esta bien
sigo: DADDI $a2, $a2, -1 
sigo2: DMUL $a0, $t1, $a0
DADDI $a2, $a2, -1
BNE $a2, $0, sigo2
DADD $v0, $0, $a0
J FIN2
es_uno: DADDI $v0, $0, 1
FIN2: JR $ra
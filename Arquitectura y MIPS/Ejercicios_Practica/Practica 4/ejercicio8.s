.data
A: .word 4
B: .word 6
RES: .word 0
.code
LD R1, A(R0)
LD R2, B(R0)
DADD R3, R0, R0
; Verifico cual es mayor, para no hacer demasiadas repeticiones
SLT R4, R1, R2 ; Comparo si R1 es menor a R2 ... Si es menor R4=1 si no R4=0
BEQZ R4, SUMO
NOP
SUMO2: DADD R3, R2, R3
DADDI R1, R1, -1
BNEZ R1, SUMO2
NOP
J FIN
NOP
SUMO: DADD R3, R1, R3
DADDI R2, R2, -1
BNEZ R2, SUMO
NOP
FIN: SD R3, RES(R0)
HALT


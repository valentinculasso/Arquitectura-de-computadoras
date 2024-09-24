.data
TABLA: .word 1,2,3,4,5,6,7,8,9,10
X: .word 5
CANT: .word 0
CANTTABLA: .word 10
RES: .word 0,0,0,0,0,0,0,0,0,1

.code
LD R2, X(R0)
LD R3, CANT(R0)
LD R4, CANTTABLA(R0)
DADD R6, R0, R0 ; R6 lo uso para TABLA
DADD R7, R0, R0 ; R7 lo uso para RES
LOOP: LD R1, TABLA(R6)
LD R5, RES(R7)
DADDI R4, R4, -1 ; resto 1 elemento

SLT R5, R2, R1 ; Verifico si X es menor al elemento de TABLA
SD R5, RES(R7)
BEQZ R5, menor
NOP
DADDI R3, R3, 1
SD R3, CANT(R0)

menor: DADDI R6, R6, 8
DADDI R7, R7, 8
BNEZ R4, LOOP
NOP
HALT

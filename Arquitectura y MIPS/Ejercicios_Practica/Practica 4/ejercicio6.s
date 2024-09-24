.data
A: .word 4
B: .word 2
C: .word 6
D: .word 0

.code
LD R1, A(R0)
LD R2, B(R0)
LD R3, C(R0)
DADD R4, R0, R0

BEQ R1,R2, salta 
BEQ R1, R3, salta3
BEQ R2, R3, salta3
J FIN
salta3: DADDI R4, R4, 2
J FIN
salta: DADDI R4, R4, 2
BEQ R2,R3, salta2
J FIN
salta2: DADDI R4, R4, 1
FIN: SD R4, D(R0) 
HALT
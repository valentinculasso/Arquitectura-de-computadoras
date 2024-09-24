; while a > 0 do
;begin
; x:= x + y;
; a:= a - 1;
;end

.data
X: .word 2
Y: .word 4
a: .word 2

.code
LD R3, a(R0)
LD R1, X(R0)
LD R2, Y(R0)
WHILE: BEQZ R3, FIN
NOP
DADDI R3, R3, -1
J WHILE
DADD R1, R1, R2
FIN: SD R1, X(R0) 
HALT
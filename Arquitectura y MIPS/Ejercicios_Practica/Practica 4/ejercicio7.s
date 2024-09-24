.data
TABLA: .word 1,2,3,4,5,6,7,8,9,10
X: .word 5
CANT: .word 0
CANTTABLA: .word 10
RES: .word 0,0,0,0,0,0,0,0,0,0

.code
LD R2, X(R0)
LD R3, CANT(R0)
LD R4, CANTTABLA(R0)
DADD R6, R0, R0 ; R6 lo uso para TABLA
DADD R7, R0, R0 ; R7 lo uso para RES
LOOP: LD R1, TABLA(R6)
LD R5, RES(R7)
DADDI R4, R4, -1 ; resto 1 elemento
SLT R5, R1, R2 ; Verifico si el primer elemento de la tabla es menor a X
**
DADDI R8, R5, 0
BEQ R5, R8, menor ; Si R5 es igual a 1 -> El numero de TABLA es menor a X
BEQ R1, R2, menor ; Verifico si los numeros son iguales
; Como llegue hasta aca el numero de la TABLA es mayor a X
DADDI R3, R3, 1 ; Sumo cant +1
DADDI R5, R5, 1 ; Esto le tengo que poner a RES
**
SD R5, RES(R7)
menor: DADDI R6, R6, 8
DADDI R7, R7, 8
SD R3, CANT(R0)
BNEZ R4, LOOP
NOP
HALT

RES Y CANT NO SE MODIFICAN**


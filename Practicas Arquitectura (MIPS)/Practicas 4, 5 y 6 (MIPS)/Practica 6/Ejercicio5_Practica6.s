.data
CONTROL: .word 0x10000
DATA: .word 0x10008
base: .double 0.0
exponente: .word 0
result: .double 0.0
valor: .double 1.0

.code
LD $s0, CONTROL($0) ; $s0 = 0x10000
LD $s1, DATA($0) ; $s1 = 0x10008
DADDI $t0, $0, 8
SD $t0, 0($s0) ; Control = 8
L.D F1, 0($s1) ; F1 = valor1 ingresado
S.D F1, base($0) ; Guardo valor ingresado en variable valor1
DADDI $t0, $0, 8
SD $t0, 0($s0) ; Control = 8
LD $a1, 0($s1) ; $a1 = valor2 ingresado
SD $a1, exponente($0) ; Guardo valor ingresado en variable valor2
; Hasta aca anda perfecto
L.D F4, base($0) ; F4 = valor1 (F4=$a0)
L.D F5, valor($0)
JAL a_la_potencia ; Calculo el resultado
; Imprimo
S.D F2, result($0) ; Guardo el resultado en la variable result
S.D F2, 0($s1) ; Mando el dato a DATA
DADDI $t0, $0, 3
SD $t0, 0($s0)
HALT

;Recibo como parametros por valor el F4=valor1 y $a1=valor2
a_la_potencia: ADD.D F2, F0, F5 ; resultado(F2) = 1
BEQZ $a1, FIN
DADDI $t1, $t1, -2
LOOP: SLT $t1, $a1, $0 ; $t1 = 0 o 1 (1 si es menor)
BNEZ $t1, FIN
DADDI $a1, $a1, -1
MUL.D F2, F2, F4
J LOOP
FIN: JR $ra
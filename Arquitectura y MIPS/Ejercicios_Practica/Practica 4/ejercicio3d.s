.data
A: .word 1
B: .word 3
TABLA: .word 0
 .code
 dadd r3, r0, r0
 ld r2, B(r0)
 ld r1, A(r0)
loop: ld r4, TABLA(r3) 
 daddi r2, r2, -1
 dsll r1, r1, 1
 sd r1, TABLA(r3)
 daddi r3, r3, 8
 bnez r2, loop
halt
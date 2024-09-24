.data
a: .byte 4
b: .byte 5

.code
lb $t1, a(r0)
lb $t2, b(r0)
loop: daddi $t2, $t2, -1
bnez $t2, loop
dsll $t1, $t1, 1
halt
.data
tabla1: .word 15, 11, 24
tabla2: .word 0,0,0

.code
daddi $t1, $0, 0
daddi $t2, $0, 3
loop: ld $t3, tabla1($t1)
daddi $t3, $t3,1
sd $t3, tabla2($t1)
daddi $t1, $t1, 8
daddi $t2, $t2, -1
bnez $t2, loop
halt
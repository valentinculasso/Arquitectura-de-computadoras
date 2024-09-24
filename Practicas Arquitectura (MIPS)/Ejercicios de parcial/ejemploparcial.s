.data
tabla: .word 1, 2, 3, 4, 5

.code
daddi $t1, $0, 5
dadd $t2, $0, $0
loop: sd $t3, tabla($t2)
daddi $t1, $t1, -1
daddi $t2, $t2, 8
bnez $t1, loop
halt
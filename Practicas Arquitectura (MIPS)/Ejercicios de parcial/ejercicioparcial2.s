.data
a: .word 3
b: .word 5
c: .word 0

.code
ld $t1, a($0)
ld $t2, b($0)
dadd $t3, $0, $0
dadd $t3, $t3, $t2
daddi $t1, $t1, -1
dadd $t3, $t3, $t2
daddi $t1, $t1, -1
dadd $t3, $t3, $t2
daddi $t1, $t1, -1
sd $t3, c($0)
halt
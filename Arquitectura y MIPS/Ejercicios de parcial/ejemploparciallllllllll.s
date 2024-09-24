.data
a: .word 1
b: .word 6

.code
dadd $t1, $0, $0
daddi $t1, $0, 8
ld $t2, a($0)
ld $t3, a($t1)
ld $t4, b($0)
dsub $t5, $t3, $t4
halt
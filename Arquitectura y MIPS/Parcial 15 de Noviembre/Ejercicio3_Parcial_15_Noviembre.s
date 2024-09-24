.data

.code
daddi $t6, $0, 0
daddi $t7, $0, 7
daddi $t7, $t7, 19
loop: daddi $t7, $t7, -1
daddi $t6, $t6, 1
BNEZ $t7, loop
HALT
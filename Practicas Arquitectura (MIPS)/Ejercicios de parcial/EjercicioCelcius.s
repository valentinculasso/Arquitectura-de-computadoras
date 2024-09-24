.data
control: .word32 0x10000
data: .word32 0x10008
coordx: .byte 20
coordy: .byte 10
color: .byte 0,0,0,0
datos: .byte 25,24,21,18,16,12,10,13,15,18,22,24

.code
lwu $s6, control($0)
lwu $s7, data($0)
daddi $t1, $0, 12
dadd $t2, $0, $0
lwu $s2, color($0)
sw $s2, 0($s7)
lb $s0, coordx($0)
daddi $t0, $0, 5
lazo1: lb $t3, datos($t2)
lb $s1, coordy($0)
sb $s0, 5($s7)
lazo2: sb $s1, 4($s7)
sd $t0, 0($s6)
daddi $t3, $t3, -1
daddi $s1, $s1, 1
bnez $t3, lazo2
daddi $s0, $s0, 1
daddi $t2, $t2, 1
daddi $t1, $t1, -1
bnez $t1, lazo1
halt
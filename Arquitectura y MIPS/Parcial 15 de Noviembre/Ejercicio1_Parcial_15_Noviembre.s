.data
numero: .double 2

.code
l.d f1, numero($0)
add.d f2, f2, f2
s.d f4, numero($0)
halt
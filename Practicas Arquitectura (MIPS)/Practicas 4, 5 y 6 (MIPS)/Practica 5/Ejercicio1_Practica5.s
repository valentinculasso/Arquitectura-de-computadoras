.data
base: .double 5.85
altura: .double 13.47
superficie: .double 0.0

.code
L.D F1, base(R0)
L.D F2, altura(R0)
ADD.D F3, F0, F0
MUL.D F1, F1, F2
DADDI R1, R1, 2
MTC1 R1, F4
DIV.D F1, F1, F4
NOP
S.D F1, superficie(R0)
HALT
@R0
D=M
@x
M=D
@R1
D=M
@y
M=D

@R4
M=0

@y
D=M
@invalid
D;JEQ

@sign
M=0

@x
D=M
@x_pos
D;JGE
@x
M=-M
@sign
M=!M

(x_pos)
@y
D=M
@y_pos
D;JGE
@y
M=-M
@sign
M=!M

(y_pos)
@quotient
M=0
@remainder
M=0

(loop)
@x
D=M
@y
D=D-M
@end_div
D;JLT

@x
M=D
@quotient
M=M+1

@loop
0;JMP

(end_div)
@x
D=M
@remainder
M=D

@sign
D=M
@make_neg
D;JNE

@quotient
D=M
@store_q
0;JMP

(make_neg)
@quotient
D=-M

(store_q)
@R2
M=D

@R0
D=M
@adj_rem
D;JGE

@remainder
M=-M

(adj_rem)
@remainder
D=M
@R3
M=D
@R4
M=0
@end
0;JMP

(invalid)
@R4
M=1
@R0
D=M
@R2
M=D
@R1
D=M
@R3
M=D

(end)
@end
0;JMP
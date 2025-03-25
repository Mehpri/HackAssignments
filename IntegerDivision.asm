@R0
D=M
@x
M=D         // Store x
@R1
D=M
@y
M=D         // Store y

@R4
M=0         // Valid flag (0 by default)

// Check for division by zero
@y
D=M
@INVALID
D;JEQ      // If y == 0, jump to INVALID case

// Track sign of quotient
@sign
M=0        // Sign tracker (0=positive, 1=negative)

// Make x positive, update sign
@x
D=M
@X_POS
D;JGE      // If x >= 0, skip negation
@x
M=-M       // x = -x
@sign
M=!M       // Flip sign bit

(X_POS)
// Make y positive, update sign
@y
D=M
@Y_POS
D;JGE      // If y >= 0, skip negation
@y
M=-M       // y = -y
@sign
M=!M       // Flip sign bit

(Y_POS)
// Initialize quotient and remainder
@quotient
M=0
@remainder
M=0

(LOOP)
@x
D=M
@y
D=D-M
@END_DIV
D;JLT     // If x < y, exit loop

@x
M=D       // x = x - y
@quotient
M=M+1     // quotient++

@LOOP
0;JMP     // Repeat until x < y

(END_DIV)
@x
D=M
@remainder
M=D       // Store remainder

// Apply sign to quotient
@sign
D=M
@MAKE_NEG
D;JNE     // If sign == 1, make quotient negative

@quotient
D=M
@STORE_Q
0;JMP

(MAKE_NEG)
@quotient
D=-M

(STORE_Q)
@R2
M=D       // Store quotient

// Adjust remainder sign to match original x
@R0
D=M
@ADJ_REM
D;JGE     // If original x >= 0, skip negation

@remainder
M=-M

(ADJ_REM)
@remainder
D=M
@R3
M=D       // Store remainder
@R4
M=0       // Valid division flag (0)
@END
0;JMP

(INVALID)
@R4
M=1       // Invalid division (y = 0)
@R0
D=M
@R2
M=D       // Store x in R2
@R1
D=M
@R3
M=D       // Store y in R3

(END)
@END
0;JMP
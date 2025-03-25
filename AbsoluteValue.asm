@R0
D=M
@POSITIVE
D;JGE     // If x >= 0, jump to POSITIVE

// Negative case
@R2
M=1       // Set R2 flag (indicates x was negative)

@32768    
D=D+A     // Check if x == -32768 (D = x + 32768)
@OVERFLOW
D;JEQ     // If x is -32768, handle overflow case

// Safe to negate x
@R0
D=M
D=-D      // Compute absolute value
@R3
M=0       // No overflow
@STORE
0;JMP

(OVERFLOW)
@R3
M=1       // Overflow flag set
@R0
D=M       // Keep x unchanged
@STORE
0;JMP

(POSITIVE)
@R2
M=0       // Set R2 flag (indicates x was positive)
@R3
M=0       // No overflow
@R0
D=M       // Keep x as is

(STORE)
@R1
M=D       // Store absolute value in R1
(END)
@END
0;JMP
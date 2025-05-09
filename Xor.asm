// Simplified version of previous code so no boolean algebra has to be used just means code is slightly longer
// XOR = (x ∧ ¬y) V (¬x ∧ y)
// First we will do the logic for (x ∧ ¬y)
@R1         
D=!M        // D = ¬y
@R0
D=D&M       // D = x ∧ ¬y
@temp
M=D         // temp = x ∧ ¬y

// Next the logic for (¬x ∧ y)
@R0
D=!M        // D = ¬x
@R1
D=D&M       // D = ¬x ∧ y

// Combine (x ∧ ¬y) V (¬x ∧ y) 
@temp
D=D|M       // D = (¬x ∧ y) ∨ (x ∧ ¬y)

// Store result in R2
@R2
M=D         // R2 = XOR

// End program 
(end)
@end
0;JMP
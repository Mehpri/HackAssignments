//Code to calculate the absolute value of a 16 bit number
// Firstly R0 is loaded and is checked if it's positive
@R0
D=M
@positive
D;JGE // If x>= 0 code will jump to the 'positive' part of the code

// If the code isn't positive it must mean that it's negative so will carry onto the code that handles negative cases
@R2
M=1  // Negative flag is set
@32768    
D=D+A // D = R0 + 32768 to make sure that R0 isn't equal to -32768 (as positive 32768 can't be represented in 16 bit format)
@overflow
D;JEQ // If D = 0 it means R0 is equal to -32768 and code will jump to the 'overflow' portion of the code

//Computes the absolute value for negative numbers that don't have an overflow
@R0
D=M  // Reloads original 16 bit number
D=-D // Makes the negative number positive
@R3
M=0  // No overflow
@store 
0;JMP // Jumps to store result

(overflow)
@R3
M=1 // Overflow detected
@R0
D=M // Reloads original 16 bit number
@store
0;JMP // Jumps to store result

(positive)
@R2
M=0  // R0 is positive
@R3
M=0  // No overflow
@R0
D=M // Original number is the absolute value of that number

(store)
@R1
M=D // stores absolute value or original number if there was an overflow

//Halts program
(end)
@end
0;JMP
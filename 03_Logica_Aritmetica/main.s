	.text
	.global main

main:	// Punto de entrada a partir del archivo Startup.

// Para operaciones aritméticas con resultado de 32 bits.
	LDR		R0, =9
	LDR		R1, =2

	ADD 	R2, R0, #6	// R2=R0+6
	SUB 	R1, #1		// R1=R1-3
	MUL		R3, R2, R1  // R3=R2*R1

// Para multiplicación con resultado de 64 bits.
	LDR	R4, =0xFFFFFFFF
	LDR	R5, =0x3
	UMULL	R6, R7, R5, R4	//(R6, R7)=R5*R4

// Para operaciones lógicas.
	LDR	R8, =#0x10101010
	LDR	R9, =#0x11111101

	AND		R10, R8, R9	// R10=R8&R9
	EOR		R11, R8, R9	// R11=R8^R9
	ORR		R12, R8, R9	// R12=R8|R9
	BIC		R8, R9		// Limpiar en R8 los bits señalados por R9.
	ROR		R9, #8		// Rotar R9 8 bits a la derecha.

	.align
	.end

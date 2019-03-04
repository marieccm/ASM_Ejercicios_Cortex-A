	.text
	.global main
	.fpu neon-fp-armv8

main:	// Punto de entrada a partir del archivo Startup.
	VLDR.F32 S8, =4

    .macro Promedio  prom, a, b, c, d
// prom = (a + b + c + d)/4
	VADD.F32	S10 , \a, \b
	VADD.F32	S10 , \c
	VADD.F32	S10 , \d
	VDIV.F32 \prom, S10, S8	// dividir en 4
	.endm


	VLDR.F32 S0, =10
	VLDR.F32 S1, =20
	VLDR.F32 S2, =15
	VLDR.F32 S3, =31

Promedio S4, S0, S1, S2, S3

	VLDR.F32 S0, =6
	VLDR.F32 S1, =8
	VLDR.F32 S2, =9
	VLDR.F32 S3, =5
Promedio S5, S0, S1, S2, S3

B Loop

Loop:
	B Loop

	.align
	.end

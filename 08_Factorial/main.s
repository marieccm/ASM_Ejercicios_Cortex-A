	.text
	.global main
    .fpu    neon-fp-armv8

main:	// Punto de entrada a partir del archivo Startup.
	VLDR.F32 S0, =30	// Número a operar (n!).
	VLDR.F32 S1, =1		// Registro para guardar resultado.
	VLDR.F32 S3, =1	// Constante 1.

Factorial:
	// Multiplicar el valor actual de n y el resultado acumulado.
	VMUL.F32 S1, S0
	// Sustraer uno al valor actual de n.
	VSUB.F32 S0, S3
	// Verificar si se ha llegado a 1 (ya no quedan números por multiplicar).
	VCMP.F32 S0, S3
	VMRS APSR_nzcv, FPSCR	// Trasladar banderas de FPSCR a APSR.
	BNE Factorial	// Si n no es igual a 1, seguir operando.

	B Loop

Loop:
	B Loop

	.align
	.end

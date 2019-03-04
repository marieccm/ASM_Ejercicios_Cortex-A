	.text
	.global main
    .fpu    neon-fp-armv8

main:	// Punto de entrada a partir del archivo Startup.
	VLDR.F32 S0, =8		// Valor de x.
	VLDR.F32 S1, =15	// Límite superior.

	VLDR.F32 S2, =1		// Constante 1.
	VLDR.F32 S3, =2		// Constante 2.

	VLDR.F32 S4, =-1 	// Valor de n.

Factor_K:	// Cálculo de K en S13.
	VMUL.F32 S10, S0, S0	// x^2
	VSUB.F32 S11, S10, S2	// (x^2)-1
	VADD.F32 S12, S10, S2	// (x^2)+1
	VDIV.F32 S13, S11, S12	// K=((x^2)-1)/((x^2)+1)

Sumatoria:	// Ciclo de sumatoria.
	VADD.F32 S4, S2		// n+1
	VMUL.F32 S20, S3, S4	// 2*n
	VADD.F32 S20, S2 	// 2n+1
	VDIV.F32 S21, S2, S20 	// a=1/(2n+1)

	VLDR.F32 S22, =0	// Contador subrutina Potencia.
	VLDR.F32 S23, =1 	// S23 contendrá el valor de la potencia.
	BL Potencia			// b=K^(2n+1), BL: "branch with link".
	VMUL.F32 S24, S23, S21	//a*b
	VADD.F32 S30, S24	// Acumulado de sumatoria en S30.
	VCMP.F32 S4, S1		// Verificar si n ha llegado a límite superior.
	VMRS APSR_nzcv, FPSCR
	BLO Sumatoria		// Sufijo LO significa "menor".

	B Loop
Loop:		// Ciclo infinito.
	B Loop

Potencia:	// Subrutina para cálculo de potencia.
	VMUL.F32 S23, S13
	VADD.F32 S22, S2
	VCMP.F32 S22, S20	// Verificar si contador es igual a exponente.
	VMRS APSR_nzcv, FPSCR
	BNE Potencia		// Si no se ha terminado, continuar calculando.
	BX LR	// Volver a línea siguiente a BL usado.


	.align
	.end

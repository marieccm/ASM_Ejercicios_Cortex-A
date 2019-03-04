	.text
	.global main

main: // Punto de entrada a partir del archivo Startup.
	LDR R0, =0
	LDR R1, =20

Delay:
	ADD R0, #1 // Sumar 1 al valor anterior de R0.
	NOP
	NOP
	NOP
	NOP

	CMP R0, R1 // Comparar R0 con constante.
	BNE Delay // Si R0!=2000000 repetir subrutina Delay.

Loop:
	B Loop // Ciclo sin salida

	.align
	.end

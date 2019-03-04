	.text
	.global main

main:	// Punto de entrada a partir del archivo Startup.
	LDR R0, =0

Sumar:
	ADD R0, #5 // Sumar 5 al valor anterior de R0.
	CMP R0, #30 // Comparar R0 con constante 30.
	BGT Loop // Si R0>30 salir del ciclo.
	B Sumar // Se llegará a esta línea sólo si R0<=30

Loop:
	B Loop // Ciclo sin salida

	.align
	.end

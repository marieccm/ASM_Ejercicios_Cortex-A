	.text
	.global main

main:	// Punto de entrada a partir del archivo Startup.
	// Cargar valores.
	LDR R0, =10
	LDR R1, =2
	// Comparar el contenido de R1 con 0. Si son iguales entonces Z=1.
	CMP R1, #0
	BEQ Loop // Saltar a Loop si R1=0.
	MUL R2, R0, R1 // Sólo se llega a esta línea si R1!=0, se multiplica.

Loop:
	B Loop // Ciclo sin salida.

	.align
	.end

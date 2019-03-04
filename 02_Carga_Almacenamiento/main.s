.equ	DIRECCION, 0X7EFFF490// Dirección en RAM.

	.text
	.global main


main:	// Punto de entrada a partir del archivo Startup.

	// Uso de pseudoinstrucción alternativa LDR Rn, =constante.
	LDR	R2, = 108900
	LDR	R3, = 12345
	LDR	R4, = 8000
	LDR	R5, = 752

	/* Almacenamiento de valores a RAM individual con aumento
	 de 4 bytes en dirección cada vez.*/
	STR R2, [R13], #4
	STR R3, [R13], #4
	// Almacenamiento colectivo de R4 y R5 en RAM.
	STM R13, {R4, R5}

	// Carga colectiva desde RAM a registros R6, R7 y R8.
	LDM R13!,{R6,R7,R8}
	// Carga individual desde RAM a R9 con la última dirección.
	LDR R9, [R13]

	.align
	.end							//Final del programa.

	.text
	.global main

main:
// Para enteros de hasta 8 bits o de la forma de segundo operador flexible.
	MOV	R1, #255
	MOV	R2, #-99
	MOV R3, #0XFF
	MOV R4, #0x3FC0
	MVN	R5, #0X3FC
	BX LR

	.align
	.end							// Final del programa.

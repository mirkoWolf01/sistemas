.data
informacion_alumno: 
    .half 5523
    .byte 3
    .half 8754
    .byte 6
    .half 8675
    .byte 6
    .half 7765
    .byte 1
    .half 5553
    .byte 10
    .half 2312
    .byte 8
    .half 0 #Declaramos el final del arreglo

.text
.global bytes_InfoAlumnos
main:
la a0, informacion_alumno
call bytes_InfoAlumnos
mv a1, a0
la a0, informacion_alumno
call suma_notas_impares
j fin

bytes_InfoAlumnos:
addi sp, sp, -16
sw ra, 0(sp)
lh t0, 0(a0)    # id alumno
mv t1, a0       # adress
li a0, 0        # contador
while_bIA:
beqz t0, end_while_bIA
addi t1, t1, 3
addi a0, a0, 3
lh   t0, 0(t1)  
j while_bIA
end_while_bIA:
addi a0, a0, 1
lw ra, 0(sp)
addi sp, sp, 16
ret 

suma_notas_impares:
addi sp, sp, -16
sw ra, 0(sp)

mv t0, a1   # contador
mv t1, a0   # adress
li a0, 0    # suma
addi t0, t0, -1
while_sumaImpares:
beqz t0, end_while_sumaImpares
lh t5, 0(t1)    # id 
lb t6, 2(t1)    # nota 
addi t1, t1, 3
addi t0, t0, -3
andi t2, t5, 0b1 # da 1 si es impar
beqz t2, while_sumaImpares    # si es par, vuelve al inicio
add a0, a0, t6
j while_sumaImpares
end_while_sumaImpares:
lw ra, 0(sp)
addi sp, sp, 16
ret 

fin:
    nop

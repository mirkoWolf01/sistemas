.data 
arreglo: .word 3, 1, 3, 1, 5, 9, 2, 6
length: .word 8

.text
lw t0, arreglo
lw t1, length
lw t3, 0         # Iterador
lw s0, 0         # max

while: 
beq t1, zero, fin
sw t4, 0(t0) # Cambiar

bgt t4, s0, no_max



no_max:
addi t3, t3, 4
addi t1, t1, -1
j while    


fin:
add s11,s11,zero

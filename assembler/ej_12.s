.data 
s: .word 1,2,3
q: .word 100,25,4
length: .word 3
.text
la t0, s
la t1, q
lw s0, length

li t6, 0 # i = 0
while:
beq t6, s0, fin   
slli t5, t6, 2    # Guardo la direccion del proximo elemenento del array

add t4, t0, t5    # Guardo la direccion original + el offset actual de s
add t2, t1, t5    # Guardo la direccion original + el offset actual de q

lw t3, 0(t2)      # Cargo el valor de q[i] en s2
sw t3, 0(t4)      # Guarda el valor de t3 en la direccion t4

addi t6,t6,1    # i++
j while

fin: 
nop
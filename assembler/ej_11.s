.data 
arreglo: .word 3, 1, 3, 1, 5, 9, 2, 6
length: .word 8

.text
la t0, arreglo   # Guardo la direccion del arreglo
lw t1, length
li t2, 0         # Iterador

#Compruebo si la lista esta vacia
beq t1, zero, fin
lw s0, 0(t0)  # max
addi t2, t2, 1

while:
beq t1, t2, fin
slli t3, t2, 2    # Guardo la direccion del proximo elemenento del array
add t4, t0, t3    # Guardo la direccion original + el offset actual
lw t5, 0(t4)      # Guardo el elemento de la iteracion actual

bge s0, t5, skip    # max >= max_iteracion => no lo guardes
mv s0, t5

skip:
addi t2, t2, 1    # t2++
j while

fin:
mv a0, s0
#ret
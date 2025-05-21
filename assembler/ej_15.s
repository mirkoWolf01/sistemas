.data
n: .word 0x0, 0xffffffff, 0x0, 0x1, 0x5, 0xF0
length: .word 3
adress: .word 0x0, 0x0

.text
lw t0, length
la t1, n         # direccion de los valores del array
la t2 , adress   # donde guardar los valores

li s0, 0         # iterador

while: 
beq s0, t0, fin
slli t3, s0, 3
add t3, t3, t1    # le sumo el offset al adress

jal ra, suma_64b  # salta a la funcion y guardo la dir de retorno

addi s0, s0, 1
j while

suma_64b:
#Sumo la parte baja, y si hubo carry lo guardo
lw t4, 4(t3)
lw t5, 4(t2)

add a0, t4, t5 
sltu t6, a0, t5    # set if less than, pone un 1 si a0 es menor a t5, osea si hubo carry

sw a0, 4(t2)

#Sumo la parte alta y le agrego el carry si hubo
lw t4, 0(t3)
lw t5, 0(t2)

add a0, t4, t5    # sumo las partes altas
add a0, a0, t6    # carry + parte alta

sw a0, 0(t2)
ret

fin:
nop

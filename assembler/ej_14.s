.data
n: .word 0x12345678, 0x9ABCDEF0  
m: .word 0x11111111, 0x12345678  
adress: .word 0, 0

.global sumar_64b
sumar_64b:
.text
la t0, n
la t1, m
la t2, adress

#Sumo la parte baja y me fijo si hubo overflow
lw t4, 4(t0)
lw t5, 4(t1)

add a0, t4, t5 
sltu t6, a0, t5    # Set if less than, pone un 1 si a0 es menor a t5, osea si hubo overflow

sw a0, 4(t2)

#Sumo la parte alta y me fijo si hubo overflow
lw t4, 0(t0)
lw t5, 0(t1)

add a0, t4, t5     # Carry + parte alta
add a0, a0, t6

sw a0, 0(t2)

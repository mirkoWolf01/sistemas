.data 
s: .word 1,2,3
q: .word 100,25,18
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

lw s1, 0(t2)    
andi s1, s1, 0b1  #Compruebo si es impar
beq s1, zero, even
j neven

even:
lw t3, 0(t2)      # Cargo el valor de q[i] en t3
sw t3, 0(t4)      # Guarda el valor de t3 en la direccion t4
j skip

neven: 
li t3, 0          # Cargo 0 en t3 y luego lo guardo en la direccion de t4
sw t3, 0(t4)      

skip:
addi t6,t6 , 1    # i++
j while

fin: 
nop
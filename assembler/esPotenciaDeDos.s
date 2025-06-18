.text

main:
li a0,256
slli a0, a0, 10

call is_pow2

mv s0, a0

j fin

is_pow2: 
addi sp, sp, -16
sw ra, 0(sp)

li t0, 32    #cant de bits
li t1, 0     #valor final
li t2, 0x1   #valor a comparar
 

while:
beqz t0, end_while
bne a0,t2, not_pow2
li t1, 1
j end_while
not_pow2:
slli t2, t2, 1
addi t0, t0, -1
j while

end_while:
mv a0, t1
lw ra, 0(sp)
addi sp, sp, 16
ret                #end_is_pow2


fin:
    nop
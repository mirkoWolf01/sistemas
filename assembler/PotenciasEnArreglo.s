.data
arr: .byte 1, 8, 0, 99, 128
len: .word 5

.text
main:
la a0, arr
lw a1, len

call pow2_arr

mv s0, a0

j fin

# Sirve para un array con numeros de 8 bits
pow2_arr:
addi sp, sp, -16
sw s2, 12(sp)    
sw s1, 8(sp)    
sw s0, 4(sp)
sw ra, 0(sp)

mv s0, a0    # dir de arr
mv s1, a1    # len de arr
li s2, 0     # cant. de potencias de 2

while_pow2_arr: 
beqz s1, end_while_pow2_arr
lbu a0, 0(s0)        # carga el Byte 
jal is_pow2
addi s0, s0 1
addi s1, s1, -1
add s2, s2, a0
j while_pow2_arr
end_while_pow2_arr:
mv a0, s2
lw s2, 12(sp)    
lw s1, 8(sp)
lw s0, 4(sp)
lw ra, 0(sp)
addi sp, sp, 16
ret                #end pow2_arr

is_pow2: 
addi sp, sp, -16
sw ra, 0(sp)
li t0, 8     #cant de bits
li t1, 0     #valor final
li t2, 0x1   #valor a comparar
while_is_pow2:
beqz t0, end_while_is_pow2
bne a0,t2, not_pow2
li t1, 1
j end_while_is_pow2
not_pow2:
slli t2, t2, 1
addi t0, t0, -1
j while_is_pow2
end_while_is_pow2:
mv a0, t1
lw ra, 0(sp)
addi sp, sp, 16
ret                #end is_pow2


fin:
    nop
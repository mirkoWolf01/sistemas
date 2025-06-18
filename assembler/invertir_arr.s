.data
lst: .word 1, -2, -3, 4, 5, 2, -5, -1, 0
len: .word 9

.text
main:
la a0, lst
la a1, len

call inv_arr

j fin

inv:
addi sp, sp, -16
sw ra, 0(sp)

xori a0, a0, -1
addi a0, a0, 1

lw ra, 0(sp)
addi sp, sp, 16
ret

inv_arr:
addi sp, sp, -16
sw s1, 8(sp)
sw s0, 4(sp)
sw ra, 0(sp)  

mv s0, a0       # dir de array
lw s1, 0(a1)    # elems restantes

while:
beqz s1, end_while

lw a0, 0(s0)
call inv

sw a0, 0(s0)
addi s0, s0, 4
addi s1, s1, -1
j while

end_while:
lw ra, 0(sp)
lw s0, 4(sp)
lw s1, 8(sp)
addi sp, sp, 16
ret            # fin de inv_arr

fin:
    nop


.text
main:
li a0, 10
call factorial
mv s0, a0
j fin

factorial:
addi sp, sp, -16
sw s0, 4(sp)
sw ra, 0(sp)
bnez a0, mayorcero
li a0, 1
j end_fact
mayorcero:
mv s0, a0
addi a0, a0, -1
call factorial
mul a0, s0, a0
end_fact:
lw s0, 4(sp)
lw ra, 0(sp)
addi sp, sp, 16
ret 


fin:
        nop
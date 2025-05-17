.data 
    val: .word 0x082B0230
    shf: .word 0x00000004
    
.text

lw t0, val
lw t1, shf

shiftll: 
    beq t1, zero, fin
    add t0, t0, t0 # Multiplica por 2
    addi t1, t1, -1
j shiftll
    
fin: 
nop
    
    
.data
val: .word 0x901A0002

.text 
lw t0, val
add t1, zero, t0

## Despejo el primer byte, y lo guardo en el sumador (s0)
andi a0, t1, 0xFF
add s0, s0, a0

## Despejo el segundo byte
srli t1, t1, 8
andi a1, t1, 0xFF
add s0, s0, a1

## Despejo el tercer byte
srli t1, t1, 8
andi a2, t1, 0xFF
add s0, s0, a2

## Despejo el ultimo byte
srli t1, t1, 8
andi a3, t1, 0xFF
add s0, s0, a3
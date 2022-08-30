const screen = $0400

START:
 jsr FIB
 rts 

FIB:
 ldd #$00
 ldx #$01
 ldy #screen
CALCFIB:
 addb #$30
 stb ,y+
 subb #$30
 pshu x
 abx
 ldb $01,u 
 cmpb #$08
 bls CALCFIB
 rts
 
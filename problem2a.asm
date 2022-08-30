const screen = $0400
START:
 jsr FIB
 rts 

FIB:
 ldb #$00
 ldx #$01
CALCFIB:
 addb #$30
 stb ,y
 subb #$30
 pshu x
 abx
 ldb $01,u 
 cmpb #$08
 bls CALCFIB
 rts

 
 
 


 
 
const screen = $0400

START:
 jsr MAIN:
 rts

MAIN:
 ldx #screen
 ldd #$FDCB
 jsr PRINTD
 lda #$20
 jsr PRINT
 ldd #$1234
 jsr PRINTD
 rts

PRINTD: 
 pshu d
 jsr CONVERT
 tfr b, a
 jsr CONVERT
 rts

CONVERT:
 pshu a
 lsra
 lsra
 lsra
 lsra
 jsr CHECK
 pulu a
 anda #$f
 jsr CHECK 
 rts

CHECK:
 cmpa #$0A
 bge LETTER
 bls NUMBER
LETTER:
 suba #$09
 bra PRINT
NUMBER:
 adda #$30
 bra PRINT

PRINT:
 sta ,x+
 rts
const screen = $0400

START:
 jsr MAIN
 rts 

MAIN:
 ldd #$0000
 ldx #$0001
 ldy #screen
PRINTFIB:
 jsr PRINTD:
CALCFIB:
 pshu d
 pshu x
 addd, u
 pulu x
 pulu x
 cmpd #$2511
 beq done
COMMA:
 pshu a
 lda #$2C
 jsr PRINT
 pulu a
 bra PRINTFIB
DONE:
 rts

PRINTD: 
 pshu d
 jsr CONVERT
 tfr b, a
 jsr CONVERT
 pulu d
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
 ble NUMBER
LETTER:
 suba #$09
 bra PRINT
NUMBER:
 adda #$30
 bra PRINT
PRINT:
 sta ,y+
 rts
 
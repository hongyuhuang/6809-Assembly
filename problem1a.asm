start:
    jsr ONETONINE
    rts

const textScreenBase = $0400

ONETONINE    
    lda #48
    ldx #textScreenBase
DISPLAYONETONINE:
    sta 0, x
    inca
    cmpa #57
    bls DISPLAYONETONINE:
    rts





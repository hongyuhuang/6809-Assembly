lda #48

ONETONINE:
    sta $0400
    inca
    cmpa #57
    bls ONETONINE
    rts
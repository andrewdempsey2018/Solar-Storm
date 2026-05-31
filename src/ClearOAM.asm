.proc clear_oam
  SAVE_REGISTERS

  ldx #$00
  lda #$F8
@clear_oam:
  sta $0200, x          ; set sprite y-positions off the screen
  inx
  inx
  inx
  inx
  bne @clear_oam

  RESTORE_REGISTERS
  rts
.endproc
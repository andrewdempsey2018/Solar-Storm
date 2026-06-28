; --------------------------------------------------
; Loads a full nametable & attributes, expects
; nametable data to be in rows
; top left -> bottom right.

; Set nametable number (00 or 02).
; layout_pointer: set this to the required layout table
; 'metatile_top_pointer' should point at top left and top right tiles for metatiles
; 'metatile_bottom_pointer' should point at bottom left and bottom right tiles for metatiles
; 'attribs_pointer' should point at relevant attributes
; --------------------------------------------------

.proc init_nametable
  SAVE_REGISTERS

  lda nametable_number
  cmp #$00
  bne nametable_02
nametable_00:
  lda PPUSTATUS
  lda #$20
  sta PPUADDR
  lda #$00
  sta PPUADDR
  jmp nametable_address_set
nametable_02:
  lda PPUSTATUS
  lda #$28
  sta PPUADDR
  lda #$00
  sta PPUADDR
nametable_address_set:

  lda #$00
  sta zp_scratch_02

  ldy #$00
  ldx #$00
top_loop:
  txa
  clc
  adc zp_scratch_02
  tay
  lda (layout_pointer), y
  asl a
  tay
  lda (metatile_top_pointer), y
  sta PPUDATA
  iny
  lda (metatile_top_pointer), y
  sta PPUDATA
  inx
  cpx #$10
  bne top_loop

  ldx #$00
bottom_loop:
  txa
  clc
  adc zp_scratch_02
  tay
  lda (layout_pointer), y
  asl a
  tay
  lda (metatile_bottom_pointer), y
  sta PPUDATA
  iny
  lda (metatile_bottom_pointer), y
  sta PPUDATA
  inx
  cpx #$10
  bne bottom_loop

  ldx #$00
  lda zp_scratch_02
  clc
  adc #$10
  sta zp_scratch_02
  cmp #$F0
  bne top_loop

  ldy #$00
load_attribs:
  lda (attribs_pointer), y
  sta PPUDATA
  iny
  cpy #$40
  bne load_attribs

  RESTORE_REGISTERS
  rts
.endproc
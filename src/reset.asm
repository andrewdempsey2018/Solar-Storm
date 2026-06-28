.segment "ZEROPAGE"

.segment "CODE"
.export reset_handler
.proc reset_handler
  sei                   ; disable interrupts
  cld
  ldx #$40
  stx APU
  ldx #$FF
  txs
  inx
  stx PPUCTRL
  stx PPUMASK
  stx IRQ_ENABLE
  bit PPUSTATUS

  WAIT_VBLANK

	ldx #$00
	lda #$FF
clear_oam:
	sta PPUCTRL, x        ; set sprite y-positions off the screen
	inx
	inx
	inx
	inx
	bne clear_oam

  lda #$00
  sta scroll_y

  lda #$00
  sta nametable_number

  lda #$00
  sta metatile_row_number

  lda #$00
  sta do_scroll

  lda #$01
  sta do_render

  lda #$00
  sta row_address
  sta level_data
  sta prep_next_row

  lda #$00
  sta zp_scratch_0
  sta zp_scratch_1
  sta zp_scratch_1+1
  sta zp_scratch_02
  sta screen_counter
  
  sta screens_lo_pointer
  sta screens_hi_pointer+1
  sta layout_pointer
  sta layout_pointer+1
  sta metatile_top_pointer
  sta metatile_top_pointer+1
  sta metatile_bottom_pointer
  sta metatile_bottom_pointer+1
  sta attribs_lo_pointer
  sta attribs_lo_pointer+1
  sta attribs_hi_pointer
  sta attribs_hi_pointer+1
  sta attribs_pointer
  sta attribs_pointer+1

; --------------------------------------------------
; clear BSS memory.
; --------------------------------------------------

  lda #0

  ldx #0
clear_row_data:
  sta row_data
  inx
  cpx #64
  bne clear_row_data

  ldx #0
clear_attrib_data:
  sta attrib_data
  inx
  cpx #8
  bne clear_attrib_data

  lda #$00
  sta scene_number

; --------------------------------------------------
; Finished clearing memory, vblank wait then go to game.
; --------------------------------------------------
  WAIT_VBLANK
  
  jmp main
.endproc
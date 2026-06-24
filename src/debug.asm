.proc debug
  SAVE_REGISTERS

  lda buttons_pressed
  and #BTN_START
  bne :+
  jmp done
:

; ----------------------------------- ;
; stop rendering
  lda #0
  sta PPUMASK

  lda #$00
  sta do_scroll
  sta scroll_y
  sta do_render
  sta screen_counter
  sta metatile_row_number
  ;sta prep_next_row ????
; ----------------------------------- ;

  lda #BANK_NUMBER_BEACH
  sta BANK_SWITCH

  lda #<BeachData::Screen1
  sta layout_pointer
  lda #>BeachData::Screen1
  sta layout_pointer+1

  lda #<BeachData::MetatileTop
  sta metatile_top_pointer
  lda #>BeachData::MetatileTop
  sta metatile_top_pointer+1

  lda #<BeachData::MetatileBottom
  sta metatile_bottom_pointer
  lda #>BeachData::MetatileBottom
  sta metatile_bottom_pointer+1


  lda #<BeachData::ScreensLow
  sta screens_lo_pointer
  lda #>BeachData::ScreensLow
  sta screens_lo_pointer+1

  lda #<BeachData::ScreensHigh
  sta screens_hi_pointer
  lda #>BeachData::ScreensHigh
  sta screens_hi_pointer+1

  lda #<BeachData::AttribsLow
  sta attribs_lo_pointer
  lda #>BeachData::AttribsLow
  sta attribs_lo_pointer+1

  lda #<BeachData::AttribsHigh
  sta attribs_hi_pointer
  lda #>BeachData::AttribsHigh
  sta attribs_hi_pointer+1

; ----------------------------------- ;
; load palettes
  ldx PPUSTATUS
  ldx #$3F
  stx PPUADDR
  ldx #$00
  stx PPUADDR

  ldx #$00
@load_palette:
  lda BeachData::PaletteTable, x
  sta PPUDATA
  inx
  cpx #$20
  bne @load_palette
; ----------------------------------- ;

; ----------------------------------- ;
; restart rendering
  lda #$01
  sta do_scroll
  sta do_render
; ----------------------------------- ;

done:
  RESTORE_REGISTERS
  rts
.endproc

.proc debug2
  SAVE_REGISTERS

  lda buttons_pressed
  and #BTN_START
  bne :+
  jmp done
:

; --------------------------------------------------
; turn off rendering
; --------------------------------------------------
  lda #0
  sta PPUCTRL
  sta PPUMASK

; --------------------------------------------------
; 
; --------------------------------------------------
  lda #$00
  sta do_scroll
  sta scroll_y
  sta do_render
  sta screen_counter
  sta metatile_row_number
  ;sta prep_next_row ????

; --------------------------------------------------
; 
; --------------------------------------------------
  lda #BANK_NUMBER_STATION
  sta BANK_SWITCH

  lda #<StationData::Screen1
  sta layout_pointer
  lda #>StationData::Screen1
  sta layout_pointer+1

  lda #<StationData::MetatileTop
  sta metatile_top_pointer
  lda #>StationData::MetatileTop
  sta metatile_top_pointer+1

  lda #<StationData::MetatileBottom
  sta metatile_bottom_pointer
  lda #>StationData::MetatileBottom
  sta metatile_bottom_pointer+1


  lda #<StationData::ScreensLow
  sta screens_lo_pointer
  lda #>StationData::ScreensLow
  sta screens_lo_pointer+1

  lda #<StationData::ScreensHigh
  sta screens_hi_pointer
  lda #>StationData::ScreensHigh
  sta screens_hi_pointer+1

  lda #<StationData::AttribsLow
  sta attribs_lo_pointer
  lda #>StationData::AttribsLow
  sta attribs_lo_pointer+1

  lda #<StationData::AttribsHigh
  sta attribs_hi_pointer
  lda #>StationData::AttribsHigh
  sta attribs_hi_pointer+1

; ----------------------------------- ;
; load palettes
  ldx PPUSTATUS
  ldx #$3F
  stx PPUADDR
  ldx #$00
  stx PPUADDR

  ldx #$00
@load_palette:
  lda StationData::PaletteTable, x
  sta PPUDATA
  inx
  cpx #$20
  bne @load_palette
; ----------------------------------- ;

; ----------------------------------- ;
; restart rendering
  lda #$01
  sta do_scroll
  sta do_render
; ----------------------------------- ;

done:
  RESTORE_REGISTERS
  rts
.endproc

.proc debug3
  SAVE_REGISTERS

  lda buttons_pressed
  and #BTN_START
  bne :+
  jmp done
:

; ----------------------------------- ;
; stop rendering
  lda #0
  sta PPUMASK

  lda #$00
  sta do_scroll
  sta scroll_y
  sta do_render
  sta screen_counter
  sta metatile_row_number
  ;sta prep_next_row ????
; ----------------------------------- ;

  lda #BANK_NUMBER_CERES
  sta BANK_SWITCH

  lda #<CeresData::Screen1
  sta layout_pointer
  lda #>CeresData::Screen1
  sta layout_pointer+1

  lda #<CeresData::MetatileTop
  sta metatile_top_pointer
  lda #>CeresData::MetatileTop
  sta metatile_top_pointer+1

  lda #<CeresData::MetatileBottom
  sta metatile_bottom_pointer
  lda #>CeresData::MetatileBottom
  sta metatile_bottom_pointer+1

  lda #<CeresData::ScreensLow
  sta screens_lo_pointer
  lda #>CeresData::ScreensLow
  sta screens_lo_pointer+1

  lda #<CeresData::ScreensHigh
  sta screens_hi_pointer
  lda #>CeresData::ScreensHigh
  sta screens_hi_pointer+1

  lda #<CeresData::AttribsLow
  sta attribs_lo_pointer
  lda #>CeresData::AttribsLow
  sta attribs_lo_pointer+1

  lda #<CeresData::AttribsHigh
  sta attribs_hi_pointer
  lda #>CeresData::AttribsHigh
  sta attribs_hi_pointer+1

; ----------------------------------- ;
; load palettes
  ldx PPUSTATUS
  ldx #$3F
  stx PPUADDR
  ldx #$00
  stx PPUADDR

  ldx #$00
@load_palette:
  lda CeresData::PaletteTable, x
  sta PPUDATA
  inx
  cpx #$20
  bne @load_palette

; ----------------------------------- ;
; restart rendering
  lda #$01
  sta do_scroll
  sta do_render
; ----------------------------------- ;

done:
  RESTORE_REGISTERS
  rts
.endproc

.proc debug4
  SAVE_REGISTERS

  lda buttons_pressed
  and #BTN_START
  bne :+
  jmp done
:

; ----------------------------------- ;
; stop rendering
  lda #0
  sta PPUMASK

  lda #$00
  sta do_scroll
  sta scroll_y
  sta do_render
  sta screen_counter
  sta metatile_row_number
  ;sta prep_next_row ????
; ----------------------------------- ;

  lda #BANK_NUMBER_PLACEHOLDER
  sta BANK_SWITCH

  lda #<PlaceholderData::Screen1
  sta layout_pointer
  lda #>PlaceholderData::Screen1
  sta layout_pointer+1

  lda #<PlaceholderData::MetatileTop
  sta metatile_top_pointer
  lda #>PlaceholderData::MetatileTop
  sta metatile_top_pointer+1

  lda #<PlaceholderData::MetatileBottom
  sta metatile_bottom_pointer
  lda #>PlaceholderData::MetatileBottom
  sta metatile_bottom_pointer+1

  lda #<PlaceholderData::ScreensLow
  sta screens_lo_pointer
  lda #>PlaceholderData::ScreensLow
  sta screens_lo_pointer+1

  lda #<PlaceholderData::ScreensHigh
  sta screens_hi_pointer
  lda #>PlaceholderData::ScreensHigh
  sta screens_hi_pointer+1

  lda #<PlaceholderData::AttribsLow
  sta attribs_lo_pointer
  lda #>PlaceholderData::AttribsLow
  sta attribs_lo_pointer+1

  lda #<PlaceholderData::AttribsHigh
  sta attribs_hi_pointer
  lda #>PlaceholderData::AttribsHigh
  sta attribs_hi_pointer+1

; ----------------------------------- ;
; load palettes
  ldx PPUSTATUS
  ldx #$3F
  stx PPUADDR
  ldx #$00
  stx PPUADDR

  ldx #$00
@load_palette:
  lda PlaceholderData::PaletteTable, x
  sta PPUDATA
  inx
  cpx #$20
  bne @load_palette

; ----------------------------------- ;
; restart rendering
  lda #$01
  sta do_scroll
  sta do_render
; ----------------------------------- ;

done:
  RESTORE_REGISTERS
  rts
.endproc
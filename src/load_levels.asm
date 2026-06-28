.proc load_station
  SAVE_REGISTERS

  lda buttons_pressed
  and #BTN_START
  bne :+
  RESTORE_REGISTERS
  rts
:

; --------------------------------------------------
; turn off rendering
; --------------------------------------------------
  lda #0
  sta PPUCTRL
  sta PPUMASK
  sta PPUSCROLL
  sta PPUSCROLL

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

  jsr init_nametable

    lda #<StationData::Screen2
  sta layout_pointer
  lda #>StationData::Screen2
  sta layout_pointer+1

  lda #2
  sta nametable_number
  jsr init_nametable


  
  ;sta scroll_y
  lda #$FF
  sta metatile_row_number
  jsr prepare_next_row
; ----------------------------------- ;
; restart rendering
  lda #$01
  sta do_scroll
  sta do_render
; ----------------------------------- ;



; --------------------------------------------------
; turn on NMIs, sprites use first pattern table
; turn on screen
; --------------------------------------------------                 
  lda #%10010000
  eor nametable_number
  sta PPUCTRL
  lda #%00011110
  sta PPUMASK

; --------------------------------------------------
; 
; -------------------------------------------------- 
  RESTORE_REGISTERS
  rts
.endproc

.proc load_beach
  SAVE_REGISTERS

  lda buttons_pressed
  and #BTN_START
  bne :+
  RESTORE_REGISTERS
  rts
:

; --------------------------------------------------
; turn off rendering
; --------------------------------------------------
  lda #0
  sta PPUCTRL
  sta PPUMASK
  sta PPUSCROLL
  sta PPUSCROLL

; --------------------------------------------------
; 
; --------------------------------------------------
  lda #$00
  sta do_scroll
  sta scroll_y
  sta do_render
  sta screen_counter
  sta metatile_row_number
  sta prep_next_row

; --------------------------------------------------
; 
; --------------------------------------------------
  lda #BANK_NUMBER_BEACH
  sta BANK_SWITCH

  lda #<BeachData::ScreenX
  sta layout_pointer
  lda #>BeachData::ScreenX
  sta layout_pointer+1

  lda #<BeachData::MetatileTop
  sta metatile_top_pointer
  lda #>BeachData::MetatileTop
  sta metatile_top_pointer+1

  lda #<BeachData::MetatileBottom
  sta metatile_bottom_pointer
  lda #>BeachData::MetatileBottom
  sta metatile_bottom_pointer+1

  lda #<BeachData::ScreenXAttrib
  sta attribs_pointer
  lda #>BeachData::ScreenXAttrib
  sta attribs_pointer+1

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

  jsr init_nametable

  lda #2
  sta nametable_number
  jsr init_nametable

  ;;;;;
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

  ldy #$00

  lda (attribs_lo_pointer), y
  sta attribs_pointer
  lda (attribs_hi_pointer), y
  sta attribs_pointer+1
  ;;;;;


  lda #0
  sta scroll_y
  lda #$FF
  sta metatile_row_number
  jsr prepare_next_row
; ----------------------------------- ;
; restart rendering
  lda #$01
  sta do_scroll
  sta do_render
; ----------------------------------- ;



; --------------------------------------------------
; turn on NMIs, sprites use first pattern table
; turn on screen
; --------------------------------------------------                 
  lda #%10010000
  eor nametable_number
  sta PPUCTRL
  lda #%00011110
  sta PPUMASK

; --------------------------------------------------
; 
; -------------------------------------------------- 
  RESTORE_REGISTERS
  rts
.endproc
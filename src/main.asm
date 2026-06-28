.include "macros.asm"
.include "constants.inc" 
.include "header.inc"
.include "reset.asm"
.include "controllers.asm"
.include "load_row.asm"
.include "ClearOAM.asm"
.include "init_nametable.asm"
.include "load_levels.asm"

.segment "ZEROPAGE"
sleeping: .res 1
buttons_held: .res 1
buttons_pressed: .res 1

nametable_number: .res 1
row_address: .res 2
level_data: .res 2
scroll_y: .res 1
screen_counter: .res 1
prep_next_row: .res 1

metatile_row_number: .res 1

; --------------------------------------------------
; scratch area
; --------------------------------------------------
zp_scratch_0: .res 1
zp_scratch_1: .res 2
zp_scratch_02: .res 1

do_render: .res 1
do_scroll: .res 1

; --------------------------------------------------
; pointers required for rendering levels
; --------------------------------------------------
layout_pointer: .res 2
metatile_top_pointer: .res 2
metatile_bottom_pointer: .res 2
attribs_pointer: .res 2
screens_lo_pointer: .res 2
screens_hi_pointer: .res 2
attribs_lo_pointer: .res 2
attribs_hi_pointer: .res 2

.segment "BSS"
row_data: .res 64
attrib_data: .res 8
level_number: .res 1

.segment "CODE"

.proc irq_handler
  rti
.endproc

.proc nmi_handler
  SAVE_REGISTERS

  lda #$00
  sta OAMADDR
  lda #$02
  sta OAMDMA
  lda #$00

  lda do_scroll
  cmp #$01
  bne dont_scroll

  dec scroll_y
  lda scroll_y
  cmp #255
  bne dont_reset_scroll_y
  lda #239
  sta scroll_y
  lda nametable_number
  eor #$02
  sta nametable_number
dont_reset_scroll_y:

NewRowCheck:
  lda scroll_y
  and #%00001111        ; multiple of 16
  bne NewRowCheckDone
  jsr load_row
  lda #$01
  sta prep_next_row

NewRowCheckDone:
dont_scroll:

  lda #$00
  sta PPUSCROLL         ; x scroll
  lda scroll_y
  sta PPUSCROLL         ; y scroll
                        
                        ; This is the PPU clean up section, so rendering the next frame starts properly.
  lda #%10010000        ; enable NMI, sprites from Pattern Table 0, background from Pattern Table 1
  eor nametable_number
  sta PPUCTRL

  lda do_render
  beq dont_render
  lda #%00011110        ; enable sprites, enable background, no clipping on left side
  sta PPUMASK
dont_render:

  lda #$00
  sta sleeping

  RESTORE_REGISTERS
  rti                   ; return from interrupt
.endproc

.proc main
; --------------------------------------------------
; turn off rendering
; --------------------------------------------------
  lda #0
  sta PPUCTRL
  sta PPUMASK
  sta PPUSCROLL
  sta PPUSCROLL

; --------------------------------------------------
; Load first screen
; --------------------------------------------------
  lda #BANK_NUMBER_GENERIC
  sta BANK_SWITCH

  ldx PPUSTATUS
  ldx #$3F
  stx PPUADDR
  ldx #$00
  stx PPUADDR

load_demoncore_screen_palettes:
  lda DemoncoreData::PaletteTable, x
  sta PPUDATA
  inx
  cpx #$20
  bne load_demoncore_screen_palettes
  
  lda #<DemoncoreData::Screen1
  sta layout_pointer
  lda #>DemoncoreData::Screen1
  sta layout_pointer+1

  lda #<DemoncoreData::MetatileTop
  sta metatile_top_pointer
  lda #>DemoncoreData::MetatileTop
  sta metatile_top_pointer+1

  lda #<DemoncoreData::MetatileBottom
  sta metatile_bottom_pointer
  lda #>DemoncoreData::MetatileBottom
  sta metatile_bottom_pointer+1

  lda #<DemoncoreData::Screen1Attrib
  sta attribs_pointer
  lda #>DemoncoreData::Screen1Attrib
  sta attribs_pointer+1

  jsr init_nametable

; --------------------------------------------------
; enable interrupts
; --------------------------------------------------
  cli

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
; wait for another vblank before continuing
; --------------------------------------------------
  WAIT_VBLANK

mainloop:

  lda prep_next_row
  beq next_row_is_prepared
  jsr prepare_next_row
next_row_is_prepared:

  jsr read_controller

; --------------------------------------------------
; For debug purposes.
; Load levels by pressing start
; --------------------------------------------------
  lda buttons_pressed
  and #BTN_START
  beq :+
  jsr load_levels
:

; --------------------------------------------------
; 
; --------------------------------------------------

done:
  inc sleeping
sleep:
  lda sleeping
  bne sleep

  jmp mainloop
.endproc

.segment "VECTORS"
.addr nmi_handler, reset_handler, irq_handler

.segment "CHR"
.incbin "graphics_generic.chr"
.incbin "graphics_title.chr"
.incbin "graphics_station.chr"
.incbin "graphics_beach.chr"
.incbin "graphics_ceres.chr"
.incbin "graphics_space.chr"
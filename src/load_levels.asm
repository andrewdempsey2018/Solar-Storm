.segment "RODATA"

.include "../data/beach_data.asm"
.include "../data/station_data.asm"
.include "../data/ceres_data.asm"
.include "../data/space_data.asm"
.include "../data/title_data.asm"
.include "../data/demoncore_data.asm"

.segment "CODE"


.proc load_levels
  SAVE_REGISTERS
; --------------------------------------------------
; Turn off rendering.
; --------------------------------------------------
  lda #0
  sta PPUCTRL
  sta PPUMASK
  sta PPUSCROLL
  sta PPUSCROLL

; --------------------------------------------------
; Clear variables used in levels.
; --------------------------------------------------
  lda #$00
  sta do_scroll
  sta scroll_y
  sta do_render
  sta screen_counter
  sta metatile_row_number
  sta prep_next_row

; --------------------------------------------------
; Increment scene number, determine which scene
; is next.
; --------------------------------------------------
  inc scene_number
  lda scene_number

  cmp #SCENE_NUMBER_DEMONCORE_SCREEN
  beq load_demoncore_static_scene
  cmp #SCENE_NUMBER_TITLE_SCREEN
  beq load_titlescreen_static_scene
  cmp #SCENE_NUMBER_INTRO_SCREEN
  beq load_beach_gameplay_scene
  
  ;SCENE_NUMBER_DEMONCORE_SCREEN = 0
;SCENE_NUMBER_TITLE_SCREEN = 1
;SCENE_NUMBER_INTRO_SCREEN = 2
;SCENE_NUMBER_SHIPSELECT_SCREEN = 3
;SCENE_NUMBER_LEVEL1TITLE_SCREEN = 4
;SCENE_NUMBER_LEVEL1GAMEPLAY_SCREEN = 5
;SCENE_NUMBER_LEVEL1BOSS_SCREEN = 6
;SCENE_NUMBER_LEVEL2TITLE_SCREEN = 7
;SCENE_NUMBER_LEVEL2GAMEPLAY_SCREEN = 8
;SCENE_NUMBER_LEVEL2BOSS_SCREEN = 9
;SCENE_NUMBER_LEVEL3TITLE_SCREEN = 10
;SCENE_NUMBER_LEVEL3GAMEPLAY_SCREEN = 11
;SCENE_NUMBER_LEVEL3BOSS_SCREEN = 12
;SCENE_NUMBER_LEVEL4TITLE_SCREEN = 13
;SCENE_NUMBER_LEVEL4GAMEPLAY_SCREEN = 14
;SCENE_NUMBER_LEVEL4BOSS_SCREEN = 15
;SCENE_NUMBER_ENDING_SCREEN = 16

load_demoncore_static_scene:
  jmp start_static_screen_level

load_titlescreen_static_scene:
  lda #BANK_NUMBER_TITLE_SCREEN
  sta BANK_SWITCH

  ldx PPUSTATUS
  ldx #$3F
  stx PPUADDR
  ldx #$00
  stx PPUADDR

load_titlescreen_palettes:
  lda TitleData::PaletteTable, x
  sta PPUDATA
  inx
  cpx #$20
  bne load_titlescreen_palettes
  
  lda #<TitleData::Screen1
  sta layout_pointer
  lda #>TitleData::Screen1
  sta layout_pointer+1

  lda #<TitleData::MetatileTop
  sta metatile_top_pointer
  lda #>TitleData::MetatileTop
  sta metatile_top_pointer+1

  lda #<TitleData::MetatileBottom
  sta metatile_bottom_pointer
  lda #>TitleData::MetatileBottom
  sta metatile_bottom_pointer+1

  lda #<TitleData::Screen1Attrib
  sta attribs_pointer
  lda #>TitleData::Screen1Attrib
  sta attribs_pointer+1

  jsr init_nametable

  jmp start_static_screen_level

; --------------------------------------------------
; Load Beach gameplay scene.
; --------------------------------------------------
load_beach_gameplay_scene:
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

  lda #0
  sta nametable_number
  jsr init_nametable

  lda #2
  sta nametable_number
  jsr init_nametable

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

  jmp start_gameplay_level

; --------------------------------------------------
; prepare for scrolling
; --------------------------------------------------
start_gameplay_level:
  lda #0
  sta scroll_y
  lda #$FF
  sta metatile_row_number
  jsr prepare_next_row

; start scrolling
  lda #$01
  sta do_scroll

  jmp turn_on_rendering

start_static_screen_level:
; add code specific to static screen type levels

; --------------------------------------------------
; turn on NMIs, sprites use first pattern table
; turn on screen
; --------------------------------------------------
turn_on_rendering:
  lda #%10010000
  eor nametable_number
  sta PPUCTRL
  lda #%00011110
  sta PPUMASK

  lda #$01
  sta do_render

; --------------------------------------------------
; Finished preparing level
; -------------------------------------------------- 
  RESTORE_REGISTERS
  rts
.endproc
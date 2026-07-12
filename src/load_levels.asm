; TODO this code is very poor, refactor
; far too much repeated code
; left here temporarily for debugging reasons

.segment "RODATA"

.include "../data/beach_data.asm"
.include "../data/station_data.asm"
.include "../data/ceres_data.asm"
.include "../data/space_data.asm"
.include "../data/title_data.asm"
.include "../data/demoncore_data.asm"
.include "../data/intro_data.asm"
.include "../data/shipselect_data.asm"
.include "../data/level1_title_data.asm"
.include "../data/level2_title_data.asm"
.include "../data/boss2_data.asm"
.include "../data/level3_title_data.asm"
.include "../data/level4_title_data.asm"
.include "../data/ending_data.asm"
.include "../sound/sounds.s"
.include "../sound/after_the_rain.s"
.include "../sound/danger_streets.s"

.segment "CODE"


.proc load_levels
  SAVE_REGISTERS
; --------------------------------------------------
; Stop music.
; --------------------------------------------------
  jsr FamiToneMusicStop

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

; Scene number has gone past ending scene, reset level number, to the start of the game.
  cmp #17
  bne :+
  lda #0
  sta scene_number
:

  cmp #SCENE_NUMBER_DEMONCORE_SCREEN
  bne :+
  jmp load_demoncore_static_scene
:
  cmp #SCENE_NUMBER_TITLE_SCREEN
  bne :+
  jmp load_titlescreen_static_scene
:
  cmp #SCENE_NUMBER_INTRO_SCREEN
  bne :+
  jmp load_intro_static_scene
:
  cmp #SCENE_NUMBER_SHIPSELECT_SCREEN
  bne :+
  jmp load_shipselect_static_scene
:
  cmp #SCENE_NUMBER_LEVEL1TITLE_SCREEN
  bne :+
  jmp load_level1title_static_scene
:
  cmp #SCENE_NUMBER_LEVEL1GAMEPLAY_SCREEN
  bne :+
  jmp load_level1_gameplay_scene
:
  cmp #SCENE_NUMBER_LEVEL1BOSS_SCREEN
  bne :+
  jmp load_level1boss_scene
:
  cmp #SCENE_NUMBER_LEVEL2TITLE_SCREEN
  bne :+
  jmp load_level2title_static_scene
:
  cmp #SCENE_NUMBER_LEVEL2GAMEPLAY_SCREEN
  bne :+
  jmp load_level2_gameplay_scene
:
  cmp #SCENE_NUMBER_LEVEL2BOSS_SCREEN
  bne :+
  jmp load_level2boss_scene
:
  cmp #SCENE_NUMBER_LEVEL3TITLE_SCREEN
  bne :+
  jmp load_level3title_static_scene
:
  cmp #SCENE_NUMBER_LEVEL3GAMEPLAY_SCREEN
  bne :+
  jmp load_level3_gameplay_scene
:
  cmp #SCENE_NUMBER_LEVEL3BOSS_SCREEN
  bne :+
  jmp load_level3boss_scene
:
  cmp #SCENE_NUMBER_LEVEL4TITLE_SCREEN
  bne :+
  jmp load_level4title_static_scene
:
  cmp #SCENE_NUMBER_LEVEL4GAMEPLAY_SCREEN
  bne :+
  jmp load_level4_gameplay_scene
:
  cmp #SCENE_NUMBER_LEVEL4BOSS_SCREEN
  bne :+
  jmp load_level4boss_scene
:
  cmp #SCENE_NUMBER_ENDING_SCREEN
  bne :+
  jmp load_ending_static_scene
:

; --------------------------------------------------
; load_demoncore_static_scene
; --------------------------------------------------
load_demoncore_static_scene:
  lda #BANK_NUMBER_TEXT
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

  jmp start_static_screen_level

; --------------------------------------------------
; Load title screen.
; --------------------------------------------------
load_titlescreen_static_scene:
  lda #BANK_NUMBER_TITLE
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
; load_intro_static_scene
; --------------------------------------------------
load_intro_static_scene:
  lda #BANK_NUMBER_TEXT
  sta BANK_SWITCH

  ldx PPUSTATUS
  ldx #$3F
  stx PPUADDR
  ldx #$00
  stx PPUADDR

load_intro_scene_palettes:
  lda IntroData::PaletteTable, x
  sta PPUDATA
  inx
  cpx #$20
  bne load_intro_scene_palettes
  
  lda #<IntroData::Screen1
  sta layout_pointer
  lda #>IntroData::Screen1
  sta layout_pointer+1

  lda #<IntroData::MetatileTop
  sta metatile_top_pointer
  lda #>IntroData::MetatileTop
  sta metatile_top_pointer+1

  lda #<IntroData::MetatileBottom
  sta metatile_bottom_pointer
  lda #>IntroData::MetatileBottom
  sta metatile_bottom_pointer+1

  lda #<IntroData::Screen1Attrib
  sta attribs_pointer
  lda #>IntroData::Screen1Attrib
  sta attribs_pointer+1

  jsr init_nametable

  jmp start_static_screen_level

; --------------------------------------------------
; load_shipselect_static_scene
; --------------------------------------------------
load_shipselect_static_scene:
  lda #BANK_NUMBER_TEXT
  sta BANK_SWITCH

  ldx PPUSTATUS
  ldx #$3F
  stx PPUADDR
  ldx #$00
  stx PPUADDR

load_shipselect_scene_palettes:
  lda ShipSelectData::PaletteTable, x
  sta PPUDATA
  inx
  cpx #$20
  bne load_shipselect_scene_palettes
  
  lda #<ShipSelectData::Screen1
  sta layout_pointer
  lda #>ShipSelectData::Screen1
  sta layout_pointer+1

  lda #<ShipSelectData::MetatileTop
  sta metatile_top_pointer
  lda #>ShipSelectData::MetatileTop
  sta metatile_top_pointer+1

  lda #<ShipSelectData::MetatileBottom
  sta metatile_bottom_pointer
  lda #>ShipSelectData::MetatileBottom
  sta metatile_bottom_pointer+1

  lda #<ShipSelectData::Screen1Attrib
  sta attribs_pointer
  lda #>ShipSelectData::Screen1Attrib
  sta attribs_pointer+1

  jsr init_nametable

  jmp start_static_screen_level

; --------------------------------------------------
; load_level1title_static_scene
; --------------------------------------------------
load_level1title_static_scene:
  lda #BANK_NUMBER_TEXT
  sta BANK_SWITCH

  ldx PPUSTATUS
  ldx #$3F
  stx PPUADDR
  ldx #$00
  stx PPUADDR

load_level1_title_scene_palettes:
  lda TitleData::PaletteTable, x
  sta PPUDATA
  inx
  cpx #$20
  bne load_level1_title_scene_palettes
  
  lda #<Level1TitleData::Screen1
  sta layout_pointer
  lda #>Level1TitleData::Screen1
  sta layout_pointer+1

  lda #<Level1TitleData::MetatileTop
  sta metatile_top_pointer
  lda #>Level1TitleData::MetatileTop
  sta metatile_top_pointer+1

  lda #<Level1TitleData::MetatileBottom
  sta metatile_bottom_pointer
  lda #>Level1TitleData::MetatileBottom
  sta metatile_bottom_pointer+1

  lda #<Level1TitleData::Screen1Attrib
  sta attribs_pointer
  lda #>Level1TitleData::Screen1Attrib
  sta attribs_pointer+1

  jsr init_nametable

  jmp start_static_screen_level

; --------------------------------------------------
; load_level1_gameplay_scene
; --------------------------------------------------
load_level1_gameplay_scene:
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

  lda #BANK_NUMBER_LEVEL1
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

  ldx #<danger_streets_music_data
	ldy #>danger_streets_music_data
	lda NTSC_MODE_FAMITONE
	jsr FamiToneInit
	lda #0
	jsr FamiToneMusicPlay

  jmp start_gameplay_level

; --------------------------------------------------
; load_level1boss_scene
; --------------------------------------------------
load_level1boss_scene:
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

  lda #BANK_NUMBER_BOSS1
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
; load_level2title_static_scene
; --------------------------------------------------
load_level2title_static_scene:
  lda #BANK_NUMBER_TEXT
  sta BANK_SWITCH

  ldx PPUSTATUS
  ldx #$3F
  stx PPUADDR
  ldx #$00
  stx PPUADDR

load_level2_title_scene_palettes:
  lda Level2TitleData::PaletteTable, x
  sta PPUDATA
  inx
  cpx #$20
  bne load_level2_title_scene_palettes
  
  lda #<Level2TitleData::Screen1
  sta layout_pointer
  lda #>Level2TitleData::Screen1
  sta layout_pointer+1

  lda #<Level2TitleData::MetatileTop
  sta metatile_top_pointer
  lda #>Level2TitleData::MetatileTop
  sta metatile_top_pointer+1

  lda #<Level2TitleData::MetatileBottom
  sta metatile_bottom_pointer
  lda #>Level2TitleData::MetatileBottom
  sta metatile_bottom_pointer+1

  lda #<Level2TitleData::Screen1Attrib
  sta attribs_pointer
  lda #>Level2TitleData::Screen1Attrib
  sta attribs_pointer+1

  jsr init_nametable

  jmp start_static_screen_level

; --------------------------------------------------
; load_level2_gameplay_scene
; --------------------------------------------------
load_level2_gameplay_scene:
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

  lda #BANK_NUMBER_LEVEL2
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

  lda #<StationData::Screen1Attrib
  sta attribs_pointer
  lda #>StationData::Screen1Attrib
  sta attribs_pointer+1

  lda #0
  sta nametable_number
  jsr init_nametable

  lda #2
  sta nametable_number
  jsr init_nametable

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

  ldy #$00

  lda (attribs_lo_pointer), y
  sta attribs_pointer
  lda (attribs_hi_pointer), y
  sta attribs_pointer+1

  jmp start_gameplay_level

; --------------------------------------------------
; load_level2boss_scene
; --------------------------------------------------
load_level2boss_scene:
  ldx PPUSTATUS
  ldx #$3F
  stx PPUADDR
  ldx #$00
  stx PPUADDR

  ldx #$00
@load_palette:
  lda Boss2Data::PaletteTable, x
  sta PPUDATA
  inx
  cpx #$20
  bne @load_palette

  lda #BANK_NUMBER_BOSS2
  sta BANK_SWITCH

  lda #<Boss2Data::ScreenX
  sta layout_pointer
  lda #>Boss2Data::ScreenX
  sta layout_pointer+1

  lda #<Boss2Data::MetatileTop
  sta metatile_top_pointer
  lda #>Boss2Data::MetatileTop
  sta metatile_top_pointer+1

  lda #<Boss2Data::MetatileBottom
  sta metatile_bottom_pointer
  lda #>Boss2Data::MetatileBottom
  sta metatile_bottom_pointer+1

  lda #<Boss2Data::ScreenXAttrib
  sta attribs_pointer
  lda #>Boss2Data::ScreenXAttrib
  sta attribs_pointer+1

  lda #0
  sta nametable_number
  jsr init_nametable

  lda #2
  sta nametable_number
  jsr init_nametable

  lda #<Boss2Data::Screen1
  sta layout_pointer
  lda #>Boss2Data::Screen1
  sta layout_pointer+1

  lda #<Boss2Data::MetatileTop
  sta metatile_top_pointer
  lda #>Boss2Data::MetatileTop
  sta metatile_top_pointer+1

  lda #<Boss2Data::MetatileBottom
  sta metatile_bottom_pointer
  lda #>Boss2Data::MetatileBottom
  sta metatile_bottom_pointer+1

  lda #<Boss2Data::ScreensLow
  sta screens_lo_pointer
  lda #>Boss2Data::ScreensLow
  sta screens_lo_pointer+1

  lda #<Boss2Data::ScreensHigh
  sta screens_hi_pointer
  lda #>Boss2Data::ScreensHigh
  sta screens_hi_pointer+1

  lda #<Boss2Data::AttribsLow
  sta attribs_lo_pointer
  lda #>Boss2Data::AttribsLow
  sta attribs_lo_pointer+1

  lda #<Boss2Data::AttribsHigh
  sta attribs_hi_pointer
  lda #>Boss2Data::AttribsHigh
  sta attribs_hi_pointer+1

  ldy #$00

  lda (attribs_lo_pointer), y
  sta attribs_pointer
  lda (attribs_hi_pointer), y
  sta attribs_pointer+1

  jmp start_gameplay_level

; --------------------------------------------------
; load_level3title_static_scene
; --------------------------------------------------
load_level3title_static_scene:
  lda #BANK_NUMBER_TEXT
  sta BANK_SWITCH

  ldx PPUSTATUS
  ldx #$3F
  stx PPUADDR
  ldx #$00
  stx PPUADDR

load_level3_title_scene_palettes:
  lda Level3TitleData::PaletteTable, x
  sta PPUDATA
  inx
  cpx #$20
  bne load_level3_title_scene_palettes
  
  lda #<Level3TitleData::Screen1
  sta layout_pointer
  lda #>Level3TitleData::Screen1
  sta layout_pointer+1

  lda #<Level3TitleData::MetatileTop
  sta metatile_top_pointer
  lda #>Level3TitleData::MetatileTop
  sta metatile_top_pointer+1

  lda #<Level3TitleData::MetatileBottom
  sta metatile_bottom_pointer
  lda #>Level3TitleData::MetatileBottom
  sta metatile_bottom_pointer+1

  lda #<Level3TitleData::Screen1Attrib
  sta attribs_pointer
  lda #>Level3TitleData::Screen1Attrib
  sta attribs_pointer+1

  jsr init_nametable

  jmp start_static_screen_level

; --------------------------------------------------
; load_level3_gameplay_scene
; --------------------------------------------------
load_level3_gameplay_scene:
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

  lda #BANK_NUMBER_LEVEL3
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

  lda #<CeresData::Screen1Attrib
  sta attribs_pointer
  lda #>CeresData::Screen1Attrib
  sta attribs_pointer+1

  lda #0
  sta nametable_number
  jsr init_nametable

  lda #2
  sta nametable_number
  jsr init_nametable

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

  ldy #$00

  lda (attribs_lo_pointer), y
  sta attribs_pointer
  lda (attribs_hi_pointer), y
  sta attribs_pointer+1

  jmp start_gameplay_level

; --------------------------------------------------
; load_level3boss_scene
; --------------------------------------------------
load_level3boss_scene:
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

  lda #BANK_NUMBER_BOSS3
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

  lda #<CeresData::Screen1Attrib
  sta attribs_pointer
  lda #>CeresData::Screen1Attrib
  sta attribs_pointer+1

  lda #0
  sta nametable_number
  jsr init_nametable

  lda #2
  sta nametable_number
  jsr init_nametable

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

  ldy #$00

  lda (attribs_lo_pointer), y
  sta attribs_pointer
  lda (attribs_hi_pointer), y
  sta attribs_pointer+1

  jmp start_gameplay_level

; --------------------------------------------------
; load_level4title_static_scene
; --------------------------------------------------
load_level4title_static_scene:
  lda #BANK_NUMBER_TEXT
  sta BANK_SWITCH

  ldx PPUSTATUS
  ldx #$3F
  stx PPUADDR
  ldx #$00
  stx PPUADDR

load_level4_title_scene_palettes:
  lda Level4TitleData::PaletteTable, x
  sta PPUDATA
  inx
  cpx #$20
  bne load_level4_title_scene_palettes
  
  lda #<Level4TitleData::Screen1
  sta layout_pointer
  lda #>Level4TitleData::Screen1
  sta layout_pointer+1

  lda #<Level4TitleData::MetatileTop
  sta metatile_top_pointer
  lda #>Level4TitleData::MetatileTop
  sta metatile_top_pointer+1

  lda #<Level4TitleData::MetatileBottom
  sta metatile_bottom_pointer
  lda #>Level4TitleData::MetatileBottom
  sta metatile_bottom_pointer+1

  lda #<Level4TitleData::Screen1Attrib
  sta attribs_pointer
  lda #>Level4TitleData::Screen1Attrib
  sta attribs_pointer+1

  jsr init_nametable

  jmp start_static_screen_level

; --------------------------------------------------
; load_level4_gameplay_scene
; --------------------------------------------------
load_level4_gameplay_scene:
  ldx PPUSTATUS
  ldx #$3F
  stx PPUADDR
  ldx #$00
  stx PPUADDR

  ldx #$00
@load_palette:
  lda SpaceData::PaletteTable, x
  sta PPUDATA
  inx
  cpx #$20
  bne @load_palette

  lda #BANK_NUMBER_LEVEL4
  sta BANK_SWITCH

  lda #<SpaceData::Screen1
  sta layout_pointer
  lda #>SpaceData::Screen1
  sta layout_pointer+1

  lda #<SpaceData::MetatileTop
  sta metatile_top_pointer
  lda #>SpaceData::MetatileTop
  sta metatile_top_pointer+1

  lda #<SpaceData::MetatileBottom
  sta metatile_bottom_pointer
  lda #>SpaceData::MetatileBottom
  sta metatile_bottom_pointer+1

  lda #<SpaceData::Screen1Attrib
  sta attribs_pointer
  lda #>SpaceData::Screen1Attrib
  sta attribs_pointer+1

  lda #0
  sta nametable_number
  jsr init_nametable

  lda #2
  sta nametable_number
  jsr init_nametable

  lda #<SpaceData::Screen1
  sta layout_pointer
  lda #>SpaceData::Screen1
  sta layout_pointer+1

  lda #<SpaceData::MetatileTop
  sta metatile_top_pointer
  lda #>SpaceData::MetatileTop
  sta metatile_top_pointer+1

  lda #<SpaceData::MetatileBottom
  sta metatile_bottom_pointer
  lda #>SpaceData::MetatileBottom
  sta metatile_bottom_pointer+1


  lda #<SpaceData::ScreensLow
  sta screens_lo_pointer
  lda #>SpaceData::ScreensLow
  sta screens_lo_pointer+1

  lda #<SpaceData::ScreensHigh
  sta screens_hi_pointer
  lda #>SpaceData::ScreensHigh
  sta screens_hi_pointer+1

  lda #<SpaceData::AttribsLow
  sta attribs_lo_pointer
  lda #>SpaceData::AttribsLow
  sta attribs_lo_pointer+1

  lda #<SpaceData::AttribsHigh
  sta attribs_hi_pointer
  lda #>SpaceData::AttribsHigh
  sta attribs_hi_pointer+1

  ldy #$00

  lda (attribs_lo_pointer), y
  sta attribs_pointer
  lda (attribs_hi_pointer), y
  sta attribs_pointer+1

  jmp start_gameplay_level

; --------------------------------------------------
; load_level4boss_scene
; --------------------------------------------------
load_level4boss_scene:
  ldx PPUSTATUS
  ldx #$3F
  stx PPUADDR
  ldx #$00
  stx PPUADDR

  ldx #$00
@load_palette:
  lda SpaceData::PaletteTable, x
  sta PPUDATA
  inx
  cpx #$20
  bne @load_palette

  lda #BANK_NUMBER_BOSS4
  sta BANK_SWITCH

  lda #<SpaceData::Screen1
  sta layout_pointer
  lda #>SpaceData::Screen1
  sta layout_pointer+1

  lda #<SpaceData::MetatileTop
  sta metatile_top_pointer
  lda #>SpaceData::MetatileTop
  sta metatile_top_pointer+1

  lda #<SpaceData::MetatileBottom
  sta metatile_bottom_pointer
  lda #>SpaceData::MetatileBottom
  sta metatile_bottom_pointer+1

  lda #<SpaceData::Screen1Attrib
  sta attribs_pointer
  lda #>SpaceData::Screen1Attrib
  sta attribs_pointer+1

  lda #0
  sta nametable_number
  jsr init_nametable

  lda #2
  sta nametable_number
  jsr init_nametable

  lda #<SpaceData::Screen1
  sta layout_pointer
  lda #>SpaceData::Screen1
  sta layout_pointer+1

  lda #<SpaceData::MetatileTop
  sta metatile_top_pointer
  lda #>SpaceData::MetatileTop
  sta metatile_top_pointer+1

  lda #<SpaceData::MetatileBottom
  sta metatile_bottom_pointer
  lda #>SpaceData::MetatileBottom
  sta metatile_bottom_pointer+1


  lda #<SpaceData::ScreensLow
  sta screens_lo_pointer
  lda #>SpaceData::ScreensLow
  sta screens_lo_pointer+1

  lda #<SpaceData::ScreensHigh
  sta screens_hi_pointer
  lda #>SpaceData::ScreensHigh
  sta screens_hi_pointer+1

  lda #<SpaceData::AttribsLow
  sta attribs_lo_pointer
  lda #>SpaceData::AttribsLow
  sta attribs_lo_pointer+1

  lda #<SpaceData::AttribsHigh
  sta attribs_hi_pointer
  lda #>SpaceData::AttribsHigh
  sta attribs_hi_pointer+1

  ldy #$00

  lda (attribs_lo_pointer), y
  sta attribs_pointer
  lda (attribs_hi_pointer), y
  sta attribs_pointer+1

  jmp start_gameplay_level

; --------------------------------------------------
; load_ending_static_scene
; --------------------------------------------------
load_ending_static_scene:
  lda #BANK_NUMBER_ENDING
  sta BANK_SWITCH

  ldx PPUSTATUS
  ldx #$3F
  stx PPUADDR
  ldx #$00
  stx PPUADDR

load_ending_scene_palettes:
  lda EndingData::PaletteTable, x
  sta PPUDATA
  inx
  cpx #$20
  bne load_ending_scene_palettes
  
  lda #<EndingData::Screen1
  sta layout_pointer
  lda #>EndingData::Screen1
  sta layout_pointer+1

  lda #<EndingData::MetatileTop
  sta metatile_top_pointer
  lda #>EndingData::MetatileTop
  sta metatile_top_pointer+1

  lda #<EndingData::MetatileBottom
  sta metatile_bottom_pointer
  lda #>EndingData::MetatileBottom
  sta metatile_bottom_pointer+1

  lda #<EndingData::Screen1Attrib
  sta attribs_pointer
  lda #>EndingData::Screen1Attrib
  sta attribs_pointer+1

  jsr init_nametable

  jmp start_static_screen_level

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
; TODO add code specific to static screen type leevels

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
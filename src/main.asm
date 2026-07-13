.include "macros.asm"
.include "constants.inc" 
.include "header.inc"
.include "reset.asm"
.include "controllers.asm"
.include "load_row.asm"
.include "ClearOAM.asm"
.include "init_nametable.asm"
.include "load_levels.asm"
.include "player.asm"
.include "enemies.asm"
.include "player_bullets.asm"
.include "gameplay_level.asm"
.include "lib/famitone2.s"

.segment "ZEROPAGE"
sleeping: .res 1
buttons_held: .res 1
buttons_pressed: .res 1
timer: .res 1

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
zp_scratch_1_lo = zp_scratch_1
zp_scratch_1_hi = zp_scratch_1+1

do_render: .res 1
do_scroll: .res 1

; --------------------------------------------------
; Pointers required for rendering levels
; --------------------------------------------------
layout_pointer: .res 2
metatile_top_pointer: .res 2
metatile_bottom_pointer: .res 2
attribs_pointer: .res 2
screens_lo_pointer: .res 2
screens_hi_pointer: .res 2
attribs_lo_pointer: .res 2
attribs_hi_pointer: .res 2
scene_number: .res 1

.segment "BSS"
row_data: .res 64
attrib_data: .res 8

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


; Timer - general purpose, used to trigger a variety 
; of events
; --------------------------------------------------
  inc timer

; --------------------------------------------------
; Player input reads
; --------------------------------------------------
  jsr read_controller

; --------------------------------------------------
; 
; --------------------------------------------------
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

  jsr FamiToneUpdate

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

; --------------------------------------------------
; Initialise FamiTone2.
; Play sound effect for initial demoncore screen.
; --------------------------------------------------
	lda NTSC_MODE_FAMITONE
	jsr FamiToneInit

	ldx #<sounds
	ldy #>sounds
	jsr FamiToneSfxInit
  lda #0
	ldx #FT_SFX_CH0
	jsr FamiToneSfxPlay

  

mainloop:

  lda scene_number
  
  cmp #SCENE_NUMBER_DEMONCORE_SCREEN
  beq demoncore_screen
  cmp #SCENE_NUMBER_TITLE_SCREEN
  beq title_screen
  cmp #SCENE_NUMBER_INTRO_SCREEN
  beq intro_screen
  cmp #SCENE_NUMBER_SHIPSELECT_SCREEN
  beq shipselect_screen
  cmp #SCENE_NUMBER_LEVEL1TITLE_SCREEN
  beq level1title_screen
  cmp #SCENE_NUMBER_LEVEL1GAMEPLAY_SCREEN
  beq level1gameplay_screen
  cmp #SCENE_NUMBER_LEVEL1BOSS_SCREEN
  beq level1boss_screen
  cmp #SCENE_NUMBER_LEVEL2TITLE_SCREEN
  beq level2title_screen
  cmp #SCENE_NUMBER_LEVEL2GAMEPLAY_SCREEN
  beq level2gameplay_screen
  cmp #SCENE_NUMBER_LEVEL2BOSS_SCREEN
  beq level2boss_screen
  cmp #SCENE_NUMBER_LEVEL3TITLE_SCREEN
  beq level3title_screen
  cmp #SCENE_NUMBER_LEVEL3GAMEPLAY_SCREEN
  beq level3gameplay_screen
  cmp #SCENE_NUMBER_LEVEL3BOSS_SCREEN
  beq level3boss_screen
  cmp #SCENE_NUMBER_LEVEL4TITLE_SCREEN
  beq level4title_screen
  cmp #SCENE_NUMBER_LEVEL4GAMEPLAY_SCREEN
  beq level4gameplay_screen
  cmp #SCENE_NUMBER_LEVEL4BOSS_SCREEN
  beq level4boss_screen
  cmp #SCENE_NUMBER_ENDING_SCREEN
  beq ending_screen

demoncore_screen:
  jmp done
title_screen:
  jmp done
intro_screen:
  jmp done
shipselect_screen:
  jmp done
level1title_screen:
  jmp done
level1gameplay_screen:
  jsr GameplayLevel
  jmp done
level1boss_screen:
  jsr GameplayLevel
  jmp done
level2title_screen:
  jmp done
level2gameplay_screen:
  jsr GameplayLevel
  jmp done
level2boss_screen:
  jsr GameplayLevel
  jmp done
level3title_screen:
  jmp done
level3gameplay_screen:
  jsr GameplayLevel
  jmp done
level3boss_screen:
  jsr GameplayLevel
  jmp done
level4title_screen:
  jmp done
level4gameplay_screen:
  jsr GameplayLevel
  jmp done
level4boss_screen:
  jsr GameplayLevel
  jmp done
ending_screen:

done:

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


  inc sleeping
sleep:
  lda sleeping
  bne sleep

  jmp mainloop
.endproc

.segment "VECTORS"
.addr nmi_handler, reset_handler, irq_handler

.segment "CHRROM_TEXT"
.incbin "../chr/text.chr"

.segment "CHRROM_LEVEL1"
.incbin "../chr/level1.chr"

.segment "CHRROM_BOSS1"
.incbin "../chr/boss1.chr"

.segment "CHRROM_LEVEL2"
.incbin "../chr/level2.chr"

.segment "CHRROM_BOSS2"
.incbin "../chr/boss2.chr"

.segment "CHRROM_LEVEL3"
.incbin "../chr/level3.chr"

.segment "CHRROM_BOSS3"
.incbin "../chr/boss3.chr"

.segment "CHRROM_LEVEL4"
.incbin "../chr/level4.chr"

.segment "CHRROM_BOSS4"
.incbin "../chr/boss4.chr"

.segment "CHRROM_TITLE"
.incbin "../chr/title.chr"

.segment "CHRROM_INTRO"
.incbin "../chr/intro.chr"

.segment "CHRROM_ENDING"
.incbin "../chr/ending.chr"
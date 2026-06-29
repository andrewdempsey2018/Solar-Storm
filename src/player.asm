.segment "ZEROPAGE"
player_x: .res 1
player_y: .res 1
player_frame: .res 1
flame_timer: .res 1
flame_frame: .res 1

.segment "CODE"

.export move_sprite
.proc move_sprite
  php  ; save registers
  pha
  txa
  pha
  tya
  pha

  lda #$00              ; if no button pressed be sure palyer frame is 0/idle
  sta player_frame

check_up:
  lda buttons_held
  and #BTN_UP
  beq check_down
  dec player_y
check_down:
  lda buttons_held
  and #BTN_DOWN
  beq check_left
  inc player_y
check_left:
  lda buttons_held
  and #BTN_LEFT
  beq check_right
  lda #$01
  sta player_frame
  dec player_x
check_right:
  lda buttons_held
  and #BTN_RIGHT
  beq done
  inc player_x
  lda #$02
  sta player_frame

done: ;--> nothing happened, quit procedure
  pla ; restore registers
  tay
  pla
  tax
  pla
  plp

  rts
.endproc

.export draw_sprite
.proc draw_sprite
  php  ; save registers
  pha
  txa
  pha
  tya
  pha

  ldx player_frame

  lda player_y
  sta $02B0
  lda player_top_left, x
  sta $02B1
  lda #$01 ; color
  sta $02B2
  lda player_x
  sta $02B3

  lda player_y
  sta $02B4
  lda player_top_right, x
  sta $02B5
  lda #$01 ; color
  sta $02B6
  lda player_x
  clc
  adc #$08
  sta $02B7

  lda player_y
  clc
  adc #$08
  sta $02B8
  lda player_bottom_left, x
  sta $02B9
  lda #$01 ; color
  sta $02BA
  lda player_x
  sta $02BB

  lda player_y
  clc
  adc #$08
  sta $02BC
  lda player_bottom_right, x
  sta $02BD
  lda #$01 ; color
  sta $02BE
  lda player_x
  clc
  adc #$08
  sta $02BF

; ----------------------------------- ;
; Draw Flame
  lda flame_timer
  clc
  adc #$40 ; speed of animation
  sta flame_timer
  bcc DrawFlame
  inc flame_frame
  lda flame_frame
  cmp #$06
  bne DrawFlame
  ldx #$00
  stx flame_frame
  
DrawFlame:
  ldx flame_frame
 
  lda player_y
  clc
  adc #$10
  sta $02C0
  lda FlameFramesData, x
  sta $02C1
  lda #$03
  sta $02C2
  lda player_x
  clc
  adc #$04
  sta $02C3

  pla ; restore registers
  tay
  pla
  tax
  pla
  plp

  rts
.endproc

.segment "RODATA"
player_top_left:
  .byte $01, $26, $28
player_top_right:
  .byte $02, $27, $29
player_bottom_left:
  .byte $11, $36, $38
player_bottom_right:
  .byte $12, $37, $39

FlameFramesData:
  .byte $00, $2A, $00, $2B, $00, $2C
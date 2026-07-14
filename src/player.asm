.segment "ZEROPAGE"
player_x: .res 1
player_y: .res 1
player_frame: .res 1
player_flame_frame: .res 1

.segment "RODATA"
player_top_left:
  .byte $02, $04, $06
player_top_right:
  .byte $03, $05, $07
player_bottom_left:
  .byte $12, $14, $16
player_bottom_right:
  .byte $13, $15, $17

player_flame_frames_data:
  .byte $00, $08, $00, $09, $00, $0A

.segment "CODE"

; --------------------------------------------------
; Hold up, down, left, right to move player ship
; --------------------------------------------------
.proc move_player
  SAVE_REGISTERS

; no button pressed, player is idle
  lda #$00
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

done:

  RESTORE_REGISTERS
  rts
.endproc

; --------------------------------------------------
; Draw player sprite.
; --------------------------------------------------
.proc draw_player
  SAVE_REGISTERS

  ldx player_frame

  lda player_y
  sta $0204
  lda player_top_left, x
  sta $0205
  lda #$01
  sta $0206
  lda player_x
  sta $0207

  lda player_y
  sta $0208
  lda player_top_right, x
  sta $0209
  lda #$01
  sta $020A
  lda player_x
  clc
  adc #$08
  sta $020B

  lda player_y
  clc
  adc #$08
  sta $020C
  lda player_bottom_left, x
  sta $020D
  lda #$01
  sta $020E
  lda player_x
  sta $020F

  lda player_y
  clc
  adc #$08
  sta $0210
  lda player_bottom_right, x
  sta $0211
  lda #$01
  sta $0212
  lda player_x
  clc
  adc #$08
  sta $0213

; --------------------------------------------------
; Draw flame at rear of player ship
; --------------------------------------------------
  lda timer
  and #%00000001
  bne dont_draw_flame

  inc player_flame_frame
  lda player_flame_frame
  cmp #$06
  bne draw_flame
  ldx #$00
  stx player_flame_frame
draw_flame:
  ldx player_flame_frame
  lda player_y
  clc
  adc #$10
  sta $0214
  lda player_flame_frames_data, x
  sta $0215
  lda #$02
  sta $0216
  lda player_x
  clc
  adc #$04
  sta $0217

dont_draw_flame:

  RESTORE_REGISTERS
  rts
.endproc
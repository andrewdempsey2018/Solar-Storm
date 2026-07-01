; --------------------------------------------------
; Player bullet constants
; PLAYER_BULLET_OAM_START first OAM slot for bullets
; NUMBER_OF_PLAYER_BULLETS
; --------------------------------------------------
PLAYER_BULLET_OAM_START = $0268
NUMBER_OF_PLAYER_BULLETS = 5

; --------------------------------------------------
; Player bullet flags.
; --------------------------------------------------
PLAYER_BULLET_DEAD = %00000000
PLAYER_BULLET_ALIVE = %10000000
PLAYER_BULLET_FLAG_6 = %01000000
PLAYER_BULLET_FLAG_5 = %00100000
PLAYER_BULLET_FLAG_4 = %00010000
PLAYER_BULLET_FLAG_3 = %00001000
PLAYER_BULLET_FLAG_2 = %00000100
PLAYER_BULLET_FLAG_1 = %00000010
PLAYER_BULLET_FLAG_0 = %00000001

.segment "ZEROPAGE"

; --------------------------------------------------
; Player bullet SoA.

; player_bullet_x, player_bullet_y position coordinates
; of bullet.

; player_bullet_flags currently holds alive or dead, 
; use for other attributes as needed.

; player_bullet_frame_number - current animation frame
; of the bullet that is being dealt with during a loop.
; --------------------------------------------------
player_bullet_x: .res NUMBER_OF_PLAYER_BULLETS
player_bullet_y: .res NUMBER_OF_PLAYER_BULLETS
player_bullet_flags: .res NUMBER_OF_PLAYER_BULLETS
player_bullet_frame_number: .res NUMBER_OF_PLAYER_BULLETS

; --------------------------------------------------
; current_player_bullet - this is the bullet that gets
; processed and updated during a loop.

; player_bullet_spawn_number - the bullet number that
; will be spawned.
; --------------------------------------------------
current_player_bullet: .res 1
player_bullet_spawn_number: .res 1

.segment "RODATA"
;.include "../data/player_bullet_data.asm"

.segment "CODE"

.proc ProcessPlayerBullets
  SAVE_REGISTERS

  ldx #$00

bullet_loop:
  stx current_player_bullet
  lda player_bullet_flags, x
  and #PLAYER_BULLET_ALIVE
  beq next_bullet
  jsr UpdatePlayerBullets
next_bullet:
  inx
  cpx #NUMBER_OF_PLAYER_BULLETS
  bne bullet_loop

  RESTORE_REGISTERS
  rts
.endproc

.proc UpdatePlayerBullets
  SAVE_REGISTERS

  ldx current_player_bullet

; --------------------------------------------------
; Dont process inactive player bullets
; --------------------------------------------------
  lda player_bullet_flags, x
  and #PLAYER_BULLET_ALIVE
  bne player_bullet_alive
  jmp done
player_bullet_alive:

; --------------------------------------------------
; Remove player bullets that go off the top of the screen
; --------------------------------------------------
  lda player_bullet_y, x
  cmp #8
  bcs bullet_on_screen
; move bullet off screen and set it inactive
  lda #PLAYER_BULLET_DEAD
  sta player_bullet_flags, x
  lda #$F0
  sta player_bullet_y, x
; still need to draw inactive bullet to clear OAM
  jsr DrawPlayerBullets
  jmp done
bullet_on_screen:

; --------------------------------------------------
; Update player bulley y position
; --------------------------------------------------
  lda player_bullet_y, x
  sec
  sbc #4 ; bullet velocity
  sta player_bullet_y, x

; --------------------------------------------------
; Updates done, now draw
; --------------------------------------------------
  jsr DrawPlayerBullets

done:
  RESTORE_REGISTERS
  rts
.endproc

.proc DrawPlayerBullets
  SAVE_REGISTERS

; x is the current bulley
; y is the particular OAM slot for that bullet
  lda current_player_bullet
  tax
  asl a
  asl a
  tay

  lda player_bullet_y, x
  sta PLAYER_BULLET_OAM_START, y
  lda #$1E
  sta PLAYER_BULLET_OAM_START+1, y
  lda #$01
  sta PLAYER_BULLET_OAM_START+2, y
  lda player_bullet_x, x
  sta PLAYER_BULLET_OAM_START+3, y

  RESTORE_REGISTERS
  rts
.endproc

.proc ShootPlayerBullets
  SAVE_REGISTERS

  lda buttons_pressed
  and #BTN_B
  beq done

  inc player_bullet_spawn_number
  lda player_bullet_spawn_number
  cmp #NUMBER_OF_PLAYER_BULLETS
  bne shoot_bullet
  lda #$00
  sta player_bullet_spawn_number

shoot_bullet:
  ldx player_bullet_spawn_number
  lda #PLAYER_BULLET_ALIVE
  sta player_bullet_flags, x

; --------------------------------------------------
; set initial x and y positions of bullet
; --------------------------------------------------
  lda player_x
  clc
  adc #4
  sta player_bullet_x, x
  lda player_y
  sta player_bullet_y, x

; --------------------------------------------------
; Play sound fx
; --------------------------------------------------
; play laser sound effect (#01)
; LDX #channel, LDA #which_sfx, JSR FamiToneSfxPlay
  ;lda #$01 
  ;ldx #$00
  ;jsr FamiToneSfxPlay

done:
  RESTORE_REGISTERS
  rts
.endproc


; --------------------------------------------------
; Enemy bullet constants
; ENEMY_BULLET_OAM_START first OAM slot for bullets
; NUMBER_OF_ENEMY_BULLETS
; --------------------------------------------------
ENEMY_BULLET_OAM_START = $02D0
NUMBER_OF_ENEMY_BULLETS = 12
ENEMY_BULLET_1_WIDTH = 8
ENEMY_BULLET_1_HEIGHT = 8

; --------------------------------------------------
; Enemy bullet flags.
; --------------------------------------------------
ENEMY_BULLET_DEAD = %00000000
ENEMY_BULLET_ALIVE = %10000000
ENEMY_BULLET_FLAG_6 = %01000000
ENEMY_BULLET_FLAG_5 = %00100000
ENEMY_BULLET_FLAG_4 = %00010000
ENEMY_BULLET_FLAG_3 = %00001000
ENEMY_BULLET_FLAG_2 = %00000100
ENEMY_BULLET_FLAG_1 = %00000010
ENEMY_BULLET_FLAG_0 = %00000001

.segment "ZEROPAGE"

; --------------------------------------------------
; Enemy bullet SoA.

; enemy_bullet_x, enemy_bullet_y position coordinates
; of bullet.

; enemy_bullet_flags currently holds alive or dead, 
; use for other attributes as needed.

; enemy_bullet_frame_number - current animation frame
; of the bullet that is being dealt with during a loop.
; --------------------------------------------------
enemy_bullet_x: .res NUMBER_OF_ENEMY_BULLETS
enemy_bullet_y: .res NUMBER_OF_ENEMY_BULLETS
enemy_bullet_flags: .res NUMBER_OF_ENEMY_BULLETS
enemy_bullet_frame_number: .res NUMBER_OF_ENEMY_BULLETS
enemy_bullet_type: .res NUMBER_OF_ENEMY_BULLETS

; --------------------------------------------------
; current_enemy_bullet - this is the bullet that gets
; processed and updated during a loop.

; enemy_bullet_spawn_number - the bullet number that
; will be spawned.
; --------------------------------------------------
current_enemy_bullet: .res 1
enemy_bullet_spawn_number: .res 1

.segment "RODATA"
;.include "../data/enemy_bullet_data.asm"

.segment "CODE"

.proc ProcessEnemyBullets
  SAVE_REGISTERS

  ldx #$00

bullet_loop:
  stx current_enemy_bullet
  lda enemy_bullet_flags, x
  and #ENEMY_BULLET_ALIVE
  beq next_bullet
  jsr UpdateEnemyBullets
next_bullet:
  inx
  cpx #NUMBER_OF_ENEMY_BULLETS
  bne bullet_loop

  RESTORE_REGISTERS
  rts
.endproc

.proc UpdateEnemyBullets
  SAVE_REGISTERS

  ldx current_enemy_bullet

; --------------------------------------------------
; Dont process inactive enemy bullets
; --------------------------------------------------
  lda enemy_bullet_flags, x
  and #ENEMY_BULLET_ALIVE
  bne enemy_bullet_alive
  jmp done
enemy_bullet_alive:

; --------------------------------------------------
; Remove enemy bullets that go off the bottom of the screen
; --------------------------------------------------
  lda enemy_bullet_y, x
  cmp #240
  bcc bullet_on_screen
; move bullet off screen and set it inactive
  lda #ENEMY_BULLET_DEAD
  sta enemy_bullet_flags, x
  lda #$F0
  sta enemy_bullet_y, x
; still need to draw inactive bullet to clear OAM
  jsr DrawEnemyBullets
  jmp done
bullet_on_screen:

; --------------------------------------------------
; Update enemy bullet y position
; --------------------------------------------------
  lda enemy_bullet_y, x
  clc
  adc #4 ; bullet velocity
  sta enemy_bullet_y, x

; --------------------------------------------------
; Check if bullet has collided with an enemy
; --------------------------------------------------
  ;jsr DetectCollision_

; --------------------------------------------------
; Updates done, now draw
; --------------------------------------------------
  jsr DrawEnemyBullets

done:
  RESTORE_REGISTERS
  rts
.endproc

.proc DrawEnemyBullets
  SAVE_REGISTERS

; x is the current bulley
; y is the particular OAM slot for that bullet
  lda current_enemy_bullet
  tax
  asl a
  asl a
  tay

  lda enemy_bullet_y, x
  sta ENEMY_BULLET_OAM_START, y
  lda #$68
  sta ENEMY_BULLET_OAM_START+1, y
  lda #$03
  sta ENEMY_BULLET_OAM_START+2, y
  lda enemy_bullet_x, x
  sta ENEMY_BULLET_OAM_START+3, y

  RESTORE_REGISTERS
  rts
.endproc

.proc ShootEnemyBullets
  SAVE_REGISTERS

  inc enemy_bullet_spawn_number
  lda enemy_bullet_spawn_number
  cmp #NUMBER_OF_ENEMY_BULLETS
  bne shoot_bullet
  lda #$00
  sta enemy_bullet_spawn_number

shoot_bullet:
; --------------------------------------------------
; set initial x and y positions of bullet
; --------------------------------------------------
  ldx current_enemy
  ldy enemy_bullet_spawn_number

  lda enemy_x_hi, x
  clc
  adc #4
  sta enemy_bullet_x, y
  lda enemy_y_hi, x
  clc
  adc #4
  sta enemy_bullet_y, y

  ldx enemy_bullet_spawn_number
  lda #ENEMY_BULLET_ALIVE
  sta enemy_bullet_flags, y


; --------------------------------------------------
; Play sound fx
; --------------------------------------------------
  ;txa
  ;pha
  ;tya
  ;pha
  ;lda #2
	;ldx #FT_SFX_CH0
	;jsr FamiToneSfxPlay
  ;pla
  ;tay
  ;pla
  ;tax

done:
  RESTORE_REGISTERS
  rts
.endproc

.proc DetectCollision_
  SAVE_REGISTERS

  ldy current_enemy_bullet

  ldx #$00 ;use y for indexing the bullet positions

  ;is bullet active?
  lda enemy_bullet_flags, y
  and #%10000000 ; bullet flag is %00000000 go to done bullet flag is %10000000 update position
  beq NoCollision

check:
; Check if A is to the left of B
  lda enemy_bullet_x, y
  clc
  adc #BULLET_1_WIDTH
  cmp enemy_x_hi, x
  bcc NoCollision  ; A is to the left of B

; Check if A is to the right of B
  lda enemy_x_hi, x
  clc
  adc #ENEMY_WIDTH
  cmp enemy_bullet_x, y
  bcc NoCollision  ; A is to the right of B

; Check if A is above B
  lda enemy_bullet_y, y
  clc
  adc #BULLET_1_HEIGHT
  cmp enemy_y_hi, x
  bcc NoCollision  ; A is above B

; Check if A is below B
  lda enemy_y_hi, x
  clc
  adc #ENEMY_HEIGHT
  cmp enemy_bullet_y, y
  bcc NoCollision  ; A is below B

;;;
  lda enemy_flags, x
  and #ENEMY_EXPLODING
  bne enemy_is_exploding
; --------------------------------------------------
; Collision occured.
; Prepare enemy to display 'hit' animaion.
; Remove bullet.
; Play appropriate sound effect.
; --------------------------------------------------
  lda enemy_flags, x
  ora #ENEMY_HIT
  sta enemy_flags, x
  lda #TIME_TO_DISPLAY_ENEMY_HIT_FRAME
  sta enemy_frame_number, x

  txa
  pha
  tya
  pha
  lda #4
	ldx #FT_SFX_CH0
	jsr FamiToneSfxPlay
  pla
  tay
  pla
  tax

; Remove enemy & bullet.
  lda #$F0
  sta enemy_bullet_y, y
  lda #$00
  sta enemy_bullet_x, y
  sta enemy_bullet_flags, y

; Remove some enemy health and destroy enemy if needs be
  dec enemy_health, x
  lda enemy_health, x
  cmp #0
  bne enemy_has_health_remaining
  lda enemy_flags, x
  ora #ENEMY_EXPLODING
  sta enemy_flags, x
  lda #$00
  sta enemy_frame_number, x

; --------------------------------------------------
; Play explosion sfx.
; --------------------------------------------------
  txa
  pha
  tya
  pha
  lda #1
	ldx #FT_SFX_CH0
	jsr FamiToneSfxPlay
  pla
  tay
  pla
  tax

enemy_has_health_remaining:
enemy_is_exploding:

NoCollision:
  inx
  cpx #NUMBER_OF_ENEMIES
  bne check

  RESTORE_REGISTERS
  rts
.endproc




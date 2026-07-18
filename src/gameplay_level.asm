.segment "CODE"

.proc GameplayLevel
; --------------------------------------------------
; Does not need to save/restore registers.
; Spawing enemies
; Read the general purpose timer. Every 32 frames decrement
; the enemy_spawn_wait time
;
; Begin spawn procedure when enemy_spawn_wait=0
; set x to the number of enemies to spawn
; set enemy_spawn_wait to the time desired to wait for next spawn
; --------------------------------------------------
  lda timer
  and #%00011111
  bne skip_spawn_wait_decrement
  dec enemy_spawn_wait
skip_spawn_wait_decrement:

  lda enemy_spawn_wait
  bne dont_spawn

  inc enemy_spawn_script
  lda enemy_spawn_script
  tay
  lda spawn_enemy_qty_table, y
  tax

  lda spawn_enemy_wait_table, y
  sta enemy_spawn_wait

spawn:
  jsr SpawnEnemy
  dex
  cpx #$00
  bne spawn

dont_spawn:

; --------------------------------------------------
; process enemies
; --------------------------------------------------
  jsr ProcessEnemeies
  jsr ProcessEnemyBullets

; --------------------------------------------------
; 
; --------------------------------------------------
  jsr ProcessPlayerBullets
  jsr ShootPlayerBullets

; --------------------------------------------------
; 
; --------------------------------------------------
  jsr move_player
  jsr draw_player

  lda prep_next_row
  beq next_row_is_prepared
  jsr prepare_next_row
next_row_is_prepared:

  rts
.endproc
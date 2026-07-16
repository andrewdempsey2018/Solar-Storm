; --------------------------------------------------
; Tiles and attributes that make up enemy
; sprites/animation frames.
; tiletl,attribtl,tiletr,attribtr,tilebl,attribbl,tilebr,attribbr
; --------------------------------------------------

; tank, grey
enemy_0_move_down_frame:
  .byte $C0,$00,$C1,$00,$D0,$00,$D1,$00
enemy_0_move_left_frame:
  .byte $C0,$00,$C1,$00,$D0,$00,$D1,$00
enemy_0_move_right_frame:
  .byte $C0,$00,$C1,$00,$D0,$00,$D1,$00
enemy_0_hit_frame:
  .byte $E0,$00,$E1,$00,$F0,$00,$F1,$00

; star, pink
enemy_1_move_down_frame:
  .byte $CA,$03,$CB,$03,$DA,$03,$DB,$03
enemy_1_move_left_frame:
  .byte $AA,$03,$AB,$03,$BA,$03,$BB,$03
enemy_1_move_right_frame:
  .byte $8A,$03,$8B,$03,$9A,$03,$9B,$03
enemy_1_hit_frame:
  .byte $EA,$00,$EB,$00,$FA,$00,$FB,$00

; head, grey
enemy_2_move_down_frame:
  .byte $C4,$00,$C5,$00,$D4,$00,$D5,$00
enemy_2_move_left_frame:
  .byte $C4,$00,$C5,$00,$D4,$00,$D5,$00
enemy_2_move_right_frame:
  .byte $C4,$00,$C5,$00,$D4,$00,$D5,$00
enemy_2_hit_frame:
  .byte $E4,$00,$E5,$00,$F4,$00,$F5,$00

; tail, grey
enemy_3_move_down_frame:
  .byte $A4,$00,$A5,$00,$B4,$00,$B5,$00
enemy_3_move_left_frame:
  .byte $A4,$00,$A5,$00,$B4,$00,$B5,$00
enemy_3_move_right_frame:
  .byte $A4,$00,$A5,$00,$B4,$00,$B5,$00
enemy_3_hit_frame:
  .byte $84,$00,$85,$00,$94,$00,$95,$00

; tank, pink
enemy_4_move_down_frame:
  .byte $C0,$03,$C1,$03,$D0,$03,$D1,$03
enemy_4_move_left_frame:
  .byte $C0,$03,$C1,$03,$D0,$03,$D1,$03
enemy_4_move_right_frame:
  .byte $C0,$03,$C1,$03,$D0,$03,$D1,$03
enemy_4_hit_frame:
  .byte $E0,$00,$E1,$00,$F0,$00,$F1,$00

; viper, grey
enemy_animated_0_frame_0:
  .byte $C2,$00,$C3,$00,$D2,$00,$D3,$00
enemy_animated_0_frame_1:
  .byte $B2,$00,$B3,$00,$D2,$00,$D3,$00
enemy_animated_0_frame_2:
  .byte $A2,$00,$A3,$00,$D2,$00,$D3,$00
enemy_animated_0_frame_3:
  .byte $B2,$00,$B3,$00,$D2,$00,$D3,$00
enemy_animated_0_hit_frame:
  .byte $E2,$00,$E3,$00,$F2,$00,$F3,$00

; ball, orange
enemy_animated_1_frame_0:
  .byte $A8,$02,$A9,$02,$B8,$02,$B9,$02
enemy_animated_1_frame_1:
  .byte $C8,$02,$C9,$02,$D8,$02,$D9,$02
enemy_animated_1_frame_2:
  .byte $A8,$02,$A9,$02,$B8,$02,$B9,$02
enemy_animated_1_frame_3:
  .byte $C8,$02,$C9,$02,$D8,$02,$D9,$02
enemy_animated_1_hit_frame:
  .byte $E8,$00,$E9,$00,$F8,$00,$F9,$00

; body, grey
enemy_animated_2_frame_0:
  .byte $86,$00,$87,$00,$96,$00,$97,$00
enemy_animated_2_frame_1:
  .byte $A6,$00,$A7,$00,$B6,$00,$B7,$00
enemy_animated_2_frame_2:
  .byte $C6,$00,$C7,$00,$D6,$00,$D7,$00
enemy_animated_2_frame_3:
  .byte $A6,$00,$A7,$00,$B6,$00,$B7,$00
enemy_animated_2_hit_frame:
  .byte $E6,$00,$E7,$00,$F6,$00,$F7,$00

; body, orange
enemy_animated_3_frame_0:
  .byte $86,$02,$87,$02,$96,$02,$97,$02
enemy_animated_3_frame_1:
  .byte $A6,$02,$A7,$02,$B6,$02,$B7,$02
enemy_animated_3_frame_2:
  .byte $C6,$02,$C7,$02,$D6,$02,$D7,$02
enemy_animated_3_frame_3:
  .byte $A6,$02,$A7,$02,$B6,$02,$B7,$02
enemy_animated_3_hit_frame:
  .byte $E6,$00,$E7,$00,$F6,$00,$F7,$00

; ball, pink
enemy_animated_4_frame_0:
  .byte $A8,$03,$A9,$03,$B8,$03,$B9,$03
enemy_animated_4_frame_1:
  .byte $C8,$03,$C9,$03,$D8,$03,$D9,$03
enemy_animated_4_frame_2:
  .byte $A8,$03,$A9,$03,$B8,$03,$B9,$03
enemy_animated_4_frame_3:
  .byte $C8,$03,$C9,$03,$D8,$03,$D9,$03
enemy_animated_4_hit_frame:
  .byte $E8,$00,$E9,$00,$F8,$00,$F9,$00

explosion_frame_0:
  .byte $20,$02,$21,$02,$30,$02,$31,$02
explosion_frame_1:
  .byte $22,$02,$23,$02,$32,$02,$33,$02
explosion_frame_2:
  .byte $24,$02,$25,$02,$34,$02,$35,$02
explosion_frame_3:
  .byte $26,$02,$27,$02,$36,$02,$37,$02

; --------------------------------------------------
; Address of each frame that will be used in
; conjunction with the frame number variable
; to animate enemies.

; Drawing routine expects 4 frames per enemy hence
; some filler values ($FF).

; 8th frame for each enemy is expected to be the
; 'hit' frame for the enemy i.e. what is displayed
; when the enemy is hit by a player bullet.
; --------------------------------------------------
frames_lo_table:
  .byte <enemy_0_move_down_frame
  .byte <enemy_0_move_left_frame
  .byte <enemy_0_move_right_frame
  .byte $FF
  .byte $FF
  .byte $FF
  .byte $FF
  .byte <enemy_0_hit_frame
  .byte <enemy_1_move_down_frame
  .byte <enemy_1_move_left_frame
  .byte <enemy_1_move_right_frame
  .byte $FF
  .byte $FF
  .byte $FF
  .byte $FF
  .byte <enemy_1_hit_frame
  .byte <enemy_2_move_down_frame
  .byte <enemy_2_move_left_frame
  .byte <enemy_2_move_right_frame
  .byte $FF
  .byte $FF
  .byte $FF
  .byte $FF
  .byte <enemy_2_hit_frame
  .byte <enemy_3_move_down_frame
  .byte <enemy_3_move_left_frame
  .byte <enemy_3_move_right_frame
  .byte $FF
  .byte $FF
  .byte $FF
  .byte $FF
  .byte <enemy_3_hit_frame
  .byte <enemy_4_move_down_frame
  .byte <enemy_4_move_left_frame
  .byte <enemy_4_move_right_frame
  .byte $FF
  .byte $FF
  .byte $FF
  .byte $FF
  .byte <enemy_4_hit_frame
  .byte <enemy_animated_0_frame_0
  .byte <enemy_animated_0_frame_1
  .byte <enemy_animated_0_frame_2
  .byte <enemy_animated_0_frame_3
  .byte $FF
  .byte $FF
  .byte $FF
  .byte <enemy_animated_0_hit_frame
  .byte <enemy_animated_1_frame_0
  .byte <enemy_animated_1_frame_1
  .byte <enemy_animated_1_frame_2
  .byte <enemy_animated_1_frame_3
  .byte $FF
  .byte $FF
  .byte $FF
  .byte <enemy_animated_1_hit_frame
  .byte <enemy_animated_2_frame_0
  .byte <enemy_animated_2_frame_1
  .byte <enemy_animated_2_frame_2
  .byte <enemy_animated_2_frame_3
  .byte $FF
  .byte $FF
  .byte $FF
  .byte <enemy_animated_2_hit_frame
  .byte <enemy_animated_3_frame_0
  .byte <enemy_animated_3_frame_1
  .byte <enemy_animated_3_frame_2
  .byte <enemy_animated_3_frame_3
  .byte $FF
  .byte $FF
  .byte $FF
  .byte <enemy_animated_3_hit_frame
  .byte <enemy_animated_4_frame_0
  .byte <enemy_animated_4_frame_1
  .byte <enemy_animated_4_frame_2
  .byte <enemy_animated_4_frame_3
  .byte $FF
  .byte $FF
  .byte $FF
  .byte <enemy_animated_4_hit_frame
  .byte <explosion_frame_0
  .byte <explosion_frame_1
  .byte <explosion_frame_2
  .byte <explosion_frame_3
  .byte $FF
  .byte $FF
  .byte $FF
  .byte $FF

frames_hi_table:
  .byte >enemy_0_move_down_frame
  .byte >enemy_0_move_left_frame
  .byte >enemy_0_move_right_frame
  .byte $FF
  .byte $FF
  .byte $FF
  .byte $FF
  .byte >enemy_0_hit_frame
  .byte >enemy_1_move_down_frame
  .byte >enemy_1_move_left_frame
  .byte >enemy_1_move_right_frame
  .byte $FF
  .byte $FF
  .byte $FF
  .byte $FF
  .byte >enemy_1_hit_frame
  .byte >enemy_2_move_down_frame
  .byte >enemy_2_move_left_frame
  .byte >enemy_2_move_right_frame
  .byte $FF
  .byte $FF
  .byte $FF
  .byte $FF
  .byte >enemy_2_hit_frame
  .byte >enemy_3_move_down_frame
  .byte >enemy_3_move_left_frame
  .byte >enemy_3_move_right_frame
  .byte $FF
  .byte $FF
  .byte $FF
  .byte $FF
  .byte >enemy_3_hit_frame
  .byte >enemy_4_move_down_frame
  .byte >enemy_4_move_left_frame
  .byte >enemy_4_move_right_frame
  .byte $FF
  .byte $FF
  .byte $FF
  .byte $FF
  .byte >enemy_4_hit_frame
  .byte >enemy_animated_0_frame_0
  .byte >enemy_animated_0_frame_1
  .byte >enemy_animated_0_frame_2
  .byte >enemy_animated_0_frame_3
  .byte $FF
  .byte $FF
  .byte $FF
  .byte >enemy_animated_0_hit_frame
  .byte >enemy_animated_1_frame_0
  .byte >enemy_animated_1_frame_1
  .byte >enemy_animated_1_frame_2
  .byte >enemy_animated_1_frame_3
  .byte $FF
  .byte $FF
  .byte $FF
  .byte >enemy_animated_1_hit_frame
  .byte >enemy_animated_2_frame_0
  .byte >enemy_animated_2_frame_1
  .byte >enemy_animated_2_frame_2
  .byte >enemy_animated_2_frame_3
  .byte $FF
  .byte $FF
  .byte $FF
  .byte >enemy_animated_2_hit_frame
  .byte >enemy_animated_3_frame_0
  .byte >enemy_animated_3_frame_1
  .byte >enemy_animated_3_frame_2
  .byte >enemy_animated_3_frame_3
  .byte $FF
  .byte $FF
  .byte $FF
  .byte >enemy_animated_3_hit_frame
  .byte >enemy_animated_4_frame_0
  .byte >enemy_animated_4_frame_1
  .byte >enemy_animated_4_frame_2
  .byte >enemy_animated_4_frame_3
  .byte $FF
  .byte $FF
  .byte $FF
  .byte >enemy_animated_4_hit_frame
  .byte >explosion_frame_0
  .byte >explosion_frame_1
  .byte >explosion_frame_2
  .byte >explosion_frame_3
  .byte $FF
  .byte $FF
  .byte $FF
  .byte $FF

; --------------------------------------------------
; Enemy data tables
; spawn_enemy_xpos_table, spawn_enemy_ypos_table - x and y positions of enemy when it is first spawned
; spawn_enemy_type_table - the specific enemy type to spawn (0-4 move down/lef/right) (5-9 animated)
; spawn_enemy_qty_table - quantity of enemies to spawn (0-5)
; spawn_enemy_wait_table - time to wait for next spawn (1-255)
; spawn_enemy_path_table - the flight path the enemy flies when it is alive (0-6)
; --------------------------------------------------
spawn_enemy_xpos_table:
  .byte $10,$50,$80,$A0,$C0,$A0,$80,$50,$10,$20,$30,$50,$50,$50,$50,$50
  .byte $10,$50,$80,$A0,$C0,$A0,$80,$50,$10,$20,$30,$50,$50,$50,$50,$50
  .byte $50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50
  .byte $50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50
  .byte $50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50
  .byte $50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50
  .byte $50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50
  .byte $50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50
  .byte $50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50
  .byte $50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50
  .byte $50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50
  .byte $50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50
  .byte $50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50
  .byte $50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50
  .byte $50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50
  .byte $50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50,$50

spawn_enemy_ypos_table:
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

spawn_enemy_type_table:
  .byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

spawn_enemy_path_table:
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

; max spawn x256 enemies
spawn_enemy_qty_table:
  .byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
  .byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
  .byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
  .byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
  .byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
  .byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
  .byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
  .byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
  .byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
  .byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
  .byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
  .byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
  .byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
  .byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
  .byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
  .byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01

spawn_enemy_wait_table:
  .byte $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04
  .byte $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04
  .byte $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04
  .byte $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04
  .byte $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04
  .byte $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04
  .byte $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04
  .byte $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04
  .byte $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04
  .byte $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04
  .byte $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04
  .byte $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04
  .byte $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04
  .byte $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04
  .byte $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04
  .byte $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04

; Tables enemy_path_0_x_table and enemy_path_0_y_table
; $00 for stop
; move right $01-$1F (1 pixel per frame), $20-$7F (sub pixel movement)
; move left $FF-$E1 (1 pixel per frame), $E0-$81 (sub pixel movement)
; move down $01-$1F (1 pixel per frame), $20-$7F (sub pixel movement)
; move up $FF-$E1 (1 pixel per frame), $E0-$81 (sub pixel movement)
;
; Table enemy_path_0_action_table
; $00 no action
; reset table index $80

; straight down
enemy_path_0_x_table:
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
enemy_path_0_y_table:
  .byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
  .byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
enemy_path_0_action_table:
  .byte $00,$00,$01,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$80

; down right
enemy_path_1_x_table:
  .byte $60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60
  .byte $60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60
enemy_path_1_y_table:
  .byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
  .byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
enemy_path_1_action_table:
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$80

; down left
enemy_path_2_x_table:
  .byte $A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0
  .byte $A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0
enemy_path_2_y_table:
  .byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
  .byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
enemy_path_2_action_table:
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$80

; sine wave
enemy_path_3_x_table:
  .byte $00,$50,$01,$02,$01,$50,$00,$B0,$FF,$FE,$FF,$B0
enemy_path_3_y_table:
  .byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
enemy_path_3_action_table:
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$80

; straight down, slow start, speed up
enemy_path_4_x_table:
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
enemy_path_4_y_table:
  .byte $01,$01,$01,$02,$03,$04,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07
enemy_path_4_action_table:
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

; slow drop, drift right to left slow (for tanks)
enemy_path_5_x_table:
  .byte $00,$00,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$00
  .byte $A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0
enemy_path_5_y_table:
  .byte $60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60
  .byte $60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60
enemy_path_5_action_table:
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$80

; slow drop, drift left to right slow (for tanks)
enemy_path_6_x_table:
  .byte $00,$00,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$00
  .byte $60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60
enemy_path_6_y_table:
  .byte $60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60
  .byte $60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60
enemy_path_6_action_table:
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$80

enemy_path_data_x_lo_table:
  .byte <enemy_path_0_x_table,<enemy_path_1_x_table,<enemy_path_2_x_table,<enemy_path_3_x_table,<enemy_path_4_x_table,<enemy_path_5_x_table,<enemy_path_6_x_table

enemy_path_data_x_hi_table:
  .byte >enemy_path_0_x_table,>enemy_path_1_x_table,>enemy_path_2_x_table,>enemy_path_3_x_table,>enemy_path_4_x_table,>enemy_path_5_x_table,>enemy_path_6_x_table

enemy_path_data_y_lo_table:
  .byte <enemy_path_0_y_table,<enemy_path_1_y_table,<enemy_path_2_y_table,<enemy_path_3_y_table,<enemy_path_4_y_table,<enemy_path_5_y_table,<enemy_path_6_y_table

enemy_path_data_y_hi_table:
  .byte >enemy_path_0_y_table,>enemy_path_1_y_table,>enemy_path_2_y_table,>enemy_path_3_y_table,>enemy_path_4_y_table,>enemy_path_5_y_table,>enemy_path_6_y_table

enemy_path_data_action_lo_table:
  .byte <enemy_path_0_action_table,<enemy_path_1_action_table,<enemy_path_2_action_table,<enemy_path_3_action_table,<enemy_path_4_action_table,<enemy_path_5_action_table
  .byte <enemy_path_6_action_table
  
enemy_path_data_action_hi_table:
  .byte >enemy_path_0_action_table,>enemy_path_1_action_table,>enemy_path_2_action_table,>enemy_path_3_action_table,>enemy_path_4_action_table,>enemy_path_5_action_table
  .byte >enemy_path_6_action_table

; --------------------------------------------------
; Offset into the enemy animation frames tables to
; get the correct animation frame to draw.
; First 5 bytes are filler but better animation code
; in general would probably better utilise this
; table - no need to calculate animation frame number
; for enemies that move down/left/right.
; Animation code could be better in general.
; --------------------------------------------------
enemy_frames_offset_table:
  .byte $FF,$FF,$FF,$FF,$FF,$28,$30,$38,$40,$48
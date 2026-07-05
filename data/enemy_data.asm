; --------------------------------------------------
; Tiles and attributes that make up enemy
; sprites/animation frames.
; tiletl,attribtl,tiletr,attribtr,tilebl,attribbl,tilebr,attribbr
; --------------------------------------------------
enemy_0_move_down_frame:
  .byte $40,$00,$41,$00,$42,$00,$43,$00
enemy_0_move_left_frame:
  .byte $50,$00,$51,$00,$42,$00,$43,$00
enemy_0_move_right_frame:
  .byte $40,$00,$41,$00,$42,$00,$43,$00
enemy_0_hit_frame:
  .byte $70,$00,$71,$00,$80,$00,$81,$00

enemy_1_move_down_frame:
  .byte $44,$01,$45,$01,$46,$01,$47,$01
enemy_1_move_left_frame:
  .byte $44,$01,$45,$01,$46,$01,$47,$01
enemy_1_move_right_frame:
  .byte $44,$01,$45,$01,$46,$01,$47,$01
enemy_1_hit_frame:
  .byte $72,$00,$73,$00,$82,$00,$83,$00

enemy_2_move_down_frame:
  .byte $60,$00,$61,$00,$62,$00,$63,$00
enemy_2_move_left_frame:
  .byte $60,$00,$61,$00,$62,$00,$63,$00
enemy_2_move_right_frame:
  .byte $60,$00,$61,$00,$62,$00,$63,$00
enemy_2_hit_frame:
  .byte $78,$00,$79,$00,$88,$00,$89,$00

enemy_3_move_down_frame:
  .byte $40,$00,$41,$00,$42,$00,$43,$00
enemy_3_move_left_frame:
  .byte $50,$00,$51,$00,$42,$00,$43,$00
enemy_3_move_right_frame:
  .byte $40,$00,$41,$00,$42,$00,$43,$00
enemy_3_hit_frame:
  .byte $78,$00,$79,$00,$88,$00,$89,$00

enemy_4_move_down_frame:
  .byte $40,$00,$41,$00,$42,$00,$43,$00
enemy_4_move_left_frame:
  .byte $50,$00,$51,$00,$42,$00,$43,$00
enemy_4_move_right_frame:
  .byte $40,$00,$41,$00,$42,$00,$43,$00
enemy_4_hit_frame:
  .byte $78,$00,$79,$00,$88,$00,$89,$00

enemy_animated_0_frame_0:
  .byte $48,$02,$49,$02,$4A,$02,$4B,$02
enemy_animated_0_frame_1:
  .byte $58,$02,$59,$02,$5A,$02,$5B,$02
enemy_animated_0_frame_2:
  .byte $48,$02,$49,$02,$4A,$02,$4B,$02
enemy_animated_0_frame_3:
  .byte $58,$02,$59,$02,$5A,$02,$5B,$02
enemy_animated_0_hit_frame:
  .byte $7A,$00,$7A,$00,$7A,$00,$7A,$00

explosion_frame_0:
  .byte $90,$03,$91,$03,$A0,$03,$A1,$03
explosion_frame_1:
  .byte $92,$03,$93,$03,$A2,$03,$A3,$03
explosion_frame_2:
  .byte $94,$03,$95,$03,$A4,$03,$A5,$03
explosion_frame_3:
  .byte $96,$03,$97,$03,$A6,$03,$A7,$03

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
; spawn_enemy_type_table - the specific enemy type to spawn (0-5)
; spawn_enemy_qty_table - quantity of enemies to spawn (0-5)
; spawn_enemy_wait_table - time to wait for next spawn (1-255)
; spawn_enemy_path_table - the flight path the enemy flies when it is alive (0-6)
; --------------------------------------------------
spawn_enemy_xpos_table:
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
  .byte $00,$00,$00,$01,$01,$01,$02,$02,$02,$03,$03,$03,$04,$04,$04,$05
  .byte $05,$05,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
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
  .byte $00,$00,$01,$01,$02,$02,$03,$03,$04,$04,$05,$05,$06,$06,$06,$06
  .byte $06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06
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
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
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
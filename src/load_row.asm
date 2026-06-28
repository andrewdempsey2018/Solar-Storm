; ----------------------------------- ;
; loads a row of metatiles expects data to be structured bottom row to top row

; document this similar to init_nametable
; be sure to include details of what zero apge pointers need to be set to etc...
;layout_pointer: .res 2
;metatile_top_pointer: .res 2
;metatile_bottom_pointer: .res 2
;attribs_pointer: .res 2
;screens_lo_pointer: .res 2
;screens_hi_pointer: .res 2

; example:
; ----------------------------------- ;
; loads a full nametable & attributes, expects nametable data to be
; in rows, top left -> bottom right
; set nametable number (00 or 02)
; layout_pointer: set this to the required layout table
; 'metatile_top_pointer' should point at top left and top right tiles for metatiles
; 'metatile_bottom_pointer' should point at bottom left and bottom right tiles for metatiles
; 'attribs_pointer' should point at relevant attributes


; load row needs:
; scroll_y, nametable_number, metatile_row_number, attrib_data to be set, row_data to be set
; load attributes needs:
; metatile_row_number, screen_counter

.proc load_row
  SAVE_REGISTERS

  lda scroll_y          ; calculate row number based on scroll position
  lsr a
  lsr a
  lsr a
  tay

  lda nt_address_lo_table, y         ; figure out what nametable to draw to
  sta row_address
  
  lda nametable_number
  eor #$02              ; drawing to nametable that is currently offscreen
  cmp #$00
  bne @Nametable2
  lda nt00_address_hi_table, y
  sta row_address+1
  jmp DrawTiles
@Nametable2:
  lda nt02_address_hi_table, y
  sta row_address+1

DrawTiles:           ; prep ppu for drawing tiles
  lda PPUSTATUS
  lda row_address + 1
  sta PPUADDR
  lda row_address
  sta PPUADDR

  ldx #$00              ; draw top half of 16x16 tiles
DrawTilesLoop:
  lda row_data, x
  sta PPUDATA
  inx
  txa
  cmp #$40
  bne DrawTilesLoop

  ;;;;;;;;;;
  lda metatile_row_number
  and #%00000001   ; isolate lowest bit
  bne DontLoadAttrib       ; if result != 0 → odd

  ldy metatile_row_number
  lda attribs_nt_address_lo_table, y         ; figure out what nametable to draw to
  sta row_address

  lda nametable_number
  eor #$02              ; drawing to nametable that is currently offscreen
  cmp #$00
  bne @Nametable2
  lda #$23
  sta row_address+1
  jmp LoadAttribs
@Nametable2:
  lda #$2B
  sta row_address+1

LoadAttribs:

  lda PPUSTATUS
  lda row_address + 1
  sta PPUADDR
  lda row_address
  sta PPUADDR

  ldx #$00              ; draw top half of 16x16 tiles
DrawAttribLoop:
  lda attrib_data, x
  sta PPUDATA
  inx
  cpx #$08
  bne DrawAttribLoop

DontLoadAttrib:
  ;;;;;;;;;;

  RESTORE_REGISTERS
  rts
.endproc

.proc prepare_next_row
  SAVE_REGISTERS

  inc metatile_row_number
  lda metatile_row_number
  cmp #15
  bne :+

  ;;;
  inc screen_counter
  ldy screen_counter

  lda (screens_lo_pointer), y
  sta layout_pointer
  lda(screens_hi_pointer), y
  sta layout_pointer+1

  lda (attribs_lo_pointer), y
  sta attribs_pointer
  lda (attribs_hi_pointer), y
  sta attribs_pointer+1
  ;;;

  lda #0
  sta metatile_row_number
:
  asl a
  asl a
  asl a
  asl a                 ; multiply by 16
  tay                   ; y now contains the address of the first element of the row
  
  sta zp_scratch_0

  ldx #$FF
fill_top_row:
  inx
  lda (layout_pointer), y
  asl a
  tay
  lda (metatile_top_pointer), y
  sta row_data, x
  inx
  iny
  lda (metatile_top_pointer), y
  sta row_data, x
  inc zp_scratch_0
  ldy zp_scratch_0
  cpx #$1F              ; 32 top tiles
  bne fill_top_row

  ;;;
  lda metatile_row_number
  asl a
  asl a
  asl a
  asl a                 ; multiply by 16
  tay                   ; y now contains the address of the first element
  sta zp_scratch_0
  ;;;

fill_bottom_row:
  inx
  lda (layout_pointer), y
  asl a
  tay
  lda (metatile_bottom_pointer), y
  sta row_data, x
  inx
  iny
  lda (metatile_bottom_pointer), y
  sta row_data, x
  inc zp_scratch_0
  ldy zp_scratch_0
  cpx #$3F              ; 32 top tiles
  bne fill_bottom_row

                        ; load attributes if the row number is even (atributes only need to be loaded every second row as attributes cover a 32x32 area)
  lda metatile_row_number
  and #%00000001        ; isolate lowest bit
  bne DontLoadAttrib    ; if result != 0 → odd
  lda metatile_row_number
  lsr a                 ; divide by 2 (if row number=0 then a=0, if row number=2 then a=1, if row number=4 then a=2 etc... 
                        ; this ensures the correct index is available for the attributes tables which is set out in 8 rows)

  asl a
  asl a
  asl a

  tay
  ldx #$00
FillAttribs:
  lda (attribs_pointer), y
  sta attrib_data, x
  iny
  inx
  cpx #$08
  bne FillAttribs
  
DontLoadAttrib:

  ;;
  lda #$00
  sta prep_next_row
  
  RESTORE_REGISTERS
  rts
.endproc

.segment "RODATA"

nt00_address_hi_table:
  .byte $20,$20,$20,$20,$20,$20,$20,$20,$21,$21,$21,$21,$21,$21,$21,$21,$22,$22,$22,$22,$22,$22,$22,$22,$23,$23,$23,$23,$23,$23
nt02_address_hi_table:
  .byte $28,$28,$28,$28,$28,$28,$28,$28,$29,$29,$29,$29,$29,$29,$29,$29,$2A,$2A,$2A,$2A,$2A,$2A,$2A,$2A,$2B,$2B,$2B,$2B,$2B,$2B
nt_address_lo_table:
  .byte $00,$20,$40,$60,$80,$A0,$C0,$E0,$00,$20,$40,$60,$80,$A0,$C0,$E0,$00,$20,$40,$60,$80,$A0,$C0,$E0,$00,$20,$40,$60,$80,$A0
attribs_nt_address_lo_table:
  ; ($00 unused)
  .byte $F8,$00,$F0,$00,$E8,$00,$E0,$00,$D8,$00,$D0,$00,$C8,$00,$C0
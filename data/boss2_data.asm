.segment "RODATA"

.scope Boss2Data

; ----------------------------------- ;
; metatile defs max 128 tiles 128*2=256)
MetatileTop:
  .byte $40,$40
  .byte $00,$01
  .byte $02,$03
  .byte $04,$05
  .byte $06,$07
  .byte $08,$09
  .byte $0A,$0B
  .byte $0C,$0D
  .byte $0E,$0F
  .byte $20,$21
  .byte $22,$23
  .byte $24,$25
  .byte $26,$27
  .byte $28,$29
  .byte $2A,$2B
  .byte $2C,$2D
  .byte $2E,$2F
  .byte $40,$41
  .byte $42,$43
  .byte $44,$45
  .byte $46,$47
  .byte $48,$49
  .byte $4A,$4B
  .byte $4C,$4D
  .byte $4E,$4F
  .byte $60,$61
  .byte $62,$63
  .byte $64,$65
  .byte $66,$67
  .byte $68,$69
  .byte $6A,$6B
  .byte $6C,$6D
  .byte $6E,$6F
  .byte $80,$81
  .byte $82,$83
  .byte $84,$85
  .byte $86,$87
  .byte $88,$89
  .byte $8A,$8B
  .byte $8C,$8D
  .byte $8E,$8F
  .byte $A0,$A1
  .byte $A2,$A3
  .byte $A4,$A5
  .byte $A6,$A7
  .byte $A8,$A9
  .byte $AA,$AB
  .byte $AC,$AD
  .byte $AE,$AF
  .byte $C0,$C1
  .byte $C2,$C3
  .byte $C4,$C5
  .byte $C6,$C7
  .byte $C8,$C9
  .byte $CA,$CB
  .byte $CC,$CD
  .byte $CE,$CF
  .byte $E0,$E1
  .byte $E2,$E3
  .byte $E4,$E5
  .byte $E6,$E7
  .byte $E8,$E9
  .byte $EA,$EB
  .byte $EC,$ED
  .byte $EE,$EF

MetatileBottom:
  .byte $40,$40
  .byte $10,$11
  .byte $12,$13
  .byte $14,$15
  .byte $16,$17
  .byte $18,$19
  .byte $1A,$1B
  .byte $1C,$1D
  .byte $1E,$1F
  .byte $30,$31
  .byte $32,$33
  .byte $34,$35
  .byte $36,$37
  .byte $38,$39
  .byte $3A,$3B
  .byte $3C,$3D
  .byte $3E,$3F
  .byte $50,$51
  .byte $52,$53
  .byte $54,$55
  .byte $56,$57
  .byte $58,$59
  .byte $5A,$5B
  .byte $5C,$5D
  .byte $5E,$5F
  .byte $70,$71
  .byte $72,$73
  .byte $74,$75
  .byte $76,$77
  .byte $78,$79
  .byte $7A,$7B
  .byte $7C,$7D
  .byte $7E,$7F
  .byte $90,$91
  .byte $92,$93
  .byte $94,$95
  .byte $96,$97
  .byte $98,$99
  .byte $9A,$9B
  .byte $9C,$9D
  .byte $9E,$9F
  .byte $B0,$B1
  .byte $B2,$B3
  .byte $B4,$B5
  .byte $B6,$B7
  .byte $B8,$B9
  .byte $BA,$BB
  .byte $BC,$BD
  .byte $BE,$BF
  .byte $D0,$D1
  .byte $D2,$D3
  .byte $D4,$D5
  .byte $D6,$D7
  .byte $D8,$D9
  .byte $DA,$DB
  .byte $DC,$DD
  .byte $DE,$DF
  .byte $F0,$F1
  .byte $F2,$F3
  .byte $F4,$F5
  .byte $F6,$F7
  .byte $F8,$F9
  .byte $FA,$FB
  .byte $FC,$FD
  .byte $FE,$FF
; ----------------------------------- ;

Screen1:
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; lev 14
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; lev 13
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; lev 12
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; lev 11
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; lev 10
.byte $00,$00,$00,$39,$3A,$3B,$3C,$3D,$3E,$3F,$40,$00,$00,$00,$00,$00 ; lev 9
.byte $00,$00,$00,$31,$32,$33,$34,$35,$36,$37,$38,$00,$00,$00,$00,$00 ; lev 8
.byte $00,$00,$00,$29,$2A,$2B,$2C,$2D,$2E,$2F,$30,$00,$00,$00,$00,$00 ; lev 7
.byte $00,$00,$00,$21,$22,$23,$24,$25,$26,$27,$28,$00,$00,$00,$00,$00 ; lev 6 
.byte $00,$00,$00,$19,$1A,$1B,$1C,$1D,$1E,$1F,$20,$00,$00,$00,$00,$00 ; lev 5
.byte $00,$00,$00,$11,$12,$13,$14,$15,$16,$17,$18,$00,$00,$00,$00,$00 ; lev 4
.byte $00,$00,$00,$09,$0A,$0B,$0C,$0D,$0E,$0F,$10,$00,$00,$00,$00,$00 ; lev 3
.byte $00,$00,$00,$01,$02,$03,$04,$05,$06,$07,$08,$00,$00,$00,$00,$00 ; lev 2
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; lev 1
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; lev 0

Screen1Attrib:
.byte $55,$55,$55,$55,$55,$55,$55,$55
.byte $55,$55,$55,$55,$55,$55,$55,$55
.byte $55,$55,$55,$55,$55,$55,$55,$55
.byte $55,$55,$55,$55,$55,$55,$55,$55
.byte $55,$55,$55,$55,$55,$55,$55,$55
.byte $55,$55,$55,$55,$55,$55,$55,$55
.byte $55,$55,$55,$55,$55,$55,$55,$55
.byte $55,$55,$55,$55,$55,$55,$55,$55

ScreenX:
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$01,$02,$03,$04,$05,$06,$07,$08,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$09,$0A,$0B,$0C,$0D,$0E,$0F,$10,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$11,$12,$13,$14,$15,$16,$17,$18,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$19,$1A,$1B,$1C,$1D,$1E,$1F,$20,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$21,$22,$23,$24,$25,$26,$27,$28,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$29,$2A,$2B,$2C,$2D,$2E,$2F,$30,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$31,$32,$33,$34,$35,$36,$37,$38,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$39,$3A,$3B,$3C,$3D,$3E,$3F,$40,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

ScreenXAttrib:
.byte $00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00

ScreensLow:
  .byte <Screen1,<Screen1,<Screen1,<Screen1,<Screen1,<Screen1,<Screen1,<Screen1,<Screen1,<Screen1,<Screen1,<Screen1,<Screen1
  .byte <Screen1,<Screen1,<Screen1,<Screen1,<Screen1,<Screen1,<Screen1,<Screen1,<Screen1,<Screen1,<Screen1,<Screen1,<Screen1
ScreensHigh:
  .byte >Screen1,>Screen1,>Screen1,>Screen1,>Screen1,>Screen1,>Screen1,>Screen1,>Screen1,>Screen1,>Screen1,>Screen1,>Screen1
  .byte >Screen1,>Screen1,>Screen1,>Screen1,>Screen1,>Screen1,>Screen1,>Screen1,>Screen1,>Screen1,>Screen1,>Screen1,>Screen1

AttribsLow:
  .byte <Screen1Attrib,<Screen1Attrib,<Screen1Attrib,<Screen1Attrib,<Screen1Attrib,<Screen1Attrib,<Screen1Attrib,<Screen1Attrib,<Screen1Attrib,<Screen1Attrib,<Screen1Attrib,<Screen1Attrib,<Screen1Attrib
  .byte <Screen1Attrib,<Screen1Attrib,<Screen1Attrib,<Screen1Attrib,<Screen1Attrib,<Screen1Attrib,<Screen1Attrib,<Screen1Attrib,<Screen1Attrib,<Screen1Attrib,<Screen1Attrib,<Screen1Attrib,<Screen1Attrib
AttribsHigh:
  .byte >Screen1Attrib,>Screen1Attrib,>Screen1Attrib,>Screen1Attrib,>Screen1Attrib,>Screen1Attrib,>Screen1Attrib,>Screen1Attrib,>Screen1Attrib,>Screen1Attrib,>Screen1Attrib,>Screen1Attrib,>Screen1Attrib
  .byte >Screen1Attrib,>Screen1Attrib,>Screen1Attrib,>Screen1Attrib,>Screen1Attrib,>Screen1Attrib,>Screen1Attrib,>Screen1Attrib,>Screen1Attrib,>Screen1Attrib,>Screen1Attrib,>Screen1Attrib,>Screen1Attrib

PaletteTable:
  .byte $0F,$00,$10,$30
  .byte $0F,$01,$21,$31
  .byte $0F,$06,$16,$26
  .byte $0F,$09,$19,$29

  .byte $0F,$00,$10,$30
  .byte $0F,$01,$21,$31
  .byte $0F,$06,$16,$26
  .byte $0F,$26,$27,$38

.endscope

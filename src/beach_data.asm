.segment "RODATA"

.scope BeachData

; ----------------------------------- ;
; metatile defs max 128 tiles 128*2=256)
MetatileTop:
  .byte $00,$01
  .byte $02,$03
  .byte $04,$05
  .byte $06,$07
  .byte $22,$23
  .byte $24,$25
  .byte $26,$27
  .byte $0E,$0F
MetatileBottom:
  .byte $10,$11
  .byte $12,$13
  .byte $14,$15
  .byte $16,$17
  .byte $32,$33
  .byte $34,$35
  .byte $36,$37
  .byte $1E,$1F
; ----------------------------------- ;

Screen1:
  .byte $07,$00,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07
  .byte $07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07
  .byte $07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07
  .byte $07,$00,$00,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07
  .byte $07,$07,$00,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07
  .byte $07,$07,$00,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07
  .byte $07,$07,$00,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07
  .byte $07,$07,$00,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07
  .byte $07,$00,$00,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07
  .byte $07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07
  .byte $07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07
  .byte $07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07
  .byte $07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07
  .byte $07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07
  .byte $07,$07,$00,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07
Screen1Attrib:
  .byte $55,$55,$55,$55,$55,$55,$55,$55
  .byte $55,$55,$55,$55,$55,$55,$55,$55
  .byte $55,$55,$55,$55,$55,$55,$55,$55
  .byte $55,$55,$55,$55,$55,$55,$55,$55
  .byte $55,$55,$55,$55,$55,$55,$55,$55
  .byte $55,$55,$55,$55,$55,$55,$55,$55
  .byte $55,$55,$55,$55,$55,$55,$55,$55
  .byte $55,$55,$55,$55,$55,$55,$55,$55

 Screen2:
  .byte $07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$00,$07
  .byte $07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07
  .byte $07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07
  .byte $07,$07,$07,$07,$07,$07,$07,$07,$00,$00,$07,$07,$00,$00,$07,$07
  .byte $07,$07,$07,$07,$07,$07,$07,$07,$07,$00,$07,$07,$00,$07,$07,$07
  .byte $07,$07,$07,$07,$07,$07,$07,$07,$07,$00,$07,$07,$00,$07,$07,$07
  .byte $07,$07,$07,$07,$07,$07,$07,$07,$07,$00,$00,$00,$00,$07,$07,$07
  .byte $07,$07,$07,$07,$07,$07,$07,$07,$07,$00,$07,$07,$00,$07,$07,$07
  .byte $07,$07,$07,$07,$07,$07,$07,$07,$00,$00,$07,$07,$00,$00,$07,$07
  .byte $07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07
  .byte $07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07
  .byte $07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07
  .byte $07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07
  .byte $07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07
  .byte $07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$00,$07,$07
 Screen2Attrib:
  .byte $00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00
  


ScreensLow:
  .byte <Screen1,<Screen2,<Screen1,<Screen2,<Screen1,<Screen2,<Screen1,<Screen2,<Screen1,<Screen2,<Screen1,<Screen2,<Screen1
  .byte <Screen2,<Screen1,<Screen2,<Screen1,<Screen2,<Screen1,<Screen2,<Screen1,<Screen2,<Screen1,<Screen2,<Screen1,<Screen2
ScreensHigh:
  .byte >Screen1,>Screen2,>Screen1,>Screen2,>Screen1,>Screen2,>Screen1,>Screen2,>Screen1,>Screen2,>Screen1,>Screen2,>Screen1
  .byte >Screen2,>Screen1,>Screen2,>Screen1,>Screen2,>Screen1,>Screen2,>Screen1,>Screen2,>Screen1,>Screen2,>Screen1,>Screen2

AttribsLow:
  .byte <Screen1Attrib,<Screen2Attrib,<Screen1Attrib,<Screen2Attrib,<Screen1Attrib,<Screen2Attrib,<Screen1Attrib,<Screen2Attrib,<Screen1Attrib,<Screen2Attrib,<Screen1Attrib,<Screen2Attrib,<Screen1Attrib
  .byte <Screen2Attrib,<Screen1Attrib,<Screen2Attrib,<Screen1Attrib,<Screen2Attrib,<Screen1Attrib,<Screen2Attrib,<Screen1Attrib,<Screen2Attrib,<Screen1Attrib,<Screen2Attrib,<Screen1Attrib,<Screen1Attrib
AttribsHigh:
  .byte >Screen1Attrib,>Screen2Attrib,>Screen1Attrib,>Screen2Attrib,>Screen1Attrib,>Screen2Attrib,>Screen1Attrib,>Screen2Attrib,>Screen1Attrib,>Screen2Attrib,>Screen1Attrib,>Screen2Attrib,>Screen1Attrib
  .byte >Screen2Attrib,>Screen1Attrib,>Screen2Attrib,>Screen1Attrib,>Screen2Attrib,>Screen1Attrib,>Screen2Attrib,>Screen1Attrib,>Screen2Attrib,>Screen1Attrib,>Screen2Attrib,>Screen1Attrib,>Screen1Attrib

PaletteTable:
  .byte $21,$27,$17,$07 ; bg
  .byte $21,$20,$11,$31
  .byte $21,$04,$14,$34
  .byte $21,$19,$29,$39

  .byte $21,$00,$10,$30 ; sprite
  .byte $21,$01,$21,$31
  .byte $21,$06,$16,$26
  .byte $21,$09,$19,$29

.endscope

.segment "HEADER"
.byte $4E, $45, $53, $1A ; iNES header
.byte $02        ; 2x 16KB PRG-ROM banks = 32kb for code
.byte $0C        ; 12x 8KB CHR-ROM banks
.byte %00110000  ; Vertical mirroring, no save RAM, CNROM/mapper 3
.byte %00000000  ; No special-case flags set
.byte $00        ; No PRG-RAM
.byte $00        ; NTSC
.segment "HEADER"
.byte $4e, $45, $53, $1a ; Magic string that always begins an iNES header
.byte $02        ; Number of 16KB PRG-ROM banks
.byte $05        ; Number of 8KB CHR-ROM banks
.byte %00110000  ; Vertical mirroring, no save RAM, use mapper (mapper type??)
.byte %00000000  ; No special-case flags set, no mapper
.byte $00        ; No PRG-RAM present
.byte $00        ; NTSC format
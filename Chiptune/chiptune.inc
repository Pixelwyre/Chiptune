; chiptune.inc

; input.asm
ProcessInput PROTO

; audio.asm
PlayNote PROTO, keyChar:BYTE

; tui.asm
DrawTUI PROTO
UpdateStatusPanel PROTO, keyChar:BYTE, currentFreq:DWORD, activeOctave:DWORD
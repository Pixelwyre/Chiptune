; chiptune.inc

; input.asm
ProcessInput PROTO

; audio.asm
PlayNote PROTO, keyIndex:DWORD, keyChar:BYTE

; kernel32
Beep PROTO, dwFreq:DWORD, dwDuration:DWORD

; tui.asm
DrawTUI PROTO
UpdateStatusPanel PROTO, keyChar:BYTE, currentFreq:DWORD, activeOctave:DWORD
; chiptune.inc

; input.asm
ProcessInput PROTO

; audio.asm
PlayNote PROTO, keyIndex:DWORD, keyChar:BYTE
ChangeOctave PROTO, direction:SDWORD
RecordNote PROTO, freq:DWORD
SetRecordState PROTO, newState:DWORD
GetRecordState PROTO
GetNoteCount PROTO

; kernel32
Beep PROTO, dwFreq:DWORD, dwDuration:DWORD

; tui.asm
DrawTUI PROTO
UpdateStatusPanel PROTO, keyChar:BYTE, currentFreq:DWORD, activeOctave:DWORD
UpdateOctaveDisplay PROTO, activeOctave:DWORD
HighlightKey PROTO, keyIndex:DWORD
UpdateModeDisplay PROTO, modeState:DWORD
UpdateRecordedCount PROTO, noteCount:DWORD
FlashControlLegend PROTO, controlIndex:DWORD
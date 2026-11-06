INCLUDE Irvine32.inc
INCLUDE chiptune.inc

.data
	; title bar
	TitleFrame0 BYTE "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป", 0Dh, 0Ah, 0
	TitleFrame1 BYTE "บ  Chiptune                                                  Press ESC to Exit บ", 0Dh, 0Ah, 0
    TitleFrame2 BYTE "ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน", 0Dh, 0Ah, 0

	; control panel / info
	InfoPanel0 BYTE "บ  Recorded Notes: [       ]                               Controls:           บ", 0Dh, 0Ah, 0
    InfoPanel1 BYTE "บ  Playback      : [       ]                                 [A-K] Play Notes  บ", 0Dh, 0Ah, 0
    InfoPanel2 BYTE "บ                                                             [+]/[-] Octave   บ", 0Dh, 0Ah, 0
    InfoPanel3 BYTE "บ                                                             [R] Record       บ", 0Dh, 0Ah, 0
    InfoPanel4 BYTE "บ                                                             [P] Playback     บ", 0Dh, 0Ah, 0

	; separator
	StatusSep   BYTE "ฬออออออออออออออออออออออออออออออออออออออหอออออออออออออออออออออออออออออออออออออออน", 0Dh, 0Ah, 0

	; status panel
	StatusPanel0 BYTE "บ Active Octave: [   ]                 บ Active Note/Freq: [     /         ]   บ", 0Dh, 0Ah, 0

	; border between status and keyboard
	KeySep0 BYTE "ฬออออออออออออออออออออออออออออออออออออออสอออออออออออออออออออออออออออออออออออออออน", 0Dh, 0Ah, 0

	; piano keyboard
	KeyPanelFrame0 BYTE "บ                                                                              บ", 0Dh, 0Ah, 0
	KeyPanelFrame1 BYTE "บ  ฺฤฤฤฤฤฤยฤฤฤยฤฤฤฤยฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤยฤฤฤยฤฤฤฤยฤฤฤยฤฤฤฤยฤฤฤยฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฟ   บ", 0Dh, 0Ah, 0
	KeyPanelFrame2 BYTE "บ  ณ      ณ   ณ    ณ   ณ      ณ      ณ   ณ    ณ   ณ    ณ   ณ      ณ        ณ   บ", 0Dh, 0Ah, 0
	KeyPanelFrame3 BYTE "บ  ณ      ณ W ณ    ณ E ณ      ณ      ณ T ณ    ณ Y ณ    ณ U ณ      ณ        ณ   บ", 0Dh, 0Ah, 0
	KeyPanelFrame4 BYTE "บ  ณ      ภฤยฤู    ภฤยฤู      ณ      ภฤยฤู    ภฤยฤู    ภฤยฤู      ณ        ณ   บ", 0Dh, 0Ah, 0
	KeyPanelFrame5 BYTE "บ  ณ        ณ        ณ        ณ        ณ        ณ        ณ        ณ        ณ   บ", 0Dh, 0Ah, 0
	KeyPanelFrame6 BYTE "บ  ณ  [A]   ณ  [S]   ณ  [D]   ณ  [F]   ณ  [G]   ณ  [H]   ณ  [J]   ณ  [K]   ณ   บ", 0Dh, 0Ah, 0
	KeyPanelFrame7 BYTE "บ  ณ   C    ณ   D    ณ   E    ณ   F    ณ   G    ณ   A    ณ   B    ณ   C    ณ   บ", 0Dh, 0Ah, 0
	KeyPanelFrame8 BYTE "บ  ภฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤู   บ", 0Dh, 0Ah, 0
	KeyPanelFrame9 BYTE "บ                                                                              บ", 0Dh, 0Ah, 0
	KeyPanelFrame10 BYTE "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ", 0Dh, 0Ah, 0

	msgHz BYTE " Hz", 0
	msgBlank BYTE "         ", 0		; 9 spaces, clears the freq slot

	keyX_Table BYTE 5, 10, 14, 19, 23, 32, 37, 41, 46, 50, 55, 59, 68
	keyY_Table BYTE 17, 14, 17, 14, 17, 17, 14, 17, 14, 17, 14, 17, 17

	keyStr_0 BYTE " [A] ", 0
	keyStr_1 BYTE "ณ W ณ", 0
	keyStr_2 BYTE " [S] ", 0
	keyStr_3 BYTE "ณ E ณ", 0
	keyStr_4 BYTE " [D] ", 0
	keyStr_5 BYTE " [F] ", 0
	keyStr_6 BYTE "ณ T ณ", 0
	keyStr_7 BYTE " [G] ", 0
	keyStr_8 BYTE "ณ Y ณ", 0
	keyStr_9 BYTE " [H] ", 0
	keyStr_10 BYTE "ณ U ณ", 0
	keyStr_11 BYTE " [J] ", 0
	keyStr_12 BYTE " [K] ", 0

	KeyStr_Table DWORD OFFSET KeyStr_0, OFFSET KeyStr_1, OFFSET KeyStr_2, OFFSET KeyStr_3
                 DWORD OFFSET KeyStr_4, OFFSET KeyStr_5, OFFSET KeyStr_6, OFFSET KeyStr_7
                 DWORD OFFSET KeyStr_8, OFFSET KeyStr_9, OFFSET KeyStr_10, OFFSET KeyStr_11
                 DWORD OFFSET KeyStr_12

	strIdle BYTE "Idle   ", 0
	strRecording BYTE "Record ", 0
	strPlaying BYTE "Playing", 0
	strCountBlank BYTE "       ", 0

	controlY_Table BYTE 4, 5, 6, 7
	controlX_Table BYTE 60, 61, 61, 61

	controlStr_0 BYTE " [A-K] Play Notes", 0
	controlStr_1 BYTE " [+]/[-] Octave", 0
	controlStr_2 BYTE " [R] Record", 0
	controlStr_3 BYTE " [P] Playback", 0

	controlStr_Table DWORD OFFSET controlStr_0, OFFSET controlStr_1, OFFSET controlStr_2, OFFSET controlStr_3

.code
DrawTUI PROC
	call Clrscr

	; draw title header (cyan color)
	mov  eax, lightCyan + (black * 16)
	call SetTextColor

	mov  edx, OFFSET TitleFrame0
	call WriteString
	mov  edx, OFFSET TitleFrame1
	call WriteString
	mov  edx, OFFSET TitleFrame2
	call WriteString
    
	; draw info / contorl area (white)
    mov  eax, white + (black * 16)
	call SetTextColor

	mov  edx, OFFSET InfoPanel0
	call WriteString
	mov  edx, OFFSET InfoPanel1
	call WriteString
	mov  edx, OFFSET InfoPanel2
	call WriteString
	mov  edx, OFFSET InfoPanel3
	call WriteString
	mov  edx, OFFSET InfoPanel4
	call WriteString

	; draw status area (yellow)
	mov  eax, yellow + (black * 16)
	call SetTextColor

	mov  edx, OFFSET StatusSep
	call WriteString
	mov  edx, OFFSET StatusPanel0
	call WriteString
	mov  edx, OFFSET KeySep0
	call WriteString

	; draw piano keyboard (light green)
	mov  eax, lightGreen + (black * 16)
	call SetTextColor

	mov  edx, OFFSET KeyPanelFrame0
	call WriteString
	mov  edx, OFFSET KeyPanelFrame1
	call WriteString
	mov  edx, OFFSET KeyPanelFrame2
	call WriteString
	mov  edx, OFFSET KeyPanelFrame3
	call WriteString
	mov  edx, OFFSET KeyPanelFrame4
	call WriteString
	mov  edx, OFFSET KeyPanelFrame5
	call WriteString
	mov  edx, OFFSET KeyPanelFrame6
	call WriteString
	mov  edx, OFFSET KeyPanelFrame7
	call WriteString
	mov  edx, OFFSET KeyPanelFrame8
	call WriteString
	mov  edx, OFFSET KeyPanelFrame9
	call WriteString
	mov  edx, OFFSET KeyPanelFrame10
	call WriteString

	; reset color to default
	mov  eax, white + (black * 16)
	call SetTextColor

	INVOKE UpdateRecordedCount, 0
	INVOKE UpdateModeDisplay, 0

	ret
DrawTUI ENDP

UpdateOctaveDisplay PROC, activeOctave:DWORD
	; update active octave (x 19, y 9)
	mov dl, 19
	mov dh, 9
	call Gotoxy

	mov eax, yellow + (black * 16)
	call SetTextColor
	mov eax, activeOctave
	call WriteDec

	; reset color to default
	mov eax, white + (black * 16)
	call SetTextColor

	ret
UpdateOctaveDisplay ENDP

UpdateStatusPanel PROC, keyChar:BYTE, currentFreq:DWORD, activeOctave:DWORD
	; update active octave
	INVOKE UpdateOctaveDisplay, activeOctave

	mov eax, yellow + (black * 16)
	call SetTextColor

	; update active note (x 62, y 9)
	mov dl, 62
	mov dh, 9
	call Gotoxy

	mov al, keyChar
	call WriteChar
	
	; clear old frequency (x 66, y 9) so leftover digits do not stay
	mov dl, 66
	mov dh, 9
	call Gotoxy

	mov edx, OFFSET msgBlank
	call WriteString

	; update current frequency (x 66, y 9)
	mov dl, 66
	mov dh, 9
	call Gotoxy

	mov eax, currentFreq
	call WriteDec

	mov edx, OFFSET msgHz
	call WriteString

	; reset color to default
	mov eax, white + (black * 16)
	call SetTextColor

	ret
UpdateStatusPanel ENDP

HighlightKey PROC, keyIndex:DWORD
	push ebx
	push edx

	mov ebx, keyIndex
	cmp ebx, 12
	ja HighlightDone				; only highlight keys 0-12

	; get x and y coordinates for the key
	mov dl, keyX_Table[ebx]
	mov dh, keyY_Table[ebx]
	call Gotoxy

	; highlight yellow text black bg
	mov eax, yellow + (black * 16)
	call SetTextColor

	mov edx, KeyStr_Table[ebx*4]
	call WriteString

	mov eax, 200
	call Delay

	; reset to og color
	mov dl, keyX_Table[ebx]
	mov dh, keyY_Table[ebx]
	call Gotoxy

	mov eax, lightGreen + (black * 16)
	call SetTextColor

	mov edx, keyStr_Table[ebx*4]
	call WriteString

	; reset default text to white
	mov eax, white + (black * 16)
	call SetTextColor
HighlightDone:
	pop edx
	pop ebx
	ret
HighlightKey ENDP

UpdateRecordedCount PROC, noteCount:DWORD
	mov dl, 20
	mov dh, 3
	call Gotoxy

	mov eax, yellow + (black * 16)
	call SetTextColor

	mov edx, OFFSET strCountBlank
	call WriteString

	mov dl, 20
	mov dh, 3
	call Gotoxy

	mov eax, noteCount
	call WriteDec
	mov al, '/'
	call WriteChar
	mov eax, 100
	call WriteDec

	mov eax, white + (black * 16)
	call SetTextColor
	ret
UpdateRecordedCount ENDP

UpdateModeDisplay PROC, modeState:DWORD
	mov dl, 20
	mov dh, 4
	call Gotoxy

	cmp modeState, 1
	je ModeRec
	cmp modeState, 2
	je ModePlay

	; default idle
	mov eax, lightRed + (black * 16)
	call SetTextColor
	mov edx, OFFSET strIdle
	jmp DrawMode

ModeRec:
	mov eax, lightRed + (black * 16)
	call SetTextColor
	mov edx, OFFSET strRecording
	jmp DrawMode
ModePlay:
	mov eax, lightGreen + (black * 16)
	call SetTextColor
	mov edx, OFFSET strPlaying
DrawMode:
	call WriteString

	mov eax, white + (black * 16)
	call SetTextColor
	ret
UpdateModeDisplay ENDP

FlashControlLegend PROC, controlIndex:DWORD
	push ebx
	push edx

	mov ebx, controlIndex
	cmp ebx, 3
	ja FlashDone

	mov dl, controlX_Table[ebx]
	mov dh, controlY_Table[ebx]
	call Gotoxy

	mov eax, yellow + (black * 16)
	call SetTextColor
	mov edx, controlStr_Table[ebx*4]
	call WriteString

	mov eax, 50
	call Delay

	mov dl, controlX_Table[ebx]
	mov dh, controlY_Table[ebx]
	call Gotoxy

	mov eax, white + (black * 16)
	call SetTextColor
	mov edx, controlStr_Table[ebx*4]
	call WriteString

FlashDone:
	pop edx
	pop ebx
	ret
FlashControlLegend ENDP
END
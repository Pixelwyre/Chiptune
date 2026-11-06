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
END
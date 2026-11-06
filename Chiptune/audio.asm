INCLUDE Irvine32.inc
INCLUDE chiptune.inc

.data
	; base freqs for for A, W, S, E, D, F, T, G, Y, H, U, J, K in Hz
	FreqTable DWORD 261, 277, 294, 311, 330, 349, 370, 392, 415, 440, 466, 494, 523

	CurrentOctave DWORD 4	; default octave

.code
PlayNote PROC, keyIndex:DWORD, keyChar:BYTE
	push ebx

	; fetch base freq using the key index
	mov ebx, keyIndex
	mov eax, FreqTable[ebx*4]

	; shift freq by the octave (table is for octave 4)
	mov ecx, CurrentOctave
	sub ecx, 4
	jz ShiftDone				; octave 4, no shift
	js ShiftDown				; below 4

	shl eax, cl					; higher octave, multiply by 2 per octave
	jmp ShiftDone

ShiftDown:
	neg ecx
	shr eax, cl					; lower octave, divide by 2 per octave

ShiftDone:
	mov ebx, eax				; keep freq safe, eax gets overwritten

	; update status box visuals directly
	INVOKE UpdateStatusPanel, keyChar, ebx, CurrentOctave

	; play the note for 100 ms
	INVOKE Beep, ebx, 100

	; highlight the key in the TUI
	INVOKE HighlightKey, keyIndex

	pop ebx
	ret
PlayNote ENDP

ChangeOctave PROC, direction:SDWORD
	mov eax, CurrentOctave
	add eax, direction

	; keep octave between 2 and 7 (octave 1 goes under the 37 hz Beep limit)
	cmp eax, 2
	jl OctaveDone
	cmp eax, 7
	jg OctaveDone

	mov CurrentOctave, eax

OctaveDone:
	INVOKE UpdateOctaveDisplay, CurrentOctave
	ret
ChangeOctave ENDP
END
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
	mov ebx, eax				; keep freq safe, eax gets overwritten

	; update status box visuals directly
	INVOKE UpdateStatusPanel, keyChar, ebx, CurrentOctave

	; play the note for 100 ms
	INVOKE Beep, ebx, 100

	pop ebx
	ret
PlayNote ENDP
END
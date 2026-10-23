INCLUDE Irvine32.inc
INCLUDE chiptune.inc

.data
	; base freqs for for A, W, S, E, D, F, T, G, Y, H, U, J, K in Hz
	FreqTable DWORD 261, 277, 294, 311, 330, 349, 370, 392, 415, 440, 466, 494, 523

	CurrentOctave DWORD 4	; default octave

.code
PlayNote PROC, keyChar:BYTE
	; fetch base freq for visual display
	; defaults to c4 = 261 hz for now
	mov eax, FreqTable[0]

	; update status box visuals directly
	INVOKE UpdateStatusPanel, keyChar, eax, CurrentOctave

	ret
PlayNote ENDP
END
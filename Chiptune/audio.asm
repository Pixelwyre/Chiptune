INCLUDE Irvine32.inc
INCLUDE chiptune.inc

.data
	msgPrefix BYTE " key pressed!", 0Dh, 0Ah, 0

.code
PlayNote PROC, keyChar:BYTE
	; TODO: map keyChar to a Frequency Table and call win32 beep

	mov al, keyChar
	call WriteChar

	mov edx, OFFSET msgPrefix
	call WriteString

	ret
PlayNote ENDP
END
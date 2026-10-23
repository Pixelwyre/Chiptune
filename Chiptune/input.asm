INCLUDE Irvine32.inc
INCLUDE chiptune.inc

.data

.code
ProcessInput PROC
	call ReadKey
	jz NoKey						; if zero flag is set, no key was pressed
									; ASCII value of pressed key goes into AL register

	; TODO: Handle key logic here

	cmp al, 1Bh						; check ESC key
	je ExitProgram

	call WriteChar					; write the input character to the console

NoKey:
	ret


ExitProgram:
	exit


ProcessInput ENDP

END
INCLUDE Irvine32.inc
INCLUDE chiptune.inc

.data

.code
main PROC
	call DrawTUI

MainLoop:
	call ProcessInput

	mov eax, 10
	call Delay

	jmp MainLoop

	exit
main ENDP
END main
INCLUDE Irvine32.inc
INCLUDE chiptune.inc

.data
	ValidKeys BYTE 'A', 'W', 'S', 'E', 'D', 'F', 'T', 'G', 'Y', 'H', 'U', 'J', 'K', '+', '-', 'R', 'P'
	KeyCount DWORD ($ - ValidKeys)			; calculates total elements

.code
ProcessInput PROC
	call ReadKey
	jz NoKey

	; check ESC key
	cmp al, 1Bh
	je ExitProgram

	; lowercase to uppercase
	cmp al, 'a'
	jb ScanLoop
	cmp al, 'z'
	ja ScanLoop
	sub al, 32

ScanLoop:
	mov ecx, KeyCount
	mov esi, 0

CheckNextKey:
	cmp al, ValidKeys[esi]
	je KeyMatch
	inc esi
	loop CheckNextKey

	jmp NoKey

KeyMatch:
	cmp esi, 12					; only notes (0-12) play for now
	ja NoKey

	INVOKE PlayNote, esi, al

NoKey:
	ret

ExitProgram:
	exit
ProcessInput ENDP
END
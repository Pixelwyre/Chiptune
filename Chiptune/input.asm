INCLUDE Irvine32.inc
INCLUDE chiptune.inc

.data
	ValidKeys BYTE 'A', 'W', 'S', 'E', 'D', 'F', 'T', 'G', 'Y', 'H', 'U', 'J', 'K', '+', '=', '-', 'R', 'P'
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
	cmp esi, 12					; 0-12 are notes, the rest are controls
	ja HandleControl

	INVOKE PlayNote, esi, al
	jmp NoKey

HandleControl:
	cmp al, '+'
	je OctaveUp
	cmp al, '='					; same key as + without shift
	je OctaveUp
	cmp al, '-'
	je OctaveDown

	jmp NoKey					; R and P come later

OctaveUp:
	INVOKE ChangeOctave, 1
	jmp NoKey

OctaveDown:
	INVOKE ChangeOctave, -1

NoKey:
	ret

ExitProgram:
	; move cursor below the ui so exit text does not print inside it
	mov dl, 0
	mov dh, 22
	call Gotoxy
	exit
ProcessInput ENDP
END
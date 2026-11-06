INCLUDE Irvine32.inc
INCLUDE chiptune.inc

.data
	MAX_NOTES EQU 100
	TRACK_SIZE EQU 16
	NoteBuffer DWORD MAX_NOTES DUP(0)
	NoteCount DWORD 0
	IsRecording DWORD 0
	BaseDuration DWORD 100

	PresetTracks DWORD 261, 261, 392, 392, 440, 440, 392, 0
				 DWORD 349, 349, 330, 330, 294, 294, 261, 0
				 DWORD 330, 330, 330, 0, 330, 330, 330, 0
				 DWORD 330, 392, 261, 294, 330, 0, 0, 0

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

	; record the shifted frequency when recording is active
	INVOKE RecordNote, ebx

	; play the note for the current tempo duration
	INVOKE Beep, ebx, BaseDuration

	; highlight the key in the TUI
	INVOKE HighlightKey, keyIndex

	pop ebx
	ret
PlayNote ENDP

RecordNote PROC, freq:DWORD
	push edi
	push ecx

	cmp IsRecording, 1
	jne SkipRecord

	mov ecx, NoteCount
	cmp ecx, MAX_NOTES
	jae SkipRecord

	mov edi, OFFSET NoteBuffer
	mov eax, freq
	mov [edi + ecx*4], eax

	inc NoteCount
	INVOKE UpdateRecordedCount, NoteCount

SkipRecord:
	pop ecx
	pop edi
	ret
RecordNote ENDP

SetRecordState PROC, newState:DWORD
	mov eax, newState
	mov IsRecording, eax
	ret
SetRecordState ENDP

GetRecordState PROC
	mov eax, IsRecording
	ret
GetRecordState ENDP

GetNoteCount PROC
	mov eax, NoteCount
	ret
GetNoteCount ENDP

PlaySequence PROC
	pushad

	mov ecx, NoteCount
	test ecx, ecx
	jz PlayDone

	INVOKE UpdateModeDisplay, 2
	mov esi, 0

PlayLoop:
	push ecx
	mov ebx, NoteBuffer[esi*4]
	cmp ebx, 0
	je PlayRest

	INVOKE UpdateStatusPanel, 'P', ebx, CurrentOctave
	INVOKE Beep, ebx, BaseDuration

	mov eax, BaseDuration
	shr eax, 1
	call Delay
	jmp PlayNext

PlayRest:
	mov eax, BaseDuration
	call Delay

PlayNext:
	inc esi
	pop ecx
	loop PlayLoop

PlayDone:
	mov eax, IsRecording
	INVOKE UpdateModeDisplay, eax
	popad
	ret
PlaySequence ENDP

ResetBuffer PROC
	pushad

	cld
	mov edi, OFFSET NoteBuffer
	mov ecx, MAX_NOTES * 4
	mov al, 0
	rep stosb

	mov NoteCount, 0
	INVOKE UpdateRecordedCount, NoteCount

	popad
	ret
ResetBuffer ENDP

AdjustTempo PROC, direction:SDWORD
	push ebx

	mov eax, BaseDuration
	cmp direction, 1
	je TempoSpeedUp

	mov ebx, 5
	mul ebx
	mov ebx, 4
	div ebx
	cmp eax, 400
	jbe SaveTempo
	mov eax, 400
	jmp SaveTempo

TempoSpeedUp:
	mov ebx, 4
	mul ebx
	mov ebx, 5
	div ebx
	cmp eax, 25
	jae SaveTempo
	mov eax, 25

SaveTempo:
	mov BaseDuration, eax
	INVOKE UpdateTempoDisplay, BaseDuration
	pop ebx
	ret
AdjustTempo ENDP

GetTempo PROC
	mov eax, BaseDuration
	ret
GetTempo ENDP

LoadPresetTrack PROC, trackIndex:DWORD
	pushad

	cmp trackIndex, 1
	ja PresetDone

	INVOKE ResetBuffer

	mov eax, trackIndex
	mov ebx, TRACK_SIZE * 4
	mul ebx
	mov esi, OFFSET PresetTracks
	add esi, eax

	mov edi, OFFSET NoteBuffer
	mov ecx, TRACK_SIZE
CopyPresetLoop:
	mov eax, [esi]
	mov [edi], eax
	add esi, 4
	add edi, 4
	loop CopyPresetLoop

	mov NoteCount, TRACK_SIZE
	INVOKE UpdateRecordedCount, NoteCount

PresetDone:
	popad
	ret
LoadPresetTrack ENDP

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
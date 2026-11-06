# Chiptune Synthesizer & Sequencer

A simple console based 8-bit musical instrument and melody recorder written in x86 Assembly (MASM) using the Irvine32 library for our COAL course. You play notes in real time using your keyboard, change octaves on the fly, and record or play back short tunes.

## Feature Checklist

- [x] Non-blocking keyboard input loop using ReadKey
- [x] Idle and active keypress handling using the CPU Zero Flag (ZF)
- [x] Key routing jump chain (CMP and JE) to handle notes and controls
- [x] Base frequency lookup array for piano keys (A to K)
- [x] Dynamic array indexing (MOV EAX, FreqTable[EBX*4])
- [x] Win32 Beep API integration for real-time sound output
- [x] Octave shifting using bitwise SHL and SHR instructions
- [x] Tempo adjustment using MUL and DIV
- [x] Static console interface layout drawn with WriteString
- [x] Target coordinates update with Gotoxy to prevent screen flicker
- [x] Visual keypress feedback using SetTextColor
- [x] Telemetry display for current octave, mode, and frequency
- [x] Recording notes into a memory buffer using indirect addressing
- [x] Sequence playback engine using ECX, LOOP, and call Delay
- [x] Buffer memory wiping using string instructions (CLD and REP STOSB)
- [x] Loading and playing pre-set tracks from a 2D array

## Group Members (BCS-3A)
- Muhammad Shayan Asim (25K-0557)
- Muhammad Sameer Adnan (25K-0600)
- Muhammad Rohail Arsalan (25K-0804)
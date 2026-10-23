# Chiptune Synthesizer & Sequencer

A simple console based 8-bit musical instrument and melody recorder written in x86 Assembly (MASM) using the Irvine32 library for our COAL course. You play notes in real time using your keyboard, change octaves on the fly, and record or play back short tunes.

## Feature Checklist

- [ ] Non-blocking keyboard input loop using ReadKey
- [ ] Idle and active keypress handling using the CPU Zero Flag (ZF)
- [ ] Key routing jump chain (CMP and JE) to handle notes and controls
- [ ] Base frequency lookup array for piano keys (A to K)
- [ ] Dynamic array indexing (MOV EAX, FreqTable[EBX*4])
- [ ] Win32 Beep API integration for real-time sound output
- [ ] Octave shifting using bitwise SHL and SHR instructions
- [ ] Tempo adjustment using MUL and DIV
- [ ] Static console interface layout drawn with WriteString
- [ ] Target coordinates update with Gotoxy to prevent screen flicker
- [ ] Visual keypress feedback using SetTextColor
- [ ] Telemetry display for current octave, mode, and frequency
- [ ] Recording notes into a memory buffer using indirect addressing
- [ ] Sequence playback engine using ECX, LOOP, and call Delay
- [ ] Buffer memory wiping using string instructions (CLD and REP STOSB)
- [ ] Loading and playing pre-set tracks from a 2D array

## Group Members (BCS-3A)
- Muhammad Shayan Asim (25K-0557)
- Muhammad Sameer Adnan (25K-0600)
- Muhammad Rohail Arsalan (25K-0804)
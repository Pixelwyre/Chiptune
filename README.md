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

## Controls & Keybindings

| Key | Action | Description |
| :---: | :--- | :--- |
| **`A` - `K`** | Play Notes | Play musical notes across the piano keyboard |
| **`+`** / **`=`** | Octave Up | Shift pitch up by one octave (doubles frequency) |
| **`-`** | Octave Down | Shift pitch down by one octave (halves frequency) |
| **`R`** | Toggle Record | Start / Stop recording played notes into memory |
| **`P`** | Playback | Play the recorded melody sequence from the buffer |
| **`C`** | Clear Buffer | Reset recorded notes buffer to zero |
| **`[`** | Slow Tempo | Increase note duration (slower playback) |
| **`]`** | Fast Tempo | Decrease note duration (faster playback) |
| **`1`** | Preset 1 | Load *Twinkle Twinkle Little Star* into buffer |
| **`2`** | Preset 2 | Load *Jingle Bells* into buffer |
| **`Esc`** | Exit | Exit the program cleanly |

## Project Structure

* **`main.asm`** — Program entry point; initializes the UI and maintains the non-blocking input loop.
* **`input.asm`** — Handles keyboard polling via `ReadKey`, case conversion, and routes keys to audio/TUI.
* **`audio.asm`** — Core audio engine: frequency table, octave bit-shifting, recording buffer, and Win32 `Beep`.
* **`tui.asm`** — Flicker-free ASCII terminal interface with targeted coordinate updates using `Gotoxy`.
* **`chiptune.inc`** — Shared procedure prototypes (`PROTO`) for inter-module linking.

## How to Build & Run

1. Open `Chiptune.slnx` or `Chiptune/Chiptune.vcxproj` in **Visual Studio**.
2. Ensure the project build configuration is set to **Debug | x86 (Win32)**.
3. Ensure the **Irvine32** library is installed at `C:\Irvine`.
4. Press **`Ctrl + F5`** to build and launch without debugging.

## Group Members (BCS-3A)
- Muhammad Shayan Asim (25K-0557)
- Muhammad Sameer Adnan (25K-0600)
- Muhammad Rohail Arsalan (25K-0804)

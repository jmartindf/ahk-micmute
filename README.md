# ahk-micmute (jmartindf fork)
AutoHotkey script for muting and unmuting microphone with mouse buttons.

fredemmott deprecated this project, in favor of [MicMuteToggle](https://github.com/fredemmott/MicMuteToggle). While ahk-micmute is more flexible, it is incompatible with some programs; for example, Black Ops 4 will immediately exit if AutoHotKey is running.

## Installation

1. Install [AutoHotkey]
1. Install `VA.ahk` from [VistaAudio] into an AHK library directory, such as `%USERPROFILE%\Documents\AutoHotkey\Lib`
1. Either clone this repository, or copy all the files into the same directory
1. Run mic-toggle.ahk

## Usage

1. Hit `Right-Control` (The "Control" button to the right of the space bar) to toggle mute while the button is held
1. Double tap the `Pause` button (located between the "ScrLk" and "NumLk" keys on my keyboard) to toggle mute
1. Configure your software (games, discord, skype etc) to use 'open mic'

This effectively means that Pause switches you between 'push to talk' and 'push to mute', and Right-Control is the PTT/PTM button. It toggles system-wide mute, effectively getting you system-wide PTT/PTM when everything is set to open mic.

## Customization

- You can change the buttons to any button that AutoHotkey supports - see their [keylist]
- When in PTT 'mode', by default, the script will leave the mic open for a fraction of a second after releasing the button, as people usually release it just a little early. You can tune or remove this by finding the 'sleep' line in the script and removing it, or changing the number. The number is the number of milliseconds to leave it live.

## License

This script is [MIT-licensed](LICENSE).

[AutoHotkey]: https://github.com/Lexikos/AutoHotkey_L
[VistaAudio]: https://github.com/ahkscript/vistaaudio
[keylist]: https://autohotkey.com/docs/KeyList.htm

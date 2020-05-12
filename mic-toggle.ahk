#SingleInstance force
; Copyright (c) 2018-present, Frederick Emmott
; All Rights Reserved.
;
; This source code is licensed under the MIT license found in the
; LICENSE file in the root directory of this source tree

; Also using code from
; https://github.com/YoYo-Pete/AutoHotKeys/PushToTalk.ahk
;
; Mute icon made by Kiranshastry from www.flaticon.com
; Unmute icon is an edited version of the mute icon
; 
; Use VA instead of SoundSet/SoundGet because of being able to set these on the default capture device
#include <VA>

#SingleInstance, force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#persistent

BoundToggle := Func("ToggleMute")

Menu, Tray, NoStandard
Menu, Tray, Add, M&ute Mic, % BoundToggle
Menu, Tray, Standard
Menu, Tray, Default, M&ute Mic
Menu, Tray, Click, 1

OnExit, ExitSub
MuteOn()
Return

MuteOn()
{
	VA_SetMasterMute(1, "capture")
	ToggleIcon()
}

MuteOff()
{
	VA_SetMasterMute(0, "capture")
	ToggleIcon()
}

PlayEffect()
{
	Muted := VA_GetMasterMute("capture")
	if (Muted) {
		SoundPlay, mute.wav
	} else {
		SoundPlay, unmute.wav
	}
}

ToggleIcon()
{
	Muted := VA_GetMasterMute("capture")
	if (Muted) {
		;Menu, Tray, Icon, imageres.dll, 233, 1
		Menu, Tray, Icon, mute.ico
		Menu, Tray, Tip, Mic Muted
	} else {
		;Menu, Tray, Icon, imageres.dll, 228, 1
		Menu, Tray, Icon, microphone.ico
		Menu, Tray, Tip, Mic Active
	}
}

ToggleMute()
{
	Muted := VA_GetMasterMute("capture")
	VA_SetMasterMute(!Muted, "capture")
	ToggleIcon()	
}

; Right-Control
; This toggles mute while the button is being held
RControl::
ToggleMute()
;Muted := VA_GetMasterMute("capture")
;VA_SetMasterMute(!Muted, "capture")
;ToggleIcon()
KeyWait, RControl
if (Muted) {
	; Keep PTT on for slightly longer
	Sleep, 250
}
ToggleMute()
;VA_SetMasterMute(Muted, "capture")
;ToggleIcon()
return

; Pause (was Right-Control)
; This toggles the mute button key between Push-To-Talk and Push-To-Mute
;~RControl::
~Pause::
if (A_PriorHotkey <> "~Pause" or A_TimeSincePriorHotkey > 400)
{
    ; Too much time between presses, so this isn't a double-press.
    KeyWait, Pause
    return
}
ToggleMute()
Muted := !WasMuted
return

ExitSub:
    MuteOff()
    ExitApp

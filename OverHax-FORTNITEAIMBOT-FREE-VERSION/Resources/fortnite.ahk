#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#MaxThreadsPerHotkey 2
activateddrop := 0
activatedthrottle := 0
activatedlag := 0
activateddupe := 0
failsafe := 0
failsafethrottle := 0
throttlearmor := 0
prankmode := 0
dropmode := 0
;bunch of unused variables leftover

Gui, Add, Button, default gClumsyReset, Reset clumsy
Gui, Add, Text,,   Throttle Bind:
Gui, Add, Hotkey, vThrottleBind, f
Gui, Add, Text,, Drop Bind:
Gui, Add, Hotkey, vDropBind, g
Gui, Add, Text,, Payload Mode key:
Gui, Add, Hotkey, vPayloadBind, h
Gui, Add, Button, default gApplyKeybinds, Apply Keybinds
Gui, Show, w265 h250, Script by datae
return

ClumsyReset:
	ControlSetText, Edit1, (outbound or inbound) and udp, ahk_exe clumsy.exe
	ControlSetText, Edit4, 300, ahk_exe clumsy.exe
	ControlSetText, Edit3, 100.0, ahk_exe clumsy.exe
	ControlSetText, Edit5, 100.0, ahk_exe clumsy.exe
	Control UnCheck,, Button11, ahk_exe clumsy.exe
	Control UnCheck,, Button8, ahk_exe clumsy.exe
return

ApplyKeybinds:
Gui, Submit, NoHide
Hotkey *%DropBind%, DropBind
Hotkey *%ThrottleBind%, ThrottleBind
Hotkey *%PayloadBind%, PayloadBind
return





DropBind: ;change this to any key to modify the bind for packet drop
	start:=A_TickCount
	SetTimer, check, 9500
	IfEqual, activateddrop, 0
	{
		SoundPlay, %A_WorkingDir%\on.wav
		Control Check,, Button7, ahk_exe clumsy.exe
		activateddrop := 1
		return
	}
	else
	{
		Control UnCheck,, Button7, ahk_exe clumsy.exe
		activateddrop := 0
		
		IfEqual, failsafe, 0
		{
			SoundPlay, %A_WorkingDir%\off.wav
			activateddrop := 0
			SetTimer, check, OFF
			SetTimer, dropfailsafe, OFF
		}
		else
		{
			SoundPlay, %A_WorkingDir%\off10.wav
			activateddrop := 0
			SetTimer, check, OFF
			SetTimer, dropfailsafe, OFF
			failsafe := 0
		}
	}
return



check: ;disconnection failsafe
IfEqual, activateddrop, 1
{
		SetTimer, check, OFF
		SoundPlay, %A_WorkingDir%\warning.wav
		SetTimer, dropfailsafe, 10000
		failsafe := 1
}
return

dropfailsafe:
IfEqual, activateddrop, 1
{
		Control UnCheck,, Button7, ahk_exe clumsy.exe
		SoundPlay, %A_WorkingDir%\failsafe.wav
		SetTimer, dropfailsafe, OFF
		activateddrop := 0
		failsafe := 0
}
return



PayloadBind:
IfEqual, prankmode, 0
{
	SetTimer, check, OFF
	SetTimer, dropfailsafe, off
	ControlClick, Button2, ahk_exe clumsy.exe
	SoundPlay, %A_WorkingDir%\uioff.wav
	ControlSetText, Edit1, (outbound or inbound) and (udp.PayloadLength > 129), ahk_exe clumsy.exe
	ControlClick, Button2, ahk_exe clumsy.exe
	prankmode := 1
}
else
{
	IfEqual, prankmode, 1
	{
	IfEqual, activateddrop, 1
	{
		SetTimer, check, 9500
	}
	ControlClick, Button2, ahk_exe clumsy.exe
	SoundPlay, %A_WorkingDir%\maxspeed.wav
	ControlSetText, Edit1, (outbound or inbound) and udp, ahk_exe clumsy.exe
	ControlClick, Button2, ahk_exe clumsy.exe
	prankmode := 0
	}
}
return






ThrottleBind:
	IfEqual, activatedthrottle, 0
	{
		SoundPlay, %A_WorkingDir%\buttonclick.wav
		Control Check,, Button10, ahk_exe clumsy.exe
		activatedthrottle := 1
		return
	}
	else
	{
		SoundPlay, %A_WorkingDir%\buttonunclick.wav
		Control UnCheck,, Button10, ahk_exe clumsy.exe
		activatedthrottle := 0
	}
return

*6:: ;change this to any key to modify the bind for packet throttling
	ControlClick, Button4, ahk_exe clumsy.exe
	IfEqual, activatedlag, 0
	{
		SoundPlay, %A_WorkingDir%\buttonclick.wav
		activatedlag := 1
		return
	}
	else
	{
		SoundPlay, %A_WorkingDir%\buttonunclick.wav
		activatedlag := 0
	}
return



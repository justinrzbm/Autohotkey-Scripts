#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force

flag_firstIter = 1
Loop {
	Loop {
		WinWait, ahk_class ZPContentViewWndClass
		if flag_firstIter
			Gosub, VolumeDown
		WinWaitClose, ahk_class ZPContentViewWndClass
		; So zoom doesn't close when switching from minimized to full screen window
		Sleep 300
		
		if not WinExist("ahk_class ZPContentViewWndClass")
			break
		; flag stops VolumeDown running every min/maximize
		flag_firstIter = 0
	}
	Process, Close, zoom.exe
	Gosub, VolumeUp
	if ErrorLevel
		MsgBox, , , Closed that shit successfully, 0.75
	else
		MsgBox, , , Failed to close that piece of shit app, 0.75
}

VolumeDown:
	Send, !]
	Sleep, 100
	Soundset, 45
	Send, ![
	Sleep, 100
	Soundset, 15
	return
	
VolumeUp:
	Send, !]
	Sleep, 100
	Soundset, 80
	Send, ![
	Sleep, 100
	Soundset, 30
	return
﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force

Loop {
	Loop {
		WinWait, ahk_class ZPContentViewWndClass
		WinWaitClose, ahk_class ZPContentViewWndClass
		; So zoom doesn't close when switching from minimized to full screen window
		Sleep 300
		
		if not WinExist("ahk_class ZPContentViewWndClass")
			break
	}
	Process, Close, zoom.exe
	if ErrorLevel
		MsgBox, , , Closed that shit successfully, 0.75
	else
		MsgBox, , , Failed to close that piece of shit app, 0.75
}
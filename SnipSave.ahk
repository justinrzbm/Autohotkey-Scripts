#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance Force
CoordMode, Mouse, Screen
title = Snip & Sketch

#+d::
	MouseMove, A_ScreenWidth-150, A_ScreenHeight-150
	Sleep 100
	Click
	WinWait, %title%, , 2
	if ErrorLevel
		return
	Sleep 100
	Loop{
		Send, ^s
		WinWait, Save As, , 0.1
		if !ErrorLevel
			break
	}
	Sleep 100
	Loop {
		ControlSend, , {Enter}, Save As
		WinWaitClose, Save As, , 0.1
		if !ErrorLevel
			break
	}
	Sleep 200
	WinClose, %title%
	Sleep 500
	; if WinExist, %title% ; do something
	return
	
; Esc:: ExitApp
; k::KeyHistory

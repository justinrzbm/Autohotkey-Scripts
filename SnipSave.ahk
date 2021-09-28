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
		ControlSend,,ls, %title%
		WinWait, Save As, , 0.5
		if !ErrorLevel
			break
		;MsgBox %ErrorLevel%
	}
	Sleep 200
	ControlSend, , {Enter}, Save As
	WinWaitClose, Save As
	Sleep 200
	WinClose, %title%
	return
	
Esc:: ExitApp
k::KeyHistory
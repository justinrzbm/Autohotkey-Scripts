#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance Force
CoordMode, Mouse, Screen

#+d::
	MouseMove, A_ScreenWidth-150, A_ScreenHeight-100
	Sleep 100
	Click
	WinWait, Snip & Sketch, , 2
	if ErrorLevel
		return
	Sleep 100
	Send, ^s
	WinWait, Save As
	Sleep 200
	Send, {Enter}
	Sleep 200
	WinClose, Snip & Sketch
	return
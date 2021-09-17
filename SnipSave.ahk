#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance Force
CoordMode, Mouse, Screen

#+D::
	Click, 2391, 1289
	WinWait, Snip & Sketch
	Sleep 100
	Send, ^s
	WinWait, Save As
	Sleep 100
	Send, {Enter}
	Sleep 200
	WinClose, Snip & Sketch
	return


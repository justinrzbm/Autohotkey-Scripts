#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force

Loop {
	WinWait, ahk_class ZPContentViewWndClass
	WinWaitClose, ahk_class ZPContentViewWndClass
	Process, Close, zoom.exe
	if ErrorLevel
		MsgBox, , , Closed that shit successfully, 1
	else
		MsgBox, , , Failed to close that piece of shit app, 1
}
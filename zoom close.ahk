﻿; Combination script that changes volume when running zoom and kills the process after.
; The device number for the last argument in the SoundSet command can be found with
; the a script by the authors of AHK (sound_devices.ahk) in this directory
; The volume set numbers are my personal preference


#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance Force
DetectHiddenWindows Off

flag_firstIter = 1
Loop {
	Loop {
		WinWait, ahk_class ZPContentViewWndClass
		WinWaitClose, ahk_class ZPContentViewWndClass
		; So zoom doesn't close when switching from minimized to full screen window
		; Also from pop-up windows like waiting to join etc
		Sleep 1000
		
		if not WinExist("ahk_class ZPContentViewWndClass")
			break
	}
	MsgBox, 1, Zoom Close Script, Meeting window closed. Close the program?
	IfMsgBox, OK
	{
	Process, Close, zoom.exe
	}
}

;class of main meeting window
;ahk_class ZPContentViewWndClass
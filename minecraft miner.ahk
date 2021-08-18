#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Minetime = 200000
Strafeblocks = 7
inventory_count = 0
pick_break_time = 120000

pickswitch:
	inventory_count += 1
	SEND, %inventory_count%
	if (inventory_count = 6)
		inventory_count = 0
^`::
	SetTimer, pickswitch, %pick_break_time%
	Loop{
		SEND, {w Down}{LButton Down}
		Sleep, Minetime
		SEND, {w Up}{LButton Up}{s Down}
		Sleep, Minetime/7
		SEND, {s Up}8
		Sleep, 1000
		Click, right
		Sleep, 1000
		SEND, %inventory_count%{a Down}
		Sleep, Strafeblocks*0.1975*1000
		SEND, {a Up}
	}
	Return
^~::
	SEND, {w Down}{LButton Down}
	KeyWait, LButton
	SEND, {w Up}{LButton Up}
	Return
Space::
	SEND, {w Up}{s Up}{LButton Up}{a Up}
	Pause
	Return
^Space::
	SEND, {w Down}{LButton Down}
	Pause
	Return
Esc::
	SEND, {w Up}{s Up}{LButton Up}{a Up}
	ExitApp
	Return
; for testing distance
m::
	SEND, {a Down}
	Sleep, Strafeblocks*0.1975*1000
	SEND, {a Up}
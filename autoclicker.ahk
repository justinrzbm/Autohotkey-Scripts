#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force

InputBox, key, Autoclicker, Type key to press,`n`` to end`, \ to pause,,,,,,,{LButton}
InputBox, delay, Autoclicker, Type delay (in ms)`n`` to end`, \ to pause,,,,,,,,30

while True
	{
	InputBox, toggle_bool, Autoclicker, Hold mode (hold MButton to trigger)? (Y/N),,,,,,,,Y
	StringLower, toggle_bool, toggle_bool
	if toggle_bool not in y,n
		{
		MsgBox,,,Wrong input., 1
		}
	else
		Break
	}
	
if ErrorLevel ; if Cancel was pressed
	ExitApp
	
if toggle_bool=n
	{
	Loop
		{
		Send, %key%
		Sleep, %delay%
		}
	}

MButton::
	While GetKeyState("MButton","P") ; P checks for you to physically hold it
		{
		Send, %key%
		Sleep, %delay%
		}
	return
	
	
^MButton::
	InputBox, key, Autoclicker, Type key to press,`n` to end`, \ to pause,,,,,,,{LButton}
	InputBox, delay, Autoclicker, Type delay (in ms)`n` to end`, \ to pause,,,,,,,,30

\::Pause

`::
	ExitApp
	Return

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force

InputBox, wait_min, How many minutes to wait before shutdown?
if ErrorLevel ; if Cancel was pressed
	ExitApp

Gui, -Caption
Gui, Color, 000000
Gui, Font, s170 c333333, Verdana
Gui, Show, Maximize, Shutoff timer (Esc to cancel)
Gui, Add, Text, Center vTextControl, Minutes`nremaining:
Gui, Add, Text, Center vMinControl, %wait_min%...


While wait_min {
	GuiControl,, MinControl, %wait_min%...

	wait_min -= 1
	Sleep 60000
}

GuiControl,, MyText, Goodnight...
Sleep 15000

Shutdown, 1



ButtonCancel:
	ExitApp
GuiClose:
	ExitApp
Esc::
	ExitApp
	

;turns off monitors
;o::
;	SendMessage,0x112,0xF170,2,,Program Manager
;	Return

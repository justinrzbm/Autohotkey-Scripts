#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

InputBox, wait_min, How many minutes to wait before shutdown?
Gui, -Caption
Gui, Color, 000000
Gui, Font, s170 w100 c333333, Verdana
; Gui, Margin, 700, 600
Gui, Show, Maximize, Shutoff timer (Esc to cancel)
Gui, Add, Text, vMyText x200 y150, Minutes`nremaining:`n`n               %wait_min%...

;Gui, New, -Caption

While wait_min {
GuiControl,, MyText, Minutes`nremaining:`n`n               %wait_min%...
; if (wait_min = 30) {
; SendMessage,0x112,0xF170,2,,Program Manager
; }
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
	
;turns off monitors
;o::
;	SendMessage,0x112,0xF170,2,,Program Manager
;	Return
Esc::
	ExitApp
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.

#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force


; GUI input for minutes to wait
wait_min := 60
Gui, 1:New
Gui, 1:Font, s24, Verdana
Gui, 1:Add, Text, x20 y20 w320 h40 Center, minutes to wait
Gui, 1:Add, Edit, x20 y70 w320 h50 vWaitEdit Center Number, %wait_min%
Gui, 1:Add, UpDown, Range1-9990 vWaitUpDown, %wait_min%
Gui, 1:Font, s20, Verdana

; Arrange buttons in a 2x2 grid, centered
btnW := 140
btnH := 60
padX := 20
padY := 20
col1 := 40
col2 := col1 + btnW + padX
row1 := 140
row2 := row1 + btnH + padY
Gui, 1:Add, Button, x%col1% y%row1% w%btnW% h%btnH% gMinus15, -15 min
Gui, 1:Add, Button, x%col2% y%row1% w%btnW% h%btnH% gPlus15, +15 min
Gui, 1:Add, Button, x%col1% y%row2% w%btnW% h%btnH% gInputOK Default, OK
Gui, 1:Add, Button, x%col2% y%row2% w%btnW% h%btnH% gInputCancel, Cancel
Gui, 1:Show, w360 h300, Set Shutdown Timer

InputBoxLoop:
Gui, 1:Submit, NoHide
return

Minus15:
Gui, 1:Submit, NoHide
wait_min := WaitEdit - 15
if (wait_min < 1)
	wait_min := 1
GuiControl, 1:, WaitEdit, %wait_min%
return

Plus15:
Gui, 1:Submit, NoHide
wait_min := WaitEdit + 15
GuiControl, 1:, WaitEdit, %wait_min%
return

InputOK:
Gui, 1:Submit
if (WaitEdit = "" or WaitEdit < 1)
	wait_min := 60
else
	wait_min := WaitEdit
Gui, 1:Destroy
goto StartTimer



; timer gui and timer loop
StartTimer:

total_seconds := wait_min * 60

Gui, -Caption +E0x02000000 ; E0x02000000 is WS_EX_COMPOSITED for double buffering
Gui, Color, 000000
Gui, Font, s170 c1F1F1F, Verdana
SysGet, MonitorWorkArea, MonitorWorkArea, 1
width := MonitorWorkAreaRight - MonitorWorkAreaLeft
height := MonitorWorkAreaBottom - MonitorWorkAreaTop
Gui, Show, x0 y0 w%width% h%height%, Shutoff timer (Esc to cancel)
Gui, Add, Text, Center vMinControl, % FormatTime(total_seconds)


; Taskbar overlay: dark, transparent, click-through 
SysGet, Mon, Monitor, 1
taskbar_y := MonitorWorkAreaBottom
taskbar_x := MonLeft
taskbar_w := MonRight - MonLeft
taskbar_h := MonBottom - MonitorWorkAreaBottom
if (taskbar_h > 0) {
	Gui, 99: -Caption +E0x20 +LastFound +ToolWindow +AlwaysOnTop
	Gui, 99:Color, 000000
	WinSet, Transparent, 210
	; Gui, 99:Show, Maximize
	Gui, 99:Show, x%taskbar_x% y%taskbar_y% w%taskbar_w% h%taskbar_h%
}


; doesn't work for unknown reasons
; Gui, Add, Button, x%A_ScreenWidth%-40 y5 w30 h20 gGuiClose, X

SysGet, MonitorCount, MonitorCount
if (MonitorCount > 1) {
	SysGet, Monitor2, Monitor, 2
	Gui, 2:-Caption +E0x02000000 ; E0x02000000 is WS_EX_COMPOSITED for double buffering
	Gui, 2:Color, 000000
	width := Monitor2Right - Monitor2Left
	height := Monitor2Bottom - Monitor2Top
	Gui, 2:Show, x%Monitor2Left% y%Monitor2Top% w%width% h%height%
}

While total_seconds > 0 {
	GuiControl,, MinControl, % FormatTime(total_seconds)
	
	total_seconds -= 1
	Sleep 1000
}

GuiControl,, MyText, Goodnight...
Sleep 15000

Shutdown, 1



InputCancel:
ExitApp
return

GuiClose:
ExitApp
return

ButtonCancel:
ExitApp
return

Esc::
	ExitApp


; hold middle mouse button for 2 seconds to exit
MButton::
st := A_TickCount
Loop
	{
		if (A_TickCount - st > 2000)
			ExitApp
		if !GetKeyState("MButton", "P")
			break
		Sleep 100
	}
	Send {MButton}
	return



FormatTime(seconds) {
	minutes := Floor(seconds / 60)
	remaining_seconds := Mod(seconds, 60)
	return Format("{:02}:{:02}", minutes, remaining_seconds)
}
	

;turns off monitors
;o::
;	SendMessage,0x112,0xF170,2,,Program Manager
;	Return

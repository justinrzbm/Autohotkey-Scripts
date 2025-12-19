
#SingleInstance Force
#Persistent
SetTitleMatchMode, 2
SetBatchLines, -1  ; To speed up the script
SetTimer, RefreshGUI, 50  ; Refresh every 50 ms

; Create GUI window to display inputs
Gui, Add, Text,, Key Presses:
Gui, Add, Edit, w500 h800 vInputDisplay ReadOnly
Gui, Show, , Key and Mouse Input Display

; Initialize an empty variable to hold the input log
inputLog := ""

; Define hotkeys to track keyboard and mouse inputs
~*a::
~*b::
~*c::
~*d::
~*e::
~*f::
~*g::
~*h::
~*i::
~*j::
~*k::
~*l::
~*m::
~*n::
~*o::
~*p::
~*q::
~*r::
~*s::
~*t::
~*u::
~*v::
~*w::
~*x::
~*y::
~*z::
~*0::
~*1::
~*2::
~*3::
~*4::
~*5::
~*6::
~*7::
~*8::
~*9::
~*Space::
~*Enter::
~*LShift::
~*RShift::
~*LCtrl::
~*RCtrl::
~*LAlt::
~*RAlt::
~*Tab::
~*Escape::
~*Backspace::
~*Delete::
~*Left::
~*Right::
~*Up::
~*Down::
~*LButton::
~*RButton::
~*MButton::
~*WheelUp::
~*WheelDown::
~*XButton1::
~*XButton2::
    ; Get the name of the key or mouse button that triggered the event
    StringTrimLeft, key, A_ThisHotkey, 2
    inputLog .= key " pressed`n"
    ; Limit the log to the last 50 lines
    StringSplit, lines, inputLog, `n
    if (lines0 > 50)
    {
        ; Rebuild the log to contain only the last 50 entries
        inputLog := ""
        Loop, 50
        {
            inputLog .= lines[A_Index] "`n"
        }
    }
    return

RefreshGUI:
    GuiControl,, InputDisplay, %inputLog%
return

; Close the script with escape key
Esc::
ExitApp

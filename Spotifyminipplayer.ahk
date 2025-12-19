#Requires AutoHotkey v2.0
#SingleInstance Force

; Spotify miniplayer helper (AutoHotkey v2)
; - Polls for Spotify every `intervalMs` ms up to `timeoutMs`
; - When found: activates Spotify, ControlClick the miniplayer button at window-relative
;   coordinates (58px from right, 44px from bottom), minimizes the main window, then exits

intervalMs := 2000
timeoutMs  := 60000
spotifyWin := "ahk_exe Spotify.exe"

startTick := A_TickCount

while (A_TickCount - startTick < timeoutMs) {
    if WinExist(spotifyWin) {
        WinActivate spotifyWin
        Sleep 10000 ; wait for window to load

        ; Get window position and size
        WinGetPos &x, &y, &w, &h, spotifyWin
        MouseGetPos &mx, &my  ; current mouse position
        ; Calculate coordinates relative to window's client area
        ; miniplayer button
        relX := w - 58
        relY := h - 44

        ; minimize button
        relX2 := w - 110
        relY2 := 35
        ; Use ControlClick to click at the relative coordinates (no mouse move)
        ; Parameters: Control (empty) , WinTitle, WinText (empty), WhichButton, ClickCount, Options
        ; Options use "x<value> y<value>" which are relative to the window's client area.
        ; ControlClick "", spotifyWin, "", "Left", 1, "x" relX " y" relY ; target control not found
        CoordMode("Mouse", "Screen")
        MouseMove(x + relX, y + relY)
        Click
        Sleep 50
        MouseMove(x + relX2, y + relY2)
        Click
        MouseMove(mx, my)  ; restore original mouse position
        ; WinMinimize spotifyWin
        ToolTip "[AHK] Spotify miniplayer opened", relX, relY
        ExitApp
    }

    Sleep intervalMs
}

ExitApp

`:: ExitApp
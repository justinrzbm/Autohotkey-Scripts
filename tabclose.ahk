#Requires AutoHotkey v2.0
#SingleInstance force

; This script looks for tabs with names that match the regex pattern and closes them
; the names are read from a file called "tabs.txt" in the same directory as the script
; the file should contain one keyphrase per line

; read the tab names from the file
tabs := FileRead("tabs.txt")
; split the tab names into an array, omit newlines
tabs := StrSplit(tabs, "`n", '`r`n')

; loop over open window titles on all browsers
windows_ids := WinGetList("ahk_exe firefox.exe")
windows_ids.Push(WinGetList("ahk_exe chrome.exe")*)
windows_ids.Push(WinGetList("ahk_exe msedge.exe")*)

for window_id in windows_ids
{
    ; get the window title
    title := WinGetTitle(window_id)
    ; loop through the tab names
    for tab in tabs
    {   
        if (tab != "" && RegExMatch(title, "i).*" tab ".*"))
        {
            ; close the tab by sending Ctrl+w to the window
            WinActivate("ahk_id" window_id)
            Send "^w"
            MsgBox format("`"{}`" was closed", title)
        }
    }
}


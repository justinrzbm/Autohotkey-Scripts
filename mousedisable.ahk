#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;https://autohotkey.com/board/topic/88434-winwait-for-any-of-two-windows/

#SingleInstance Force
SetBatchLines, 1ms
Suspend

GroupAdd, windowgroup, ahk_exe osu!.exe
GroupAdd, windowgroup, Krunker — Mozilla Firefox

Loop
{
	WinWaitActive, ahk_group windowgroup
	Suspend Off
	WinWaitNotActive, ahk_group windowgroup
	Suspend
}
	
XButton1::return ;catches input and ignores it

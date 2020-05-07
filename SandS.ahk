;"C:\Program Files\AutoHotkey\AutoHotkey.exe" "D:\Dropbox\autohotkey.ahk"
; Ctrl + Alt + E でスクリプトを編集.
;^!e::Edit
; Ctrl + Alt + R でスクリプトを再読み込み.
^!r::Reload


;https://edvakf.hatenadiary.org/entry/20101027/1288168554


Space::
SendInput {RShift Down}
If SandS_SpaceDown = 1
{
	Return
}
SandS_SpaceDown := 1
SandS_SpaceDownTime := A_TickCount ; milliseconds after computer is booted http://www.autohotkey.com/docs/Variables.htm
SandS_AnyKeyPressed := 0
; watch for the next single key, http://www.autohotkey.com/docs/commands/Input.htm
Input, SandS_AnyKey, L1 V,{LControl}{RControl}{LAlt}{RAlt}{LShift}{RShift}{LWin}{RWin}{AppsKey}{F1}{F2}{F3}{F4}{F5}{F6}{F7}{F8}{F9}{F10}{F11}{F12}{Left}{Right}{Up}{Down}{Home}{End}{PgUp}{PgDn}{Del}{Ins}{BS}{Capslock}{Numlock}{PrintScreen}{Pause}
SandS_AnyKeyPressed := 1
Return


Space Up::
SendInput {RShift Up}
SandS_SpaceDown := 0
If SandS_AnyKeyPressed = 0
{
	If A_TickCount - SandS_SpaceDownTime < 200
	{
		;If takubo = 0
		;{
		;	SendInput {Space}
		;} Else {
		;	SendInput ^{Space}
		;}
		if ( 0 )
		{
			SendInput {Space}
		}
		else
		{
			if  ( WinActive("ahk_class LyncConversationWindowClass")  ){
				Send, #{F4}
			}else{
				SendInput {Space}
			}
		}
	}
	; Send EndKey of the "Input" command above
	; You must use Send here since SendInput is ignored by "Input"
	Send {RShift}
}
Return


RControl::Space


; Not HHKB
; LShift::LCtrl


RShift::RCtrl





; RControl:: SendInput {Space}
; 
; LShift:: SendInput {Escape}
; 
; 
; ;RShift:: SendInput {CtrlDown}
; 
; ;RShift Up:: SendInput {CtrlUp}
; 
; RShift::
; 	takubo := 1
; 	SendInput {CtrlDown}
; 	Return
; 
; 
; RShift Up::
; 	takubo := 0
; 	SendInput {CtrlUp}
; 	Return



; HHKB

; HHKB Cursor
NumpadMult::Left
NumpadDiv::Down
Home::Up
PgUp::Right

; HHKB Shift + Cursor
NumpadAdd::+Left
NumpadSub::+Down
End::+Up
PgDn::+Right

; for Excel
PrintScreen::F2
ScrollLock::PrintScreen


Capslock::AltTab


;LShift::LWin
LShift::Space

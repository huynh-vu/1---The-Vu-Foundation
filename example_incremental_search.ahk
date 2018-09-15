#SingleInstance force
#NoEnv
SetBatchLines, -1

Loop, %A_WinDir%\*.*
{
	list .= A_LoopFileName "|"
}
Gui, Add, ComboBox, HwndhCB vCBgCB Sort r10, %list%
Gui, Show
return


GuiClose:
{
	ExitApp
}




CB:
{
	len1 := StrLen(%A_GuiControl%)
	Gui, Submit, NoHide
	len2 := StrLen(%A_GuiControl%)
	If (len2 = 0) 
	{
		SendMessage, 0x14F, FALSE,,,% "ahk_id " h%A_GuiControl%              ;CB_SHOWDROPDOWN
		return
	}
	SendMessage, 0x14C, -1, &%A_GuiControl%,,% "ahk_id " h%A_GuiControl%  ;CB_FINDSTRING
	If (len2 <= len1) OR (ErrorLevel = 4294967295)                        ;4294967295 = string not found
	{
		return
	}
	SendMessage, 0x157,,,,% "ahk_id " h%A_GuiControl%                     ;CB_GETDROPPEDSTATE
	If !ErrorLevel
	{
	 	SendMessage, 0x14F, TRUE,,,% "ahk_id " h%A_GuiControl%               ;CB_SHOWDROPDOWN
	}
	GuiControl, ChooseString, %A_GuiControl%,% %A_GuiControl%
	GuiControlGet, text,,%A_GuiControl%
	LoWord := StrLen(%A_GuiControl%), HiWord := StrLen(text), DWord := HiWord << 16 | LoWord
	SendMessage, 0x142,,DWord,,% "ahk_id " h%A_GuiControl%                ;CB_SETEDITSEL
	return
}
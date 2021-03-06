; GLOBAL SETTINGS ===============================================================================================================

global WM_USER               := 0x00000400
global PBM_SETMARQUEE        := WM_USER + 10
global PBM_SETSTATE          := WM_USER + 16
global PBS_MARQUEE           := 0x00000008
global PBS_SMOOTH            := 0x00000001
global PBS_VERTICAL          := 0x00000004
global PBST_NORMAL           := 0x00000001
global PBST_ERROR            := 0x00000002
global PBST_PAUSE            := 0x00000003
global STAP_ALLOW_NONCLIENT  := 0x00000001
global STAP_ALLOW_CONTROLS   := 0x00000002
global STAP_ALLOW_WEBCONTENT := 0x00000004
global WM_THEMECHANGED       := 0x0000031A

#singleinstance force 
#NoEnv
#Include %A_ScriptDir%\Gdip.ahk			
#Include %A_ScriptDir%\BarChart.ahk	
;#NoTrayIcon
setBatchLines -1
SendMode Input
ListLines Off ; faster script
gui, -Sysmenu +Owner -caption +lastfound
DllCall("SetClassLong", "uint", WinExist(), "int", -26, "int", DllCall("GetClassLong", "uint", WinExist(), "int", -26) | 0x20000)
; ================================================================================================================================

gui, font, bold s15 cwhite, georgia 
gui, add, groupbox, section w230 r8 center, Gulf Bay Marine
gui, font,
Gui, Add, Picture, 0x8 xs+22 ys+30 w172 h-1 border 0x40000, %a_scriptdir%\images\logo.png
;gui, add, text, 0x8 h18 w75 right xs+5 yp+40, USERNAME:  
;gui, add, edit, 0x8 w180 x+8 yp-4 left vusername,

gui, font, cwhite bold, arial
gui, add, text, 0x8 h18 w200 center yp233,
gui, font,

gui, add, text, 0x8 h18 w0 right xs+5 yp+13, 
gui, add, edit, border 0x8 w189 h23 x+16 left vpassword password, 
gui, add, text, hidden 0x8 h18 w75 right xs+5, 
gui, add, button, hidden default 0x8 w100 x+8 yp-4 glogin, LOGIN
gui, font, s8 cwhite italic, arial
gui, add, text, h18 w230 center xs+5 yp+5, Copyright © 2018 Gulf Bay Marine, Inc.


; BACKGROUND COLOR
gui, color, C0077be
gui, show, noactivate, GBM Login
WinSet, Transparent, Off, GBM Login
WinSet, Region, 0-0 w265 h367 R15-15,GBM Login
ControlFocus, edit1, GBM Login

TrayTip, Password, The password is your name., , 2


return

#include %a_scriptdir%\subroutines\subroutines.ahk


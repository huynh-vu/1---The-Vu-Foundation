#Include %A_ScriptDir%\Gdip.ahk			
#Include %A_ScriptDir%\BarChart.ahk	

YearChart =
(
January	523
February	523
March	411
April	311
May	601
June	345
July	550
August	487
September	390
October	511
November	413
December	386
)

MayChart =
(
18
21
15
18
20
21
20
13
20
21
26
20
23
20
24
20
17
20
15
20
22
11
20
20
21
24
20
15
20
13
23
)

Skin := "DiagonBlackGreen"

Gui, 1:Color, 111111
Gui, 1:Add, Picture, x5 y5 w250 h350 BackgroundTrans 0xE vYearPic
;Gui, 1:Add, Picture, x260 y5 w250 h350 BackgroundTrans 0xE vMayPic

pToken := Gdip_Startup()
BarChart(YearChart, "YearPic", 1, "Monthly Visits", Skin)
Gdip_Shutdown(pToken)

;BarChart(MayChart, "MayPic", 1, "Downloads - May 2012", Skin, "DisplayValues:0, BarHeightFactor:0.62, BarSpacing:2, BarRoundness:0, TextSize:10, BarColorDirection:1")


Gui 1:Show, noactivate, Software X
return


;===Subroutines=========================================================================
GuiClose:
ExitApp


;===Functions===========================================================================
#Include %A_ScriptDir%\Gdip.ahk			; by Tic
#Include %A_ScriptDir%\BarChart.ahk		; by Learning one
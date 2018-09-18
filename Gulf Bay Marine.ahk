#singleinstance force 
#NoEnv
#Include %A_ScriptDir%\Gdip.ahk			
#Include %A_ScriptDir%\BarChart.ahk	
;#NoTrayIcon
setBatchLines -1
;SendMode Input
ListLines Off ; faster script
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
Skin := "DiagonBlackGreen"
count_invoice_line := 1
session_customer := 
total_sales := 0
menu, filemenu, add, Exit, menuhandler_exit
menu, mymenubar, add, File, :filemenu
menu, mymenubar, add, Home, :filemenu
menu, mymenubar, add, Insert, :filemenu
menu, mymenubar, add, Layout, :filemenu
menu, mymenubar, add, References, :filemenu
menu, mymenubar, add, Mailings, :filemenu
menu, mymenubar, add, View, :filemenu
gui, menu, mymenubar
gui, add, tab2, x+0 yp+2 w1100 h985, Inventory|Accounts|Overview|Expenses|Tax|Timesheet|Analytics|Reports|Export ;w1900
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
gui, tab, 1,
gui, font, bold c s15, arial
gui, add, groupbox, section w1075 h950 center, INVENTORY ;w1875
gui, font,
gui, add, text, 0x8 h18 w100 xs+10 yp+25 right, Search Product:  
gui, add, edit, 0x8 h18 w200 x+8 vA_SearchTerm gSearchProduct left, 
gui, add, button, border w100 x+642 gAddProduct, + ADD PRODUCT
gui, font, s11
Gui, add, listview, 0x8000 0x400000 r43 w1050 yp+25 xs+10 grid vlistviewproducts geditproduct vscroll, Barcode|Product|Sales|Cost|Quantity|Capacity|Tax|Vendor|Last Updated|Notes ;w1850
gosub, sub_load_listview_products
total_expenses := 0
gui, font, 

;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
gui, tab, 2,
gui, add, button, 0x8000 0x400000 h45 w150 center x+10 gcreate_new_invoice, + INVOICE
gui, add, button, 0x8000 0x400000 h45 w150 center x+5 gaddcustomer, + ACCOUNT
Gui, add, listview, 0x8000 0x400000 r51 w300 xs+10 yp+55 vlistviewcustomers glist_view_customers grid, CUSTOMERS | BALANCE
gosub, sub_load_listview_customers
gui, font, bold c s15, arial
gui, add, groupbox, x+10 yp-12 section w573 h908 center, Customer Profile ;w1500
gui, font,
gui, add, text, 0x8 h18 w75 right xs+5 ys+30, CUSTOMER:  
gui, add, edit, 0x8 w180 x+8 yp-4 left vcustomer gsave_recent_customer,
gui, add, text, 0x8 h18 w75 right xs+5 yp+30, FISH HOUSE:  
gui, add, edit, 0x8 w180 x+8 yp-4 left vFishHouse,
gui, add, text, 0x8 h18 w75 right xs+5 yp+30, CREDIT:  
gui, add, edit, 0x8 w180 x+8 yp-4 left vCredit,
gui, add, text, 0x8 h18 w75 right xs+5 yp+30, ADDRESS:  
gui, add, edit, 0x8 w180 x+8 yp-4 r3 left vaddress, 
gui, add, text, 0x8 h18 w75 right xs+5 yp+58, PHONE:  
gui, add, edit, 0x8 w180 x+8 yp-4 left vPhone,
gui, add, text, 0x8 h18 w75 right xs+5 yp+30, EMAIL:  
gui, add, edit, 0x8 w180 x+8 yp-4 left vEmail,
gui, add, text, 0x8 h18 w75 right xs+5 yp+30, TAX EXEMPT:  
gui, add, edit, 0x8 w180 x+8 yp-4 r1 left vtaxexempt,
gui, add, text, 0x8 h18 w75 right xs+5 yp+30, NET TERM:  
gui, add, edit, 0x8 w180 x+8 yp-4 left vnetterm, 
gui, font, bold s20
gui, add, text, 0x8 h28 w292 x+5 ys+26 right cgreen, Total Amount Due: 
gui, font, bold s15
gui, add, text, 0x8 h28 w292 xp yp+26 right vprofile_total cgreen, $0.00
gui, font 
gui, add, button, 0x8 h22 w190 xp+98 yp+156 gsavecustomer, Save Customer Information 
gui, add, button, 0x8 h22 w190 yp+29 gprintstatement, Print Statement
gui, add, text, xs+10 yp+26 w550 h2 0x10 ;Horizontal Line > Black
gui, add, listview, 0x8000 0x400000 r35 w550 xs+10 yp+10 vlistviewinvoices glist_view_invoice grid, Date | Invoice No. | Total Amount
LV_ModifyCol(1, "100 SortAsc")
LV_ModifyCol(2, "345")
LV_ModifyCol(3, "100")
LV_ModifyCol(4, "40")

;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
gui, tab, 3,
gui, add, button, 0x8000 0x400000 x+10 w227 h50 gAddTask, + TASK
gui, add, monthcal, yp+60 r5 vOverviewCalendar border 16, 
gui, add, listview, 0x8000 0x400000 x+10 r15 w375 vlistviewtasks glist_view_tasks grid, TASKS
gosub, sub_load_listview_tasks
Gui, Add, Picture, x650 ys29 w250 h70 BackgroundTrans 0xE vbankbalance

Bank = 88682.60

pToken := Gdip_Startup()
BarChart(Bank, "bankbalance", 1, "BANK:", Skin)
Gdip_Shutdown(pToken)

;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
gui, tab, 4,
gui, font, bold c s15, arial
gui, add, groupbox, section w800 r18 center, GULF BAY MARINE - EXPENSES
gui, font,
gui, add, button, 0x8 xs+8 yp+25 center gAddExpense, + Add Expense
gui, add, listview, 0x8000 0x400000 xs+9 yp+25 w380 r25 vlistviewexpenses center gListViewExpense grid, Due Date | Vendor | Amount | Paid
gui, add, listview, 0x8000 0x400000 x+15 w380 r25 center vlistviewexpensespaid gListViewExpensePaid grid, Due Date | Vendor | Amount | Paid
gui, add, text, 0x8 h18 xs+8 yp+485 w380 right vTotalExpenses, Total Expenses: 
gosub, sub_load_listview_expenses
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
gui, tab, 5,
gui, font, bold c s15, arial
gui, add, groupbox, section w875 r29 center, TAX INFORMATION ;w1875
gui, font,
gui, add, listview, 0x8000 0x400000 w800 r20 xs+10 yp+23 vlistviewtaxstatements grid, Date | Product | Quantity | Price | Total
gui, add, text, xs+10 yp+375, Total Tax Sales: 
gui, add, text, x+5 w200 vtotaltaxsales,
gui, add, listview, 0x8000 0x400000 w800 r20 xs+10 yp+23 vlistviewtotalstatements grid, Date | Product | Quantity | Price | Total
gui, add, text, xs+10 yp+375, Total Sales: 
gui, add, text, x+5 w200 vtotalstatementsales,
;gosub, sub_load_listview_total_statements
;gosub, sub_load_listview_tax_statements
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
gui, tab, 6,
gui, font, bold c s15, arial
gui, add, groupbox, section w875 r29 center, Timesheet ;w1875
gui, font,
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
gui, tab, 7,
gui, font, bold c s15, arial
gui, add, groupbox, section w875 r29 center, Analytics ;w1875
gui, font,
gui, add, listview, 0x8000 0x400000 w800 r25 xs+10 yp+23 vlistviewproductssoldconsolidated grid, Product | Quantity | Price | Total
gui, add, text, xs+10 yp+500, Total: 
gui, add, text, x+5 w200 vtotalconsolidatedsales,
;gosub, sub_load_listview_products_sold_consolidated
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
gui, tab, 9,
gui, font, bold c s15, arial
gui, add, groupbox, section w875 r29 center, Export
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
; BACKGROUND COLOR
gui, color, FFFFFF
gui, show, noactivate, Gulf Bay Marine
WinSet, Transparent, Off, Gulf Bay Marine

;winmove, Gulf Bay Marine, 0, 0

return

#include %a_scriptdir%\subroutines\subroutines.ahk


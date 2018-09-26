

inactivity:
{
	IfGreater, A_TimeIdle, 900000
	{
		gui, destroy
		MsgBox, You have been logged out due to inactivity.
		
		run, %a_scriptdir%\Gulf Bay Marine.ahk
	}
	
	return
}

login:
{
	; get motivational quote
	random, quote_number, 1, 70
	filereadline, quote, %a_scriptdir%\data\quotes.csv, quote_number
	gui, submit, nohide

	if(password = "webapp")
	{
		run, %a_scriptdir%\Example.ahk
		gui, destroy

		;create index.html
		filedelete, %a_scriptdir%\index.html
		filepath = %a_scriptdir%\index.html
		file := FileOpen(filepath, "w")
		
		file.Writeline("<!DOCTYPE html>")
		c1 = <html lang=`"en`">
		file.Writeline(c1)
		file.Writeline("<head>")
		c2 = <meta charset=`"utf-8`">
		file.Writeline(c2)
		c3 = <meta name=`"viewport`" content=`"width=device-width, initial-scale=1, shrink-to-fit=no`">
		file.Writeline(c3)
		file.Writeline("<meta http-equiv='X-UA-Compatible' content='IE=edge'>")
		c4 = <link rel=`"stylesheet`" href=`"css/bootstrap.css`">
		file.Writeline(c4)
		c5 = <link rel=`"stylesheet`" href=`"https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css`" integrity=`"sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO`" crossorigin=`"anonymous`">
		file.Writeline(c5)
		c6 = <script src=`"https://code.jquery.com/jquery-3.3.1.slim.min.js`" integrity=`"sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo`" crossorigin=`"anonymous`"></script>
		file.Writeline(c6)
		c7 = <script src=`"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js`" integrity=`"sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49`" crossorigin=`"anonymous`"></script>
		file.Writeline(c7)
		c8 = <script src=`"https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js`" integrity=`"sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy`" crossorigin=`"anonymous`"></script>
		file.Writeline(c8)
		file.Writeline("<style>")
		file.Writeline("html{margin:0;padding:0;overflow:auto;}")
		file.Writeline("body{padding:10px 20px 0 20px;}")
		file.Writeline("</style>")
		file.Writeline("</head>")
		file.Writeline("<body>")
		c9 = <div class=`"container`">
		file.Writeline(c9)
		file.Writeline("<div>")
		;c10 = Search Product: <input style=`"font-size:14px`" class=`"rounded border border-primary`" type=`"text`" name=`"fname`"><br>
		




		c10 =
		(
		<nav class=`"navbar .navbar-dark navbar-expand-lg bg-dark rounded`">

		<a class=`"navbar-brand`" href=`"#`">Gulf Bay Marine</a>
		<button class=`"navbar-toggler`" type=`"button`" data-toggle=`"collapse`" data-target=`"#navbarSupportedContent`" aria-controls=`"navbarSupportedContent`" aria-expanded=`"false`" aria-label=`"Toggle navigation`">
		<span class=`"navbar-toggler-icon`"></span>
		</button>

		<div class=`"collapse navbar-collapse`" id=`"navbarSupportedContent`">
		<ul class=`"navbar-nav mr-auto`">
		<li class=`"nav-item active`">
		<a class=`"nav-link`" href=`"#`">Home <span class=`"sr-only`">(current)</span></a>
		</li>
		<li class=`"nav-item`">
		<a class=`"nav-link`" href=`"#`">Link</a>
		</li>
		<li class=`"nav-item dropdown`">
		<a class=`"nav-link dropdown-toggle`" href=`"#`" id=`"navbarDropdown`" role=`"button`" data-toggle=`"dropdown`" aria-haspopup=`"true`" aria-expanded=`"false`">  
		Dropdown
		</a>
		<div class=`"dropdown-menu`" aria-labelledby=`"navbarDropdown`">
		<a class=`"dropdown-item`" href=`"#`">Action</a>
		<a class=`"dropdown-item`" href=`"#`">Another action</a>
		<div class=`"dropdown-divider`"></div>
		<a class=`"dropdown-item`" href=`"#`">Something else here</a>
		</div>
		</li>
		<li class=`"nav-item`">
		<a class=`"nav-link disabled`" href=`"#`">Disabled</a>
		</li>
		</ul>
		<form class=`"form-inline my-2 my-lg-0`">
		<input class=`"form-control mr-sm-2`" type=`"search`" placeholder=`"Search`" aria-label=`"Search`">
		<button class=`"btn btn-outline-primary my-2 my-sm-0`" type=`"submit`">Search</button>
		</form>
		</div>
		</nav>
		)
		
  		file.Writeline(c10)

		file.Writeline("<br>")



		


		c11 = <table class=`"table table-sm table-dark table-hover table-striped rounded`">
		file.Writeline(c11)
		file.Writeline("<thead>")
		file.Writeline("<tr>")
		c12 = <th scope=`"col`">Barcode</th>
		file.Writeline(c12)
		c13 = <th scope=`"col`">Item Description</th>
		file.Writeline(c13)
		c14 = <th scope=`"col`">Sales</th>
		file.Writeline(c14)
		;c15 = <th scope=`"col`">Cost</th>
		;file.Writeline(c15)
		c16 = <th scope=`"col`">Quantity</th>
		file.Writeline(c16)
		c17 = <th scope=`"col`">Capacity</th>
		file.Writeline(c17)
		c100 = <th scope=`"col`">Tax</th>
		file.Writeline(c100)
		;c18 = <th scope=`"col`">Vendor</th>
		;file.Writeline(c18)

		file.Writeline("</tr>")
		file.Writeline("</thead>")
		file.Writeline("<tbody>")

		Loop, read, %a_scriptdir%\data\products.csv 
		{
			file.Writeline("<tr>")
			loop, parse, a_loopreadline, `,
			{
				var%a_index% := a_loopfield
			}
			c21 = <th scope="row"> 
			c22 = </th>
			c23 = %c21%%var1%%c22%
			file.Writeline(c23)
			c24 = <td>
			c25 = </td>
			c26 = %c24%%var2%%c25%
			file.Writeline(c26)
			c27 = %c24%%var3%%c25%
			file.Writeline(c27)

			;c28 = %c24%%var4%%c25%
			;file.Writeline(c28)

			c29 = %c24%%var5%%c25%
			file.Writeline(c29)

			c30 = %c24%%var6%%c25%
			file.Writeline(c30)

			c31 = %c24%%var7%%c25%
			file.Writeline(c31)

			;c32 = %c24%%var8%%c25%
			;file.Writeline(c32)

			; view product button

			c33 = <button type=`"button`" class=`"btn btn-primary btn-sm`">Add</button>
			c34 = %c24%%c33%%c25%
			file.Writeline(c34)

			file.Writeline(</tr>)
		}
		
		file.Writeline("</tbody>")
		file.Writeline("</table>")
		file.Writeline("</div>")
		file.Writeline("</div>")
		file.Writeline("<br><br><br>")
		file.Writeline("</body>")
		file.Writeline("</html>")


		file.Close()


	


		;gui, -Sysmenu -caption +alwaysontop
		;Gui, add, listview, 0x8000 0x400000 r50 w1850 grid vlistviewproducts geditproduct vscroll, Barcode|Product|Sales|Cost|Quantity|Capacity|Tax|Vendor|Last Updated|Notes ;w1850
		;gosub, sub_load_listview_products
		;gui, show, noactivate x25 y100, listview
		
		return
	}	
	if(password = "test" OR password = "doan")
	{
		SetTimer, inactivity, 900000
		
		gui, destroy
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
		gui, add, tab2, x+0 yp+2 w1900 h985, Inventory|Accounts|Overview|Expenses|Tax|Timesheet|Analytics|Reports|Activity ;w1900
		;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
		gui, tab, 1,
		gui, font, bold c s15, arial
		gui, add, groupbox, section w1875 h950 center, INVENTORY ;w1875
		gui, font,
		gui, add, text, 0x8 h18 w100 xs+10 yp+25 right, Search Product:  
		gui, add, edit, 0x8 h18 w200 x+8 vA_SearchTerm gSearchProduct left, 
		gui, add, button, border h19 w100 x+5 gReloadProduct, Reload
		gui, add, button, border w100 x+1337 gAddProduct, + ADD PRODUCT
		gui, font, s11
		Gui, add, listview, 0x8000 0x400000 r43 w1850 yp+25 xs+10 grid vlistviewproducts geditproduct vscroll, Barcode|Product|Sales|Cost|Quantity|Capacity|Tax|Vendor|Last Updated|Notes ;w1850
		
		gosub, sub_load_listview_products
		LV_ModifyCol(4, "")
		total_expenses := 0
		gui, font, 

		;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
		gui, tab, 2,
		gui, add, text, 0x8 h18 right xs+10 yp-40, FISHHOUSE: 
		gui, add, combobox, 0x8 w230 x+5 left yp-3 vfilterfishhouse gfilter_fishhouse r11, ALL|ANCHOR SEAFOOD|AZTECA|BOWERS SEAFOOD|PO BOYS DOCK|TEXAS GULF SEAFOOD|QUALITY SEAFOOD|GAR SHRIMP|CAPT TOM SEAFOOD|W&W DOCK|UNITED SEAFOOD
		Gui, add, listview, 0x8000 0x400000 r51 w300 xs+10 yp+25 vlistviewcustomers glist_view_customers grid, CUSTOMERS | BALANCE
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
		gui, add, button, 0x8000 0x400000 h45 w150 center ys+10 gcreate_new_invoice, + INVOICE
		gui, add, button, 0x8000 0x400000 h45 w150 center yp+50 gaddcustomer, + ACCOUNT

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
		gui, add, groupbox, section w875 r29 center, Activity Log
		gui, font, 
		Gui, add, listview, 0x8000 0x400000 r51 w850 xs+10 yp+25 vlistviewactivity grid, Activity Log
		gosub, sub_load_listview_activity
		;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000


		gui, color, FFFFFF
		gui, show, noactivate, Gulf Bay Marine
		WinSet, Transparent, Off, Gulf Bay Marine

		TrayTip, Welcome`, Administrator, %quote%, 3, 1
	}

	if(password = "luan")
	{
		SetTimer, inactivity, 900000
		
		gui, destroy
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
		gui, add, tab2, x+0 yp+2 w1900 h985, Inventory|Accounts
		;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
		gui, tab, 1,
		gui, font, bold c s15, arial
		gui, add, groupbox, section w1875 h950 center, INVENTORY ;w1875
		gui, font,
		gui, add, text, 0x8 h18 w100 xs+10 yp+25 right, Search Product:  
		gui, add, edit, 0x8 h18 w200 x+8 vA_SearchTerm gSearchProduct left, 
		gui, add, button, border h19 w100 x+5 gReloadProduct, Reload
		gui, add, button, border w100 x+1337 gAddProduct, + ADD PRODUCT
		gui, font, s11
		Gui, add, listview, 0x8000 0x400000 r43 w1850 yp+25 xs+10 grid vlistviewproducts geditproduct vscroll, Barcode|Product|Sales|Cost|Quantity|Capacity|Tax|Vendor|Last Updated|Notes ;w1850
		gosub, sub_load_listview_products
		gui, 1: default
		gui, 1: listview, listviewproducts
		lv_modifycol(4, "0")
		total_expenses := 0
		gui, font, 

		;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
		gui, tab, 2,
		gui, add, text, 0x8 h18 right xs+10 yp-40, FISHHOUSE: 
		gui, add, combobox, 0x8 w230 x+5 left yp-3 vfilterfishhouse gfilter_fishhouse r11, ALL|ANCHOR SEAFOOD|AZTECA|BOWERS SEAFOOD|PO BOYS DOCK|TEXAS GULF SEAFOOD|QUALITY SEAFOOD|GAR SHRIMP|CAPT TOM SEAFOOD|W&W DOCK|UNITED SEAFOOD
		Gui, add, listview, 0x8000 0x400000 r51 w300 xs+10 yp+25 vlistviewcustomers glist_view_customers grid, CUSTOMERS | BALANCE
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
		gui, add, button, 0x8000 0x400000 h45 w150 center ys+10 gcreate_new_invoice, + INVOICE
		gui, add, button, 0x8000 0x400000 h45 w150 center yp+50 gaddcustomer, + ACCOUNT

		;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
		
		gui, color, FFFFFF
		gui, show, noactivate, Gulf Bay Marine
		WinSet, Transparent, Off, Gulf Bay Marine

		TrayTip, Welcome`, %password%, %quote%, 3, 1
	}
	return
}


sub_load_listview_products_sold_consolidated:
{
	BlockInput, on
	gui, 1: default
	gui, 1: listview, listviewproductssoldconsolidated
	total_sales := 0
	Loop, Files, %a_scriptdir%\statements\*.csv, R
	{
		balance := 0
		loop, read, %a_loopfilefullpath%
		{
			var1 :=
			var2 :=
			var3 :=
			var4 :=
			var5 :=
			var6 := 
			filereadline, invoice_date, %a_loopfilefullpath%, 2
			loop, parse, a_loopreadline, `,
			{
				var%a_index% := a_loopfield
			}
			if var2!=
			{ 
				if var3 != 
				{
					if var4 !=
					{
						if var5 !=
						{
							total_sales := total_sales + var5
							lv_add(,var2,var3,var4,var5)

						}
					}
				}
			} 
		}
	}
	LV_ModifyCol(1, "300 left")
	LV_ModifyCol(2, "60 center")
	LV_ModifyCol(3, "60 right")
	LV_ModifyCol(4, "60 right")
	LV_ModifyCol(4, "60 right")
	total_sales := round(total_sales, 2)
	guicontrol, 1: , totalconsolidatedsales, $%total_sales%
	gui, submit, nohide
	return
	BlockInput, off
}

savecustomer:
{
	blockinput, on
	guicontrolget, customer_, ,customer
	guicontrolget, fish_house, ,fishhouse
	guicontrolget, credit_, ,credit
	guicontrolget, address_, ,address
	guicontrolget, phone_, ,phone
	guicontrolget, email_, ,email
	guicontrolget, tax_exempt, ,taxexempt
	guicontrolget, net_term, ,netterm
	Loop, read, %a_scriptdir%\data\customers.csv
	{
	    LineNumberForItem = %A_Index%
	    Loop, parse, A_LoopReadLine, `n
	    {
	    	row_text = %customer_%,%fish_house%,%credit_%,%address_%,%phone_%,%email_%,%tax_exempt%,%net_term%
	    	if a_loopreadline contains %session_customer%
	    	{
	    		fileappend,%row_text%`n, %a_scriptdir%\data\temp_customers.csv
	    	}
	    	else
	    	{
	    		fileappend,%a_loopreadline%`n, %a_scriptdir%\data\temp_customers.csv
	    	}
	    }
	}
	
	filepath = %a_scriptdir%\data\temp_customers.csv
	func_sort_file(filepath)
	filedelete, %a_scriptdir%\data\customers.csv
	filemove, %filepath%,%a_scriptdir%\data\customers.csv
	gosub, sub_load_listview_customers
	gui, 5: destroy
	gui, 6: destroy
	gosub, create_new_invoice
	return
	blockinput, off
}

printstatement:
{
	blockinput, on
	total_amount := 0
	reformatted_total_amount := 0
	gui, submit, nohide
	gui, 15: font, bold s15, arial
	gui, 15: add, groupbox, x+10 section w600 r20 center, Customer Profile
	gui, 15: font,
	gui, 15: add, text, 0x8 h18 w75 right xs+5 ys+30, CUSTOMER:  
	gui, 15: add, edit, 0x8 w180 x+8 yp-4 left vcustomer gsave_recent_customer, %customer%
	gui, 15: font, bold s20
	gui, 15: add, text, 0x8 h28 w292 x+20 right cgreen, Total Amount Due: 
	gui, 15: font, bold s15
	gui, 15: add, text, 0x8 h28 w292 yp+30 right vprofile_total cgreen, 
	gui, 15: font 
	gui, 15: add, text, 0x8 h18 w75 right xs+5 yp, FISH HOUSE:  
	gui, 15: add, edit, 0x8 w180 x+8 yp-4 left vFishHouse, %fishhouse%
	gui, 15: add, text, 0x8 h18 w75 right xs+5 yp+30, CREDIT:  
	gui, 15: add, edit, 0x8 w180 x+8 yp-4 left vCredit, %credit%
	gui, 15: add, text, 0x8 h18 w75 right xs+5 yp+30, ADDRESS:  
	gui, 15: add, edit, 0x8 w180 x+8 yp-4 r3 left vaddress, %address%
	gui, 15: add, text, 0x8 h18 w75 right xs+5 yp+58, PHONE:  
	gui, 15: add, edit, 0x8 w180 x+8 yp-4 left vPhone, %phone%
	gui, 15: add, text, 0x8 h18 w75 right xs+5 yp+30, EMAIL:  
	gui, 15: add, edit, 0x8 w180 x+8 yp-4 left vEmail, %email%
	gui, 15: add, text, 0x8 h18 w75 right xs+5 yp+30, TAX EXEMPT:  
	gui, 15: add, combobox, 0x8 w180 x+8 yp-4 r1 left vtaxexempt, %taxexempt%
	gui, 15: add, text, 0x8 h18 w75 right xs+5 yp+30, NET TERM:  
	gui, 15: add, edit, 0x8 w180 x+8 yp-4 left vnetterm, %netterm%
	gui, 15: add, listview, w575 r26 xp-75 yp+30 vlistviewinvoices grid, Date|Invoice No.|Total Amount
	gui, 15: default
	gui, 15: listview, listviewinvoices
	loop, parse, list_invoices, |
	{
		var1 = 
		var2 =
		var3 =
		loop, parse, a_loopfield, `,
		{
			var%a_index% := a_loopfield
		}
		if var1 !=
		{
			lv_add(,var1, var2, var3)
			stringreplace, var3, var3, $, , all
			total_amount := total_amount + var3
		}
	}
	reformatted_total_amount := round(total_amount, 2)
	guicontrol, 15: , profile_total, $%reformatted_total_amount%
	LV_ModifyCol(1, "100 center SortAsc")
	LV_ModifyCol(2, "295")
	LV_ModifyCol(3, "175 right")
	gui, 15: show, noactivate, Statement Cover
	WinSet, Transparent, Off, Statement Cover

	winactivate, Statement Cover
	Runwait, "%a_scriptdir%\IrfanView\i_view32.exe" /capture=2 /convert=%a_scriptdir%\statements\%customer%\statement_cover.png
	Runwait, "%a_scriptdir%\IrfanView\i_view32.exe" "%a_scriptdir%\statements\%customer%\statement_cover.png" /print
	gui, 15: destroy

	gui, 1: default
	gui, 1: listview, listviewinvoices
	count_invoice := 5

	loop % lv_getcount()
	{
		LV_GetText(get_date, a_index, 1)
		LV_GetText(get_invoiceno, a_index, 2)
		LV_GetText(get_totalamount, a_index, 3)
		
		if get_invoiceno not contains PAID
		{
			if (mod(count_invoice,4) = 1)
			{
				gui, 14: add, picture, x+5 w350 h475, %a_scriptdir%\statements\%customer%\%get_invoiceno%.png
			}
			if (mod(count_invoice,4) = 2)
			{
				gui, 14: add, picture, x+5 w350 h475, %a_scriptdir%\statements\%customer%\%get_invoiceno%.png
			}
			if (mod(count_invoice,4) = 3)
			{
				gui, 14: add, picture, xs+0 w350 h475, %a_scriptdir%\statements\%customer%\%get_invoiceno%.png
			}
			if (mod(count_invoice,4) = 0)
			{
				gui, 14: add, picture, x+5 w350 h475, %a_scriptdir%\statements\%customer%\%get_invoiceno%.png
				gui, 14: show, noactivate, Monthly Statement
			
				WinSet, Transparent, Off, Monthly Statement

				winactivate, Monthly Statement
				Runwait, "%a_scriptdir%\IrfanView\i_view32.exe" /capture=2 /convert=%a_scriptdir%\statements\%customer%\monthly_statement.png
				Runwait, "%a_scriptdir%\IrfanView\i_view32.exe" "%a_scriptdir%\statements\%customer%\monthly_statement.png" /print
				gui, 14: destroy
			}
			count_invoice++
		}
	}
	if (mod(count_invoice,4) != 0)
	{
		gui, 14: show, noactivate, Monthly Statement
		WinSet, Transparent, Off, Monthly Statement
		winactivate, Monthly Statement
		Runwait, "%a_scriptdir%\IrfanView\i_view32.exe" /capture=2 /convert=%a_scriptdir%\statements\%customer%\monthly_statement.png
		Runwait, "%a_scriptdir%\IrfanView\i_view32.exe" "%a_scriptdir%\statements\%customer%\monthly_statement.png" /print
		gui, 14: destroy
	}
	guicontrolget, get_profile_total, , profile_total

	
 
	return
	blockinput, off
}

sub_load_listview_activity:
{
	BlockInput, on
	gui, 1: default
	gui, 1: listview, listviewactivity
	lv_delete()

	gui, 9: -Caption +border
	Gui, 9: Add, text, w250 h18, Loading Activity List...
	Gui, 9: Add, Progress, Range0-100 horizontal w250 h18 yp+15 vMyProgress border
	Gui, 9: Show, noactivate, 

	loop, read, %a_scriptdir%\data\activitylog.csv
	{
	   	StringSplit, item, A_LoopReadLine, `,
		LV_Add("", item1)
		GuiControl, 9: , MyProgress, +1
	}
	
	

	LV_ModifyCol(1, "800")
	gui, 9: destroy
	return
	BlockInput, off
}

sub_load_listview_tax_statements:
{
	blockinput, on
	gui, 1: default
	gui, 1: listview, listviewtaxstatements
	lv_delete()
	total_tax_sales := 0
	Loop, Files, %a_scriptdir%\statements\*.csv, R
	{
		loop, read, %a_loopfilefullpath%
		{
			var1 :=
			var2 :=
			var3 :=
			var4 :=
			var5 :=
			var6 := 
			filereadline, invoice_date, %a_loopfilefullpath%, 2
			loop, parse, a_loopreadline, `,
			{
				var%a_index% := a_loopfield
			}
			if var2!=
			{ 
				if var3 != 
				{
					if var4 !=
					{
						if var5 !=
						{
							if var6 !=
							{
								total_tax_sales := total_tax_sales + var5
								lv_add(,invoice_date,var2,var3,var4,var5)
								;msgbox %a_loopfilefullpath%, %invoice_date%, %var2%, %var3%, %var4%, %var5%, %var6%
							}
						}
					}
				}
			} 
		}
		LV_ModifyCol(1, "60 center SortAsc")
		LV_ModifyCol(2, "300")
		LV_ModifyCol(3, "60 right")
		LV_ModifyCol(4, "60 right")
		LV_ModifyCol(5, "60 right")
	}
	total_tax_sales := round(total_tax_sales, 2)
	guicontrol, 1: , totaltaxsales, $%total_tax_sales%
	gui, submit, nohide
	return
	blockinput, off
}

sub_load_listview_total_statements:
{
	blockinput, on
	gui, 1: default
	gui, 1: listview, listviewtotalstatements
	lv_delete()
	total_sales := 0
	Loop, Files, %a_scriptdir%\statements\*.csv, R
	{
		balance := 0
		loop, read, %a_loopfilefullpath%
		{
			var1 :=
			var2 :=
			var3 :=
			var4 :=
			var5 :=
			var6 := 
			filereadline, invoice_date, %a_loopfilefullpath%, 2
			loop, parse, a_loopreadline, `,
			{
				var%a_index% := a_loopfield
			}
			if var2!=
			{ 
				if var3 != 
				{
					if var4 !=
					{
						if var5 != 
						{
							total_sales := total_sales + var5
							balance := balance + var5
							lv_add(,invoice_date,var2,var3,var4,var5)
						}
					}
				}
			} 
		}
		LV_ModifyCol(1, "60 center SortAsc")
		LV_ModifyCol(2, "300")
		LV_ModifyCol(3, "60 right")
		LV_ModifyCol(4, "60 right")
		LV_ModifyCol(5, "60 right")
	}
	total_sales := round(total_sales, 2)
	guicontrol, 1: , totalstatementsales, $%total_sales%
	gui, submit, nohide
	return
	blockinput, off
}

sub_load_listview_products:
{
	blockinput, on
	item1 :=
	item2 := 
	item3 := 
	item4 :=
	item5 :=
	item6 :=
	item7 :=
	item8 :=
	item9 :=
	item10 :=
	gui, 1: default
	gui, 1: listview, listviewproducts
	lv_delete()
	list_product =
	list_product_price =
	list_product_price_quantity =
	list_product_price_cost_quantity =
	list_product_price_cost_quantity_monthcal =  
	list_product_price_cost_quantity_capacity_tax = 
	list_product_price_cost_quantity_capacity_tax_vendor = 
	list_product_price_cost_quantity_capacity_tax_vendor_lastupdated = 
	list_product_price_cost_quantity_capacity_tax_vendor_lastupdated_notes = 
	loop, read, %a_scriptdir%\data\products.csv
	{
		item9 :=
		item10 :=
		gui, 1: default
		gui, 1: listview, listviewproducts
	   	StringSplit, item, A_LoopReadLine, `,
	   	item3 := round(item3, 2)
	   	item3 = $%item3%
	   	item4 := round(item4, 2)
	   	item4 = $%item4%
	   	if item1 !=
	   	{
	   		LV_Add("", item1, item2, item3, item4, item5, item6, item7, item8, item9, item10)
	   	}
		list_product = %list_product%%item2%|
		list_product_price = %list_product_price%%item2%,%item3%|
		list_product_price_cost = %list_product_price_cost%%item2%,%item3%,%item4%|
		list_product_price_cost_quantity = %list_product_price_cost_quantity%%item1%,%item2%,%item3%,%item4%,%item5%|
		list_product_price_cost_quantity_capacity = %list_product_price_cost_quantity%%item1%,%item2%,%item3%,%item4%,%item5%,%item6%|
		list_product_price_cost_quantity_capacity_tax = %list_product_price_cost_quantity_capacity_tax%%item1%,%item2%,%item3%,%item4%,%item5%,%item6%,%item7%|
		list_product_price_cost_quantity_capacity_tax_vendor = %list_product_price_cost_quantity_capacity_tax_vendor%%item1%,%item2%,%item3%,%item4%,%item5%,%item6%,%item7%,%item8%|
		list_product_price_cost_quantity_capacity_tax_vendor_lastupdated = %list_product_price_cost_quantity_capacity_tax_vendor_lastupdated%%item1%,%item2%,%item3%,%item4%,%item5%,%item6%,%item7%,%item8%,%item9%|
		list_product_price_cost_quantity_capacity_tax_vendor_lastupdated_notes = %list_product_price_cost_quantity_capacity_tax_vendor_lastupdated_notes%%item1%,%item2%,%item3%,%item4%,%item5%,%item6%,%item7%,%item8%,%item9%,%item10%|
	}
	LV_ModifyCol(1, "center")
	LV_ModifyCol(2, "640")
	LV_ModifyCol(3, "100 right")
	LV_ModifyCol(4, "100 right")
	LV_ModifyCol(5, "100 center")
	LV_ModifyCol(6, "100 center")
	LV_ModifyCol(7, "100 center")
	LV_ModifyCol(8, "200 left")
	LV_ModifyCol(9, "100 center")
	LV_ModifyCol(10, "0")
	return
	blockinput, off
}

sub_load_listview_search_products:
{
	blockinput, on
	item1 :=
	item2 := 
	item3 := 
	item4 :=
	item5 :=
	item6 :=
	item7 :=
	item8 :=
	item9 :=
	gui, 11: default
	gui, 11: listview, listviewproducts
	lv_delete()
	list_product =
	list_product_price =
	list_product_price_quantity =
	list_product_price_cost_quantity =
	list_product_price_cost_quantity_capacity =  
	list_product_price_cost_quantity_capacity_tax = 
	list_product_price_cost_quantity_capacity_tax_vendor = 
	loop, read, %a_scriptdir%\data\products.csv
	{
		gui, 11: default
		gui, 11: listview, listviewproducts
	   	StringSplit, item, A_LoopReadLine, `,
	   	item3 := round(item3, 2)
	   	item3 = $%item3%
	   	item4 := round(item4, 2)
	   	item4 = $%item4%
	   	if item1 !=
	   	{
	   		LV_Add("", item1, item2, item3, item5)
	   	}
		list_product = %list_product%%item2%|
		list_product_price = %list_product_price%%item2%,%item3%|
		list_product_price_quantity = %list_product_price_quantity%%item1%,%item2%,%item3%,%item4%|
		list_product_price_cost_quantity = %list_product_price_cost_quantity%%item1%,%item2%,%item3%,%item4%,%item5%|
		list_product_price_cost_quantity_capacity = %list_product_price_cost_quantity_capacity%%item1%,%item2%,%item3%,%item4%,%item5%,%item6%|
		list_product_price_cost_quantity_capacity_tax = %list_product_price_cost_quantity_capacity_tax%%item1%,%item2%,%item3%,%item4%,%item5%,%item6%,%item7%|
		list_product_price_cost_quantity_capacity_tax_vendor = %list_product_price_cost_quantity_capacity_tax_vendor%%item1%,%item2%,%item3%,%item4%,%item5%,%item6%,%item7%,%item8%|
	}
	LV_ModifyCol(1, "55")
	LV_ModifyCol(2, "290")
	LV_ModifyCol(3, "65 right")
	LV_ModifyCol(4, "65 right")
	LV_ModifyCol(5, "130")
	LV_ModifyCol(6, "50")
	return
	blockinput, off
}

sub_load_listview_customers:
{
	BlockInput, on
	gui, 1: default
	gui, 1: listview, listviewcustomers
	lv_delete()
	list_customer =  

	gui, 9: -Caption +border
	Gui, 9: Add, text, w250 h18, Loading Program...

	Gui, 9: Add, Progress, Range0-75 horizontal w250 h18 yp+15 vMyProgress border
	Gui, 9: Show, noactivate, 

	loop, read, %a_scriptdir%\data\customers.csv
	{
	   	StringSplit, item, A_LoopReadLine, `,

	   	calc_total_amount := 0
		loop, files, %a_scriptdir%\statements\%item1%\*.csv,
		{
			filename = %a_loopfilename%
			stringreplace, filename, filename, .csv, , all
			filereadline, total_amount, %a_loopfilefullpath%, 19
			total_amount_num := round(total_amount, 2)
			total_amount = $%total_amount_num%
			paid = paid
			if filename not contains %paid%
			{
				calc_total_amount := calc_total_amount + total_amount_num
			}
			length_filename := strlen(filename)
		}
		reformatted_calc_total_amount := round(calc_total_amount, 2)
		if item1 !=
		{
			LV_Add("", item1, reformatted_calc_total_amount, item3, item4, item5)
		}
		
		list_customer = %list_customer%%item1%|
	}
	loop 75
	{
		sleep 1
		GuiControl, 9: , MyProgress, +1
	}
	LV_ModifyCol(1, "199 SortAsc")
	LV_ModifyCol(2, "74 right")
	LV_ModifyCol(3, "0")
	LV_ModifyCol(4, "0")
	LV_ModifyCol(5, "0")
	LV_ModifyCol(6, "0")
	gui, 9: destroy
	return
	BlockInput, off
}

func_sort_file(filepath)
{
	BlockInput, on
	FileRead, contents, %filepath%
	if not ErrorLevel  
	{
		Sort, Contents
		FileDelete, %filepath%
 		fileappend, %Contents%, %a_scriptdir%\data\temp.csv
 		Contents =  
	}

	file := FileOpen(filepath, "w")
	loop, read, %a_scriptdir%\data\temp.csv
	{
		if a_loopreadline = 
		{

		}
		else
		{
			TestString := a_loopreadline  ; When writing a file this way, use `r`n rather than `n to start a new line.
			file.Writeline(TestString)
			;fileappend, %a_loopreadline%`n, %filepath%
			GuiControl, 9: , MyProgress, +1
		}
	}
	file.Close()
	filedelete, %a_scriptdir%\data\temp.csv
	return
	BlockInput, off
}

editproduct:
{
	if(password = "luan")
	{
		return
	}
	BlockInput, on
	ifwinexist, Product Information
	{
		msgbox, Please close existing instance before opening a new one.
		winactivate, Product Information
		return
	}
	get_product_barcde = 
	get_product_name =
	get_product_price =
	get_product_cost = 
	get_product_quantity =
	get_product_capacity =
	get_product_tax =
	get_product_vendor =
	get_product_notes =
	gui, 1: listview, listviewproducts
	LV_GetText(get_product_barcode, A_EventInfo, 1)
	LV_GetText(get_product_name, A_EventInfo, 2)
	LV_GetText(get_product_price, A_EventInfo, 3)
	LV_GetText(get_product_cost, A_EventInfo, 4)
	LV_GetText(get_product_quantity, A_EventInfo, 5)
	LV_GetText(get_product_capacity, A_EventInfo, 6)
	LV_GetText(get_product_tax, A_EventInfo, 7)
	LV_GetText(get_product_vendor, A_EventInfo, 8)
	LV_GetText(get_product_notes, A_EventInfo, 10)
	gui, 10: font, bold c s12, arial
	gui, 10: add, groupbox, section w850 r10 center, Product Information
	gui, 10: font,
	gui, 10: add, picture, +border w250 h250 xs+10 yp+23 vproduct_image, %a_scriptdir%\images\image_%get_product_name%.png
	gui, 10: font, s11
	gui, 10: add, button, w252 xs+10 yp+250 gupload_product_image border, Upload Photo...
	StringReplace, get_product_notes, get_product_notes, ///, `n, All ; replace newlines 
	StringReplace, get_product_notes, get_product_notes, /\/, `,, All ; replace newlines 
	if new_barcode =
	{
		;reformat notes
		
		gui, 10: add, text, w55 x+8 right yp-245, Barcode:
		gui, 10: add, edit, x+5 w45 yp-3 vnew_product_barcode disabled center, %get_product_barcode%
		gui, 10: add, text, w55 x+5 yp+3 right, Name:
		gui, 10: add, edit, x+5 w400 yp-3 vnew_product_name, %get_product_name%
		gui, 10: add, text, xs+270 yp+32 w572 h2 0x10 ;Horizontal Line > Black
		gui, 10: add, text, w55 xs+270 right yp+13, Price:
		gui, 10: add, edit, x+5 w110 yp-3 vnew_product_price center, %get_product_price%
		gui, 10: add, text, w75 x+5 yp+3 right, Quantity:
		gui, 10: add, edit, x+5 w110 yp-3 vnew_product_quantity center, %get_product_quantity%
		gui, 10: add, text, w75 x+5 yp+3 right, Tax?:
		gui, 10: add, edit, x+5 w120 yp-3 vnew_product_tax center, %get_product_tax%
		gui, 10: add, text, w55 xs+270 right yp+30, Cost:
		gui, 10: add, edit, x+5 w110 yp-3 vnew_product_cost center, %get_product_cost%
		gui, 10: add, text, w75 x+5 yp+3 right, Capacity:
		gui, 10: add, edit, x+5 w110 yp-3 vnew_product_capacity center, %get_product_capacity%
		gui, 10: add, text, w75 x+5 yp+3 right, Vendor:
		gui, 10: add, edit, x+5 w120 yp-3 vnew_product_vendor center, %get_product_vendor%
		gui, 10: add, text, w200 xs+320 right yp+30, Wholesale #:
		gui, 10: add, edit, x+5 w110 yp-3 vwholesale_quantity gwholesalequantity center, 
		gui, 10: add, text, x+5 w65 yp+3 vwholesale_price, 
		gui, 10: add, text, xs+270 yp+30 w572 h2 0x10 ;Horizontal Line > Black
		gui, 10: add, text, w55 xs+270 right yp+8, Notes:
		gui, 10: add, edit, x+5 w510 r6 vnew_product_notes, %get_product_notes%
	}
	else
	{
		gui, 10: add, text, w55 x+9 right yp-245, Barcode:
		gui, 10: add, edit, x+5 w45 yp-3 vnew_product_barcode disabled center, %new_barcode%
		gui, 10: add, text, w55 x+5 yp+3 right, Name:
		gui, 10: add, edit, x+5 w400 yp-3 vnew_product_name, 
		gui, 10: add, text, xs+270 yp+32 w572 h2 0x10 ;Horizontal Line > Black
		gui, 10: add, text, w55 xs+270 right yp+10, Price:
		gui, 10: add, edit, x+5 w110 vnew_product_price center, 
		gui, 10: add, text, w75 x+5 right, Quantity
		gui, 10: add, edit, x+5 w110 vnew_product_quantity center, 
		gui, 10: add, text, w75 x+5 right, Tax?:
		gui, 10: add, edit, x+5 w120 vnew_product_tax center, 
		gui, 10: add, text, w55 xs+270 right yp+27, Cost:
		gui, 10: add, edit, x+5 w110 vnew_product_cost center, 
		gui, 10: add, text, w75 x+5 right, Capacity:
		gui, 10: add, edit, x+5 w110 vnew_product_capacity center, 
		gui, 10: add, text, w75 x+5 right, Vendor:
		gui, 10: add, edit, x+5 w120 vnew_product_vendor center, 
		gui, 10: add, text, w200 xs+320 right yp+30, Wholesale #:
		gui, 10: add, edit, x+5 w110 yp-3 vwholesale_quantity gwholesalequantity center, 
		gui, 10: add, text, x+5 w65 yp+3 vwholesale_price, 
		gui, 10: add, text, xs+270 yp+30 w572 h2 0x10 ;Horizontal Line > Black
		gui, 10: add, text, w55 xs+270 right yp+8, Notes:
		gui, 10: add, edit, x+5 w510 r6 vnew_product_notes, 
	}
	
	
	gui, 10: add, button, w300 xs+430 yp+110 gupdate_product border, Update Product Information
	gui, 10: show, noactivate, Product Information

	return
	BlockInput, off
}

update_product:
{
	BlockInput, on
	gui, submit, nohide
	if(new_product_barcode = "")
	{
		msgbox, 0x10, Error!, Please enter a valid barcode!
		return
	}
	if(new_product_name = "")
	{
		msgbox, 0x10, Error!, Please enter a valid name!
		return
	}
	if(new_product_price = "")
	{
		msgbox, 0x10, Error!, Please enter a valid price!
		return
	}
	if(new_product_cost = "")
	{
		msgbox, 0x10, Error!, Please enter a valid cost!
		return
	}
	if(new_product_quantity = "")
	{
		msgbox, 0x10, Error!, Please enter a valid quantity!
		return
	}
	if(new_product_capacity = "")
	{
		msgbox, 0x10, Error!, Please enter a valid capacity quantity!
		return
	}
	if(new_product_tax = "")
	{
		msgbox, 0x10, Error!, Please enter a valid tax!
		return
	}
	if(new_product_vendor = "")
	{
		msgbox, 0x10, Error!, Please enter a valid vendor!
		return
	}
	guicontrolget, session_search, 1:, a_searchterm

	gui, 9: -Caption +border
	Gui, 9: Add, text, w250 h18, Updating Product...
	Gui, 9: Add, Progress, Range0-5000 horizontal w250 h18 yp+15 vMyProgress border
	Gui, 9: Show, noactivate, 

	FileRead, contents, %a_scriptdir%\data\products.csv

	Loop, read, %a_scriptdir%\data\products.csv
	{
	    LineNumberForItem = %A_Index%
	    Loop, parse, A_LoopReadLine, `n
	    {
	    	loop, parse, a_loopfield, `,
	    	{
		    	if a_loopfield contains %get_product_barcode%
		    	{
		    		line_to_delete = %a_loopreadline%
		    	}
		    	GuiControl, 9: , MyProgress, +1
	    	}
	    	
	    }
	}
	StringReplace, new_product_price, new_product_price, $, , all

	FormatTime, TimeString, T12, yyyy-MM-dd
	StringReplace, new_product_notes, new_product_notes, `n, ///, All ; replace newlines 
	StringReplace, new_product_notes, new_product_notes, `,, /\/, All ; replace newlines 

	new_line = %new_product_barcode%,%new_product_name%,%new_product_price%,%new_product_cost%,%new_product_quantity%,%new_product_capacity%,%new_product_tax%,%new_product_vendor%,%TimeString%,%new_product_notes%
	if new_barcode =
	{
		;editing existing product
		StringReplace, new_contents, contents, %line_to_delete%, %new_line%, all
		StringReplace, new_contents, new_contents, $, , all
		fileappend, %new_contents%, %a_scriptdir%\data\temp_products.csv
	}
	else
	{
		;adding new product
		StringReplace, new_contents, contents, $, , all
		fileappend, %new_contents%`n%new_line%, %a_scriptdir%\data\temp_products.csv
	}
	filepath = 
	
	file_path = %a_scriptdir%\data\temp_products.csv
	func_sort_file(file_path)
	gui, 9: destroy
	gui, 10: destroy
	filedelete, %a_scriptdir%\data\products.csv
	try
	{
		filemove, %a_scriptdir%\data\temp_products.csv, %a_scriptdir%\data\products.csv, Overwrite
	}
	catch
	{
		filemove, %a_scriptdir%\data\temp_products.csv, %a_scriptdir%\data\products.csv, Overwrite
	}
	gosub, sub_load_listview_products
	gosub, sub_load_listview_search_products

	if a_searchterm
	{	
		GuiControl, 1: , a_searchterm,
		GuiControl, 1: , a_searchterm, %session_search%
	}

	new_barcode =
	session_search = 
	new_contents =

	;activity log
	if(get_product_name != new_product_name)
	{
		fileappend, Updated NAME: "%get_product_name%" to "%new_product_name%". `n, %a_scriptdir%\data\, %a_scriptdir%\data\activitylog.csv
	}
	StringReplace, get_product_price, get_product_price, $, , all
	StringReplace, new_product_price, new_product_price, $, , all
	if(get_product_price != new_product_price)
	{
		fileappend, Updated PRICE of %new_product_name% from "%get_product_price%" to "%new_product_price%". `n, %a_scriptdir%\data\activitylog.csv
	}
	StringReplace, get_product_cost, get_product_cost, $, , all
	StringReplace, new_product_cost, new_product_cost, $, , all
	if(get_product_cost != new_product_cost)
	{
		fileappend, Updated COST of %new_product_name% from "%get_product_cost%" to "%new_product_cost%". `n, %a_scriptdir%\data\activitylog.csv
	}
	if(get_product_quantity != new_product_quantity)
	{
		fileappend, Updated QUANTITY of %new_product_name% from "%get_product_quantity%" to "%new_product_quantity%". `n, %a_scriptdir%\data\activitylog.csv
	}
	if(get_product_capacity != new_product_capacity)
	{
		fileappend, Updated CAPACITY of %new_product_name% from "%get_product_capacity%" to "%new_product_capacity%". `n, %a_scriptdir%\data\activitylog.csv
	}
	if(get_product_tax != %new_product_tax%)
	{
		fileappend, Updated TAX of %new_product_name% from "%get_product_tax%" to "%new_product_tax%". `n, %a_scriptdir%\data\activitylog.csv
	}
	if(get_product_vendor != new_product_vendor)
	{
		fileappend, Updated VENDOR of %new_product_name% from "%get_product_vendor%" to "%new_product_vendor%". `n, %a_scriptdir%\data\activitylog.csv
	}
	if(get_product_notes != new_product_notes)
	{
		fileappend, Updated NOTES of %new_product_name% from "%get_product_notes%" to "%new_product_notes%". `n, %a_scriptdir%\data\activitylog.csv
	}
	
	fileread, activitylog, %a_scriptdir%\data\activitylog.csv
	gosub, sub_load_listview_activity
	return
	BlockInput, off
}

wholesalequantity:
{
	BlockInput, on
	gui, submit, nohide
	StringReplace, new_product_price, new_product_price, $, , all
	StringReplace, new_product_cost, new_product_cost, $, , all
	wholesaleprice := round((new_product_cost + ((1.25 - (wholesale_quantity/new_product_capacity)) * (new_product_price - new_product_cost) * .5)) , 3)
	;+ ((new_product_price - new_product_cost) * .5) ----- add this for better profit
	if(wholesale_quantity > new_product_capacity)
	{
		GuiControl, 10: , wholesale_price, Invalid Qty!
	}
	else
	{
		GuiControl, 10: , wholesale_price, $%wholesaleprice%
	}
	return
	BlockInput, off
}



upload_product_image:
{
	blockinput, on
	IfExist, %a_scriptdir%\images\image_%get_product_name%.png
	{
		msgbox, 4,, A picture already exists, delete?
		ifmsgbox yes
		{
			filedelete, %a_scriptdir%\images\image_%get_product_name%.png
		}
		ifmsgbox no
		{
			return
		}
	}
	IfExist, %a_scriptdir%\images\image_%get_product_name%.jpg
	{
		msgbox, 4,, A picture already exists, delete?
		ifmsgbox yes
		{
			filedelete, %a_scriptdir%\images\image_%get_product_name%.jpg
		}
		ifmsgbox no
		{
			return
		}
	}
	FileSelectFile, SelectedFile, 3, , Open a file, 
	if SelectedFile =
	{
    	return
	}
	else
	{
  		FileCopy, %selectedfile%, %a_scriptdir%\images\image_%get_product_name%.png
	}

	GuiControl, 10: , product_image, %a_scriptdir%\images\image_%get_product_name%.png
	gui, submit, nohide
	return
	BlockInput, off
}


create_new_invoice:
{
	BlockInput, on
	ifwinexist, New Invoice
	{
		msgbox, Another session is open!
		return
	}
	gui, 5: color, FFFFFF
	gui, 5: font, bold c s12, arial
	gui, 5: add, groupbox, yp+10 section w575 r25 center cgreen, New Invoice
	gui, 5: font,
	Gui, 5: Add, Picture, 0x8 xs+370 ys+25 w172 h-1 border, %a_scriptdir%\images\logo.png
	gui, 5: add, text, 0x8 h18 w100 right xs+5 yp+5, INVOICE NO.:  
	gui, 5: add, edit, 0x8 w225 x+8 yp-4 left vinvoiceno,
	gui, 5: add, text, 0x8 h18 w100 right xs+5 yp+30, CUSTOMER: 
	gui, 5: add, combobox, 0x8 w200 x+8 yp-4 left Hwndhcustomer vcustomer gincremental_combobox r10, %list_customer%
	;gui, 5: add, dropdownlist, 0x8 w200 x+8 yp-4 left vcustomer, %list_customer%
	gui, 5: add, button, 0x8 h23 w20 x+5 yp-1 gaddcustomer, +
	gui, 5: add, text, 0x8 h18 w100 right xs+5 yp+30, DATE:
	gui, 5: add, monthcal, x+8 vNewInvoiceDate, 
	gui, 5: add, text, xs+5 yp+140,
	gui, 5: add, text, xs+10 yp+35 w550 h2 0x10 ;Horizontal Line > Black
	gui, 5: add, text, 0x8 h18 w100 xs+15 yp+15 center, BARCODE
	gui, 5: add, text, 0x8 h18 w200 x+8 center, ITEM DESCRIPTION
	gui, 5: add, text, 0x8 h18 w50 x+8 center, QTY
	gui, 5: add, text, 0x8 h18 w50 x+8 center, PRICE
	gui, 5: add, text, 0x8 h18 w50 x+8 center, TOTAL
	gui, 9: -Caption +border
	Gui, 9: Add, text, w250 h18, Creating New Invoice...
	Gui, 9: Add, Progress, horizontal w250 h18 yp+15 vMyProgress border
	Gui, 9: Show, noactivate, 
	loop % 15
	{
		gui, 5: add, edit, 0x8 w100 xs+15 yp+23 center vbarcode%a_index% gbarcode, 
		gui, 5: add, dropdownlist, w200 x+8 left vitemdescription%a_index% gLoadProduct, %list_product%
		gui, 5: add, edit, 0x8 h21 w50 x+8 center vQuantity%a_index% gQuantity%a_index%,
		gui, 5: add, edit, 0x8 h21 w50 x+8 right vPrice%a_index% gPrice%a_index%, 
		gui, 5: add, edit, 0x8 h21 w50 x+8 right vTotal%a_index%, 
		gui, 5: font, s13
		gui, 5: add, edit, 0x8 h21 w50 x+8 center vTax%a_index% -E0x200,
		gui, 5: font
		GuiControl, 9: , MyProgress, +10 
	}
	gui, 9: destroy
	gui, 5: font, verdana s10
	gui, 5: add, text, 0x8 w420 xs+5 yp+26 right, SUBTOTAL:
	gui, 5: add, text, 0x8 w69 x+5 right vSubTotal, $0.00
	gui, 5: add, text, 0x8 w420 xs+5 yp+20 right, TAX: 
	gui, 5: add, text, 0x8 w69 x+5 right vTaxTotal, $0.00
	gui, 5: add, text, 0x8 w420 xs+5 yp+20 right, TOTAL: 
	gui, 5: add, text, 0x8 w69 x+5 right vGrandTotal, $0.00
	gui, 5: font,
	gui, 5: add, picture, xp-415 yp-36 w308 h80 vsignature border, 
	gui, 5: add, button, 0x8 h23 w308 xs+15	yp+66 center gget_signature border, SIGNATURE
	gui, 5: add, button, 0x8 h35 w105 x+10 yp-12 center gsave_invoice border, SAVE
	gui, 5: add, button, 0x8 h35 w110 x+10 center gbutton_checkout vbuttoncheckout border, CHECKOUT >>
	winminimize, Gulf Bay Marine
	gui, 5: show, noactivate, New Invoice
	WinSet, Transparent, Off, New Invoice
	gosub, ^+F
	ControlFocus, edit1, New Invoice
	winactivate, New Invoice
	return
	BlockInput, off
}

addcustomer:
{
	BlockInput, on
	InputBox, customername, Add Customer, Please enter the customer's name:, , 250, 125
	Loop, read, %a_scriptdir%\data\customers.csv
	{
	    LineNumberForItem = %A_Index%
	    Loop, parse, A_LoopReadLine, CSV
	    {
	    	if a_loopreadline = %customername% OR customername = 
	    	{
				msgbox This customer already exists or the input was empty.
				return
	    	}
	    }
	}
	fileappend,%customername%`,`,`,`,`,`,`,`n, %a_scriptdir%\data\customers.csv
	file_path = %a_scriptdir%\data\customers.csv
	func_sort_file(file_path)
	gosub, sub_load_listview_customers
	ifwinexist, New Invoice
	{
		gui, 5: destroy
		gui, 5: destroy
		gosub, create_new_invoice
	}
	return
	BlockInput, off
}

StartNewInvoice:
{
	BlockInput, on
	gosub, sub_clear_invoice
	gosub, 4guiclose
	return
	BlockInput, off
}

list_view_invoice:
{
	BlockInput, on
	ifwinexist, Edit Invoice
	{
		msgbox, Another session is open!
		return
	}
	gosub, sub_clear_invoice
	if A_GuiEvent = doubleclick
	{
		gui, listview, listviewinvoices
		LV_GetText(getdate, A_EventInfo, 1)
		LV_GetText(getinvoiceno, A_EventInfo, 2)
		LV_GetText(gettotalamount, A_EventInfo, 3)
		gui, submit, nohide
	}
	gosub, 4guiclose
	gui, 6: color, FFFFFF
	gui, 6: font, bold c s12, arial
	gui, 6: add, groupbox, yp+10 section w575 r25 center cred, Edit Invoice
	gui, 6: font,
	gui, 6: Add, Picture, 0x8 xs+370 ys+25 w172 h-1 border, %a_scriptdir%\images\logo.png
	gui, 6: add, text, 0x8 h18 w100 right xs+5 yp+5, INVOICE NO.:  
	gui, 6: add, edit, 0x8 w225 x+8 yp-4 left vinvoiceno,
	guicontrol, 6: , invoiceno, %getinvoiceno%
	gui, 6: add, text, 0x8 h18 w100 right xs+5 yp+30, CUSTOMER:  
	gui, 6: add, combobox, 0x8 w225 x+8 yp-4 left Hwndhcustomer vcustomer gincremental_combobox r10, %list_customer%
	;gui, 6: add, dropdownlist, 0x8 w225 x+8 yp-4 left vcustomer, %list_customer%
	filereadline, customer, %a_scriptdir%\statements\%customer%\%rowtext1%.csv, 1
	find_this = %customer%
	Loop, read, %a_scriptdir%\data\customers.csv
	{
	    LineNumberForItem = %A_Index%
	    Loop, parse, A_LoopReadLine, CSV
	    {
	    	if a_loopfield = %customer%
	    	{
	        	guicontrol, 6: choose, customer, %LineNumberForItem%
	    	}
	    }
	}
	gui, 6: add, text, 0x8 h18 w100 right xs+5 yp+30, DATE:
	gui, 6: add, monthcal, x+8 vNewInvoiceDate, 
	guicontrol, 6: , newinvoicedate, %getdate%
	gui, 6: add, text, xs+5 yp+140,
	gui, 6: add, text, xs+10 yp+35 w550 h2 0x10 ;Horizontal Line > Black
	gui, 6: add, text, 0x8 h18 w100 xs+15 yp+15 center, BARCODE
	gui, 6: add, text, 0x8 h18 w200 x+8 center, ITEM DESCRIPTION
	gui, 6: add, text, 0x8 h18 w50 x+8 center, QTY
	gui, 6: add, text, 0x8 h18 w50 x+8 center, PRICE
	gui, 6: add, text, 0x8 h18 w50 x+8 center, TOTAL
	gui, 9: -Caption +border
	Gui, 9: Add, text, w250 h18, Opening Invoice...
	Gui, 9: Add, Progress, horizontal w250 h18 yp+15 vMyProgress border
	Gui, 9: Show, noactivate, 
	loop % 15
	{
		gui, 6: add, edit, 0x8 w100 xs+15 yp+23 center vbarcode%a_index% gbarcode, 
		gui, 6: add, dropdownlist, w200 x+8 left vitemdescription%a_index% gLoadProduct, %list_product%
		gui, 6: add, edit, 0x8 h21 w50 x+8 center vQuantity%a_index% gQuantity%a_index%, 
		gui, 6: add, edit, 0x8 h21 w50 x+8 right vPrice%a_index% gprice%a_index%, 
		gui, 6: add, edit, 0x8 h21 w50 x+8 right vTotal%a_index%, 
		gui, 6: font, s13
		gui, 6: add, edit, 0x8 h21 w50 x+8 center vTax%a_index% -E0x200, 
		gui, 6: font,
		GuiControl, 9: , MyProgress, +10 
	}
	Gui, 9: destroy
	gui, 6: font, verdana s10
	gui, 6: add, text, 0x8 w420 xs+5 yp+26 right, SUBTOTAL:
	gui, 6: add, text, 0x8 w69 x+5 right vSubTotal, $0.00
	gui, 6: add, text, 0x8 w420 xs+5 yp+20 right, TAX: 
	gui, 6: add, text, 0x8 w69 x+5 right vTaxTotal, $0.00
	gui, 6: add, text, 0x8 w420 xs+5 yp+20 right, TOTAL: 
	gui, 6: add, text, 0x8 w69 x+5 right vGrandTotal, $0.00
	gui, 6: font,
	gui, 6: add, picture, xp-415 yp-36 w308 h80 vsignature border,
	gui, 6: add, button, h23 w308 xs+15	yp+66 center gget_signature border, SIGNATURE
	gui, 6: add, button, h35 w105 x+10 yp-12 center gsave_invoice border, SAVE
	invoice_length := strlen(getinvoiceno)
	if (invoice_length < 8)
	{
		gui, 6: add, button, 0x8 h35 w110 x+10 center gbutton_checkout vbuttoncheckout border, CHECKOUT >>
	}
	guicontrol, 6: , invoiceno, %getinvoiceno%
	Loop, read, %a_scriptdir%\statements\%customer%\%getinvoiceno%.csv
	{
	    LineNumber := A_Index - 2 ; skips first line of invoice that contains the customer name and date

	    Loop, parse, A_LoopReadLine, CSV
	    {
	    	if (a_index = 1)
	    	{
	    		guicontrol, 6: ,barcode%LineNumber%,%a_loopfield%
	    	}
	    	if (a_index = 2)
	    	{
	    		find_this = %a_loopfield%
	    		
	    		Loop, read, %a_scriptdir%\data\products.csv
				{
				    LineNumberForItem = %A_Index%

				    Loop, parse, A_LoopReadLine, CSV
				    {
				    	if a_loopreadline contains %find_this%
				    	{
				        	guicontrol, 6: choose, itemdescription%linenumber%, %LineNumberForItem%
				    	}
				    }
				}
	    	}
	    	if (a_index = 3)
	    	{
	    		guicontrol, 6: ,quantity%LineNumber%,%a_loopfield%
	    	}
	    	if (a_index = 4)
	    	{
	    		guicontrol, 6: ,price%LineNumber%,%a_loopfield%
	    	}
	    	if (a_index = 5)
	    	{
	    		reformat_total := round(a_loopfield, 2)
	    		guicontrol, 6: ,total%LineNumber%,%reformat_total%
	    	}
	    	if (a_index = 6)
	    	{
	    		guicontrol, 6: ,tax%LineNumber%,%a_loopfield%
	    	}
	    }
	}
	
	
	
	gui, submit, nohide
	guicontrol, 6: , signature, %a_scriptdir%\data\signatures\%customer%_%invoiceno%.png
	winminimize, Gulf Bay Marine
	gui, 6: show, noactivate, Edit Invoice
	WinSet, Transparent, Off, Edit Invoice
	gosub, ^+F
	ControlFocus, edit1, Edit Invoice
	winactivate, Edit Invoice
	return
	BlockInput, off
}

list_view_customers:
{
	BlockInput, on
	list_invoices = 
	guicontrol, , fishhouse, 
	guicontrol, , credit,
	guicontrol, , address,
	guicontrol, , phone, 
	guicontrol, , email,
	guicontrol, , taxexempt,
	guicontrol, , netterm, 

	if A_GuiEvent = doubleclick
	{
		session_invoiceno = 
	}		
	if session_customer !=
	{
		RowText1 = %session_customer%
	}
	gui, listview, listviewcustomers
	LV_GetText(RowText1, A_EventInfo, 1)
	session_customer := RowText1
	gui, submit, nohide
	gui, 1: default
	gui, 1: listview, listviewinvoices
	lv_delete()
	guicontrol, , customer, %RowText1%
	Loop, read, %a_scriptdir%\data\customers.csv
	{
	    LineNumberForItem = %A_Index% 
	    Loop, parse, A_LoopReadLine, CSV
	    {
	    	if a_loopreadline contains %rowtext1%
	    	{
	    		if (a_index = 2 AND a_loopfield != "")
		    	{
		    		guicontrol, , fishhouse, %a_loopfield%
		    	}
	    		if (a_index = 3 AND a_loopfield != "")
		    	{
		    		guicontrol, , credit, %a_loopfield%
		    	}
	    		if (a_index = 4 AND a_loopfield != "")
		    	{
		    		guicontrol, , address, %a_loopfield%
		    	}
		    	if (a_index = 5 AND a_loopfield != "")
		    	{
		    		guicontrol, , phone, %a_loopfield%
		    	}
		    	if (a_index = 6 AND a_loopfield != "")
		    	{
		    		guicontrol, , email, %a_loopfield%
		    	}
		    	if (a_index = 7 AND a_loopfield != "")
		    	{ 
		    		guicontrol, , taxexempt, %a_loopfield%
		    	}
		    	if (a_index = 8 AND a_loopfield != "")
		    	{
		    		guicontrol, , netterm, %a_loopfield%
		    	}
	    	}
	    }
	}
	gui, submit, nohide
	calc_total_amount := 0

	gui, 9: -Caption +border
	Gui, 9: Add, text, w250 h18, Saving Data...
	Gui, 9: Add, Progress, Range0-1188 horizontal w250 h18 yp+15 vMyProgress border
	Gui, 9: Show, noactivate, 

	loop, files, %a_scriptdir%\statements\%customer%\*.*,
	{
		date =
		filename =
		total_amount =
		filereadline, date%a_index%, %a_loopfilefullpath%, 2
		date := date%a_index%
		Loop, read, %a_scriptdir%\data\customers.csv
		{
		    LineNumberForItem = %A_Index%
		    Loop, parse, A_LoopReadLine, CSV
		    {
		    	if a_loopreadline contains %find_this%
		    	{
		        	guicontrol, 6: choose, customer, %LineNumberForItem%
		    	}
		    }
		}

		filename = %a_loopfilename%
		stringreplace, filename, filename, .csv, , all
		;guicontrol, , invoiceno%a_index%, %filename%
		filereadline, total_amount, %a_loopfilefullpath%, 19
		total_amount_num := round(total_amount, 2)
		total_amount = $%total_amount_num%
		gui, 1: default
		gui, 1: listview, listviewinvoices
		if a_loopfilename contains csv 
		{
			lv_add(, date, filename, total_amount)
			list_invoices = %list_invoices%%date%,%filename%,%total_amount%|
		}
		LV_ModifyCol(1, "100 SortDesc")
		LV_ModifyCol(2, "345")
		LV_ModifyCol(3, "100")
		LV_ModifyCol(4, "40")
		length_filename := strlen(filename)
		paid = paid
		if filename not contains %paid%
		{
			calc_total_amount := calc_total_amount + total_amount_num
		}

	}
	gui, 9: destroy
	if session_customer !=
	{
		Loop, % LV_GetCount()
		{
			LV_GetText(filename, a_index, 2)
			if filename = %session_invoiceno%
			{
				rownumber = %a_index%
			}
		}
		LV_Modify(rownumber, "Select")
	}
	reformatted_calc_total_amount := round(calc_total_amount, 2)
	guicontrol, , profile_total, $%reformatted_calc_total_amount%

	YearChart =
	(
	%reformatted_calc_total_amount%
	)

	pToken := Gdip_Startup()
	BarChart(YearChart, "YearPic", 1, "Total Amount Due", Skin)
	Gdip_Shutdown(pToken)

	pToken := Gdip_Startup()
	BarChart(YearChart, "YearPic1", 1, "Total Amount Due", Skin)
	Gdip_Shutdown(pToken)
	return
	BlockInput, off
}

ListViewRecentCustomers:
{
	BlockInput, on
	if A_GuiEvent = doubleclick
	{
	    LV_GetText(RecentCustomer, A_EventInfo)  ; Get the text from the row's first field.
		guicontrol, , customer, %RecentCustomer%
	    return
	}
	BlockInput, off
}

save_recent_customer:
{
	BlockInput, on
	gui, submit, nohide
	fileappend,%customer%, %a_scriptdir%\recent_customers.csv
	return
	BlockInput, off
}

sub_clear_invoice:
{
	BlockInput, on
	loop % 15
	{ 
		guicontrol, 1: , invoiceno, 
		guicontrol, 1: , Date%a_index%, 
		guicontrol, 1: choose, itemdescription%a_index%, 0
		guicontrol, 1: , Quantity%a_index%,
		guicontrol, 1: , Price%a_index%,
		guicontrol, 1: , Total%a_index%,
	}
	return
	BlockInput, off
}

sub_update_grandtotal:
{
	BlockInput, on
	if (total1 == "")
	{
		total1 := 0 
	}
	if (total2 == "")
	{
		total2 := 0
	}
	if (total3 == "")
	{
		total3 := 0
	}
	if (total4 == "")
	{
		total4 := 0
	}
	if (total5 == "")
	{
		total5 := 0
	}
	if (total6 == "")
	{
		total6 := 0
	}
	if (total7 == "")
	{
		total7 := 0
	}
	if (total8 == "")
	{
		total8 := 0
	}
	if (total9 == "")
	{
		total9 := 0 
	}
	if (total10 == "")
	{
		total10 := 0 
	}
	if (total11 == "")
	{
		total11 := 0
	}
	if (total12 == "")
	{
		total12 := 0
	}
	if (total13 == "")
	{
		total13 := 0
	}
	if (total14 == "")
	{
		total14 := 0
	}
	if (total15 == "")
	{
		total15 := 0
	}

	
	;GuiControlGet, OutputVar, FocusV 
	;stringtrimleft, row, outputvar, 7
	tax_total := 0

	loop % 15
	{
		guicontrolget, tax_%a_index%, , tax%a_index%
		if tax_%a_index% 
		{
			total%a_index% := total%a_index%
			tax_item := round(total%a_index% * .0825, 2)
			tax_total += tax_item
		}
	}
	
	sub_total := total1 + total2 + total3 + total4 + total5 + total6 + total7 + total8 + total9 + total10 + total11 + total12 + total13 + total14 + total15
	
	grand_total := total1 + total2 + total3 + total4 + total5 + total6 + total7 + total8 + total9 + total10 + total11 + total12 + total13 + total14 + total15 + tax_total
	
	gui, submit, nohide

	sub_total := round(sub_total, 2)
	tax_total := round(tax_total, 2)
	grand_total := round(grand_total, 2)

	guicontrol, , subtotal, $%sub_total%
	guicontrol, 5: , subtotal, $%sub_total%
	guicontrol, 6: , subtotal, $%sub_total%

	guicontrol, , taxtotal, $%tax_total%
	guicontrol, 5: , taxtotal, $%tax_total%
	guicontrol, 6: , taxtotal, $%tax_total%

	guicontrol, , grandtotal, $%grand_total%
	guicontrol, 5: , grandtotal, $%grand_total%
	guicontrol, 6: , grandtotal, $%grand_total%

	return
	BlockInput, off
}

func_convert_dollars(amount)
{
	BlockInput, on
	amount := round(amount, 2)
	stringlen, len, amount
	comma_pos := len - 6
	if(comma_pos > 0)
	{
		stringleft, left, amount, comma_pos
		stringright, right, amount, 6
		amount := "$" . left . "," . right
	}
	return %amount%
	BlockInput, off
}
save_invoice:
{
	BlockInput, off
	gui, submit, nohide
	if (invoiceno = "")
	{
		msgbox Invalid Invoice No.!
		return
	}	
	loop, parse, list_invoices, |
	{
		if a_loopfield contains %invoiceno%
		{
			msgbox, 4, Duplicate Invoice, This invoice already exists. Are you sure you want to overwrite it?
			ifmsgbox Yes
			{
				continue
			}
			ifmsgbox No
			{
				return
			}
		}
	}
	if (customer = "")
	{
		msgbox Please select a customer!
		return
	}	
	ifnotexist, %a_scriptdir%\data\signatures\%customer%_%invoiceno%.png
	{

		if invoiceno not contains PAID
		{
			msgbox, 0x10, NO SIGNATURE DETECTED!, Signature Required!
			return
		}	
	}

	ifexist, %a_scriptdir%\statements\%customer%\%invoiceno%.csv
	{
		Loop, read, %a_scriptdir%\statements\%customer%\%getinvoiceno%.csv
		{
		    LineNumber := A_Index - 2 ; skips first line of invoice that contains the customer name and date
		    Loop, parse, A_LoopReadLine, `,
		    {
		    	if (a_index = 1)
		    	{
		    		try
		    		{
		    			old_barcode%linenumber% := a_loopfield
		    		}
		    	}
		    	if (a_index = 3)
		    	{
		    		try
		    		{
		    			old_quantity%linenumber% := a_loopfield
		    		}
		    	}

		    }
		}
	}
	loop % 15
	{
		if(total%a_index% = 0)
		{
			guicontrol, 6:, total%a_index%, 
		}
	}
	gui, submit, nohide

	FormatTime, TimeString, %NewInvoiceDate% T12, yyyyMMdd
	FormatTime, statement_month, %NewInvoiceDate%, yyyyMM

	filedelete, %a_scriptdir%\statements\%customer%\%invoiceno%.csv
	
	FileCreateDir, %a_scriptdir%\statements\%customer%\

	row1 = %barcode1%,%itemdescription1%,%quantity1%,%price1%,%total1%,%tax1%
	row2 = %barcode2%,%itemdescription2%,%quantity2%,%price2%,%total2%,%tax2%
	row3 = %barcode3%,%itemdescription3%,%quantity3%,%price3%,%total3%,%tax3%
	row4 = %barcode4%,%itemdescription4%,%quantity4%,%price4%,%total4%,%tax4%
	row5 = %barcode5%,%itemdescription5%,%quantity5%,%price5%,%total5%,%tax5%
	row6 = %barcode6%,%itemdescription6%,%quantity6%,%price6%,%total6%,%tax6%
	row7 = %barcode7%,%itemdescription7%,%quantity7%,%price7%,%total7%,%tax7%
	row8 = %barcode8%,%itemdescription8%,%quantity8%,%price8%,%total8%,%tax8%
	row9 = %barcode9%,%itemdescription9%,%quantity9%,%price9%,%total9%,%tax9%
	row10 = %barcode10%,%itemdescription10%,%quantity10%,%price10%,%total10%,%tax10%
	row11 = %barcode11%,%itemdescription11%,%quantity11%,%price11%,%total11%,%tax11%
	row12 = %barcode12%,%itemdescription12%,%quantity12%,%price12%,%total12%,%tax12%
	row13 = %barcode13%,%itemdescription13%,%quantity13%,%price13%,%total13%,%tax13%
	row14 = %barcode14%,%itemdescription14%,%quantity14%,%price14%,%total14%,%tax14%
	row15 = %barcode15%,%itemdescription15%,%quantity15%,%price15%,%total15%,%tax15%

	fileappend,%customer%`n%NewInvoiceDate%,%a_scriptdir%\statements\%customer%\%invoiceno%.csv
	fileappend,`n%row1%,%a_scriptdir%\statements\%customer%\%invoiceno%.csv
	fileappend,`n%row2%,%a_scriptdir%\statements\%customer%\%invoiceno%.csv
	fileappend,`n%row3%,%a_scriptdir%\statements\%customer%\%invoiceno%.csv
	fileappend,`n%row4%,%a_scriptdir%\statements\%customer%\%invoiceno%.csv
	fileappend,`n%row5%,%a_scriptdir%\statements\%customer%\%invoiceno%.csv
	fileappend,`n%row6%,%a_scriptdir%\statements\%customer%\%invoiceno%.csv
	fileappend,`n%row7%,%a_scriptdir%\statements\%customer%\%invoiceno%.csv
	fileappend,`n%row8%,%a_scriptdir%\statements\%customer%\%invoiceno%.csv
	fileappend,`n%row9%,%a_scriptdir%\statements\%customer%\%invoiceno%.csv
	fileappend,`n%row10%,%a_scriptdir%\statements\%customer%\%invoiceno%.csv
	fileappend,`n%row11%,%a_scriptdir%\statements\%customer%\%invoiceno%.csv
	fileappend,`n%row12%,%a_scriptdir%\statements\%customer%\%invoiceno%.csv
	fileappend,`n%row13%,%a_scriptdir%\statements\%customer%\%invoiceno%.csv
	fileappend,`n%row14%,%a_scriptdir%\statements\%customer%\%invoiceno%.csv
	fileappend,`n%row15%,%a_scriptdir%\statements\%customer%\%invoiceno%.csv
	fileappend,`n`n%grand_total%,%a_scriptdir%\statements\%customer%\%invoiceno%.csv
	
	mousemove, 300, 0, 0, R

	if invoiceno contains PAID
	{
		gui, 15: color, FFFFFF
		gui, 15: -sysmenu -caption +alwaysontop
		gui, 15: font, s110 bold
		gui, 15: add, text, cred center, PAID
		gui, 15: font,
		gui, 15: show, noactivate, WATERMARK
		WinSet, Transparent, 50, WATERMARK
	}
	
	Runwait, "%a_scriptdir%\IrfanView\i_view32.exe" /capture=2 /convert=%a_scriptdir%\statements\%customer%\%invoiceno%.png

	loop % 15
	{
		if barcode%a_index%
		{
			inventory_barcode := barcode%a_index%
			inventory_quantity := quantity%a_index%
			
			FileRead, contents, %a_scriptdir%\data\products.csv
			Loop, read, %a_scriptdir%\data\products.csv
			{
			    LineNumberForItem = %A_Index%
			    Loop, parse, A_LoopReadLine, `n
			    {
			    	loop, parse, a_loopfield, `,
			    	{
			    		var%a_index% = %a_loopfield%
			    	}
			    	if var1 contains %inventory_barcode%
			    	{
			    		line_to_delete = %a_loopreadline%
			    		inventory_item := var2
			    		inventory_price := var3
			    		inventory_cost := var4
			    		inventory_quantity := var5 - inventory_quantity 
			    		ifexist, %a_scriptdir%\statements\%customer%\%invoiceno%.csv
			    		{
			    			loop % 15
			    			{
			    				; INVENTORY UPDATES CORRECT FOR ONE UNIQUE BARCODE LINE
			    				if(inventory_barcode = old_barcode%a_index%)
			    				{
			    					inventory_quantity := inventory_quantity + old_quantity%a_index%
			    				}
			    			}
			    			
			    		}
			    		inventory_capacity := var6
			    		inventory_tax := var7
			    		inventory_vendor := var8	
			    	}
			    }
			}

			new_line = %inventory_barcode%,%inventory_item%,%inventory_price%,%inventory_cost%,%inventory_quantity%,%inventory_capacity%,%inventory_tax%,%inventory_vendor%
			StringReplace, new_contents, contents, %line_to_delete%, %new_line%, all
			StringReplace, new_contents, new_contents, $, , all
			fileappend, %new_contents%, %a_scriptdir%\data\temp_products.csv

			filepath = 
			file_path = %a_scriptdir%\data\temp_products.csv
			func_sort_file(file_path)

			Filedelete, %a_scriptdir%\data\products.csv
			FileMove, %a_scriptdir%\data\temp_products.csv, %a_scriptdir%\data\products.csv
			gosub, sub_load_listview_products
			gosub, sub_load_listview_search_products

			; CLEAR MEMORY
			inventory_barcode :=
			inventory_item := 
    		inventory_price := 
    		inventory_cost := 
    		inventory_quantity := 
    		inventory_capacity :=
    		inventory_tax :=
    		inventory_vendor := 
    		old_quantity :=
		}
	}

	gui, 15: destroy

	session_customer = %customer%
	session_invoiceno = %invoiceno%
	
	gosub, list_view_customers
	gosub, sub_load_listview_tax_statements
	gosub, sub_load_listview_customers
	gui, 5: destroy
	gui, 6: destroy
	gui, 14: destroy
	winactivate, Gulf Bay Marine
	return
	BlockInput, off
}

button_checkout:
{
	BlockInput, on
	gui, submit, nohide
	if (invoiceno = "")
	{
		msgbox Invalid Invoice No.!
		return
	}
	loop, parse, list_invoices, |
	{
		if a_loopfield contains %invoiceno%
		{
			msgbox, 4, Duplicate Invoice, This invoice already exists. Are you sure you want to overwrite it?
			ifmsgbox Yes
			{
				continue
			}
			ifmsgbox No
			{
				return
			}
		}
	}	
	if (customer = "")
	{
		msgbox Please select a customer!
		return
	}	
	loop % 15
	{
		if(total%a_index% = 0)
		{
			guicontrol, 6:, total%a_index%, 
		}
	}
	
	gui, submit, nohide

	FormatTime, TimeString, %NewInvoiceDate% T12, yyyyMMdd

	filedelete, %a_scriptdir%\statements\%customer%\%invoiceno%.csv
	filedelete, %a_scriptdir%\statements\%customer%\%invoiceno%-PAID.csv
	
	FileCreateDir, %a_scriptdir%\statements\%customer%\

	row1 = %barcode1%,%itemdescription1%,%quantity1%,%price1%,%total1%,%tax1%
	row2 = %barcode2%,%itemdescription2%,%quantity2%,%price2%,%total2%,%tax2%
	row3 = %barcode3%,%itemdescription3%,%quantity3%,%price3%,%total3%,%tax3%
	row4 = %barcode4%,%itemdescription4%,%quantity4%,%price4%,%total4%,%tax4%
	row5 = %barcode5%,%itemdescription5%,%quantity5%,%price5%,%total5%,%tax5%
	row6 = %barcode6%,%itemdescription6%,%quantity6%,%price6%,%total6%,%tax6%
	row7 = %barcode7%,%itemdescription7%,%quantity7%,%price7%,%total7%,%tax7%
	row8 = %barcode8%,%itemdescription8%,%quantity8%,%price8%,%total8%,%tax8%
	row9 = %barcode9%,%itemdescription9%,%quantity9%,%price9%,%total9%,%tax9%
	row10 = %barcode10%,%itemdescription10%,%quantity10%,%price10%,%total10%,%tax10%
	row11 = %barcode11%,%itemdescription11%,%quantity11%,%price11%,%total11%,%tax11%
	row12 = %barcode12%,%itemdescription12%,%quantity12%,%price12%,%total12%,%tax12%
	row13 = %barcode13%,%itemdescription13%,%quantity13%,%price13%,%total13%,%tax13%
	row14 = %barcode14%,%itemdescription14%,%quantity14%,%price14%,%total14%,%tax14%
	row15 = %barcode15%,%itemdescription15%,%quantity15%,%price15%,%total15%,%tax15%

	fileappend,%customer%`n%NewInvoiceDate%, %a_scriptdir%\statements\%customer%\%invoiceno%-PAID.csv
	fileappend,`n%row1%, %a_scriptdir%\statements\%customer%\%invoiceno%-PAID.csv
	fileappend,`n%row2%, %a_scriptdir%\statements\%customer%\%invoiceno%-PAID.csv
	fileappend,`n%row3%, %a_scriptdir%\statements\%customer%\%invoiceno%-PAID.csv
	fileappend,`n%row4%, %a_scriptdir%\statements\%customer%\%invoiceno%-PAID.csv
	fileappend,`n%row5%, %a_scriptdir%\statements\%customer%\%invoiceno%-PAID.csv
	fileappend,`n%row6%, %a_scriptdir%\statements\%customer%\%invoiceno%-PAID.csv
	fileappend,`n%row7%, %a_scriptdir%\statements\%customer%\%invoiceno%-PAID.csv
	fileappend,`n%row8%, %a_scriptdir%\statements\%customer%\%invoiceno%-PAID.csv
	fileappend,`n%row9%, %a_scriptdir%\statements\%customer%\%invoiceno%-PAID.csv
	fileappend,`n%row10%, %a_scriptdir%\statements\%customer%\%invoiceno%-PAID.csv
	fileappend,`n%row11%, %a_scriptdir%\statements\%customer%\%invoiceno%-PAID.csv
	fileappend,`n%row12%, %a_scriptdir%\statements\%customer%\%invoiceno%-PAID.csv
	fileappend,`n%row13%, %a_scriptdir%\statements\%customer%\%invoiceno%-PAID.csv
	fileappend,`n%row14%, %a_scriptdir%\statements\%customer%\%invoiceno%-PAID.csv
	fileappend,`n%row15%, %a_scriptdir%\statements\%customer%\%invoiceno%-PAID.csv
	fileappend,`n`n%grand_total%, %a_scriptdir%\statements\%customer%\%invoiceno%-PAID.csv
	;filedelete, %a_scriptdir%\data\counter_invoice.txt
	;invoiceno := invoiceno + 1
	;fileappend,%invoiceno%, %a_scriptdir%\data\counter_invoice.txt


	fileread, invoice_at_checkout, %a_scriptdir%\statements\%customer%\%invoiceno%-PAID.csv
	ControlFocus, edit77, New Invoice
	ControlFocus, edit77, Edit Invoice
	mousemove, 300, 0, 0, R

	gui, 15: color, FFFFFF
	gui, 15: -sysmenu -caption +alwaysontop
	gui, 15: font, s110 bold
	gui, 15: add, text, cred center, PAID
	gui, 15: font,
	gui, 15: show, noactivate, WATERMARK
	WinSet, Transparent, 50, WATERMARK

	Runwait, "%a_scriptdir%\IrfanView\i_view32.exe" /capture=2 /convert=%a_scriptdir%\statements\%customer%\%invoiceno%-PAID.png
  	Runwait, "%a_scriptdir%\IrfanView\i_view32.exe" "%a_scriptdir%\statements\%customer%\%invoiceno%-PAID.png" /print

  	loop % 15
	{
		if barcode%a_index%
		{
			inventory_barcode := barcode%a_index%
			inventory_quantity := quantity%a_index%
			
			FileRead, contents, %a_scriptdir%\data\products.csv
			Loop, read, %a_scriptdir%\data\products.csv
			{
			    LineNumberForItem = %A_Index%
			    Loop, parse, A_LoopReadLine, `n
			    {
			    	loop, parse, a_loopfield, `,
			    	{
			    		var%a_index% = %a_loopfield%
			    	}
			    	if var1 contains %inventory_barcode%
			    	{
			    		line_to_delete = %a_loopreadline%
			    		inventory_item := var2
			    		inventory_price := var3
			    		inventory_cost := var4
			    		inventory_quantity := var5 - inventory_quantity 
			    		ifexist, %a_scriptdir%\statements\%customer%\%invoiceno%.csv
			    		{
			    			loop % 15
			    			{
			    				; INVENTORY UPDATES CORRECT FOR ONE UNIQUE BARCODE LINE
			    				if(inventory_barcode = old_barcode%a_index%)
			    				{
			    					inventory_quantity := inventory_quantity + old_quantity%a_index%
			    				}
			    			}
			    			
			    		}
			    		inventory_capacity := var6
			    		inventory_tax := var7
			    		inventory_vendor := var8	
			    	}
			    }
			}

			new_line = %inventory_barcode%,%inventory_item%,%inventory_price%,%inventory_cost%,%inventory_quantity%,%inventory_capacity%,%inventory_tax%,%inventory_vendor%
			StringReplace, new_contents, contents, %line_to_delete%, %new_line%, all
			StringReplace, new_contents, new_contents, $, , all
			fileappend, %new_contents%, %a_scriptdir%\data\temp_products.csv

			filepath = 
			file_path = %a_scriptdir%\data\temp_products.csv
			func_sort_file(file_path)

			Filedelete, %a_scriptdir%\data\products.csv
			FileMove, %a_scriptdir%\data\temp_products.csv, %a_scriptdir%\data\products.csv
			gosub, sub_load_listview_products
			gosub, sub_load_listview_search_products

			; CLEAR MEMORY
			inventory_barcode :=
			inventory_item := 
    		inventory_price := 
    		inventory_cost := 
    		inventory_quantity := 
    		inventory_capacity :=
    		inventory_tax :=
    		inventory_vendor := 
    		old_quantity :=
		}
	}

  	gui, 15: destroy
	session_customer = %customer%
	session_invoiceno = %invoiceno%

  	gosub, list_view_customers
  	gosub, sub_load_listview_customers
  	gosub, sub_load_listview_tax_statements
  	gui, 5: destroy
	gui, 6: destroy
	gui, 14: destroy
	winactivate, Gulf Bay Marine
	return
	BlockInput, off
}

Print:
{
	BlockInput, on
	gui, submit, nohide
	Runwait, "%a_scriptdir%\IrfanView\i_view32.exe" "%a_scriptdir%\data\signatures\%invoiceno%.png" /print
	gui, 7: destroy
	return
	BlockInput, off
}

barcode:
{
	BlockInput, on
	gui, submit, nohide
	GuiControlGet, OutputVar, FocusV 
	stringtrimleft, row, outputvar, 7
	guicontrolget, barcode, , %outputvar%

	line_number := 1

	barcode_length := strlen(barcode)

	if(barcode_length = 0)
	{
		guicontrol, choose, itemdescription%row%, 0
		guicontrol, , quantity%row%,
		guicontrol, , price%row%,
		guicontrol, , total%row%,
		gui, submit, nohide
	}
	if(barcode_length = 5)
	{
		loop, read, %a_scriptdir%\data\products.csv
		{
			if a_loopreadline contains %barcode%
			{
				loop, parse, a_loopreadline, `,
				{
					if a_index = 1
					{
						guicontrol, choose, itemdescription%row%, %line_number%
					}
					if a_index = 3
					{
						reformat_price := round(a_loopfield, 2)
						guicontrol, , price%row%, %reformat_price%
					}
					if a_index = 5
					{
						guicontrol, , quantity%row%, 1
					}
					if a_index = 6
					{
						tax_ = %a_loopfield%
					}
				}
			}
			line_number += 1
		}
	}

	total_ := round(price%row%*quantity%row%,2)
	guicontrol, , total%row%, %total_%
	if (tax_ = 1)
	{
		guicontrol, , tax%row%, TAX
	}
	else
	{
		guicontrol, , tax%row%, 
	}
	gui, submit, nohide
	gosub, sub_update_grandtotal

	return
	BlockInput, off
}

barcode2:
{
	BlockInput, on
	gui, submit, nohide
	; find barcode of the itemdescription2
	line_number := 1
	loop, read, %a_scriptdir%\data\products.csv
	{
		if a_loopreadline contains %barcode2%
		{
			loop, parse, a_loopreadline, `,
			{
				if a_index = 1
				{
					guicontrol, choose, itemdescription2, %line_number%
				}
				if a_index = 3
				{
					reformat_price := round(a_loopfield, 2)
					guicontrol, , price2, %reformat_price%
				}
				if a_index = 4
				{
					guicontrol, , quantity2, 1
				}
			}
		}
		
		line_number += 1
	}
	total_ := round(price2*quantity2,2)
	guicontrol, , total2, %total_%
	gui, submit, nohide
	gosub, sub_update_grandtotal
	return
	BlockInput, off
}

barcode3:
{
	gui, submit, nohide
	; find barcode of the itemdescription3
	line_number := 1
	loop, read, %a_scriptdir%\data\products.csv
	{
		if a_loopreadline contains %barcode3%
		{
			loop, parse, a_loopreadline, `,
			{
				if a_index = 1
				{
					guicontrol, choose, itemdescription3, %line_number%
				}
				if a_index = 3
				{
					reformat_price := round(a_loopfield, 2)
					guicontrol, , price3, %reformat_price%
				}
				if a_index = 4
				{
					guicontrol, , quantity3, 1
				}
			}
		}
		
		line_number += 1
	}
	total_ := round(price3*quantity3,2)
	guicontrol, , total3, %total_%
	gui, submit, nohide
	gosub, sub_update_grandtotal
	return
}

barcode4:
{
	gui, submit, nohide
	; find barcode of the itemdescription4
	line_number := 1
	loop, read, %a_scriptdir%\data\products.csv
	{
		if a_loopreadline contains %barcode4%
		{
			loop, parse, a_loopreadline, `,
			{
				if a_index = 1
				{
					guicontrol, choose, itemdescription4, %line_number%
				}
				if a_index = 3
				{
					reformat_price := round(a_loopfield, 2)
					guicontrol, , price4, %reformat_price%
				}
				if a_index = 4
				{
					guicontrol, , quantity4, 1
				}
			}
		}
		
		line_number += 1
	}
	total_ := round(price4*quantity4,2)
	guicontrol, , total4, %total_%
	gui, submit, nohide
	gosub, sub_update_grandtotal
	return
}

barcode5:
{
	gui, submit, nohide
	; find barcode of the itemdescription5
	line_number := 1
	loop, read, %a_scriptdir%\data\products.csv
	{
		if a_loopreadline contains %barcode5%
		{
			loop, parse, a_loopreadline, `,
			{
				if a_index = 1
				{
					guicontrol, choose, itemdescription5, %line_number%
				}
				if a_index = 3
				{
					reformat_price := round(a_loopfield, 2)
					guicontrol, , price5, %reformat_price%
				}
				if a_index = 4
				{
					guicontrol, , quantity5, 1
				}
			}
		}
		
		line_number += 1
	}
	total_ := round(price5*quantity5,2)
	guicontrol, , total5, %total_%
	gui, submit, nohide
	gosub, sub_update_grandtotal
	return
}

barcode6:
{
	gui, submit, nohide
	; find barcode of the itemdescription6
	line_number := 1
	loop, read, %a_scriptdir%\data\products.csv
	{
		if a_loopreadline contains %barcode6%
		{
			loop, parse, a_loopreadline, `,
			{
				if a_index = 1
				{
					guicontrol, choose, itemdescription6, %line_number%
				}
				if a_index = 3
				{
					reformat_price := round(a_loopfield, 2)
					guicontrol, , price6, %reformat_price%
				}
				if a_index = 4
				{
					guicontrol, , quantity6, 1
				}
			}
		}
		
		line_number += 1
	}
	total_ := round(price6*quantity6,2)
	guicontrol, , total6, %total_%
	gui, submit, nohide
	gosub, sub_update_grandtotal
	return
}

barcode7:
{
	gui, submit, nohide
	; find barcode of the itemdescription7
	line_number := 1
	loop, read, %a_scriptdir%\data\products.csv
	{
		if a_loopreadline contains %barcode7%
		{
			loop, parse, a_loopreadline, `,
			{
				if a_index = 1
				{
					guicontrol, choose, itemdescription7, %line_number%
				}
				if a_index = 3
				{
					reformat_price := round(a_loopfield, 2)
					guicontrol, , price7, %reformat_price%
				}
				if a_index = 4
				{
					guicontrol, , quantity7, 1
				}
			}
		}
		
		line_number += 1
	}
	total_ := round(price7*quantity7,2)
	guicontrol, , total7, %total_%
	gui, submit, nohide
	gosub, sub_update_grandtotal
	return
}

barcode8:
{
	gui, submit, nohide
	; find barcode of the itemdescription8
	line_number := 1
	loop, read, %a_scriptdir%\data\products.csv
	{
		if a_loopreadline contains %barcode8%
		{
			loop, parse, a_loopreadline, `,
			{
				if a_index = 1
				{
					guicontrol, choose, itemdescription8, %line_number%
				}
				if a_index = 3
				{
					reformat_price := round(a_loopfield, 2)
					guicontrol, , price8, %reformat_price%
				}
				if a_index = 4
				{
					guicontrol, , quantity8, 1
				}
			}
		}
		
		line_number += 1
	}
	total_ := round(price8*quantity8,2)
	guicontrol, , total8, %total_%
	gui, submit, nohide
	gosub, sub_update_grandtotal
	return
}

barcode9:
{
	gui, submit, nohide
	; find barcode of the itemdescription9
	line_number := 1
	loop, read, %a_scriptdir%\data\products.csv
	{
		if a_loopreadline contains %barcode9%
		{
			loop, parse, a_loopreadline, `,
			{
				if a_index = 1
				{
					guicontrol, choose, itemdescription9, %line_number%
				}
				if a_index = 3
				{
					reformat_price := round(a_loopfield, 2)
					guicontrol, , price9, %reformat_price%
				}
				if a_index = 4
				{
					guicontrol, , quantity9, 1
				}
			}
		}
		
		line_number += 1
	}
	total_ := round(price9*quantity9,2)
	guicontrol, , total9, %total_%
	gui, submit, nohide
	gosub, sub_update_grandtotal
	return
}

barcode10:
{
	gui, submit, nohide
	; find barcode of the itemdescription10
	line_number := 1
	loop, read, %a_scriptdir%\data\products.csv
	{
		if a_loopreadline contains %barcode10%
		{
			loop, parse, a_loopreadline, `,
			{
				if a_index = 1
				{
					guicontrol, choose, itemdescription10, %line_number%
				}
				if a_index = 3
				{
					reformat_price := round(a_loopfield, 2)
					guicontrol, , price10, %reformat_price%
				}
				if a_index = 4
				{
					guicontrol, , quantity10, 1
				}
			}
		}
		
		line_number += 1
	}
	total_ := round(price10*quantity10,2)
	guicontrol, , total10, %total_%
	gui, submit, nohide
	gosub, sub_update_grandtotal
	return
}

barcode11:
{
	gui, submit, nohide
	; find barcode of the itemdescription11
	line_number := 1
	loop, read, %a_scriptdir%\data\products.csv
	{
		if a_loopreadline contains %barcode11%
		{
			loop, parse, a_loopreadline, `,
			{
				if a_index = 1
				{
					guicontrol, choose, itemdescription11, %line_number%
				}
				if a_index = 3
				{
					reformat_price := round(a_loopfield, 2)
					guicontrol, , price11, %reformat_price%
				}
				if a_index = 4
				{
					guicontrol, , quantity11, 1
				}
			}
		}
		
		line_number += 1
	}
	total_ := round(price11*quantity11,2)
	guicontrol, , total11, %total_%
	gui, submit, nohide
	gosub, sub_update_grandtotal
	return
}

barcode12:
{
	gui, submit, nohide
	; find barcode of the itemdescription12
	line_number := 1
	loop, read, %a_scriptdir%\data\products.csv
	{
		if a_loopreadline contains %barcode12%
		{
			loop, parse, a_loopreadline, `,
			{
				if a_index = 1
				{
					guicontrol, choose, itemdescription12, %line_number%
				}
				if a_index = 3
				{
					reformat_price := round(a_loopfield, 2)
					guicontrol, , price12, %reformat_price%
				}
				if a_index = 4
				{
					guicontrol, , quantity12, 1
				}
			}
		}
		
		line_number += 1
	}
	total_ := round(price12*quantity12,2)
	guicontrol, , total12, %total_%
	gui, submit, nohide
	gosub, sub_update_grandtotal
	return
}

barcode13:
{
	gui, submit, nohide
	; find barcode of the itemdescription13
	line_number := 1
	loop, read, %a_scriptdir%\data\products.csv
	{
		if a_loopreadline contains %barcode13%
		{
			loop, parse, a_loopreadline, `,
			{
				if a_index = 1
				{
					guicontrol, choose, itemdescription13, %line_number%
				}
				if a_index = 3
				{
					reformat_price := round(a_loopfield, 2)
					guicontrol, , price13, %reformat_price%
				}
				if a_index = 4
				{
					guicontrol, , quantity13, 1
				}
			}
		}
		
		line_number += 1
	}
	total_ := round(price13*quantity13,2)
	guicontrol, , total13, %total_%
	gui, submit, nohide
	gosub, sub_update_grandtotal
	return
}

barcode14:
{
	gui, submit, nohide
	; find barcode of the itemdescription14
	line_number := 1
	loop, read, %a_scriptdir%\data\products.csv
	{
		if a_loopreadline contains %barcode14%
		{
			loop, parse, a_loopreadline, `,
			{
				if a_index = 1
				{
					guicontrol, choose, itemdescription14, %line_number%
				}
				if a_index = 3
				{
					reformat_price := round(a_loopfield, 2)
					guicontrol, , price14, %reformat_price%
				}
				if a_index = 4
				{
					guicontrol, , quantity14, 1
				}
			}
		}
		
		line_number += 1
	}
	total_ := round(price14*quantity14,2)
	guicontrol, , total14, %total_%
	gui, submit, nohide
	gosub, sub_update_grandtotal
	return
}

barcode15:
{
	gui, submit, nohide
	; find barcode of the itemdescription15
	line_number := 1
	loop, read, %a_scriptdir%\data\products.csv
	{
		if a_loopreadline contains %barcode15%
		{
			loop, parse, a_loopreadline, `,
			{
				if a_index = 1
				{
					guicontrol, choose, itemdescription15, %line_number%
				}
				if a_index = 3
				{
					reformat_price := round(a_loopfield, 2)
					guicontrol, , price15, %reformat_price%
				}
				if a_index = 4
				{
					guicontrol, , quantity15, 1
				}
			}
		}
		
		line_number += 1
	}
	total_ := round(price15*quantity15,2)
	guicontrol, , total15, %total_%
	gui, submit, nohide
	gosub, sub_update_grandtotal
	return
}

Quantity1:
{
	gui, submit, nohide
	total_ := round(price1*quantity1,2)
	guicontrol, , total1, %total_%
	gui, submit, nohide
	gosub, sub_update_grandtotal
	return
}

Quantity2:
{
	gui, submit, nohide
	total_ := round(price2*quantity2,2)
	guicontrol, , total2, %total_%
	gui, submit, nohide
	gosub, sub_update_grandtotal
	return
}

Quantity3:
{
	gui, submit, nohide
	total_ := round(price3*quantity3,2)
	guicontrol, , total3, %total_%
	gui, submit, nohide
	gosub, sub_update_grandtotal
	return
}

Quantity4:
{
	gui, submit, nohide
	total_ := round(price4*quantity4,2)
	guicontrol, , total4, %total_%
	gui, submit, nohide
	gosub, sub_update_grandtotal
	return
}

Quantity5:
{
	gui, submit, nohide
	total_ := round(price5*quantity5,2)
	guicontrol, , total5, %total_%
	gui, submit, nohide
	gosub, sub_update_grandtotal
	return
}

Quantity6:
{
	gui, submit, nohide
	total_ := round(price6*quantity6,2)
	guicontrol, , total6, %total_%
	gui, submit, nohide
	gosub, sub_update_grandtotal
	return
}

Quantity7:
{
	gui, submit, nohide
	total_ := round(price7*quantity7,2)
	guicontrol, , total7, %total_%
	gui, submit, nohide
	gosub, sub_update_grandtotal
	return
}

Quantity8:
{
	gui, submit, nohide
	total_ := round(price8*quantity8,2)
	guicontrol, , total8, %total_%
	gui, submit, nohide
	gosub, sub_update_grandtotal
	return
}

Quantity9:
{
	gui, submit, nohide
	total_ := round(price9*quantity9,2)
	guicontrol, , total9, %total_%
	gui, submit, nohide
	gosub, sub_update_grandtotal
	return
}

Quantity10:
{
	gui, submit, nohide
	total_ := round(price10*quantity10,2)
	guicontrol, , total10, %total_%
	gui, submit, nohide
	gosub, sub_update_grandtotal
	return
}

Quantity11:
{
	gui, submit, nohide
	total_ := round(price11*quantity11,2)
	guicontrol, , total11, %total_%
	gui, submit, nohide
	gosub, sub_update_grandtotal
	return
}

Quantity12:
{
	gui, submit, nohide
	total_ := round(price12*quantity12,2)
	guicontrol, , total12, %total_%
	gui, submit, nohide
	gosub, sub_update_grandtotal
	return
}

Quantity13:
{
	gui, submit, nohide
	total_ := round(price13*quantity13,2)
	guicontrol, , total13, %total_%
	gui, submit, nohide
	gosub, sub_update_grandtotal
	return
}

Quantity14:
{
	gui, submit, nohide
	total_ := round(price14*quantity14,2)
	guicontrol, , total14, %total_%
	gui, submit, nohide
	gosub, sub_update_grandtotal
	return
}

Quantity15:
{
	gui, submit, nohide
	total_ := round(price15*quantity15,2)
	guicontrol, , total15, %total_%
	gui, submit, nohide
	gosub, sub_update_grandtotal
	return
}

Price1:
{
	gui, submit, nohide
	total_ := round(price1*quantity1,2)
	guicontrol, , total1, %total_%
	gui, submit, nohide
	gosub, sub_update_grandtotal
	return
}

Price2:
{
	gui, submit, nohide
	total_ := round(price2*quantity2,2)
	guicontrol, , total2, %total_%
	gui, submit, nohide
	gosub, sub_update_grandtotal
	return
}

Price3:
{
	gui, submit, nohide
	total_ := round(price3*quantity3,2)
	guicontrol, , total3, %total_%
	gui, submit, nohide
	gosub, sub_update_grandtotal
	return
}

Price4:
{
	gui, submit, nohide
	total_ := round(price4*quantity4,2)
	guicontrol, , total4, %total_%
	gui, submit, nohide
	gosub, sub_update_grandtotal
	return
}

Price5:
{
	gui, submit, nohide
	total_ := round(price5*quantity5,2)
	guicontrol, , total5, %total_%
	gui, submit, nohide
	gosub, sub_update_grandtotal
	return
}

Price6:
{
	gui, submit, nohide
	total_ := round(price6*quantity6,2)
	guicontrol, , total6, %total_%
	gui, submit, nohide
	gosub, sub_update_grandtotal
	return
}

Price7:
{
	gui, submit, nohide
	total_ := round(price7*quantity7,2)
	guicontrol, , total7, %total_%
	gui, submit, nohide
	gosub, sub_update_grandtotal
	return
}

Price8:
{
	gui, submit, nohide
	total_ := round(price8*quantity8,2)
	guicontrol, , total8, %total_%
	gui, submit, nohide
	gosub, sub_update_grandtotal
	return
}

Price9:
{
	gui, submit, nohide
	total_ := round(price9*quantity9,2)
	guicontrol, , total9, %total_%
	gui, submit, nohide
	gosub, sub_update_grandtotal
	return
}

Price10:
{
	gui, submit, nohide
	total_ := round(price10*quantity10,2)
	guicontrol, , total10, %total_%
	gui, submit, nohide
	gosub, sub_update_grandtotal
	return
}

Price11:
{
	gui, submit, nohide
	total_ := round(price11*quantity11,2)
	guicontrol, , total11, %total_%
	gui, submit, nohide
	gosub, sub_update_grandtotal
	return
}

Price12:
{
	gui, submit, nohide
	total_ := round(price12*quantity12,2)
	guicontrol, , total12, %total_%
	gui, submit, nohide
	gosub, sub_update_grandtotal
	return
}

Price13:
{
	gui, submit, nohide
	total_ := round(price13*quantity13,2)
	guicontrol, , total13, %total_%
	gui, submit, nohide
	gosub, sub_update_grandtotal
	return
}

Price14:
{
	gui, submit, nohide
	total_ := round(price14*quantity14,2)
	guicontrol, , total14, %total_%
	gui, submit, nohide
	gosub, sub_update_grandtotal
	return
}

Price15:
{
	gui, submit, nohide
	total_ := round(price15*quantity15,2)
	guicontrol, , total15, %total_%
	gui, submit, nohide
	gosub, sub_update_grandtotal
	return
}

LoadProduct:
{
	;get control name
	GuiControlGet, OutputVar, FocusV 
	itemdescription = %outputvar%
	stringtrimleft, row, outputvar, 15
	gui, submit, nohide
	loop, read, %a_scriptdir%\data\products.csv
	{
		Loop, parse, A_LoopReadLine, `,
	    {
	        if instr(a_loopreadline, %itemdescription%)
				var%a_index% := a_loopfield
				barcode_ := var1
				price_ := var3
				tax_ := var6
	    }
	}
	barcode := "barcode"row
	quantity := "quantity"row
	price := "price"row
	tax = "tax"row
	total = "total"row
	guicontrol, , %barcode%, %barcode_%
	guicontrol, , %quantity%, 1
	guicontrol, , %price%, %price_%

	if (tax_ = 1)
	{
		guicontrol, , tax%row%, TAX
	}
	else
	{
		guicontrol, , tax%row%, 
	}
	gui, submit, nohide
	gosub, sub_update_grandtotal
	return
}

add_product_line:
{
	count_invoice_line := count_invoice_line + 2
	gui, add, dropdownlist, 0x8 w300  xs+15 yp+23 left vItemDescription%count_invoice_line% gLoadProduct, %list_product%4
	gui, add, edit, 0x8 h21 w50 x+8 left vQuantity%count_invoice_line% gQuantity,
	gui, add, edit, 0x8 h21 w50 x+8 left vPrice%count_invoice_line%, 
 
	gui, add, edit, 0x8 h21 w50 x+8 left, 
	gui, add, edit, 0x8 h21 w50 x+8 left vTotal%count_invoice_line%,
	return
}

menuhandler_exit:
{
	exitapp
}

F5::
{
    ;gui, submit, nohide
    ;guicontrolget, code_gui, ,codegui
    ;guicontrolget, code_subroutine, ,codesubroutine
    ;filedelete, %a_scriptdir%\Gulf Bay Marine - Procurement.ahk
    ;filedelete, %a_scriptdir%\subroutine\subroutine.ahk
    ;fileappend, %code_gui%, %a_scriptdir%\Gulf Bay Marine - Procurement.ahk
    ;fileappend, %code_subroutine%, %a_scriptdir%\subroutine\subroutine.ahk
	run, %a_scriptdir%\Gulf Bay Marine.ahk
}



guiclose:
{	
	ExitApp
}

2guiclose:
{
	gui, 2: destroy
	return
}


3guiclose:
{
	gui, 3: destroy
	return
}

4guiclose:
{
	gui, 4: destroy
	return
}

5guiclose:
{
	gui, 5: destroy
	gui, 14: destroy
	winactivate, Gulf Bay Marine
	return
}

6guiclose:
{
	gui, 6: destroy
	gui, 14: destroy
	winactivate, Gulf Bay Marine
	return
}

7guiclose:
{
	gui, 7: destroy
	gui, 6: destroy
	gui, 5: destroy
	return
}

8guiclose:
{
	gui, 8: destroy
	return
}

9guiclose:
{
	gui, 9: destroy
	return
}

10guiclose:
{
	new_barcode = 
	gui, 10: destroy
	return
}

11guiclose:
{
	gui, 11: destroy
	return
}

12guiclose:
{
	gui, 12: destroy
	return
}

13guiclose:
{

	gui, 13: destroy
	return
}
14guiclose:
{

	gui, 14: destroy
	return
}
AddExpense:
{
	gui, 2: add, monthcal, vExpenseDueDate, 
	gui, 2: add, text, 0x8 h18 w80 xs+0 yp+175 right, Vendor: 
	gui, 2: add, edit, 0x8 h18 w125 x+8 right vExpenseVendor, 
	gui, 2: add, text, 0x8 h18 w80 xs+0 yp+25 right, Amount: 
	gui, 2: add, edit, 0x8 h18 w125 x+8 right vExpenseAmount,
	gui, 2: add, checkbox, 0x8 vExpensePaid, Paid 
	gui, 2: add, button, 0x8 h18 xs+88 yp+20 center gSubmitExpense, Submit 
	gui, 2: show, noactivate, Add Expense
	return
}

SubmitExpense:
{
	gui, 2: submit, nohide	
	fileread, contents, %a_scriptdir%\data\expenses.csv
	row = %ExpenseDueDate%,%ExpenseVendor%,%ExpenseAmount%,%ExpensePaid%
	fileappend, %contents%`n%row%, %a_scriptdir%\data\temp_expenses.csv
	filepath = %a_scriptdir%\data\temp_expenses.csv
	func_sort_file(filepath)
	Filedelete, %a_scriptdir%\data\expenses.csv
	FileMove, %a_scriptdir%\data\temp_expenses.csv, %a_scriptdir%\data\expenses.csv
	gui, 2: destroy
	gosub, sub_load_listview_expenses
	return
}

ListViewExpense:
{
	if A_GuiEvent = doubleclick
	{
		gui, listview, listviewexpenses
		LV_GetText(RowText1, A_EventInfo, 1)
		LV_GetText(RowText2, A_EventInfo, 2)
		LV_GetText(RowText3, A_EventInfo, 3)
		LV_GetText(RowText4, A_EventInfo, 4)
		DowndatedExpenseDueDate = %RowText1%
		DowndatedExpenseDueVendor = %rowtext2%
		DowndatedExpenseDueAmount = %rowtext3%
		DowndatedExpensePaid = %rowtext4%
		get_old_expenses_file = %RowText1%_%RowText2%
		gui, 3: add, monthcal, vUpdatedExpenseDueDate, %rowtext1%
		gui, 3: add, text, 0x8 h18 w80 xs+0 yp+180 right, Vendor: 
		gui, 3: add, edit, 0x8 h18 w125 x+8 right vUpdatedExpenseVendor, %rowtext2%
		gui, 3: add, text, 0x8 h18 w80 xs+0 yp+20 right, Amount: 
		gui, 3: add, edit, 0x8 h18 w125 x+8 right vUpdatedExpenseAmount, %RowText3%
		if(RowText4 == "1")
		{
			gui, 3: add, checkbox, 0x8 vUpdatedExpensePaid checked, Paid
		}
		if(RowText4 == "0")
		{
			gui, 3: add, checkbox, 0x8 vUpdatedExpensePaid, Paid
		}
		gui, 3: add, button, 0x8 h18 xs+88 yp+20 center gUpdatedSubmitExpense, Update	
		gui, 3: show, noactivate, Update Expense
	}
	
	return
}

ListViewExpensePaid:
{
	if A_GuiEvent = doubleclick
	{
		gui, listview, listviewexpensespaid
		LV_GetText(RowText1, A_EventInfo, 1)
		LV_GetText(RowText2, A_EventInfo, 2)
		LV_GetText(RowText3, A_EventInfo, 3)
		LV_GetText(RowText4, A_EventInfo, 4)
		DowndatedExpenseDueDate = %RowText1%
		DowndatedExpenseDueVendor = %rowtext2%
		DowndatedExpenseDueAmount = %rowtext3%
		DowndatedExpensePaid = %rowtext4%
		guicontrol, , Amount1, %RowText3%
		get_old_expenses_file = %RowText1%_%RowText2%
		gui, 12: add, monthcal, vUpdatedExpenseDueDate, %rowtext1%
		gui, 12: add, text, 0x8 h18 w80 xs+0 yp+180 right, Vendor: 
		gui, 12: add, edit, 0x8 h18 w125 x+8 right vUpdatedExpenseVendor, %rowtext2%
		gui, 12: add, text, 0x8 h18 w80 xs+0 yp+20 right, Amount: 
		gui, 12: add, edit, 0x8 h18 w125 x+8 right vUpdatedExpenseAmount, %RowText3%
		if(RowText4 == "1")
		{
			gui, 12: add, checkbox, 0x8 vUpdatedExpensePaid checked, Paid
		}
		if(RowText4 == "0")
		{
			gui, 12: add, checkbox, 0x8 vUpdatedExpensePaid, Paid
		}
		gui, 12: add, button, 0x8 h18 xs+88 yp+20 center gUpdatedSubmitExpense, Update	
		gui, 12: show, noactivate, Update Expense
	}
	return
}
UpdatedSubmitExpense:
{
	gui, 3: submit, nohide
	gui, 12: submit, nohide
	fileread, contents, %a_scriptdir%\data\expenses.csv
	find_this = %DowndatedExpenseDueDate%,%DowndatedExpenseDueVendor%,%DowndatedExpenseDueAmount%,%DowndatedExpensePaid%
	loop, read, %a_scriptdir%\data\expenses.csv
	{
		loop, parse, a_loopreadline, `n
		{
			if a_loopreadline = %find_this%
			{
				row = %UpdatedExpenseDueDate%,%UpdatedExpenseVendor%,%UpdatedExpenseAmount%,%UpdatedExpensePaid%
				fileappend, `n%row%, %a_scriptdir%\data\temp_expenses.csv
			}
			else
			{
				fileappend, `n%a_loopreadline%, %a_scriptdir%\data\temp_expenses.csv
			}
		}
		
	}
	filepath = %a_scriptdir%\data\temp_expenses.csv
	func_sort_file(filepath)
	Filedelete, %a_scriptdir%\data\expenses.csv
	FileMove, %a_scriptdir%\data\temp_expenses.csv, %a_scriptdir%\data\expenses.csv
	gui, 3: destroy	
	gui, 12: destroy		
	gosub, sub_load_listview_expenses
	return
}

PrintExpense:
{
	run, print "%a_scriptdir%\MISS ANNA V - NESTCAM 0501180930.txt"
	return
}

sub_load_listview_expenses:
{
	var1 =
	var2 =
	var3 =
	var4 =
	gui, 1: default
	gui, 1: listview, listviewexpenses
	lv_delete()
	gui, 1: default
	gui, 1: listview, listviewexpensespaid
	lv_delete()
	total_expenses := 0
	loop, read, %a_scriptdir%\data\expenses.csv,
	{
		Loop Parse, a_loopreadline, `,
		{
			var%a_index% := a_loopfield
			loop_count1 += 1
		}
		if var4 =
		{

		}
		else if var4 = 0
		{
			gui, 1: default
			gui, listview, listviewexpenses
			lv_add(, var1, var2, var3, var4)
			LV_ModifyCol(1, "70 SortAsc")
			LV_ModifyCol(2, "200")
			LV_ModifyCol(3, "65 Integer")
			LV_ModifyCol(4, "40")
			total_expenses := round(total_expenses+var3,2)
		}
		else 
		{
			gui, 1: default
			gui, listview, listviewexpensespaid
			lv_add(, var1, var2, var3, var4)
			LV_ModifyCol(1, "70 SortAsc")
			LV_ModifyCol(2, "200")
			LV_ModifyCol(3, "65 Integer")
			LV_ModifyCol(4, "40")
		}
		loop_count += 1
		guicontrol, , TotalExpenses, Total Expenses: $%total_expenses%
	}
	return
}

listview1:
{
	if A_GuiEvent = doubleclick
{
    LV_GetText(ItemNo, A_EventInfo)  ; Get the text from the row's first field.
	LV_GetText(Description, A_EventInfo, 2)
	LV_GetText(Price, A_EventInfo, 3)
	LV_GetText(Count, A_EventInfo, 4)
	gui, 2: add, text, w100 right, Item No. :
	gui, 2: add, edit, w200 x+10 vupdateItemNo disabled, %ItemNo%
	gui, 2: add, text, w100 xs right , Description :
	gui, 2: add, edit, w200 x+10 vupdateDescription, %Description%
	gui, 2: add, text, w100 xs right, Price :
	gui, 2: add, edit, w200 x+10 vupdatePrice, %Price%
	gui, 2: add, text, w100 xs right, Count :
	gui, 2: add, edit, w200 x+10 vupdateCount, %Count%
	gui, 2: add, text, w100 xs right,
	gui, 2: add, button, w100 x+9 gupdate, Update
  	gui, 2: show, noactivate, Update Inventory
    return
}
}


SearchProduct:
{
	gui, submit, nohide
	loop % array_count
	{
		array%a_index% :=
	}
	len := StrLen(a_searchterm)
	array_count := 0
	Loop Parse, list_product_price_cost_quantity_capacity_tax_vendor_lastupdated_notes, |
	{
		If a_loopfield contains %a_searchterm%
		{
			array%array_count% := a_loopfield
			array_count += 1
		}
	}
	Gui, 1: default
	gui, 1: listview, listviewproducts
	lv_delete()
	LV_ModifyCol(3, "right")
	loop_count := 0
	loop_count1 := 0
	loop %array_count%
	{
		Loop Parse, array%loop_count%, `,
		{
			var%a_index% := a_loopfield
			loop_count1 += 1
		}
		lv_add(, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10)
		loop_count += 1
	}	
	Return
}

SearchProductCTRLF:
{
	gui, submit, nohide
	loop % array_count
	{
		array%a_index% :=
	}
	len := StrLen(a_searchterm)
	array_count := 0
	Loop Parse, list_product_price_cost_quantity, |
	{
		If a_loopfield contains %a_searchterm%
		{
			array%array_count% := a_loopfield
			array_count += 1
		}
	}

	Gui, 14: default
	gui, 14: listview, listviewproducts

	lv_delete()
	LV_ModifyCol(3, "right")
	loop_count := 0
	loop_count1 := 0
	loop %array_count%
	{

		Loop Parse, array%loop_count%, `,
		{
			var%a_index% := a_loopfield
			loop_count1 += 1
		}
		lv_add(, var1, var2, var3, var5)
		loop_count += 1
	}	
	Return
}

^+F::
{
	BlockInput, on
	X := 0
	Y := 0
	gui, 14: destroy
	gui, 14: font, bold c s15, arial
	gui, 14: add, groupbox, section w500 r13 center, Search Results
	gui, 14: font,
	gui, 14: add, text, xs+10 yp+23 0x8 h18 right, Search Product:  
	gui, 14: add, edit, 0x8 h18 w400 x+8 vA_SearchTerm gSearchProductCTRLF left,  
		;CHANGE TO geditproduct if you want to edit the product when double clicking
	gui, 14: font, s11
	Gui, 14: add, listview, r25 w490 yp+22 xs+5 grid vlistviewproducts gselectproduct vscroll, Barcode|Product|Sales|Quantity
	list_product =
	list_product_price =
	list_product_price_quantity =
	list_product_price_cost_quantity = 
	list_product_price_cost_quantity_capacity = 
	list_product_price_cost_quantity_capacity_tax = 
	list_product_price_cost_quantity_capacity_tax_vendor = 
	loop, read, %a_scriptdir%\data\products.csv
	{
		gui, 14: default
		gui, 14: listview, listviewproducts

	   	StringSplit, item, A_LoopReadLine, `,
	   	item3 := round(item3, 2)
	   	item3 = $%item3%
	   	LV_Add("", item1, item2, item3, item5)
		list_product = %list_product%%item2%|
		list_product_price = %list_product_price%%item2%,%item3%|
		list_product_price_cost = %list_product_price_cost%%item2%,%item3%,%item4%|
		list_product_price_cost_quantity = %list_product_price_cost_quantity%%item1%,%item2%,%item3%,%item4%,%item5%|
		list_product_price_cost_quantity_capacity = %list_product_price_cost_quantity%%item1%,%item2%,%item3%,%item4%,%item5%,%item6%|
		list_product_price_cost_quantity_capacity_tax = %list_product_price_cost_quantity_capacity_tax%%item1%,%item2%,%item3%,%item4%,%item5%,%item6%,%item7%|
		list_product_price_cost_quantity_capacity_tax_vendor = %list_product_price_cost_quantity_capacity_tax_vendor%%item1%,%item2%,%item3%,%item4%,%item5%,%item6%,%item7%,%item8%|
	}
	LV_ModifyCol(1, "55")
	LV_ModifyCol(2, "290")
	LV_ModifyCol(3, "65 right")
	LV_ModifyCol(4, "55 center")
	LV_ModifyCol(5, "130")
	LV_ModifyCol(6, "50")
	gui, 14: add, button, 0x8 h23 w200 xs+153 gAddProduct, + Add Product  
	ifwinexist, New Invoice,
	{
		WinGetPos, X, Y,,, New Invoice
	}
	ifwinexist, Edit Invoice,
	{
		WinGetPos, X, Y,,, Edit Invoice
	}
	
	X := X+607
	gui, 14: show, x%X% y%Y%, Search Results 

	
	ControlFocus, edit1, Search Results
	winactivate, Search Results
	return
	BlockInput, off
}

selectproduct:
{
	BlockInput, on
	if A_GuiEvent = doubleclick
	{
		gui, 5: submit, nohide
		gui, 6: submit, nohide
		winactivate, Search Results
		lv_gettext(rowtext1, a_eventinfo, 1)

		loop % 15
		{
			guicontrolget, barcode, 5:, barcode%a_index%
			guicontrolget, barcode, 6:, barcode%a_index%
			if barcode = 
			{	
				guicontrol, 5:, barcode%a_index%, %rowtext1%
				guicontrol, 6:, barcode%a_index%, %rowtext1%
				row := a_index
				line_number := 1
				barcode_length := strlen(rowtext1)

				loop, read, %a_scriptdir%\data\products.csv
				{
					if a_loopreadline contains %rowtext1%
					{
						loop, parse, a_loopreadline, `,
						{
							if a_index = 1
							{
								guicontrol, 5: choose, itemdescription%row%, %line_number%
								guicontrol, 6: choose, itemdescription%row%, %line_number%
							}
							if a_index = 3
							{
								reformat_price := round(a_loopfield, 2)
								guicontrol, 5: , price%row%, %reformat_price%
								guicontrol, 6: , price%row%, %reformat_price%
							}
							if a_index = 5
							{
								guicontrol, 5: , quantity%row%, 1
								guicontrol, 6: , quantity%row%, 1
							}
							if a_index = 6
							{
								tax_ = %a_loopfield%
							}
						}
					}
					line_number += 1
				}
				

				total_ := round(price%row%*quantity%row%,2)
				guicontrol, 5:, total%row%, %total_%
				guicontrol, 6:, total%row%, %total_%
				if (tax_ = 1)
				{
					guicontrol, 5:, tax%row%, TAX
					guicontrol, 6:, tax%row%, TAX
				}
				else
				{
					guicontrol, 5:, tax%row%, 
					guicontrol, 6:, tax%row%, 
				}
				gui, 5: submit, nohide
			
				gosub, sub_update_grandtotal
				return
			}
		} until barcode =
	}
	return
	BlockInput, off
}

AddProduct:
{
	BlockInput, on
	gui, 1: default
	gui, 1: listview, listviewproducts
	count_barcode := 0
	loop, read, %a_scriptdir%\data\products.csv
	{
		count_barcode += 1
	}
	count_barcode += 1
	new_barcode_length := strlen(count_barcode)
	loop % 5-new_barcode_length
	{
		new_barcode = 0%count_barcode%
	}
	gosub, editproduct
	return
	BlockInput, off
}


AddTask:
{
	BlockInput, on
	InputBox, taskdescription, Add Task, Please describe the task:, , 250, 125
	Loop, read, %a_scriptdir%\data\tasks.csv
	{
	    LineNumberForItem = %A_Index%
	    Loop, parse, A_LoopReadLine, CSV
	    {
	    	if a_loopreadline = %taskdescription% OR taskdescription = 
	    	{
				msgbox This task already exists or the input was empty.
				return
	    	}
	    }
	}
	fileappend,%taskdescription%`n, %a_scriptdir%\data\tasks.csv
	file_path = %a_scriptdir%\data\tasks.csv
	func_sort_file(file_path)
	gosub, sub_load_listview_tasks
	return
	BlockInput, off
}

sub_load_listview_tasks:
{
	BlockInput, on
	gui, 1: default
	gui, 1: listview, listviewtasks
	lv_delete()
	list_task =  

	gui, 9: -Caption +border
	Gui, 9: Add, text, w250 h18, Loading Customer List...
	Gui, 9: Add, Progress, Range0-200 horizontal w250 h18 yp+15 vMyProgress border
	Gui, 9: Show, noactivate, 

	loop, read, %a_scriptdir%\data\tasks.csv
	{
	   	StringSplit, item, A_LoopReadLine, `,
		LV_Add("", item1)
		GuiControl, 9: , MyProgress, +1
	}
	LV_ModifyCol(1, "495 SortAsc")
	gui, 9: destroy
	return
	BlockInput, off
}

list_view_tasks:
{
	BlockInput, on
	if A_GuiEvent = doubleclick
	{
		gui, listview, listviewtasks
		lv_gettext(rowtext1, a_eventinfo, 1)

		msgbox 4, Delete Task, Are you sure you want to delete this task?`n`n%rowtext1%.
		ifmsgbox Yes
		{
			loop, read, %a_scriptdir%\data\tasks.csv
			{
				loop, parse, a_loopreadline, `,
				{
					if a_loopreadline = %rowtext1%
					{
						
					}
					else
					{
						fileappend, %a_loopreadline%`n, %a_scriptdir%\data\temp_tasks.csv
					}
				}
			}
			filepath = %a_scriptdir%\data\temp_tasks.csv
			func_sort_file(filepath)
			filedelete, %a_scriptdir%\data\tasks.csv
			filemove, %a_scriptdir%\data\temp_tasks.csv, %a_scriptdir%\data\tasks.csv
			gosub, sub_load_listview_tasks
		}
		ifmsgbox No
		{

		}
	}
	return
	BlockInput, off
}

get_signature:
{
	gui, submit, nohide
	if (invoiceno = "")
	{
		msgbox Invalid Invoice No.!
		return
	}	
	if (customer = "")
	{
		msgbox Please select a customer!
		return
	}	
	
	guicontrolget, customer_, , customer
	Gui, 13: show, maximize, Please Sign
	hWnd := WinExist("Please Sign")
	hDC := DllCall("GetDC", UInt, hWnd)
	color := 0x000000
	OnMessage(0x200, "Draw")
	Return
}

Draw(wParam, lParam)
{
	setBatchLines -1
   	Global hDC, color
	X := lparam & 0xFFFF
  	Y := lparam >> 16

   x-=(7/2)
   y-=(7/2)

   x_orig:=x
   y_orig:=y

	loop % 7
	{
      loop % 7
      {
          DllCall("SetPixel", UInt, hDC, Int, X, Int, Y, UInt, color)
          y++
      }
   x++  
   y:=y_orig
	}
	return
}

ins::
{
	ifwinexist, Please Sign
	{
		gui, submit, nohide
		ifnotexist, %a_scriptdir%\data\signatures\  
		{
			fileCreateDir, %a_scriptdir%\data\signatures\   
		}
		winactivate, Please Sign
		Runwait, "%a_scriptdir%\IrfanView\i_view32.exe" /capture=2 /convert=%a_scriptdir%\data\signatures\%customer_%_%invoiceno%.png

		guicontrol, 5: , signature, %a_scriptdir%\data\signatures\%customer_%_%invoiceno%.png
		guicontrol, 6: , signature, %a_scriptdir%\data\signatures\%customer_%_%invoiceno%.png
		gui, 13: destroy
	}
	return
}

incremental_combobox:
{
	Gui, Submit, NoHide
	GuiControl, ChooseString, %A_GuiControl%,% %A_GuiControl%
	GuiControlGet, text,,%A_GuiControl%
	LoWord := StrLen(%A_GuiControl%), HiWord := StrLen(text), DWord := HiWord << 16 | LoWord
	SendMessage, 0x142,,DWord,,% "ahk_id " h%A_GuiControl%                ;CB_SETEDITSEL
	return
}

filter_fishhouse:
{
	gui, submit, nohide
	gui, 1: default
	gui, 1: listview, listviewcustomers
	lv_delete()
	list_customer =  

	gui, 9: -Caption +border
	Gui, 9: Add, text, w250 h18, Loading Customer List...
	Gui, 9: Add, Progress, Range0-200 horizontal w250 h18 yp+15 vMyProgress border
	Gui, 9: Show, noactivate, 

	loop, read, %a_scriptdir%\data\customers.csv
	{
	   	StringSplit, item, A_LoopReadLine, `,

	   	calc_total_amount := 0
	   	if(filterfishhouse = item2)
	   	{
	   		loop, files, %a_scriptdir%\statements\%item1%\*.csv,
			{
				filename = %a_loopfilename%
				stringreplace, filename, filename, .csv, , all
				filereadline, total_amount, %a_loopfilefullpath%, 19
				total_amount_num := round(total_amount, 2)
				total_amount = $%total_amount_num%
				paid = paid
				if filename not contains %paid%
				{
					calc_total_amount := calc_total_amount + total_amount_num
				}
				length_filename := strlen(filename)
			}
			reformatted_calc_total_amount := round(calc_total_amount, 2)
			if item1 !=
			{
				LV_Add("", item1, reformatted_calc_total_amount, item3, item4, item5)
			}
			
			list_customer = %list_customer%%item1%|
			GuiControl, 9: , MyProgress, +1
		}
		if(filterfishhouse = "all")
		{
			loop, files, %a_scriptdir%\statements\%item1%\*.csv,
			{
				filename = %a_loopfilename%
				stringreplace, filename, filename, .csv, , all
				filereadline, total_amount, %a_loopfilefullpath%, 19
				total_amount_num := round(total_amount, 2)
				total_amount = $%total_amount_num%
				paid = paid
				if filename not contains %paid%
				{
					calc_total_amount := calc_total_amount + total_amount_num
				}
				length_filename := strlen(filename)
			}
			reformatted_calc_total_amount := round(calc_total_amount, 2)
			if item1 !=
			{
				LV_Add("", item1, reformatted_calc_total_amount, item3, item4, item5)
			}
			
			list_customer = %list_customer%%item1%|
			GuiControl, 9: , MyProgress, +1
		}
		
	}
	LV_ModifyCol(1, "199 SortAsc")
	LV_ModifyCol(2, "74 right")
	LV_ModifyCol(3, "0")
	LV_ModifyCol(4, "0")
	LV_ModifyCol(5, "0")
	LV_ModifyCol(6, "0")
	gui, 9: destroy
	return
	return
}

ReloadProduct:
{	
	gui, 9: -Caption +border
	Gui, 9: Add, text, w250 h18, Reloading...
	Gui, 9: Add, Progress, Range0-51 horizontal w250 h18 yp+15 vMyProgress border
	Gui, 9: Show, noactivate, 
	GuiControl, 1: , a_searchterm, 

	loop 50
	{
		GuiControl, 9: , MyProgress, +1
		sleep, 1
	}
	gosub, sub_load_listview_products
	GuiControl, 9: , MyProgress, +1
	sleep 100
	gui, 9: destroy
	return
}

;$U(`%Y-`%m-`%d_`%H`%M`%S)
; ================================================================================================================================

; webapp controls

; ================================================================================================================================





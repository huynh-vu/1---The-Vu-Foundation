#singleinstance force 
#NoEnv
;#NoTrayIcon
setBatchLines -1
;SendMode Input
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
count_invoice_line := 1
session_customer := 
total_sales := 0
; BACKGROUND COLOR
gui, color, DDDDDD

menu, filemenu, add, Exit, menuhandler_exit
menu, mymenubar, add, File, :filemenu
menu, mymenubar, add, Home, :filemenu
menu, mymenubar, add, Insert, :filemenu
menu, mymenubar, add, Layout, :filemenu
menu, mymenubar, add, References, :filemenu
menu, mymenubar, add, Mailings, :filemenu
menu, mymenubar, add, View, :filemenu
gui, menu, mymenubar

gui, add, tab2, x+0 yp+2 w1900 h985, Accounts|Inventory|Expenses|Tax|Timesheet

gui, tab, 1,
gui, add, button, 0x8 h45 w150 center xs yp+25 gcreate_new_invoice, + INVOICE
gui, add, button, 0x8 h45 w150 center x+5 gaddcustomer, + ACCOUNT
Gui, add, listview, r51 w300 xs yp+55 vlistviewcustomers glist_view_customers grid, CUSTOMERS | BALANCE
gosub, sub_load_listview_customers

gui, font, bold c s15, arial
gui, add, groupbox, x+10 yp-63 section w1668 r30 center, Customer Profile
gui, font,
gui, add, text, 0x8 h18 w75 right xs+5 ys+25, CUSTOMER:  
gui, add, edit, 0x8 w180 x+8 yp-4 left vcustomer gsave_recent_customer,
gui, font, bold s20
gui, add, text, 0x8 h28 w292 x+5 yp-4 right cgreen, Total Amount Due: 
gui, font, bold s15
gui, add, text, 0x8 h28 w292 xp yp+26 right vprofile_total cgreen, $0.00
gui, font 
gui, add, text, 0x8 h18 w75 right xs+5 yp+8, ADDRESS:  
gui, add, edit, 0x8 w180 x+8 yp-4 r3 left vaddress, 
gui, add, text, 0x8 h18 w75 right xs+5 yp+57, TAX EXEMPT:  
gui, add, combobox, 0x8 w180 x+8 yp-4 r1 left vtaxexempt,
gui, add, button, 0x8 h22 w190 x+100 gsavecustomer, Save Customer Information
gui, add, text, 0x8 h18 w75 right xs+5 yp+30, NET TERM:  
gui, add, dropdownlist, 0x8 w180 x+8 yp-4 left vnetterm choose1, Due Upon Receipt |30 Days |60 Days |90 Days
gui, add, button, 0x8 h22 w190 x+100 gprintstatement, Print Statement

gui, add, text, xs+10 y+10 w550 h2 0x10 ;Horizontal Line > Black

gui, add, listview, r44 w550 xs+10 yp+15 vlistviewinvoices glist_view_invoice grid, Date | Invoice No. | Total Amount
LV_ModifyCol(1, "100 SortAsc")
LV_ModifyCol(2, "345")
LV_ModifyCol(3, "100")
LV_ModifyCol(4, "40")
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
gui, tab, 2,
gui, font, bold c s15, arial
gui, add, groupbox, section w1875 r29 center, INVENTORY
gui, font,
gui, add, text, 0x8 h18 w100 xs+10 yp+25 right, Search Product:  
gui, add, edit, 0x8 h18 w200 x+8 vA_SearchTerm gSearchProduct left,  
Gui, add, listview, r51 w1850 yp+22 xs+10 grid vlistviewproducts geditproduct vscroll, Barcode|Product|Sales|Quantity
gosub, sub_load_listview_products
total_expenses := 0
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
gui, tab, 3,
gui, font, bold c s15, arial
gui, add, groupbox, section w800 r18 center, GULF BAY MARINE - EXPENSES
gui, font,
gui, add, button, 0x8 xs+8 yp+25 center gAddExpense, + Add Expense
gui, add, listview, 0x8000 0x400000 xs+9 yp+25 w380 r50 vlistviewexpenses center gListViewExpense grid, Due Date | Vendor | Amount | Paid
gui, add, listview, 0x8000 0x400000 x+15 w380 r50 center vlistviewexpensespaid gListViewExpensePaid grid, Due Date | Vendor | Amount | Paid
gui, add, text, 0x8 h18 xs+8 yp+885 w380 right vTotalExpenses, Total Expenses: 
gosub, sub_load_listview_expenses
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
gui, tab, 4,
gui, font, bold c s15, arial
gui, add, groupbox, section w1875 r29 center, TAX INFORMATION
gui, font,
gui, add, listview, w800 r25 xs+10 yp+23 vlistviewstatements grid, Date | Product | Quantity | Price | Total
gui, add, text, xs+10 yp+600, Total: 
gui, add, text, x+5 w200 vtotalsales,
gosub, sub_load_listview_statements

gui, show, noactivate, Gulf Bay Marine - Procurement

return
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
savecustomer:
{
	guicontrolget, customer_, ,customer
	guicontrolget, address_, ,address
	guicontrolget, tax_exempt, ,taxexempt
	guicontrolget, net_term, ,netterm

	Loop, read, %a_scriptdir%\customers.csv
	{
	    LineNumberForItem = %A_Index%
	    Loop, parse, A_LoopReadLine, CSV
	    {
	    	if a_loopreadline contains %session_customer%
	    	{
	    		fileappend,`n%customername%, %a_scriptdir%\customers.csv
				file_path = %a_scriptdir%\customers.csv
				func_sort_file(file_path)
				gosub, sub_load_listview_customers
				gui, 5: destroy
				gui, 6: destroy
				gosub, create_new_invoice
	    	}
	    }
	}
	
	



	return

}

printstatement:
{
	gui, submit, nohide
	filedelete, %a_scriptdir%\printing_statement.txt 
	gui, 1: listview, listviewinvoices

	loop % lv_getcount()
	{
		LV_GetText(get_date, a_index, 1)
		LV_GetText(get_invoiceno, a_index, 2)
		LV_GetText(get_totalamount, a_index, 3)
		if get_invoiceno not contains PAID
		{
			fileappend, %get_date% %a_tab% %get_invoiceno% %a_tab% %get_totalamount%`n, %a_scriptdir%\printing_statement.txt 
		}
	}
	guicontrolget, get_profile_total, , profile_total
	fileappend, Total Amount Due: %get_profile_total%, %a_scriptdir%\printing_statement.txt 
	run %a_scriptdir%\printing_statement.txt 
	return
}
sub_load_listview_statements:
{
	gui, 1: default
	gui, 1: listview, listviewstatements
	lv_delete()
	total_sales := 0
	Loop, Files, %a_scriptdir%\statements\*.*, R
	{
		balance := 0
		loop, read, %a_loopfilefullpath%
		{
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
								total_sales := total_sales + var5
								balance := balance + var5
								lv_add(,invoice_date,var2,var3,var4,var5)
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
	total_sales := round(total_sales, 2)
	guicontrol, 1: , totalsales, $%total_sales%
	gui, submit, nohide
	return
}

sub_load_listview_products:
{
	gui, 1: default
	gui, 1: listview, listviewproducts
	lv_delete()
	list_product =
	list_product_price =
	list_product_price_quantity =
	loop read, products.csv
	{
		gui, 1: default
		gui, 1: listview, listviewproducts
	   	StringSplit, item, A_LoopReadLine, `,
	   	item3 := round(item3, 2)
	   	item3 = $%item3%
	   	LV_Add("", item1, item2, item3, item4)
		LV_ModifyCol(1, "100")
		LV_ModifyCol(2, "350")
		LV_ModifyCol(3, "60 right")
		LV_ModifyCol(4, "60 center")
		LV_ModifyCol(5, "130")
		LV_ModifyCol(6, "50")
		list_product = %list_product%%item2%|
		list_product_price = %list_product_price%%item2%,%item3%|
		list_product_price_quantity = %list_product_price_quantity%%item1%,%item2%,%item3%,%item4%|
	}
	return
}

sub_load_listview_customers:
{
	gui, 1: default
	gui, 1: listview, listviewcustomers
	lv_delete()
	list_customer =  

	gui, 9: -Caption +border
	Gui, 9: Add, text, w250 h18, Loading Customer List...
	Gui, 9: Add, Progress, Range0-200 horizontal w250 h18 yp+15 vMyProgress
	Gui, 9: Show, noactivate, 

	loop read, customers.csv
	{
	   	StringSplit, item, A_LoopReadLine, `,

	   	calc_total_amount := 0
		loop, files, %a_scriptdir%\statements\%item1%\*.*,
		{
			filename = %a_loopfilename%
			stringreplace, filename, filename, .csv, , all
			filereadline, total_amount, %a_loopfilefullpath%, 19
			total_amount_num := round(total_amount, 2)
			total_amount = $%total_amount_num%
			LV_ModifyCol(1, "100 SortDesc")
			LV_ModifyCol(2, "345")
			LV_ModifyCol(3, "100")
			LV_ModifyCol(4, "40")
			paid = paid
			if filename not contains %paid%
			{
				calc_total_amount := calc_total_amount + total_amount_num
			}
			length_filename := strlen(filename)
;			if (length_filename < 8)
;			{
;				calc_total_amount := calc_total_amount + total_amount_num
;			}
		}
		reformatted_calc_total_amount := round(calc_total_amount, 2)
	   	LV_Add("", item1, reformatted_calc_total_amount, item3, item4, item5)
		LV_ModifyCol(1, "199 SortAsc")
		LV_ModifyCol(2, "80 right")
		LV_ModifyCol(3, "0")
		LV_ModifyCol(4, "0")
		LV_ModifyCol(5, "0")
		LV_ModifyCol(6, "0")
		list_customer = %list_customer%%item1%|
		GuiControl, 9: , MyProgress, +1
	}
	gui, 9: destroy
	return
}

func_sort_file(filepath)
{
	FileRead, contents, %filepath%
	if not ErrorLevel  
	{
		Sort, Contents
		FileDelete, %filepath%
 		fileappend,%Contents%, %filepath%
 		Contents =  
	}
	return
}

editproduct:
{
	gui, 1: listview, listviewproducts
	LV_GetText(get_product_barcode, A_EventInfo, 1)
	LV_GetText(get_product_name, A_EventInfo, 2)
	LV_GetText(get_product_price, A_EventInfo, 3)
	LV_GetText(get_product_quantity, A_EventInfo, 4)
	gui, 10: font, bold c s12, arial
	gui, 10: add, groupbox, section w575 r8 center, Product Information
	gui, 10: font,
	gui, 10: add, picture, +border w200 h200 xs+10 yp+23, %a_scriptdir%\images\image_%get_product_name%.png
	gui, 10: add, button, w200 xs+10 yp+205 gupload_product_image, Upload Photo...
	gui, 10: add, text, x+37 right yp-200, Barcode:
	gui, 10: add, edit, x+5 w250 yp-4 vnew_product_barcode, %get_product_barcode%
	gui, 10: add, text, xs+259 right yp+27, Name:
	gui, 10: add, edit, x+5 w250 yp-4 vnew_product_name, %get_product_name%
	gui, 10: add, text, xs+263 right yp+27, Price:
	gui, 10: add, edit, x+5 w250 yp-4 vnew_product_price, %get_product_price%
	gui, 10: add, text, xs+248 right yp+27, Quantity:
	gui, 10: add, edit, x+5 w250 yp-4 vnew_product_quantity, %get_product_quantity%
	gui, 10: add, button, xs+350 yp+27 gupdate_product, Update Product Information
	gui, 10: show, noactivate, Product Information
	return
}
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
update_product:
{
	gui, submit, nohide
	Loop, read, %a_scriptdir%\products.csv
	{
	    LineNumberForItem = %A_Index%
	    Loop, parse, A_LoopReadLine, `n
	    {
	    	new_line = %a_loopreadline%
	    	if a_loopreadline contains %get_product_name%
	    	{
	    		StringReplace, new_product_price, new_product_price, $, , all
				new_line = %new_product_barcode%,%new_product_name%,%new_product_price%,%new_product_quantity%
				fileappend,%new_line%`n, %a_scriptdir%\temp.csv
	    	}
	    	else
	    	{
	    		fileappend,%a_loopreadline%`n, %a_scriptdir%\temp.csv


	    	}	
	    }
	}
	FileRead, Contents, %a_scriptdir%\temp.csv
	if not ErrorLevel  ; Successfully loaded.
	{
		Sort, Contents
		FileDelete, %a_scriptdir%\temp.csv
 		fileappend,%Contents%, %a_scriptdir%\temp.csv
 		Contents =  ; Free the memory.
	}
	Filedelete, %a_scriptdir%\products.csv
	FileMove, %a_scriptdir%\temp.csv, %a_scriptdir%\products.csv
	gosub, sub_load_listview_products
	gui, 10: destroy
	return
}
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
upload_product_image:
{
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
	FileSelectFile, SelectedFile, 3, , Open a file, 
	if SelectedFile =
	{
    	return
	}
	else
	{
  		FileCopy, %selectedfile%, %a_scriptdir%\images\image_%get_product_name%.png
	}
	return
}
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
create_new_invoice:
{
	gui, 5: font, bold c s12, arial
	gui, 5: add, groupbox, yp+10 section w575 r25 center cgreen, Create New Invoice
	gui, 5: font,
	Gui, 5: Add, Picture, 0x8 xs+370 ys+25 w172 h-1 border, %a_scriptdir%\images\logo.png
	gui, 5: add, text, 0x8 h18 w100 right xs+5 yp+5, INVOICE NO.:  
	gui, 5: add, edit, 0x8 w225 x+8 yp-4 left vinvoiceno,
	gui, 5: add, text, 0x8 h18 w100 right xs+5 yp+30, CUSTOMER: 
	gui, 5: add, dropdownlist, 0x8 w200 x+8 yp-4 left vcustomer, %list_customer%
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
	Gui, 9: Add, Progress, horizontal w250 h18 yp+15 vMyProgress
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
	gui, 5: add, text, 0x8 h25 w444 xs+5 yp+26 right, Tax: 
	gui, 5: add, text, 0x8 h25 w50 x+10 left vTaxTotal, $0.00
	gui, 5: add, text, 0x8 h25 w444 xs+5 yp+26 right, Total Amount: 
	gui, 5: add, text, 0x8 h25 w50 x+10 left vGrandTotal, $0.00
	gui, 5: add, button, 0x8 h45 w200 xs+15 yp+25 center gsave_invoice, SAVE
	gui, 5: show, , Create New Invoice
	invoice_length := strlen(getinvoiceno)
	if (invoice_length < 8)
	{
		gui, 5: add, button, 0x8 h45 w220 x+65 center gbutton_checkout vbuttoncheckout, CHECKOUT >>
	}
	return
}
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
addcustomer:
{
	InputBox, customername, Add Customer, Please enter the customer's name:, , 250, 125
	Loop, read, %a_scriptdir%\customers.csv
	{
	    LineNumberForItem = %A_Index%
	    Loop, parse, A_LoopReadLine, CSV
	    {
	    	if a_loopreadline contains %customername%
	    	{
				msgbox This customer already exists!
				return
	    	}
	    }
	}
	fileappend,`n%customername%, %a_scriptdir%\customers.csv
	file_path = %a_scriptdir%\customers.csv
	func_sort_file(file_path)
	gosub, sub_load_listview_customers
	gui, 5: destroy
	gui, 6: destroy
	gosub, create_new_invoice
	return
}
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
StartNewInvoice:
{
	gosub, sub_clear_invoice
	gosub, 4guiclose
	return
}
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
list_view_invoice:
{
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
	gui, 6: font, bold c s12, arial
	gui, 6: add, groupbox, yp+10 section w575 r25 center cred, Edit Invoice
	gui, 6: font,
	gui, 6: Add, Picture, 0x8 xs+370 ys+25 w172 h-1 border, %a_scriptdir%\images\logo.png
	gui, 6: add, text, 0x8 h18 w100 right xs+5 yp+5, INVOICE NO.:  
	gui, 6: add, edit, 0x8 w225 x+8 yp-4 left vinvoiceno,
	guicontrol, 6: , invoiceno, %getinvoiceno%
	gui, 6: add, text, 0x8 h18 w100 right xs+5 yp+30, CUSTOMER:  
	gui, 6: add, dropdownlist, 0x8 w225 x+8 yp-4 left vcustomer, %list_customer%
	filereadline, customer, %a_scriptdir%\statements\%customer%\%rowtext1%.csv, 1
	find_this = %customer%
	Loop, read, %a_scriptdir%\customers.csv
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
	Gui, 9: Add, Progress, horizontal w250 h18 yp+15 vMyProgress
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
	gui, 6: show, noactivate, Create New Invoice
	gui, 6: add, text, 0x8 h25 w444 xs+5 yp+26 right, Tax: 
	gui, 6: add, text, 0x8 h25 w50 x+10 left vTaxTotal, $0.00
	gui, 6: add, text, 0x8 h25 w444 xs+5 yp+26 right, Total Amount: 
	gui, 6: add, text, 0x8 h25 w50 x+10 left vGrandTotal, $0.00
	gui, 6: add, button, 0x8 h45 w200 xs+15 yp+25 center gsave_invoice, SAVE
	invoice_length := strlen(getinvoiceno)
	if (invoice_length < 8)
	{
		gui, 6: add, button, 0x8 h45 w220 x+65 center gbutton_checkout vbuttoncheckout, CHECKOUT >>
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
	    		
	    		Loop, read, %a_scriptdir%\products.csv
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
	    }
	}
	Loop, read, %a_scriptdir%\statements\%customer%\%getinvoiceno%.csv
	{
	    LineNumber := A_Index - 2 ; skips first line of invoice that contains the customer name and date
	    Loop, parse, A_LoopReadLine, CSV
	    {
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
	return
}
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
list_view_customers:
{
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
	Loop, read, %a_scriptdir%\customers.csv
	{
	    LineNumberForItem = %A_Index%
	    Loop, parse, A_LoopReadLine, CSV
	    {
	    	if a_loopreadline contains %rowtext1%
	    	{
	    		if (a_index = 5)
		    	{
		    		guicontrol, , address, %a_loopfield%
		    	}
	    	}
	    }
	}
	gui, submit, nohide
	calc_total_amount := 0

	gui, 9: -Caption +border
	Gui, 9: Add, text, w250 h18, Saving Data...
	Gui, 9: Add, Progress, Range0-1188 horizontal w250 h18 yp+15 vMyProgress
	Gui, 9: Show, noactivate, 

	loop, files, %a_scriptdir%\statements\%customer%\*.*,
	{
		filereadline, date%a_index%, %a_loopfilefullpath%, 2
		date := date%a_index%
		Loop, read, %a_scriptdir%\customers.csv
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
		lv_add(, date, filename, total_amount)
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
;		if (length_filename < 8)
;		{
;			calc_total_amount := calc_total_amount + total_amount_num
;		}
		GuiControl, 9: , MyProgress, +1
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
	return
}
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ListViewRecentCustomers:
if A_GuiEvent = doubleclick
{
    LV_GetText(RecentCustomer, A_EventInfo)  ; Get the text from the row's first field.
	guicontrol, , customer, %RecentCustomer%
    return
}
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
save_recent_customer:
{
	gui, submit, nohide
	fileappend,%customer%, %a_scriptdir%\recent_customers.csv
	return
}
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
sub_clear_invoice:
{
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
}
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
sub_update_grandtotal:
{
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
			tax_total := round(tax_total, 2)
		}
	}
	
	grand_total := total1 + total2 + total3 + total4 + total5 + total6 + total7 + total8 + total9 + total10 + total11 + total12 + total13 + total14 + total15 + tax_total
	grand_total := round(grand_total, 2)
	gui, submit, nohide

	guicontrol, , taxtotal, $%tax_total%
	guicontrol, 5: , taxtotal, $%tax_total%
	guicontrol, 6: , taxtotal, $%tax_total%

	guicontrol, , grandtotal, $%grand_total%
	guicontrol, 5: , grandtotal, $%grand_total%
	guicontrol, 6: , grandtotal, $%grand_total%
	return
}
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
save_invoice:
{
	gui, submit, nohide
	if (invoiceno = "")
	{
		msgbox Invalid Invoice No.!
		return
	}	
	if (total1 == 0)
	{
		total1 := 
	}
	if (total2 == 0)
	{
		total2 := 
	}
	if (total3 == 0)
	{
		total3 := 
	}
	if (total4 == 0)
	{
		total4 := 
	}
	if (total5 == 0)
	{
		total5 := 
	}
	if (total6 == 0)
	{
		total6 := 
	}
	if (total7 == 0)
	{
		total7 := 
	}
	if (total8 == 0)
	{
		total8 := 
	}
	if (total9 == 0)
	{
		total9 := 
	}
	if (total10 == 0)
	{
		total10 := 
	}
	if (total11 == 0)
	{
		total11 := 
	}
	if (total12 == 0)
	{
		total12 := 
	}
	if (total13 == 0)
	{
		total13 := 
	}
	if (total14 == 0)
	{
		total14 := 
	}
	if (total15 == 0)
	{
		total15 := 
	}
	gui, submit, nohide

	FormatTime, TimeString, %NewInvoiceDate% T12, yyyyMMdd

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
	
	session_customer = %customer%
	session_invoiceno = %invoiceno%
	
	gosub, list_view_customers
	gosub, sub_load_listview_statements
	gosub, sub_load_listview_customers
	gui, 5: destroy
	gui, 6: destroy

	return
}
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
button_checkout:
{
	gui, submit, nohide
	if (invoiceno = "")
	{
		msgbox Invalid Invoice No.!
		return
	}	
	if (total1 == 0)
	{
		total1 := 
	}
	if (total2 == 0)
	{
		total2 := 
	}
	if (total3 == 0)
	{
		total3 := 
	}
	if (total4 == 0)
	{
		total4 := 
	}
	if (total5 == 0)
	{
		total5 := 
	}
	if (total6 == 0)
	{
		total6 := 
	}
	if (total7 == 0)
	{
		total7 := 
	}
	if (total8 == 0)
	{
		total8 := 
	}
	if (total9 == 0)
	{
		total9 := 
	}
	if (total10 == 0)
	{
		total10 := 
	}
	if (total11 == 0)
	{
		total11 := 
	}
	if (total12 == 0)
	{
		total12 := 
	}
	if (total13 == 0)
	{
		total13 := 
	}
	if (total14 == 0)
	{
		total14 := 
	}
	if (total15 == 0)
	{
		total15 := 
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

	gui, 7: add, edit, w500 r20 left, %invoice_at_checkout%
	gui, 7: add, button, w100 x+9 gPrint, Print
  	gui, 7: show, noactivate, Print Preview

	session_customer = %customer%
	session_invoiceno = %invoiceno%

  	gosub, list_view_customers
  	gosub, sub_load_listview_customers
  	gosub, sub_load_listview_statements
	return
}
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
Print:
{
	;run, print "%a_scriptdir%\invoice_sample.txt"
	Run, write /p "%a_scriptdir%\invoice_sample.txt"
	
	return
}
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

barcode:
{
	gui, submit, nohide
	GuiControlGet, OutputVar, FocusV 
	stringtrimleft, row, outputvar, 7
	guicontrolget, barcode, , %outputvar%

	line_number := 1

	barcode_length := strlen(barcode)

	if(barcode_length = 5)
	{
		loop, read, %a_scriptdir%\products.csv
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
					if a_index = 4
					{
						guicontrol, , quantity%row%, 1
					}
					if a_index = 5
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
}

barcode2:
{
	gui, submit, nohide
	; find barcode of the itemdescription2
	line_number := 1
	loop, read, %a_scriptdir%\products.csv
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
}

barcode3:
{
	gui, submit, nohide
	; find barcode of the itemdescription3
	line_number := 1
	loop, read, %a_scriptdir%\products.csv
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
	loop, read, %a_scriptdir%\products.csv
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
	loop, read, %a_scriptdir%\products.csv
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
	loop, read, %a_scriptdir%\products.csv
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
	loop, read, %a_scriptdir%\products.csv
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
	loop, read, %a_scriptdir%\products.csv
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
	loop, read, %a_scriptdir%\products.csv
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
	loop, read, %a_scriptdir%\products.csv
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
	loop, read, %a_scriptdir%\products.csv
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
	loop, read, %a_scriptdir%\products.csv
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
	loop, read, %a_scriptdir%\products.csv
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
	loop, read, %a_scriptdir%\products.csv
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
	loop, read, %a_scriptdir%\products.csv
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
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
LoadProduct:
{
	;get control name
	GuiControlGet, OutputVar, FocusV 
	itemdescription = %outputvar%
	stringtrimleft, row, outputvar, 15
	gui, submit, nohide
	loop, read, %a_scriptdir%\products.csv
	{
		Loop, parse, A_LoopReadLine, `,
	    {
	        if instr(a_loopreadline, %itemdescription%)
				var%a_index% := a_loopfield
				barcode_ := var1
				price_ := var3
				tax_ := var5
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
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

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
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
menuhandler_exit:
{
	exitapp
}
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
F5::
{
	run, %a_scriptdir%\Gulf Bay Marine - Procurement.ahk
}
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
SubmitExpense:
{
	gui, 2: submit, nohide
	fileappend,%ExpenseDueDate%`n%ExpenseVendor%`n%ExpenseAmount%`n%ExpensePaid%, %a_scriptdir%\expenses\%ExpenseDueDate%_%ExpenseVendor%_%ExpenseAmount%.txt	
	gui, 2: destroy
	gosub, sub_load_listview_expenses
	run, %a_scriptdir%\Gulf Bay Marine - Procurement.ahk
	return
}
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;UPDATE EXPENSE
ListViewExpense:
{
	if A_GuiEvent = doubleclick
	{
		gui, listview, listviewexpenses
		LV_GetText(RowText1, A_EventInfo, 1)
		LV_GetText(RowText2, A_EventInfo, 2)
		LV_GetText(RowText3, A_EventInfo, 3)
		LV_GetText(RowText4, A_EventInfo, 4)
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
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ListViewExpensePaid:
{
	if A_GuiEvent = doubleclick
	{
		gui, listview, listviewexpensespaid
		LV_GetText(RowText1, A_EventInfo, 1)
		LV_GetText(RowText2, A_EventInfo, 2)
		LV_GetText(RowText3, A_EventInfo, 3)
		LV_GetText(RowText4, A_EventInfo, 4)
		guicontrol, , Amount1, %RowText3%
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
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
	return
}

6guiclose:
{
	gui, 6: destroy
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
	gui, 10: destroy
	return
}

11guiclose:
{
	gui, 11: destroy
	return
}
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
UpdatedSubmitExpense:
{
	gui, 3: submit, nohide
	filedelete, %a_scriptdir%\expenses\%get_old_expenses_file%*.txt
	fileappend,%UpdatedExpenseDueDate%`n%UpdatedExpenseVendor%`n%UpdatedExpenseAmount%`n%UpdatedExpensePaid%, %a_scriptdir%\expenses\%UpdatedExpenseDueDate%_%UpdatedExpenseVendor%_%UpdatedExpenseAmount%.txt
	gui, 3: destroy		
	gosub, sub_load_listview_expenses
	run, %a_scriptdir%\Gulf Bay Marine - Procurement.ahk
	return
}
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
PrintExpense:
{
	run, print "%a_scriptdir%\MISS ANNA V - NESTCAM 0501180930.txt"
	return
}
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
sub_load_listview_expenses:
{
	gui, listview, listviewexpenses
	lv_delete()
	gui, listview, listviewexpensespaid
	lv_delete()
	loop, files, %a_scriptdir%\expenses\*.*,
	{
		filereadline, file_content_line_1, %A_LoopFileFullPath%, 1
		filereadline, file_content_line_2, %A_LoopFileFullPath%, 2
		filereadline, file_content_line_3, %A_LoopFileFullPath%, 3
		filereadline, file_content_line_4, %A_LoopFileFullPath%, 4
		if(file_content_line_4 == 1)
		{	
			;file_content_line_4 = YES
			gui, listview, listviewexpensespaid
			lv_add(, file_content_line_1, file_content_line_2, round(file_content_line_3, 2), file_content_line_4)
			LV_ModifyCol(1, "70 SortAsc")
			LV_ModifyCol(2, "200")
			LV_ModifyCol(3, "65 Integer")
			LV_ModifyCol(4, "40")
		}
		if(file_content_line_4 == 0)
		{
			gui, listview, listviewexpenses
			;file_content_line_4 = NO
			lv_add(, file_content_line_1, file_content_line_2, round(file_content_line_3, 2), file_content_line_4)
			LV_ModifyCol(1, "70 SortAsc")
			LV_ModifyCol(2, "200")
			LV_ModifyCol(3, "65 Integer")
			LV_ModifyCol(4, "40")
			total_expenses := round(total_expenses + file_content_line_3, 2)
		}
		guicontrol, , TotalExpenses, Total Expenses: $%total_expenses%
	}
	return
}
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
listview1:
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
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
SearchProduct:
{
	gui, submit, nohide
	loop % array_count
	{
		array%a_index% :=
	}
	len := StrLen(a_searchterm)
	array_count := 0
	Loop Parse, list_product_price_quantity, |
	{
		;StringLeft part, A_LoopField, len
;~ 		Sleep 500
		
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
		lv_add(, var1, var2, var3, var4)
		loop_count += 1
	}	
	Return
}
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
SearchProductCTRLF:
{
	gui, submit, nohide
	loop % array_count
	{
		array%a_index% :=
	}
	len := StrLen(a_searchterm)
	array_count := 0
	Loop Parse, list_product_price_quantity, |
	{
		;StringLeft part, A_LoopField, len
;~ 		Sleep 500
		
		If a_loopfield contains %a_searchterm%
		{
			array%array_count% := a_loopfield
			array_count += 1
		}
	}

	Gui, 11: default
	gui, 11: listview, listviewproducts

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
		lv_add(, var1, var2, var3, var4)
		loop_count += 1
	}	
	Return
}

;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;^F::
{
	gui, 11: destroy
	gui, 11: font, bold c s15, arial
	gui, 11: add, groupbox, section w500 r5 center, Search Results
	gui, 11: font,
	gui, 11: add, text, xs+10 yp+23 0x8 h18 right, Search Product:  
	gui, 11: add, edit, 0x8 h18 w400 x+8 vA_SearchTerm gSearchProductCTRLF left,  
	Gui, 11: add, listview, r8 w490 yp+22 xs+5 grid vlistviewproducts geditproduct vscroll, Barcode|Product|Sales|Quantity
	list_product =
	list_product_price =
	list_product_price_quantity =
	loop read, products.csv
	{
		gui, 11: default
		gui, 11: listview, listviewproducts

	   	StringSplit, item, A_LoopReadLine, `,
	   	item3 := round(item3, 2)
	   	item3 = $%item3%
	   	LV_Add("", item1, item2, item3, item4)
		LV_ModifyCol(1, "55")
		LV_ModifyCol(2, "290")
		LV_ModifyCol(3, "65 right")
		LV_ModifyCol(4, "55 center")
		LV_ModifyCol(5, "130")
		LV_ModifyCol(6, "50")
		list_product = %list_product%%item2%|
		list_product_price = %list_product_price%%item2%,%item3%|
		list_product_price_quantity = %list_product_price_quantity%%item1%,%item2%,%item3%,%item4%|
	}
	gui, 11: show, noactivate, Search Results 
	
	ControlFocus, edit1, Search Results
	winactivate, Search Results
	return
}
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
;00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
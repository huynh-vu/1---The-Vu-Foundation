filepath := a_scriptdir "\test.txt"

oOutlook := ComObjCreate("Outlook.application")

oOutlookMsg := oOutlook.CreateItem(0)

oOutlookMsg.Subject := "Text Report"
oOutlookMsg.Body := "the File in this emails path is " . FilePath
oOutlookMsg.To := "gulfbaymarine@gmail.com"

oOoutlookmsg.attachments.add(filepath)
/*  contact_browser ()
 Created by: Kirk as Designer, Created: 11/05/21, 14:41:40
 ------------------
 Purpose: 

*/
// 11/5/21 16:25 Comment by Tom Benedict //
If (Form:C1466#Null:C1517)
	var $ui_msg; $objectName_t : Text
	
	$objectName_t:=String:C10(FORM Event:C1606.objectName)
	
	Case of 
		: (Form event code:C388=On Load:K2:1)  //  catches all objects
			Form:C1466.contacts:=ds:C1482.Contacts.all().orderBy("last_name")
			Form:C1466.Subform:=Null:C1517
			
		: (Form event code:C388=On Clicked:K2:4)
			Case of 
				: ($objectName_t="btn_add")
					OBJECT SET SUBFORM:C1138(*; "Subform"; "contact_detail")
					Form:C1466.Subform:=ds:C1482.Contacts.new()
			End case 
			
		: (Form event code:C388=On Selection Change:K2:29)
			Case of 
				: ($objectName_t="contact_LB")
					
					If (Form:C1466.selected_contact=Null:C1517)
						OBJECT SET SUBFORM:C1138(*; "Subform"; "logo")
					Else 
						OBJECT SET SUBFORM:C1138(*; "Subform"; "contact_detail")
						Form:C1466.Subform:=Form:C1466.selected_contact
					End if 
					
					//  hacky way to refresh the list
					If (Records in table:C83([Contacts:1])#Form:C1466.contacts.length)
						Form:C1466.contacts:=ds:C1482.Contacts.all().orderBy("last_name")
					End if 
					
			End case 
			
	End case 
	
	
End if 
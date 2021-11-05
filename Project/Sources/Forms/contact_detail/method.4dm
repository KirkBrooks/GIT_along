/*  contact_detail ()
 Created by: Kirk as Designer, Created: 11/05/21, 14:44:54
 ------------------
 Purpose: 

*/

If (Form:C1466#Null:C1517)
	var $ui_msg; $objectName_t : Text
	
	$objectName_t:=String:C10(FORM Event:C1606.objectName)
	
	Case of 
		: (Form event code:C388=On Data Change:K2:15)  //  catches all objects
			ASSERT:C1129(Form:C1466.save().success; "Couldn't save the Contact.")
			
			
	End case 
	
End if 
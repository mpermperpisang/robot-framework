*** Settings ***
Documentation    	resource button
...					Menggunakan keyword dan variable dari resource.robot
...					Pengaturan awal test suite agar browser terbuka menggunakan Suite Setup
...					Untuk menjalankan test case satu persatu gunakan line robot -t (nama test case) (direktori test suite)

*** Keywords ***
#Pengaturan tombol-tombol	
Seat selection	
	Page Should Contain Button					xpath=//button[@data-target='#editSeat']
#=============================================================================================================================================================================
No seat selection
	Page Should Not Contain Button				xpath=//button[@data-target='#editSeat']
#=============================================================================================================================================================================
Split reservation
	${count1}=	Get Matching Xpath Count		xpath=//a[@href='#pas2']
	Run Keyword If		(${count1}==1)			Split pax
	...		ELSE IF		(${count1}==0)			No split pax
	#log to console	${count}					
#============================================================================================================================================================================
Split pax
	#>1 pax
	Page Should Contain Button					xpath=//button[@data-target='#splitPnr']
#============================================================================================================================================================================
No split pax
	#1 pax
	Page Should Not Contain Element				xpath=//button[@data-target='#splitPnr']
#=============================================================================================================================================================================
Edit baggage
	Page Should Contain					Add Baggage
#=============================================================================================================================================================================
No edit baggage
	Page Should Not Contain				Add Baggage
#=============================================================================================================================================================================
Print reservation
	Page Should Contain 				Email Reservation
	Page Should Contain 				Print Reservation
#=============================================================================================================================================================================
No print reservation
	Page Should Not Contain				Email Reservation
	Page Should Not Contain				Print Reservation
#=============================================================================================================================================================================
Print ticket
	Page Should Contain					Email Ticket
	Page Should Contain					Print Ticket
#=============================================================================================================================================================================
No print ticket
	Page Should Not Contain				Email Ticket
	Page Should Not Contain				Print Ticket
#=============================================================================================================================================================================
Print polis
	Page Should Contain 				Email Polis
	Page Should Contain 				Print Polis
#=============================================================================================================================================================================
No print polis
	Page Should Not Contain				Email Polis
	Page Should Not Contain				Print Polis
#=============================================================================================================================================================================
Print receipt
	Page Should Contain					Print Receipt
#=============================================================================================================================================================================
No print receipt
	Page Should Not Contain				Print Receipt
#=============================================================================================================================================================================
Auto tiket
	Page Should Contain					AUTOTICKET DETAIL
	Page Should Contain					Resend Email
	Page Should Contain					Remove Autoticket
	Page Should Not Contain Button		xpath=//button[@data-target='#autoticketpnr']
	Page Should Not Contain Button		Modification
#=============================================================================================================================================================================
No auto tiket
	Page Should Not Contain				AUTOTICKET DETAIL
	Page Should Not Contain				Resend Email
	Page Should Not Contain				Remove Autoticket
	Page Should Contain Button			xpath=//button[@data-target='#autoticketpnr']
	Page Should Contain 				Modification
#=============================================================================================================================================================================
No button auto tiket
	Page Should Contain					AUTOTICKET DETAIL
	Page Should Not Contain				Resend Email
	Page Should Not Contain				Remove Autoticket
	Page Should Not Contain Button		xpath=//button[@data-target='#autoticketpnr']
	Page Should Not Contain 			Modification
#==============================================================================================================================================================================
export button
	Page Should Contain Button			xpath=//button[@id='modalSlideUp1']
#==============================================================================================================================================================================
no export button
	Page Should Not Contain Button		xpath=//button[@id='modalSlideUp1']
#==============================================================================================================================================================================
start tutorial
    Page Should Contain Button			sizzle=button#reopenalltutorial.btn.btn-primary	
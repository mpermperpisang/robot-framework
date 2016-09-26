*** Settings ***
Documentation    	resource status pnr
...					Menggunakan keyword dan variable dari resource.robot
...					Pengaturan awal test suite agar browser terbuka menggunakan Suite Setup
...					Untuk menjalankan test case satu persatu gunakan line robot -t (nama test case) (direktori test suite)

*** Keywords ***
#Pengaturan berdasarkan status PNR
Status Booked	
	#elemen-elemen yang wajib dimiliki oleh PNR dengan status=BOOKED 
    Page Should Contain Button			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[2]/td[5]/button	
    Page Should Contain Button			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[3]/td[5]/button					 		
    Page Should Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button
    Page Should Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[2]	
    Page Should Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[3]
    Run Keyword If						'${object['itinerary']['autoPaymentNo']}'=='None'			booked no autoticket
    ...		ELSE IF						'${object['itinerary']['autoPaymentNo']}'<>'None'			booked autoticket
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Element Text Should Be				xpath=//div[@class='panel-body']/div/div/h5/span			BOOKED by ${object['itinerary']['bookedBy']} on ${object['itinerary']['bookingDate']} WIB
#=============================================================================================================================================================================
booked no autoticket
	#PNR status=BOOKED, autoticket=null
    Page Should Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[4]
    Page Should Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[5]
#==============================================================================================================================================================================    
booked autoticket
	#PNR status=BOOKED, autoticket=not null
    Page Should Not Contain Button		xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[4]
    Page Should Not Contain Button		xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[5]
    Element Text Should Be				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[3]		Cancel
#==============================================================================================================================================================================
Status Canceled
	#elemen-elemen yang wajib dimiliki oleh PNR dengan status=CANCELED
    Page Should Not Contain Button		xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/h4/button  
    Page Should Not Contain Button		xpath=//div[@class='panel-body']/div/div/table/tbody/tr[2]/td[5]/button					
    Page Should Not Contain Button		xpath=//div[@class='panel-body']/div/div/table/tbody/tr[3]/td[5]/button	
    Page Should Contain Element			xpath=//div[@class='panel-body']/div/div/h5[2]/span					   
    Page Should Not Contain Button		xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button
    Page Should Not Contain Button		xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[2]	
    Page Should Not Contain Button		xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[3]
    Page Should Not Contain Button		xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[4]
    Page Should Not Contain Button		xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[5]
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Element Text Should Be				xpath=//div[@class='panel-body']/div/div/h5/span			BOOKED by ${object['itinerary']['bookedBy']} on ${object['itinerary']['bookingDate']} WIB
	Element Text Should Be				xpath=//div[@class='panel-body']/div/div/h5[2]/span			CANCELED by ${object['itinerary']['cancelledBy']}
#=============================================================================================================================================================================    
Status Ticketed
	#elemen-elemen yang wajib dimiliki oleh PNR dengan status=TICKETED
    Page Should Not Contain Button		xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/h4/button    					
    Page Should Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[3]/div/h4/button						
    Page Should Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[3]/div/h4/button[2]	
    Page Should Contain Element			xpath=//div[@class='panel-body']/div/div/h5[2]/span
    Page Should Not Contain Button		xpath=//div[@class='panel-body']/div/div/table/tbody/tr[2]/td[5]/button					  
    Page Should Not Contain Button		xpath=//div[@class='panel-body']/div/div/table/tbody/tr[3]/td[5]/button					 
    Page Should Not Contain Button		xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button
    Page Should Not Contain Button		xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[2]	
    Page Should Not Contain Button		xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[3]
    Page Should Not Contain Button		xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[4]
    Page Should Not Contain Button		xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[5]
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Element Text Should Be				xpath=//div[@class='panel-body']/div/div/h5/span			BOOKED by ${object['itinerary']['bookedBy']} on ${object['itinerary']['bookingDate']} WIB
	Element Text Should Be				xpath=//div[@class='panel-body']/div/div/h5[2]/span			ISSUED by ${object['itinerary']['issuedBy']} on ${object['itinerary']['issuedDate']} WIB
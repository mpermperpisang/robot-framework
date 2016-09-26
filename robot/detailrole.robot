*** Settings ***
Documentation    	resource role
...					Menggunakan keyword dan variable dari resource.robot
...					Pengaturan awal test suite agar browser terbuka menggunakan Suite Setup
...					Untuk menjalankan test case satu persatu gunakan line robot -t (nama test case) (direktori test suite)

*** Keywords ***
#Pengaturan role setiap halaman    
#Pengaturan role untuk halaman PNR flight
role_attraction_report_pnr
	#log to console 	attraction report berhasil
    Page Should Not Contain Button			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[2]/td[5]/button	
    Page Should Not Contain Button			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[3]/td[5]/button					 		
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[2]	
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[3]
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[4]
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[5]
	Location Should Be						${HOME_URL}
	Page Should Contain						You do not have authorization to access this service
#=============================================================================================================================================================================
role_attraction_ticketing_pnr
	#log to console 	attraction ticketing berhasil
    Page Should Not Contain Button			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[2]/td[5]/button	
    Page Should Not Contain Button			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[3]/td[5]/button					 		
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[2]	
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[3]
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[4]
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[5]
	Location Should Be						${HOME_URL}
	Page Should Contain						You do not have authorization to access this service
#=============================================================================================================================================================================
role_hotel_confirm_pnr
	#log to console 	hotel confirm berhasil
    Page Should Not Contain Button			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[2]/td[5]/button	
    Page Should Not Contain Button			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[3]/td[5]/button					 		
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[2]	
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[3]
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[4]
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[5]
	Location Should Be						${HOME_URL}
	Page Should Contain						You do not have authorization to access this service
#=============================================================================================================================================================================
role_attraction_booking_pnr
	#log to console 	attraction booking berhasil
    Page Should Not Contain Button			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[2]/td[5]/button	
    Page Should Not Contain Button			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[3]/td[5]/button					 		
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[2]	
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[3]
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[4]
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[5]
	Location Should Be						${HOME_URL}
	Page Should Contain						You do not have authorization to access this service
#=============================================================================================================================================================================
role_report_pnr
	#log to console 	report berhasil
    ${STATUS}=						Get Text		xpath=//div[@class='panel-heading']/div/div[2]/h4[2]/span[2]
	Run Keyword If		'${STATUS}'=='BOOKED'			role_report_booked
	...		ELSE IF		'${STATUS}'=='CANCELED'			role_canceled
	...		ELSE IF		'${STATUS}'=='TICKETED'			role_ticketed
	Location Should Be						${HOME_URL}
	Page Should Not Contain					You do not have authorization to access this service
	
role_report_booked
    Page Should Contain Button				xpath=//div[@class='panel-body']/div/div/table/tbody/tr[2]/td[5]/button	
    Page Should Contain Button				xpath=//div[@class='panel-body']/div/div/table/tbody/tr[3]/td[5]/button					 		
    Page Should Contain Button				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[2]	
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[3]
	Element Text Should Be					xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button			Cancel
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[4]
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[5]
#=============================================================================================================================================================================
role_bookntsa_pnr
	#log to console 	book ntsa berhasil
    ${STATUS}=						Get Text		xpath=//div[@class='panel-heading']/div/div[2]/h4[2]/span[2]
	Run Keyword If		'${STATUS}'=='BOOKED'			role_bookntsa_booked
	...		ELSE IF		'${STATUS}'=='CANCELED'			role_canceled
	...		ELSE IF		'${STATUS}'=='TICKETED'			role_ticketed
    Page Should Contain						NTSA
    Page Should Contain						COMMISSION
    Page Should Contain						DISCOUNT
	Location Should Be						${HOME_URL}
	Page Should Not Contain					You do not have authorization to access this service
	
role_bookntsa_booked
    Page Should Contain Button				xpath=//div[@class='panel-body']/div/div/table/tbody/tr[2]/td[5]/button	
    Page Should Contain Button				xpath=//div[@class='panel-body']/div/div/table/tbody/tr[3]/td[5]/button					 		
    Page Should Contain Button				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button
    Page Should Contain Button				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[2]	
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[3]
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[4]
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[5]
    Element Text Should Be					xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button			Modification
    Element Text Should Be					xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[2]		Cancel
#=============================================================================================================================================================================
role_booking_pnr
	#log to console 	booking berhasil
    ${STATUS}=						Get Text		xpath=//div[@class='panel-heading']/div/div[2]/h4[2]/span[2]
	Run Keyword If		'${STATUS}'=='BOOKED'			role_booking_booked
	...		ELSE IF		'${STATUS}'=='CANCELED'			role_canceled
	...		ELSE IF		'${STATUS}'=='TICKETED'			role_ticketed
    Page Should Not Contain					NTSA
    Page Should Not Contain					COMMISSION
    Page Should Not Contain					DISCOUNT
	Page Should Not Contain					You do not have authorization to access this service
	
role_booking_booked
    Page Should Contain Button				xpath=//div[@class='panel-body']/div/div/table/tbody/tr[2]/td[2]/button	
    Page Should Contain Button				xpath=//div[@class='panel-body']/div/div/table/tbody/tr[3]/td[2]/button					 		
    Page Should Contain Button				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button
    Page Should Contain Button				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[2]	
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[3]
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[4]
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[5]
    Element Text Should Be					xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button			Modification
    Element Text Should Be					xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[2]		Cancel
    
role_canceled
    Page Should Not Contain Button			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[2]/td[2]/button	
    Page Should Not Contain Button			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[3]/td[2]/button					 		
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[2]	
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[3]
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[4]
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[5]
    
role_ticketed
    Page Should Not Contain Button			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[2]/td[2]/button	
    Page Should Not Contain Button			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[3]/td[2]/button					 		
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[2]	
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[3]
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[4]
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[5]
#=============================================================================================================================================================================
role_ticketing_pnr
	#log to console 	ticketing berhasil
    ${STATUS}=						Get Text		xpath=//div[@class='panel-heading']/div/div[2]/h4[2]/span[2]
	Run Keyword If		'${STATUS}'=='BOOKED'			role_ticketing_booked
	...		ELSE IF		'${STATUS}'=='CANCELED'			role_canceled
	...		ELSE IF		'${STATUS}'=='TICKETED'			role_ticketed
    Page Should Contain						NTSA
    Page Should Contain						COMMISSION
    Page Should Contain						DISCOUNT
	Location Should Be						${HOME_URL}
	Page Should Not Contain					You do not have authorization to access this service
	
role_ticketing_booked
    Page Should Contain Button				xpath=//div[@class='panel-body']/div/div/table/tbody/tr[2]/td[5]/button	
    Page Should Contain Button				xpath=//div[@class='panel-body']/div/div/table/tbody/tr[3]/td[5]/button					 		
    Page Should Contain Button				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button
    Page Should Contain Button				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[2]	
    Page Should Contain Button				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[3]
    Page Should Contain Button				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[4]
    Element Text Should Be					xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[4]			Cancel
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[5]
#=============================================================================================================================================================================
role_hotel_booking_pnr
	#log to console 	hotel booking berhasil
    Page Should Not Contain Button			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[2]/td[5]/button	
    Page Should Not Contain Button			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[3]/td[5]/button					 		
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[2]	
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[3]
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[4]
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[5]
	Location Should Be						${HOME_URL}
	Page Should Contain						You do not have authorization to access this service
#=============================================================================================================================================================================
role_notadmin_pnr
	#log to console 	notadmin berhasil
    ${STATUS}=						Get Text		xpath=//div[@class='panel-heading']/div/div[2]/h4[2]/span[2]
	Run Keyword If		'${STATUS}'=='BOOKED'		Status Booked
	...		ELSE IF		'${STATUS}'=='CANCELED'		role_canceled
	...		ELSE IF		'${STATUS}'=='TICKETED'		role_ticketed
	Location Should Be								${HOME_URL}
	Page Should Not Contain							You do not have authorization to access this service
#=============================================================================================================================================================================
role_admin_pnr
	#log to console 	admin berhasil
    ${STATUS}=						Get Text		xpath=//div[@class='panel-heading']/div/div[2]/h4[2]/span[2]
	Run Keyword If		'${STATUS}'=='BOOKED'		Status Booked
	...		ELSE IF		'${STATUS}'=='CANCELED'		role_canceled
	...		ELSE IF		'${STATUS}'=='TICKETED'		role_ticketed
	Location Should Be								${HOME_URL}
	Page Should Not Contain							You do not have authorization to access this service
#=============================================================================================================================================================================
role_flexy_booking_pnr
	#log to console 	attraction booking berhasil
    Page Should Not Contain Button			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[2]/td[5]/button	
    Page Should Not Contain Button			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[3]/td[5]/button					 		
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[2]	
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[3]
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[4]
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[5]
	Location Should Be						${HOME_URL}
	Page Should Contain						You do not have authorization to access this service
#=============================================================================================================================================================================	
role_flexy_ticketing_pnr
	#log to console 	attraction booking berhasil
    Page Should Not Contain Button			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[2]/td[5]/button	
    Page Should Not Contain Button			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[3]/td[5]/button					 		
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[2]	
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[3]
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[4]
    Page Should Not Contain Button			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[5]
	Location Should Be						${HOME_URL}
	Page Should Contain						You do not have authorization to access this service

#Pengaturan role untuk halaman retrieve flight
role_autho_retrieve
	Location Should Be						${RETRIEVE_URL}
	Page Should Not Contain					You do not have authorization to access this service
#============================================================================================================================================================================	
role_autho_avail
	Location Should Be						${AVAIL_URL}
	Page Should Not Contain					You do not have authorization to access this service
#============================================================================================================================================================================
role_notautho
	Location Should Be						${HOME_URL}
	Page Should Contain						You do not have authorization to access this service

#Pengaturan autorisasi menu report dan settings beserta isinya
Hak menu report
	Page Should Contain Element			xpath=//div[@class='content']/div/div[3]/ul/li/a/span
	Page Should Contain Element			xpath=//div[@class='content']/div/div[3]/ul/li[2]/a/span
	Page Should Contain Element			xpath=//div[@class='content']/div/div[3]/ul/li[3]/a/span
	Page Should Contain Element			xpath=//div[@class='content']/div/div[3]/ul/li[4]/a/span
	Page Should Contain Element			xpath=//div[@class='content']/div/div[3]/ul/li[5]/a/span
	Element Text Should Be				xpath=//div[@class='content']/div/div[3]/ul/li/a/span			Home
	Element Text Should Be				xpath=//div[@class='content']/div/div[3]/ul/li[2]/a/span		News
	Element Text Should Be				xpath=//div[@class='content']/div/div[3]/ul/li[3]/a/span		Report
	Element Text Should Be				xpath=//div[@class='content']/div/div[3]/ul/li[4]/a/span		Settings
	Element Text Should Be				xpath=//div[@class='content']/div/div[3]/ul/li[5]/a/span		Help
#============================================================================================================================================================================
No hak menu report
	Page Should Contain Element			xpath=//div[@class='content']/div/div[3]/ul/li/a/span
	Page Should Contain Element			xpath=//div[@class='content']/div/div[3]/ul/li[2]/a/span
	Page Should Contain Element			xpath=//div[@class='content']/div/div[3]/ul/li[3]/a/span
	Page Should Contain Element			xpath=//div[@class='content']/div/div[3]/ul/li[4]/a/span
	Page Should Not Contain Element		xpath=//div[@class='content']/div/div[3]/ul/li[5]/a/span
	Element Text Should Be				xpath=//div[@class='content']/div/div[3]/ul/li/a/span			Home
	Element Text Should Be				xpath=//div[@class='content']/div/div[3]/ul/li[2]/a/span		News
	Element Should Not Contain			xpath=//div[@class='content']/div/div[3]/ul/li[3]/a/span		Report
	Element Text Should Be				xpath=//div[@class='content']/div/div[3]/ul/li[3]/a/span		Settings
	Element Text Should Be				xpath=//div[@class='content']/div/div[3]/ul/li[4]/a/span		Help
#============================================================================================================================================================================
Hak report admin
	Hak report default
	Menu report admin
#============================================================================================================================================================================	
Hak report not admin
	Hak report default
	Menu report not admin
#============================================================================================================================================================================
Hak report attraction
	Hak report default
	Menu themepark report
#============================================================================================================================================================================
No hak report
	Location Should Be					${HOME_URL}
	Page Should Contain					You do not have authorization to access this service
	Page Should Not Contain Element		css=div.btn-group.btn-block	
#============================================================================================================================================================================
Hak report default
	Page Should Contain Element			css=div.btn-group.btn-block		
	Page Should Contain Element			xpath=//div[@class='panel-body']/div/div/div/div/button/span[2]
	Element Text Should Be				xpath=//div[@class='panel-body']/div/div/div/div/button/span[2]					STATEMENT OF ACCOUNT
	Page Should Contain Element			xpath=//div[@class='panel-body']/div/div/div[2]/div/button/span[2]
	Element Text Should Be				xpath=//div[@class='panel-body']/div/div/div[2]/div/button/span[2]				AIRLINE REVENUE
	Page Should Contain Element			xpath=//div[@class='panel-body']/div/div/div[3]/div/button/span[2]
	Element Text Should Be				xpath=//div[@class='panel-body']/div/div/div[3]/div/button/span[2]				HOTEL REVENUE
#============================================================================================================================================================================
Menu themepark report
	Page Should Contain Element			xpath=//div[@class='panel-body']/div/div/div[4]/div/button/span[2]
	Element Text Should Be				xpath=//div[@class='panel-body']/div/div/div[4]/div/button/span[2]				THEMEPARK REVENUE
#============================================================================================================================================================================
Menu report not admin
	Page Should Contain Element			xpath=//div[@class='panel-body']/div[2]/div/div/div/button/span[2]
	Element Text Should Be				xpath=//div[@class='panel-body']/div[2]/div/div/div/button/span[2]				CREDIT CARD REPORT
	Page Should Contain Element			xpath=//div[@class='panel-body']/div[2]/div/div[2]/div/button/span[2]
	Element Text Should Be				xpath=//div[@class='panel-body']/div[2]/div/div[2]/div/button/span[2]			TOPUP LIST
#============================================================================================================================================================================
Menu report admin
	Page Should Contain Element			xpath=//div[@class='panel-body']/div/div/div[4]/div/button/span[2]				
	Element Text Should Be				xpath=//div[@class='panel-body']/div/div/div[4]/div/button/span[2]				THEMEPARK REVENUE
	Page Should Contain Element			xpath=//div[@class='panel-body']/div[2]/div/div/div/button/span[2]				
	Element Text Should Be				xpath=//div[@class='panel-body']/div[2]/div/div/div/button/span[2]				AUTO TICKET REPORT
	Page Should Contain Element			xpath=//div[@class='panel-body']/div[2]/div/div[2]/div/button/span[2]				
	Element Text Should Be				xpath=//div[@class='panel-body']/div[2]/div/div[2]/div/button/span[2]			CREDIT CARD REPORT
	Page Should Contain Element			xpath=//div[@class='panel-body']/div[2]/div/div[3]/div/button/span[2]				
	Element Text Should Be				xpath=//div[@class='panel-body']/div[2]/div/div[3]/div/button/span[2]			TOP UP REPORT
	Page Should Contain Element			xpath=//div[@class='panel-body']/div[2]/div/div[4]/div/button/span[2]				
	Element Text Should Be				xpath=//div[@class='panel-body']/div[2]/div/div[4]/div/button/span[2]			REGISTERED MEMBERS
#============================================================================================================================================================================
Hak settings admin
	Page Should Contain Element			xpath=//div[@class='content']/div[3]/div/div/ul/li/a/span
	Element Text Should Be				xpath=//div[@class='content']/div[3]/div/div/ul/li/a/span						OFFICE PROFILE
	Page Should Contain Element			xpath=//div[@class='content']/div[3]/div/div/ul/li[2]/a/span
	Element Text Should Be				xpath=//div[@class='content']/div[3]/div/div/ul/li[2]/a/span					USER PROFILE
	Page Should Contain Element			xpath=//div[@class='content']/div[3]/div/div/ul/li[3]/a/span
	Element Text Should Be				xpath=//div[@class='content']/div[3]/div/div/ul/li[3]/a/span					USER MAINTENANCE
#============================================================================================================================================================================	
Hak settings no admin
	Page Should Contain Element			xpath=//div[@class='content']/div[3]/div/div/ul/li/a/span	
	Element Text Should Be				xpath=//div[@class='content']/div[3]/div/div/ul/li/a/span						USER PROFILE
	Element Should Not Contain			xpath=//div[@class='content']/div[3]/div/div/ul/li/a/span						OFFICE PROFILE
	Page Should Not Contain Element		xpath=//div[@class='content']/div[3]/div/div/ul/li[2]/a/span
	Page Should Not Contain Element		xpath=//div[@class='content']/div[3]/div/div/ul/li[3]/a/span					USER MAINTENANCE
#============================================================================================================================================================================
Hak listreport
	Location Should Be					${REPORT_URL}
	Title Should Be						Report - Voltras Agent Network
	Page Should Not Contain				You do not have authorization to access this service
#============================================================================================================================================================================
Hak SOA
	Location Should Be					${SOA_URL}
	Title Should Be						Statement of Account - Voltras Agent Network
	Page Should Not Contain				You do not have authorization to access this service
#============================================================================================================================================================================
Hak AR
	Location Should Be					${AR_URL}
	Title Should Be						Airline Revenue - Voltras Agent Network
	Page Should Not Contain				You do not have authorization to access this service
#============================================================================================================================================================================
Hak HR
	Location Should Be					${HR_URL}
	Title Should Be						Hotel Revenue - Voltras Agent Network
	Page Should Not Contain				You do not have authorization to access this service
#============================================================================================================================================================================
Hak ATT
	Location Should Be					${ATT_URL}
	Title Should Be						Themepark Revenue - Voltras Agent Network
	Page Should Not Contain				You do not have authorization to access this service
#============================================================================================================================================================================
Hak AUT
	Location Should Be					${AUT_URL}
	Title Should Be						Autoticket Report - Voltras Agent Network
	Page Should Not Contain				You do not have authorization to access this service
#============================================================================================================================================================================
Hak CC
	Location Should Be					${CC_URL}
	Title Should Be						Credit Card Report - Voltras Agent Network
	Page Should Not Contain				You do not have authorization to access this service
#============================================================================================================================================================================
Hak TU
	Location Should Be					${TU_URL}
	Title Should Be						Topup Report - Voltras Agent Network
	Page Should Not Contain				You do not have authorization to access this service
#============================================================================================================================================================================
Hak RM
	Location Should Be					${RM_URL}
	Title Should Be						Registered Members - Voltras Agent Network
	Page Should Not Contain				You do not have authorization to access this service
#============================================================================================================================================================================
rolepnr
	:FOR    ${IDX}    	IN RANGE    	0				13
	\	${LIST}=		Evaluate		${IDX}+1	
	\	Set Suite Variable				${IDX}
	\	Set Suite Variable				${LIST}
    #hak akses input
    \	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Chakakses%5Ccase0${LIST}
    \	Go To							${PNR_URL}?id=${idRolepnr}&transportationType=airline
	\	Location Should Be				${PNR_URL}?id=${idRolepnr}&transportationType=airline
    \	${json}= 						Get file 		C:/Users/User/workspace/van-web4/WebContent/test/pnr/case0${NAME}/input/TransportationRetrieveByIdResponse.txt
    \	${object}= 						Evaluate 		json.loads('''${json}''') 			json
    \	Set Suite Variable				${json}
    \	Set Suite Variable				${object}
    #\	log to console	${LIST}
    \	Run Keyword If					${LIST}==1		role_booking_pnr
    \	...		ELSE IF					${LIST}==2		role_bookntsa_pnr
    \	...		ELSE IF					${LIST}==3		role_ticketing_pnr
    \	...		ELSE IF					${LIST}==4		role_attraction_report_pnr
    \	...		ELSE IF					${LIST}==5		role_attraction_ticketing_pnr
    \	...		ELSE IF					${LIST}==6		role_hotel_confirm_pnr
    \	...		ELSE IF					${LIST}==7		role_attraction_booking_pnr
    \	...		ELSE IF					${LIST}==8		role_report_pnr
    \	...		ELSE IF					${LIST}==9		role_hotel_booking_pnr
    \	...		ELSE IF					${LIST}==10		role_notadmin_pnr
    \	...		ELSE IF					${LIST}==11		role_admin_pnr
    \	...		ELSE IF					${LIST}==12		role_flexy_booking_pnr
    \	...		ELSE IF					${LIST}==13		role_flexy_ticketing_pnr
    #\	Execute Manual Step				message=liat manual role utk pnr
    \	Sleep							1s
#==============================================================================================================================================================================
roleRetrieve
	:FOR    ${IDX}    	IN RANGE    	0				13
	\	${LIST}=		Evaluate		${IDX}+1	
	\	Set Suite Variable				${IDX}
	\	Set Suite Variable				${LIST}
	\	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Chakakses%5Ccase0${LIST}
	\	Go To							${RETRIEVE_URL}
	\	Run Keyword If					(${LIST}==1 or ${LIST}==2 or ${LIST}==3 or ${LIST}==10 or ${LIST}==11)		role_autho_retrieve
	\	...		ELSE IF					(${LIST}==1 or ${LIST}<>2 or ${LIST}<>3 or ${LIST}<>10 or ${LIST}<>11)		role_notautho
	#\	Pause Execution
	\	Sleep							1s
#==============================================================================================================================================================================	
roleAvail
	:FOR    ${IDX}    	IN RANGE    	0				13
	\	${LIST}=		Evaluate		${IDX}+1	
	\	Set Suite Variable				${IDX}
	\	Set Suite Variable				${LIST}
	\	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Chakakses%5Ccase0${LIST}
	\	Go To							${AVAIL_URL}
	\	Run Keyword If					(${LIST}==1 or ${LIST}==2 or ${LIST}==10 or ${LIST}==11)		role_autho_avail
	\	...		ELSE IF					(${LIST}<>1 or ${LIST}<>2 or ${LIST}<>10 or ${LIST}<>11)		role_notautho
#=============================================================================================================================================================================
roleListReport
	:FOR    ${IDX}    	IN RANGE    	0				13
	\	${LIST}=		Evaluate		${IDX}+1	
	\	Set Suite Variable				${IDX}
	\	Set Suite Variable				${LIST}
    #authorization input
	\	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Chakakses%5Ccase0${LIST}
	\	Go To							${REPORT_URL}
	\	Run Keyword If					'${NAME}'=='1' or '${NAME}'=='2' or '${NAME}'=='3' or '${NAME}'=='5' or '${NAME}'=='6' or '${NAME}'=='7' or '${NAME}'=='9' or '${NAME}'=='12' or '${NAME}'=='13'	No hak report
	\	...		ELSE IF					('${NAME}'=='4' or '${NAME}'=='8' or '${NAME}'=='10' or '${NAME}'=='11')		Hak listreport
#=============================================================================================================================================================================
roleSOA
	:FOR    ${IDX}    	IN RANGE    	0				13
	\	${LIST}=		Evaluate		${IDX}+1	
	\	Set Suite Variable				${IDX}
	\	Set Suite Variable				${LIST}
    #authorization input
	\	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Chakakses%5Ccase0${LIST}
	\	Go To							${SOA_URL}
	\	Run Keyword If					'${NAME}'=='8' or '${NAME}'=='10' or '${NAME}'=='11'		Hak SOA
	\	...		ELSE IF					'${NAME}'<>'8' or '${NAME}'<>'10' or '${NAME}'<>'11'		No hak report	
#=============================================================================================================================================================================
roleAR
	:FOR    ${IDX}    	IN RANGE    	0				13
	\	${LIST}=		Evaluate		${IDX}+1	
	\	Set Suite Variable				${IDX}
	\	Set Suite Variable				${LIST}
    #authorization input
	\	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Chakakses%5Ccase0${LIST}
	\	Go To							${AR_URL}
	\	Run Keyword If					'${NAME}'=='8' or '${NAME}'=='10' or '${NAME}'=='11'		Hak AR
	\	...		ELSE IF					'${NAME}'<>'8' or '${NAME}'<>'10' or '${NAME}'<>'11'		No hak report		
#=============================================================================================================================================================================
roleHR
	:FOR    ${IDX}    	IN RANGE    	0				13
	\	${LIST}=		Evaluate		${IDX}+1	
	\	Set Suite Variable				${IDX}
	\	Set Suite Variable				${LIST}
    #authorization input
	\	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Chakakses%5Ccase0${LIST}
	\	Go To							${HR_URL}
	\	Run Keyword If					'${NAME}'=='8' or '${NAME}'=='10' or '${NAME}'=='11'		Hak HR
	\	...		ELSE IF					'${NAME}'<>'8' or '${NAME}'<>'10' or '${NAME}'<>'11'		No hak report	
#=============================================================================================================================================================================
roleATT
	:FOR    ${IDX}    	IN RANGE    	0				13
	\	${LIST}=		Evaluate		${IDX}+1	
	\	Set Suite Variable				${IDX}
	\	Set Suite Variable				${LIST}
    #authorization input
	\	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Chakakses%5Ccase0${LIST}
	\	Go To							${ATT_URL}
	\	Run Keyword If					'${NAME}'=='4' or '${NAME}'=='8' or '${NAME}'=='10' or '${NAME}'=='11'		Hak ATT
	\	...		ELSE IF					'${NAME}'<>'4' or '${NAME}'<>'8' or '${NAME}'<>'10' or '${NAME}'<>'11'		No hak report	
#=============================================================================================================================================================================
roleAUT
	:FOR    ${IDX}    	IN RANGE    	0				13
	\	${LIST}=		Evaluate		${IDX}+1	
	\	Set Suite Variable				${IDX}
	\	Set Suite Variable				${LIST}
    #authorization input
	\	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Chakakses%5Ccase0${LIST}
	\	Go To							${AUT_URL}
	\	Run Keyword If					'${NAME}'=='11'			Hak AUT
	\	...		ELSE IF					'${NAME}'<>'11'			No hak report			
#=============================================================================================================================================================================
roleCC
	:FOR    ${IDX}    	IN RANGE    	0				13
	\	${LIST}=		Evaluate		${IDX}+1	
	\	Set Suite Variable				${IDX}
	\	Set Suite Variable				${LIST}
    #authorization input
	\	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Chakakses%5Ccase0${LIST}
	\	Go To							${CC_URL}
	\	Run Keyword If					'${NAME}'=='8' or '${NAME}'=='10' or '${NAME}'=='11'		Hak CC
	\	...		ELSE IF					'${NAME}'<>'8' or '${NAME}'<>'10' or '${NAME}'<>'11'		No hak report	
#=============================================================================================================================================================================
roleTU
	:FOR    ${IDX}    	IN RANGE    	0				13
	\	${LIST}=		Evaluate		${IDX}+1	
	\	Set Suite Variable				${IDX}
	\	Set Suite Variable				${LIST}
    #authorization input
	\	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Chakakses%5Ccase0${LIST}
	\	Go To							${TU_URL}
	\	Run Keyword If					'${NAME}'=='8' or '${NAME}'=='10' or '${NAME}'=='11'		Hak TU
	\	...		ELSE IF					'${NAME}'<>'8' or '${NAME}'<>'10' or '${NAME}'<>'11'		No hak report					
#=============================================================================================================================================================================
roleRM
	:FOR    ${IDX}    	IN RANGE    	0				13
	\	${LIST}=		Evaluate		${IDX}+1	
	\	Set Suite Variable				${IDX}
	\	Set Suite Variable				${LIST}
    #authorization input
	\	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Chakakses%5Ccase0${LIST}
	\	Go To							${RM_URL}
	\	Run Keyword If					'${NAME}'=='11'		Hak RM
	\	...		ELSE IF					'${NAME}'<>'11'		No hak report										
#==============================================================================================================================================================================
settings_admin
	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Csettings%5Cofficeprofile%5Ccase01
	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Chakakses%5Ccase0${NAME}
	Go To							${SETTINGS_URL}
	Hak settings admin
	Sleep							1s	
	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Csettings%5Cuserprofile%5Ccase01
	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Chakakses%5Ccase0${NAME}
	Go To							${SETTINGS_URL}
	Hak settings admin
	Sleep							1s
	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Csettings%5Cusermaintenance%5Ccase01
	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Chakakses%5Ccase0${NAME}
	Go To							${SETTINGS_URL}
	Hak settings admin
	Sleep							1s
#==============================================================================================================================================================================
settings_noadmin
    Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Csettings%5Cofficeprofile%5Ccase02
	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Chakakses%5Ccase0${NAME}
	Go To							${SETTINGS_URL}
	Hak settings no admin
	Sleep							1s
	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Csettings%5Cuserprofile%5Ccase02
	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Chakakses%5Ccase0${NAME}
	Go To							${SETTINGS_URL}
	Hak settings no admin
	Sleep							1s
	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Csettings%5Cusermaintenance%5Ccase02
	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Chakakses%5Ccase0${NAME}
	Go To							${SETTINGS_URL}
	Hak settings no admin
	Sleep							1s
*** Settings ***
Documentation    	resource avail
...					Menggunakan keyword dan variable dari resource.robot
...					Pengaturan awal test suite agar browser terbuka menggunakan Suite Setup
...					Untuk menjalankan test case satu persatu gunakan line robot -t (nama test case) (direktori test suite)

*** Keywords ***
#Pengaturan elemen availability result
check insurance
	#note insurance
	Page Should Contain Element			xpath=//div[@class='content']/div[2]/div/div[8]/div/input
	Page Should Contain Element			xpath=//div[@class='content']/div[2]/div/div[8]/div/label
#=============================================================================================================================================================================
adult default 1
	#field passenger
	#1 adult default
	Page Should Contain Element			xpath=//div[@class='panel-body']/div[contains(@class,'col-lg-12 bg-complete-lighter')]
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div/label
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div/div/div
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div/div[2]/input
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div/div[3]/input
	Page Should Contain Element			xpath=//input[@id='popupSearchSavedPax' and @name='adult.searchSavedPax.0']
#=============================================================================================================================================================================
avail_pax1
	#1 adult
	#adult
	adult default 1
	Page Should Not Contain Element		xpath=//div[@class='panel-body']/div[contains(@class,'col-lg-12 bg-complete-lighter')][2]
	#child
	Page Should Not Contain Element		xpath=//div[@class='panel-body']/div[contains(@class,'col-lg-12 bg-warning-lighter')]
	#infant
	Page Should Not Contain Element		xpath=//div[@class='panel-body']/div[contains(@class,'col-lg-12 bg-danger-lighter')]
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
	#tipe penumpang
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/label
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/label
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/label
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#gelar
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div/div
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/div/div
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div/div
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#nama lengkap
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div[2]/input
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/div[2]/input
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div[2]/input
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#no id
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div[3]/input
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/div[3]/input
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div[3]/input
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#search pax
	Page Should Not Contain Button		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div[5]/button
	Page Should Not Contain Button		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/div[5]/button
	Page Should Not Contain Button		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div[5]/button
#=============================================================================================================================================================================	
avail_pax2
	#2 adult
	adult default 1
	Page Should Contain Element			xpath=//div[@class='panel-body']/div[contains(@class,'col-lg-12 bg-complete-lighter')][2]
	Page Should Not Contain Element		xpath=//div[@class='panel-body']/div[contains(@class,'col-lg-12 bg-complete-lighter')][3]
	Page Should Not Contain Element		xpath=//div[@class='panel-body']/div[contains(@class,'col-lg-12 bg-warning-lighter')]
	Page Should Not Contain Element		xpath=//div[@class='panel-body']/div[contains(@class,'col-lg-12 bg-danger-lighter')]
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#tipe penumpang
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/label
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/label		${EMPTY}
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][3]/form/div/label
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/label
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/label
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#gelar
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div/div
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][3]/form/div/div/div
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/div/div
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div/div
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#nama lengkap
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div[2]/input
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][3]/form/div/div[2]/input
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/div[2]/input
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div[2]/input
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#no id
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div[3]/input
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][3]/form/div/div[3]/input
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/div[3]/input
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div[3]/input
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#search pax
	Page Should Contain Button			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div[5]/button
	Page Should Not Contain Button		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][3]/form/div/div[5]/button
	Page Should Not Contain Button		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/div[5]/button
	Page Should Not Contain Button		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div[5]/button
#=============================================================================================================================================================================
avail_pax3
	#1 adult + 1 child 
	adult default 1
	Page Should Not Contain Element		xpath=//div[@class='panel-body']/div[contains(@class,'col-lg-12 bg-complete-lighter')][2]
	Page Should Contain Element			xpath=//div[@class='panel-body']/div[contains(@class,'col-lg-12 bg-warning-lighter')]
	Page Should Not Contain Element		xpath=//div[@class='panel-body']/div[contains(@class,'col-lg-12 bg-warning-lighter')][2]
	Page Should Not Contain Element		xpath=//div[@class='panel-body']/div[contains(@class,'col-lg-12 bg-danger-lighter')]
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#tipe penumpang
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/label
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/label
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][2]/form/div/label
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/label
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#gelar
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div/div
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/div/div
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][2]/form/div/div/div
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div/div
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#nama lengkap
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div[2]/input
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/div[2]/input
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][2]/form/div/div[2]/input
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div[2]/input
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#no id
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div[3]/input
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/div[3]/input
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][2]/form/div/div[3]/input
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div[3]/input
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#search pax
	Page Should Not Contain Button		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div[5]/button
	Page Should Contain Button			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/div[5]/button
	Page Should Not Contain Button		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][2]/form/div/div[5]/button
	Page Should Not Contain Button		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div[5]/button
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
	#dob
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div[2]/div[2]/label
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div[2]/div[2]/label
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][2]/form/div[2]/div[2]/label
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div[2]/div[2]/label
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
	#date dob
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div[2]/div[3]/div/div/div/ul
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div[2]/div[3]/div/div/div/ul
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div[2]/div[3]/div/div/span			DD
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][2]/form/div[2]/div[3]/div/div/div/ul
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div[2]/div[3]/div/div/div/ul	
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#month dob 
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div[2]/div[3]/div[2]/div/div/ul
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div[2]/div[3]/div[2]/div/div/ul
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div[2]/div[3]/div[2]/div/span			MMM
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][2]/form/div[2]/div[3]/div[2]/div/div/ul
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div[2]/div[3]/div[2]/div/div/ul
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#year dob
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div[2]/div[3]/div[3]/div/div/ul
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div[2]/div[3]/div[3]/div/div/ul	
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div[2]/div[3]/div[3]/div/span			YYYY
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][2]/form/div[2]/div[3]/div[3]/div/div/ul
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div[2]/div[3]/div[3]/div/div/ul		
#=============================================================================================================================================================================
avail_pax4
	#1 adult + 1 child + 1 infant
	adult default 1
	Page Should Not Contain Element		xpath=//div[@class='panel-body']/div[contains(@class,'col-lg-12 bg-complete-lighter')][2]
	Page Should Contain Element			xpath=//div[@class='panel-body']/div[contains(@class,'col-lg-12 bg-warning-lighter')]
	Page Should Not Contain Element		xpath=//div[@class='panel-body']/div[contains(@class,'col-lg-12 bg-warning-lighter')][2]
	Page Should Contain Element			xpath=//div[@class='panel-body']/div[contains(@class,'col-lg-12 bg-danger-lighter')]
	Page Should Not Contain Element		xpath=//div[@class='panel-body']/div[contains(@class,'col-lg-12 bg-danger-lighter')][2]
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#tipe penumpang
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/label
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/label
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][2]/form/div/label
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/label
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/label
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#gelar
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div/div
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/div/div
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][2]/form/div/div/div
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div/div
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/div/div
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#nama lengkap
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div[2]/input
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/div[2]/input
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][2]/form/div/div[2]/input
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div[2]/input
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/div[2]/input
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#no id
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div[3]/input
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/div[3]/input
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][2]/form/div/div[3]/input
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div[3]/input
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/div[3]/input
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#adult assoc
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div[4]/div/div/div/ul
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/div[4]/div/div/div/ul
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div[4]/div/div/div/ul
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div[4]/div/div/span			Adult Assoc.
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/div[4]/div/div/div/ul
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#search pax
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div[5]/button
	Page Should Contain Button			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/div[5]/button
	Page Should Not Contain Button		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][2]/form/div/div[5]/button
	Page Should Contain Button			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div[5]/button
	Page Should Not Contain Button		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/div[5]/button
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#dob 
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div[2]/div[2]/label
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div[2]/div[2]/label
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][2]/form/div[2]/div[2]/label
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div[2]/div[2]/label
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div[2]/div[2]/label
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#date dob 
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div[2]/div[3]/div/div/div/ul
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div[2]/div[3]/div/div/div/ul
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div[2]/div[3]/div/div/span			DD
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][2]/form/div[2]/div[3]/div/div/div/ul
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div[2]/div[3]/div/div/div/ul	
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div[2]/div[3]/div/div/span				DD
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div[2]/div[3]/div/div/div/ul	
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#month dob 
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div[2]/div[3]/div[2]/div/div/ul
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div[2]/div[3]/div[2]/div/div/ul
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div[2]/div[3]/div[2]/div/span			MMM
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][2]/form/div[2]/div[3]/div[2]/div/div/ul
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div[2]/div[3]/div[2]/div/div/ul
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div[2]/div[3]/div[2]/div/span			MMM
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div[2]/div[3]/div[2]/div/div/ul
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#year dob 
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div[2]/div[3]/div[3]/div/div/ul
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div[2]/div[3]/div[3]/div/div/ul	
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div[2]/div[3]/div[3]/div/span			YYYY
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][2]/form/div[2]/div[3]/div[3]/div/div/ul
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div[2]/div[3]/div[3]/div/div/ul
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div[2]/div[3]/div[3]/div/span			YYYY
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div[2]/div[3]/div[3]/div/div/ul
#=============================================================================================================================================================================
avail_pax5
	#2 adult + 2 infant
	adult default 1
	Page Should Contain Element			xpath=//div[@class='panel-body']/div[contains(@class,'col-lg-12 bg-complete-lighter')][2]
	Page Should Not Contain Element		xpath=//div[@class='panel-body']/div[contains(@class,'col-lg-12 bg-complete-lighter')][3]
	Page Should Not Contain Element		xpath=//div[@class='panel-body']/div[contains(@class,'col-lg-12 bg-warning-lighter')]
	Page Should Contain Element			xpath=//div[@class='panel-body']/div[contains(@class,'col-lg-12 bg-danger-lighter')]
	Page Should Contain Element			xpath=//div[@class='panel-body']/div[contains(@class,'col-lg-12 bg-danger-lighter')][2]
	Page Should Not Contain Element		xpath=//div[@class='panel-body']/div[contains(@class,'col-lg-12 bg-danger-lighter')][3]
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#tipe penumpang
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/label
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/label		${EMPTY}
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][3]/form/div/label
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/label
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/label
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/label
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/label		${EMPTY}
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][3]/form/div/label
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#gelar
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div/div
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][3]/form/div/div/div
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/div/div
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div/div
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/div/div
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][3]/form/div/div/div
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#nama lengkap
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div[2]/input
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][3]/form/div/div[2]/input
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/div[2]/input
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div[2]/input
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/div[2]/input
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][3]/form/div/div[2]/input
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#no id
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div[3]/input
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][3]/form/div/div[3]/input
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/div[3]/input
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div[3]/input
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/div[3]/input
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][3]/form/div/div[3]/input
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#adult assoc
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div/div[4]/div/div/div/ul
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div[4]/div/div/div/ul
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][2]/form/div/div[4]/div/div/div/ul
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div[4]/div/div/div/ul
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div[4]/div/div/span			Adult Assoc.
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/div[4]/div/div/div/ul
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/div[4]/div/div/span			Adult Assoc.
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][3]/form/div/div[4]/div/div/div/ul
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#search pax
	Page Should Contain Button			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div[5]/button
	Page Should Not Contain Button		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][3]/form/div/div[5]/button
	Page Should Not Contain Button		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/div[5]/button
	Page Should Contain Button			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div[5]/button
	Page Should Contain Button			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/div[5]/button
	Page Should Not Contain Button		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][3]/form/div/div[5]/button
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#dob 
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div[2]/div[2]/label
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div[2]/div[2]/label
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div[2]/div[2]/label
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div[2]/div[2]/label
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div[2]/div[2]/label
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][3]/form/div[2]/div[2]/label
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#date dob 
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div[2]/div[3]/div/div/div/ul
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div[2]/div[3]/div/div/div/ul
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div[2]/div[3]/div/div/div/ul
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div[2]/div[3]/div/div/div/ul	
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div[2]/div[3]/div/div/span				DD
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div[2]/div[3]/div/div/div/ul	
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div[2]/div[3]/div/div/span			DD
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][3]/form/div[2]/div[3]/div/div/div/ul	
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#month dob 
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div[2]/div[3]/div[2]/div/div/ul
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div[2]/div[3]/div[2]/div/div/ul
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div[2]/div[3]/div[2]/div/div/ul
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div[2]/div[3]/div[2]/div/div/ul
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div[2]/div[3]/div[2]/div/span			MMM
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div[2]/div[3]/div[2]/div/div/ul
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div[2]/div[3]/div[2]/div/span		MMM
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][3]/form/div[2]/div[3]/div[2]/div/div/ul
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#year dob 
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div[2]/div[3]/div[3]/div/div/ul
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div[2]/div[3]/div[3]/div/div/ul
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div[2]/div[3]/div[3]/div/div/ul
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div[2]/div[3]/div[3]/div/div/ul
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div[2]/div[3]/div[3]/div/span			YYYY
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div[2]/div[3]/div[3]/div/div/ul
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div[2]/div[3]/div[3]/div/span		YYYY
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][3]/form/div[2]/div[3]/div[3]/div/div/ul
#=============================================================================================================================================================================
avail_pax6
	#6 adult + 6 child + 6 infant
	adult default 1
	Page Should Contain Element			xpath=//div[@class='panel-body']/div[contains(@class,'col-lg-12 bg-complete-lighter')][2]
	Page Should Contain Element			xpath=//div[@class='panel-body']/div[contains(@class,'col-lg-12 bg-complete-lighter')][3]
	Page Should Contain Element			xpath=//div[@class='panel-body']/div[contains(@class,'col-lg-12 bg-complete-lighter')][4]
	Page Should Contain Element			xpath=//div[@class='panel-body']/div[contains(@class,'col-lg-12 bg-complete-lighter')][5]
	Page Should Contain Element			xpath=//div[@class='panel-body']/div[contains(@class,'col-lg-12 bg-complete-lighter')][6]
	Page Should Not Contain Element		xpath=//div[@class='panel-body']/div[contains(@class,'col-lg-12 bg-complete-lighter')][7]
	Page Should Contain Element			xpath=//div[@class='panel-body']/div[contains(@class,'col-lg-12 bg-warning-lighter')]
	Page Should Contain Element			xpath=//div[@class='panel-body']/div[contains(@class,'col-lg-12 bg-warning-lighter')][2]
	Page Should Contain Element			xpath=//div[@class='panel-body']/div[contains(@class,'col-lg-12 bg-warning-lighter')][3]
	Page Should Contain Element			xpath=//div[@class='panel-body']/div[contains(@class,'col-lg-12 bg-warning-lighter')][4]
	Page Should Contain Element			xpath=//div[@class='panel-body']/div[contains(@class,'col-lg-12 bg-warning-lighter')][5]
	Page Should Contain Element			xpath=//div[@class='panel-body']/div[contains(@class,'col-lg-12 bg-warning-lighter')][6]
	Page Should Not Contain Element		xpath=//div[@class='panel-body']/div[contains(@class,'col-lg-12 bg-warning-lighter')][7]
	Page Should Contain Element			xpath=//div[@class='panel-body']/div[contains(@class,'col-lg-12 bg-danger-lighter')]
	Page Should Contain Element			xpath=//div[@class='panel-body']/div[contains(@class,'col-lg-12 bg-danger-lighter')][2]
	Page Should Contain Element			xpath=//div[@class='panel-body']/div[contains(@class,'col-lg-12 bg-danger-lighter')][3]
	Page Should Contain Element			xpath=//div[@class='panel-body']/div[contains(@class,'col-lg-12 bg-danger-lighter')][4]
	Page Should Contain Element			xpath=//div[@class='panel-body']/div[contains(@class,'col-lg-12 bg-danger-lighter')][5]
	Page Should Contain Element			xpath=//div[@class='panel-body']/div[contains(@class,'col-lg-12 bg-danger-lighter')][6]
	Page Should Not Contain Element		xpath=//div[@class='panel-body']/div[contains(@class,'col-lg-12 bg-danger-lighter')][7]
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#tipe penumpang
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/label
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/label		${EMPTY}
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][3]/form/div/label
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][3]/form/div/label		${EMPTY}
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][4]/form/div/label
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][4]/form/div/label		${EMPTY}
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][5]/form/div/label
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][5]/form/div/label		${EMPTY}
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][6]/form/div/label
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][6]/form/div/label		${EMPTY}
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][7]/form/div/label
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/label
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][2]/form/div/label
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][2]/form/div/label		${EMPTY}
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][3]/form/div/label
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][3]/form/div/label		${EMPTY}
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][4]/form/div/label
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][4]/form/div/label		${EMPTY}
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][5]/form/div/label
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][5]/form/div/label		${EMPTY}
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][6]/form/div/label
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][6]/form/div/label		${EMPTY}
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][7]/form/div/label
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/label
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/label
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/label		${EMPTY}
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][3]/form/div/label
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][3]/form/div/label		${EMPTY}
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][4]/form/div/label
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][4]/form/div/label		${EMPTY}
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][5]/form/div/label
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][5]/form/div/label		${EMPTY}
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][6]/form/div/label
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][6]/form/div/label		${EMPTY}
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][7]/form/div/label
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#gelar
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div/div
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][3]/form/div/div/div
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][4]/form/div/div/div
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][5]/form/div/div/div
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][6]/form/div/div/div
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][7]/form/div/div/div
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/div/div
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][2]/form/div/div/div
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][3]/form/div/div/div
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][4]/form/div/div/div
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][5]/form/div/div/div
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][6]/form/div/div/div
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][7]/form/div/div/div
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div/div
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/div/div
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][3]/form/div/div/div
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][4]/form/div/div/div
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][5]/form/div/div/div
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][6]/form/div/div/div
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][7]/form/div/div/div
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#nama lengkap
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div[2]/input
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][3]/form/div/div[2]/input
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][4]/form/div/div[2]/input
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][5]/form/div/div[2]/input
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][6]/form/div/div[2]/input
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][7]/form/div/div[2]/input
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/div[2]/input
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][2]/form/div/div[2]/input
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][3]/form/div/div[2]/input
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][4]/form/div/div[2]/input
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][5]/form/div/div[2]/input
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][7]/form/div/div[2]/input
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div[2]/input
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/div[2]/input
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][3]/form/div/div[2]/input
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][4]/form/div/div[2]/input
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][5]/form/div/div[2]/input
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][6]/form/div/div[2]/input
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][7]/form/div/div[2]/input
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#no id
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div[3]/input
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][3]/form/div/div[3]/input
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][4]/form/div/div[3]/input
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][5]/form/div/div[3]/input
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][6]/form/div/div[3]/input
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][7]/form/div/div[3]/input
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/div[3]/input
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][2]/form/div/div[3]/input
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][3]/form/div/div[3]/input
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][4]/form/div/div[3]/input
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][5]/form/div/div[3]/input
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][6]/form/div/div[3]/input
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][7]/form/div/div[3]/input
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div[3]/input
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/div[3]/input
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][3]/form/div/div[3]/input
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][4]/form/div/div[3]/input
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][5]/form/div/div[3]/input
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][6]/form/div/div[3]/input
	Page Should Not Contain Element		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][7]/form/div/div[3]/input
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#search pax
	Page Should Contain Button			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div[5]/button
	Page Should Contain Button			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][3]/form/div/div[5]/button
	Page Should Contain Button			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][4]/form/div/div[5]/button
	Page Should Contain Button			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][5]/form/div/div[5]/button
	Page Should Contain Button			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][6]/form/div/div[5]/button
	Page Should Not Contain Button		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][7]/form/div/div[5]/button
	Page Should Contain Button			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/div[5]/button
	Page Should Contain Button			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][2]/form/div/div[5]/button
	Page Should Contain Button			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][3]/form/div/div[5]/button
	Page Should Contain Button			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][4]/form/div/div[5]/button
	Page Should Contain Button			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][5]/form/div/div[5]/button
	Page Should Contain Button			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][6]/form/div/div[5]/button
	Page Should Not Contain Button		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][7]/form/div/div[5]/button
	Page Should Contain Button			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div[5]/button
	Page Should Contain Button			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/div[5]/button
	Page Should Contain Button			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][3]/form/div/div[5]/button
	Page Should Contain Button			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][4]/form/div/div[5]/button
	Page Should Contain Button			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][5]/form/div/div[5]/button
	Page Should Contain Button			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][6]/form/div/div[5]/button
	Page Should Not Contain Button		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][7]/form/div/div[5]/button
#============================================================================================================================================================================				
contact pax
	#label contact
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div/label
	#label customer
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div/div/label
	#full name
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div/div[2]/input
	#origin phone
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div/div[3]/input
	#other phone
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div/div[4]/input
	#button search
	Page Should Contain Element			xpath=//input[@id='popupSearchSavedPax' and @name='contactcustomer.searchSavedPax.1']
	#label agent
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div[2]/label
	#agent name
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div[2]/div/label
	#agent email
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div[2]/div[2]/input
	#agent phone
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div[2]/div[3]/input
	#saved pax
	Page Should Contain Element			xpath=//input[contains(@id,'checkbox9 savepassenger')]
	#label saved pax
	Page Should Contain Element			xpath=//div[contains(@class,'col-sm-6 checkbox check-primary checkbox-circle')]/label
	#tombol booking
	Page Should Contain Element			xpath=//div[contains(@class,'col-sm-6 text-right')]/button
	Element Text Should Be				xpath=//div[contains(@class,'col-sm-6 text-right')]/button									Booking
	#label booking purpose
	Page Should Contain Element			xpath=//div[contains(@class,'panel col-sm-12 panel-default')]/div[3]/label
	#list booking purpose
	Page Should Contain Element			xpath=//div[contains(@class,'panel col-sm-12 panel-default')]/div[3]/div/div/div/div/ul
	Element Text Should Be				xpath=//div[contains(@class,'panel col-sm-12 panel-default')]/div[3]/div/div/div/span		Personal
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ${json}= 							Get file 		C:/Users/User/workspace/van-web4/WebContent/test/commoninput/input/SelfOfficeInformationResponse1.txt
    ${object}= 							Evaluate 		json.loads('''${json}''') 			json
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------    
    Textfield Value Should Be			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div[2]/div/label			${object['name']}	
    Textfield Value Should Be			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div[2]/div[2]/input		${object['email']}	
    Textfield Value Should Be			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div[2]/div[3]/input		${object['phone']}	
    	
#Pengaturan avail fare
fare1
	avail_pax1
	Element_fare1
#============================================================================================================================================================================
fare2
	avail_pax2
	Element_fare1
#============================================================================================================================================================================
fare3
	avail_pax3
	Element_fare1
#============================================================================================================================================================================
fare4
	avail_pax4
	Element_fare2
#============================================================================================================================================================================
fare5
	avail_pax5
	Element_fare3
#============================================================================================================================================================================
fare6
	avail_pax6
	Element_fare3
#============================================================================================================================================================================
fare7
	avail_pax6
	Element_fare4
	
#Pengaturan elemen fare
Element_fare1
	label depart
	label airline
	nama airline
	label fare summary
	label nama airline
	harga flight
	label cur flight
	label service
	harga service
	label cur service
	label total
	harga total
	label cur total
	catatan maskapai
#============================================================================================================================================================================
Element_fare2
	label depart
	label airline
	nama airline
	label arrive
	label airline arrive
	nama airline arrive
	label fare summary arrive
	label nama airline arrive
	harga flight arrive
	label cur flight arrive
	label service arrive
	harga service arrive
	label cur service arrive
	label total arrive
	harga total arrive
	label cur total arrive
	catatan maskapai
#============================================================================================================================================================================
Element_fare3
	label depart
	label airline
	nama airline
	nama airline connecting
	label fare summary
	label nama airline
	harga flight
	label cur flight
	label service
	harga service
	label cur service
	label total
	harga total
	label cur total
	catatan maskapai
#============================================================================================================================================================================
Element_fare4
	label depart
	label airline
	nama airline
	nama airline connecting
	label fare summary
	label nama airline
	label nama airline connecting
	harga flight
	harga flight connecting
	label cur flight
	label cur flight connecting
	label service
	label service connecting
	harga service
	harga service connecting
	label cur service
	label cur service connecting
	label total
	label total connecting
	harga total
	harga total connecting
	label cur total
	label cur total connecting
	catatan maskapai
#============================================================================================================================================================================
label depart
	#label depart dan tanggalnya
	Page Should Contain Element			xpath=//div[@class='col-lg-3']/div/div/div/table/thead/tr/th
	Page Should Not Contain				???common.day.Ka???,
#============================================================================================================================================================================
label arrive
	#label depart dan tanggalnya
	Page Should Contain Element			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/thead/tr/th
#============================================================================================================================================================================
label airline
	#label airline, flight no, route dan etd	/eta
	Page Should Contain Element			xpath=//table[contains(@class,'table m-r-5 m-l-0 m-t-0 m-b-5 no-padding fs-12')]/thead/tr[2]/th
	Page Should Contain Element			xpath=//table[contains(@class,'table m-r-5 m-l-0 m-t-0 m-b-5 no-padding fs-12')]/thead/tr[2]/th[2]
	Page Should Contain Element			xpath=//table[contains(@class,'table m-r-5 m-l-0 m-t-0 m-b-5 no-padding fs-12')]/thead/tr[2]/th[3]
	Page Should Contain Element			xpath=//table[contains(@class,'table m-r-5 m-l-0 m-t-0 m-b-5 no-padding fs-12')]/thead/tr[2]/th[4]
#============================================================================================================================================================================
label airline arrive
	#label airline, flight no, route dan etd	/eta
	Page Should Contain Element			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/thead/tr[2]/th
	Page Should Contain Element			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/thead/tr[2]/th[2]
	Page Should Contain Element			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/thead/tr[2]/th[3]
	Page Should Contain Element			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/thead/tr[2]/th[4]
#============================================================================================================================================================================
nama airline
	#nama airline dan barisannya
	Page Should Contain Element			xpath=//table[contains(@class,'table m-r-5 m-l-0 m-t-0 m-b-5 no-padding fs-12')]/tbody/tr/td
	Page Should Contain Element			xpath=//table[contains(@class,'table m-r-5 m-l-0 m-t-0 m-b-5 no-padding fs-12')]/tbody/tr/td[2]
	Page Should Contain Element			xpath=//table[contains(@class,'table m-r-5 m-l-0 m-t-0 m-b-5 no-padding fs-12')]/tbody/tr/td[3]
	Page Should Contain Element			xpath=//table[contains(@class,'table m-r-5 m-l-0 m-t-0 m-b-5 no-padding fs-12')]/tbody/tr/td[4]
#============================================================================================================================================================================
nama airline arrive
	#nama airline dan barisannya
	Page Should Contain Element			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/tbody/tr/td
	Page Should Contain Element			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/tbody/tr/td[2]
	Page Should Contain Element			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/tbody/tr/td[3]
	Page Should Contain Element			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/tbody/tr/td[4]
#============================================================================================================================================================================
nama airline connecting
	#nama airline dan barisannya
	Page Should Contain Element			xpath=//table[contains(@class,'table m-r-5 m-l-0 m-t-0 m-b-5 no-padding fs-12')]/tbody[2]/tr/td
	Page Should Contain Element			xpath=//table[contains(@class,'table m-r-5 m-l-0 m-t-0 m-b-5 no-padding fs-12')]/tbody[2]/tr/td[2]
	Page Should Contain Element			xpath=//table[contains(@class,'table m-r-5 m-l-0 m-t-0 m-b-5 no-padding fs-12')]/tbody[2]/tr/td[3]
	Page Should Contain Element			xpath=//table[contains(@class,'table m-r-5 m-l-0 m-t-0 m-b-5 no-padding fs-12')]/tbody[2]/tr/td[4]
#============================================================================================================================================================================
label fare summary
	#label fare summary
	Page Should Contain Element			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/thead/tr/th
#============================================================================================================================================================================
label fare summary arrive
	#label fare summary
	Page Should Contain Element			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[3]/thead/tr/th
#============================================================================================================================================================================
label nama airline
	#label nama airline
	Page Should Contain Element			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/tbody/tr/td
#============================================================================================================================================================================
label nama airline arrive
	#label nama airline
	Page Should Contain Element			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[3]/tbody/tr/td
#============================================================================================================================================================================
label nama airline connecting
	#label nama airline
	Page Should Contain Element			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/tbody/tr[3]/td
#============================================================================================================================================================================
harga flight
	#harga flight
	Page Should Contain Element			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/tbody/tr/td[2]/span
	Element Should Contain				xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/tbody/tr/td[2]/span			.
	Element Should Not Contain			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/tbody/tr/td[2]/span			,
#============================================================================================================================================================================
harga flight arrive
	#harga flight
	Page Should Contain Element			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[3]/tbody/tr/td[2]/span
	Element Should Contain				xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[3]/tbody/tr/td[2]/span			.
	Element Should Not Contain			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[3]/tbody/tr/td[2]/span			,
#============================================================================================================================================================================
harga flight connecting
	#harga flight
	Page Should Contain Element			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/tbody/tr[3]/td[2]/span
	Element Should Contain				xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/tbody/tr[3]/td[2]/span		.
	Element Should Not Contain			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/tbody/tr[3]/td[2]/span		,
#============================================================================================================================================================================
label cur flight
	#label currency flight
	Page Should Contain Element			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/tbody/tr/td[3]/span
	Element Text Should Be				xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/tbody/tr/td[3]/span			IDR
#============================================================================================================================================================================
label cur flight arrive
	#label currency flight
	Page Should Contain Element			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[3]/tbody/tr/td[3]/span
	Element Text Should Be				xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[3]/tbody/tr/td[3]/span			IDR	
#============================================================================================================================================================================
label cur flight connecting
	#label currency flight
	Page Should Contain Element			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/tbody/tr[3]/td[3]/span
	Element Text Should Be				xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/tbody/tr[3]/td[3]/span		IDR
#============================================================================================================================================================================
label service
	#label service fee/discount
	Page Should Contain Element			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/tbody/tr[2]/td
#============================================================================================================================================================================
label service arrive
	#label service fee/discount
	Page Should Contain Element			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[3]/tbody/tr[2]/td
#============================================================================================================================================================================
label service connecting
	#label service fee/discount
	Page Should Contain Element			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/tbody/tr[4]/td
#============================================================================================================================================================================
harga service
	#harga service
	Page Should Contain Element			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/tbody/tr[2]/td[2]//input[contains(@class,'form-control input-sm text-right fs-12')]
	${servalue}=						Get Value		xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/tbody/tr[2]/td[2]//input[contains(@class,'form-control input-sm text-right fs-12')]
	Set Global Variable					${servalue}
	Run Keyword If						${servalue}==0		fee0
	...		ELSE IF						${servalue}<>0		fee1
#============================================================================================================================================================================
harga service arrive
	#harga service
	Page Should Contain Element			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[3]/tbody/tr[2]/td[2]//input[contains(@class,'form-control input-sm text-right fs-12')]
	${servalue}=						Get Value		xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[3]/tbody/tr[2]/td[2]//input[contains(@class,'form-control input-sm text-right fs-12')]	
	Set Global Variable					${servalue}
	Run Keyword If						${servalue}==0		fee0
	...		ELSE IF						${servalue}<>0		fee1
#============================================================================================================================================================================
harga service connecting
	#harga service
	Page Should Contain Element			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/tbody/tr[4]/td[2]//input[contains(@class,'form-control input-sm text-right fs-12')]
	${servalue}=						Get Value			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/tbody/tr[4]/td[2]//input[contains(@class,'form-control input-sm text-right fs-12')]	
	Set Global Variable					${servalue}
	Run Keyword If						${servalue}==0		fee0
	...		ELSE IF						${servalue}<>0		fee1
#============================================================================================================================================================================
fee0
	Should Not Contain					${servalue}		.
	Should Not Contain					${servalue}		,
#=============================================================================================================================================================================	
fee1
	Should Contain						${servalue}		.
	Should Not Contain					${servalue}		,
#============================================================================================================================================================================
label cur service
	#label currency service
	Page Should Contain Element			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/tbody/tr[2]/td[3]/span
	Element Text Should Be				xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/tbody/tr[2]/td[3]/span		IDR
#============================================================================================================================================================================
label cur service arrive
	#label currency service
	Page Should Contain Element			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[3]/tbody/tr[2]/td[3]/span
	Element Text Should Be				xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[3]/tbody/tr[2]/td[3]/span		IDR
#============================================================================================================================================================================
label cur service connecting
	#label currency service
	Page Should Contain Element			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/tbody/tr[4]/td[3]/span
	Element Text Should Be				xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/tbody/tr[4]/td[3]/span		IDR
#============================================================================================================================================================================
label total
	#label total
	Page Should Contain Element			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/tbody/tr[3]/td
#============================================================================================================================================================================
label total arrive
	#label total
	Page Should Contain Element			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[3]/tbody/tr[3]/td
#============================================================================================================================================================================
label total connecting
	#label total
	Page Should Contain Element			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/tbody/tr[5]/td
#============================================================================================================================================================================
harga total
	#harga total
	Page Should Contain Element			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/tbody/tr[3]/td[2]/span
	Element Should Contain				xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/tbody/tr[3]/td[2]/span		.
	Element Should Not Contain			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/tbody/tr[3]/td[2]/span		,
#============================================================================================================================================================================
harga total arrive
	#harga total
	Page Should Contain Element			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[3]/tbody/tr[3]/td[2]/span
	Element Should Contain				xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[3]/tbody/tr[3]/td[2]/span		.
	Element Should Not Contain			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[3]/tbody/tr[3]/td[2]/span		,
#============================================================================================================================================================================
harga total connecting
	#harga total
	Page Should Contain Element			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/tbody/tr[5]/td[2]/span
	Element Should Contain				xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/tbody/tr[5]/td[2]/span		.
	Element Should Not Contain			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/tbody/tr[5]/td[2]/span		,
#============================================================================================================================================================================
label cur total
	#label currency total
	Page Should Contain Element			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/tbody/tr[3]/td[3]/span
	Element Text Should Be				xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/tbody/tr[3]/td[3]/span		IDR
#============================================================================================================================================================================
label cur total arrive
	#label currency total
	Page Should Contain Element			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[3]/tbody/tr[3]/td[3]/span
	Element Text Should Be				xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[3]/tbody/tr[3]/td[3]/span		IDR
#============================================================================================================================================================================
label cur total connecting
	#label currency total
	Page Should Contain Element			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/tbody/tr[5]/td[3]/span
	Element Text Should Be				xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/tbody/tr[5]/td[3]/span		IDR
#============================================================================================================================================================================
catatan maskapai
	#note flight
	Page Should Contain Element			xpath=//div[@class='col-lg-3']/div/div[2]//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]
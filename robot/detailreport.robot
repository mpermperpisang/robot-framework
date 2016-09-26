*** Settings ***
Documentation    	resource detail report
...					Menggunakan keyword dan variable dari resource.robot
...					Pengaturan awal test suite agar browser terbuka menggunakan Suite Setup
...					Untuk menjalankan test case satu persatu gunakan line robot -t (nama test case) (direktori test suite)

*** Keywords ***
#Pengaturan elemen header menu default
List menu header
	#elemen label menu home
	Page Should Contain Element			xpath=//div[@class='content']/div[2]/ul/li/a
	#elemen gambar >
	Page Should Contain Element			xpath=//div[@class='content']/div[2]/ul/li
	#elemen label menu pnr list
	Page Should Contain Element			xpath=//div[@class='content']/div[2]/ul/li[2]/a
#=============================================================================================================================================================================
List submenu header	
	#elemen gambar >
	Page Should Contain Element			xpath=//div[@class='content']/div[2]/ul/li[3]
	#elemen menu statement of account
	Page Should Contain Element			xpath=//div[@class='content']/div[2]/ul/li[3]/a
#=============================================================================================================================================================================
Header menu
	#label Van News
	Page Should Contain Element			xpath=//div[@class='content']/div[2]/h3
	#keterangan Archive of our news, based on newest date
	Page Should Contain Element			xpath=//div[@class='content']/div[2]
#=============================================================================================================================================================================	
Date subyek
	#elemen date news
	Page Should Contain Element			xpath=//div[@class='content']/div[3]/div/div/div/div/div/div/div
	#elemen judul news
	Page Should Contain Element			xpath=//div[@class='content']/div[3]/div/div/div/div/div/div/div/h3
#=============================================================================================================================================================================
Content list
	#elemen image
	Page Should Contain Element			xpath=//div[@class='content']/div[3]/div/div/div/div/div/div[2]/div/div/img
	#elemen isi news
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-6 col-md-6')]/p
	#elemen read more  
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-6 col-md-6')]/a
#=============================================================================================================================================================================
Search export
	#tombol search
	Page Should Contain Element			xpath=//button[contains(@class,'btn btn-primary pull-right btn-block')]	
	#tombol export
	button export
#=============================================================================================================================================================================	
Field default
	#label FROM
	Page Should Contain Element			xpath=//form[@id='form-work']/div/div/label
	#from date
	Page Should Contain Element			xpath=//form[@id='form-work']/div/div/div/div/input
	Page Should Contain Element			xpath=//form[@id='form-work']/div/div/div/div/span/i
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
	${from}= 							Get WebElement  		xpath=//input[@class='form-control' and @name='dateFrom']
	${FROMREADONLY}=				 	set variable			${from.get_attribute('readonly')} 
    Should Be Equal  					${FROMREADONLY}   											true
	Should Not Be Equal					${FROMREADONLY}												false
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#label TO
	Page Should Contain Element			xpath=//div[@class='form-group']/label[2]
	#to date
	Page Should Contain Element			xpath=//div[@class='form-group']/div[2]/div/input
	Page Should Contain Element			xpath=//div[@class='form-group']/div[2]/div/span/i
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${to}= 								Get WebElement  		xpath=//input[@class='form-control' and @name='dateTo']
	${TOREADONLY}=					 	set variable			${to.get_attribute('readonly')} 
    Should Be Equal  					${TOREADONLY}   											true
	Should Not Be Equal					${TOREADONLY}												false 
#=============================================================================================================================================================================
Currency default
	#label currency
	Page Should Contain Element			xpath=//div[@class='form-group']/label[3]
	#list currency
	Page Should Contain Element			xpath=//div[@class='form-group']/div[3]/div/div/div/ul
	Page Should Contain Element			xpath=//div[@class='form-group']/div[3]/div/div/span
#=============================================================================================================================================================================
Header tabel
	#label Date (GMT+0700)
	Page Should Contain Element			xpath=//table[@id='tableWithSearch']/thead/tr/th
	#label USER ID
	Page Should Contain Element			xpath=//table[@id='tableWithSearch']/thead/tr/th[2]
	#label TYPE
	Page Should Contain Element			xpath=//table[@id='tableWithSearch']/thead/tr/th[3]
	#label ITEM
	Page Should Contain Element			xpath=//table[@id='tableWithSearch']/thead/tr/th[4]
#=============================================================================================================================================================================
Report default
	Field default
	Currency default
	Search export
	Header tabel
	#entries
	Page Should Contain Element			xpath=//div[@id='tableWithSearch_info' and @class='dataTables_info']
	#paging
	Page Should Contain Element			xpath=//div[contains(@class,'dataTables_paginate paging_simple_numbers') and @id='tableWithSearch_paginate']
#=============================================================================================================================================================================
button export
	Run Keyword If						${text}<>0		Export_report
	...		ELSE IF						${text}==0		No export_report
#=============================================================================================================================================================================
Export_report
	Page Should Contain Element			xpath=//button[contains(@class,'btn btn-primary btn-cons') and @id='modalSlideUp1']
#=============================================================================================================================================================================
No export_report
	Page Should Not Contain Element		xpath=//button[contains(@class,'btn btn-primary btn-cons') and @id='modalSlideUp1']
#=============================================================================================================================================================================
Kategori news
	#elemen kategori
	Page Should Contain Element			xpath=//span[contains(@class,'label label-info font-montserrat fs-11')]
	Page Should Contain Element			xpath=//span[contains(@class,'label label-info font-montserrat fs-11')][2]	
	#label CATEGORIES
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-3 col-md-3')]/div/div/div
	#elemen list kategori
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-3 col-md-3')]div/div[2]/ul/li/a
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-3 col-md-3')]div/div[2]/ul/li[2]/a
#=============================================================================================================================================================================
Indeks		
	#elemen newer
	Page Should Contain Element			xpath=//div[contains(@class,'row full-width center-margin')]/ul/li			
	#elemen newest index
	Page Should Contain Element			xpath=//div[contains(@class,'row full-width center-margin')]/ul/li[2]
#=============================================================================================================================================================================
Paging
	#elemen paging
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-9 col-md-9 ')]/div[2]/ul/li/a
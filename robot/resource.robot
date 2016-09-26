*** Settings ***
Documentation     	File resource ini berisi keyword-keyword dan variable yang dapat digunakan berulang kali
...					Menggunakan library selenium sebagai library utama
...					Resource untuk van-web4 testing
...					-Dshowservice="true" -Dsuspendscheduler="true" -Distest="true" pengaturan server
Library           	Selenium2Library
Library				RequestsLibrary
Library				String
Library				OperatingSystem
Library				Dialogs
| Resource | 		detaildata.robot
| Resource | 		detailrole.robot
| Resource | 		detailbahasa.robot
| Resource | 		detailavail.robot
| Resource | 		detailbutton.robot
| Resource | 		detailpnrstatus.robot
| Resource | 		detailpnr.robot
| Resource | 		detailreport.robot
| Resource | 		detailretrieve.robot
| Resource | 		detailexception.robot
#Library				HttpLibrary.HTTP  Live Testing

*** Variables ***
#Pengaturan browser dan kecepatan selenium
${BROWSER}        			ff
${OPEN}						${EMPTY}
${DELAY}          			1
#Pengaturan URL
${SERVER}         			http://localhost:8081/van-web4/
${RESPONSE_URL}				${SERVER}test/inputresponse.jsp?folder=
${LOGIN_URL}      			${SERVER}login.jsp
${HOME_URL}					${SERVER}home.jsp
${PNR_URL}					${SERVER}pnr_flight.jsp
${REPORT_URL}				${SERVER}report.jsp
${SETTINGS_URL}				${SERVER}settings.jsp
${USERPROFILE_URL}			${SETTINGS_URL}?page=user
${USERMAINTENANCE_URL}		${SETTINGS_URL}?page=user-maintain
${AVAIL_URL}				${SERVER}avail.jsp
${RETRIEVE_URL}				${SERVER}pnr_list_flight.jsp
${LISTNEWS_URL}				${SERVER}news.jsp
${NEWS_URL}					${SERVER}newsdetail.jsp?newsID=136
${LISTTIPS_URL}				${SERVER}tips.jsp
${TIPS_URL}					${SERVER}tipsdetail.jsp?tipsID=139
${SOA_URL}					${SERVER}statementofaccount.jsp
${AR_URL}					${SERVER}revenue.jsp
${HR_URL}					${SERVER}hotel_revenue.jsp
${ATT_URL}					${SERVER}themepark_revenue.jsp
${AUT_URL}					${SERVER}autoticket_report.jsp
${CC_URL}					${SERVER}cc_report.jsp
${TU_URL}					${SERVER}topup_list.jsp
${RM_URL}					${SERVER}registered_member.jsp

*** Keywords ***
#Pengaturan browser
Buka browser
	#membuka browser pertama kali yang diisi dengan newtab (${EMPTY})
    Open Browser    					${OPEN}			${BROWSER}   
    Maximize Browser Window	
    Set Selenium Speed    				${DELAY}
    Sleep								1s
#============================================================================================================================================================================
Tutup browser
	Close Browser
	
#Pengaturan login
Menuju login
	#pergi ke halaman login dan memerika setiap elemen  di halaman tsb
    Go To    							${LOGIN_URL}
    Elemen Login
#=============================================================================================================================================================================
Elemen login
	#elemen-elemen yang wajib ada di halaman login
    Title Should Be    					Member Login - Voltras Agent Network
   	Page Should Contain Element			xpath=//input[@name='username']
    Page Should Contain Element			xpath=//input[@name='password']
    Page Should Contain Link			id=linkForgot
    Page Should Contain Button			xpath=//form[@id='form-login']/button
    Page Should Contain Element			xpath=//div[@class='bg-pic']/div/h2
    Page Should Contain Element			xpath=//div[@class='bg-pic']/div/p
#=============================================================================================================================================================================
Isi username
	#mengisi username secara dinamis
    [Arguments]    						${username}
    Input Text     						username   		${username}
#=============================================================================================================================================================================
Isi password
	#mengisi password secara dinamis
    [Arguments]    						${password}
    Input Text     						password    	${password}
#=============================================================================================================================================================================
Submit login
	#tombol sign in/masuk
   	Submit Form							form-login
#=============================================================================================================================================================================
Judul beranda
	#elemen yang wajib ada sebagai penanda telah berhasil login
	Location Should Be					${HOME_URL}
	Title Should Be						Home - Voltras Agent Network

#Pengaturan halaman default
Isi halaman
	#elemen-elemen yang wajib ada di setiap halaman
	Elemen welcome
	Elemen bahasa
	Elemen menu
	Elemen avail
	Elemen footer
#=============================================================================================================================================================================
Elemen welcome
	#berisi informasi user
	Page Should Contain Element			xpath=//div[@id='accountInfo']/span/i
	#elemen Welcome
	Page Should Contain Element			xpath=//div[@id='accountInfo']/span
	#elemen nama pengguna
	Page Should Contain Element			xpath=//div[@id='accountInfo']/span/span
	#elemen Your Balance is...IDR 
	Page Should Contain Element			xpath=//div[@id='accountInfo']/span/span[2]
	#elemen icon add
	Page Should Contain Element			xpath=//div[@id='accountInfo']/span/span[2]/a/i
	#elemen package
	Page Should Contain Element			xpath=//div[@id='accountInfo']/span/span[3]
	#elemen logout
	Page Should Contain Element			xpath=//div[@id='accountInfo']/span/span[4]/a
#=============================================================================================================================================================================
Elemen bahasa
	#pilihan bahasa yang tersedia
	Page Should Contain Element			xpath=//div[@id='selectLang']
	Page Should Contain List			xpath=//select[@id='selectlanguage' and @name='selectlanguage']
#=============================================================================================================================================================================
Elemen menu
	#pilihan menu utama
	Page Should Contain Element			xpath=//div[@class='content']/div/div[3]/ul/li/a/span
	Page Should Contain Element			xpath=//div[@class='content']/div/div[3]/ul/li[2]/a/span
	Page Should Contain Element			xpath=//div[@class='content']/div/div[3]/ul/li[3]/a/span
	Page Should Contain Element			xpath=//div[@class='content']/div/div[3]/ul/li[4]/a/span
	Page Should Contain Element			xpath=//div[@class='content']/div/div[3]/ul/li[5]/a/span
#=============================================================================================================================================================================
Elemen avail
	#availability search dari flight - themepark dan juga retrieve
	Page Should Contain Element			xpath=//div[@class='page-sidebar']
	Page Should Contain Element			xpath=//div[@id='sPanel']
	Element Text Should Be				xpath=//div[@id='sPanel']/span									SEARCH PANEL
	Page Should Contain Element			xpath=//div[@class='sidebar-menu']
	Element Text Should Be				xpath=//div[@class='sidebar-menu']/div/ul/li/a/span				FLIGHTS/TRAIN
	Page Should Contain Element			xpath=//div[@class='sidebar-menu']/div/ul/li/span/i
	Element Text Should Be				xpath=//div[@class='sidebar-menu']/div/ul/li[2]/a/span			HOTEL
	Page Should Contain Element			xpath=//div[@class='sidebar-menu']/div/ul/li[2]/span/i
	Element Text Should Be				xpath=//div[@class='sidebar-menu']/div/ul/li[3]/a/span			THEMEPARK
	Page Should Contain Element			xpath=//div[@class='sidebar-menu']/div/ul/li[3]/span/i
	Element Text Should Be				xpath=//div[@class='sidebar-menu']/div/ul/li[4]/a/span			RETRIEVE
	Page Should Contain Element			xpath=//div[@class='sidebar-menu']/div/ul/li[4]/span/i		
#=============================================================================================================================================================================
Elemen footer
	#footer
	Page Should Contain Element			css=div.copyright.sm-text-center
	Element Should Contain				xpath=//div[contains(@class,'container-fluid container-fixed-lg footer')]/div/p/span		Copyright
	Element Should Contain				xpath=//div[contains(@class,'container-fluid container-fixed-lg footer')]/div/p/span		2016
	Element Text Should Be				xpath=//div[contains(@class,'container-fluid container-fixed-lg footer')]/div/p/span[2]		Voltras Agent Network
	Element Text Should Be				xpath=//div[contains(@class,'container-fluid container-fixed-lg footer')]/div/p/span[3]		All rights reserved.
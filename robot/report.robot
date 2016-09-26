*** Settings ***
Documentation    	Test suite berisi list report
...					Menggunakan keyword dan variable dari resource.robot
...					Pengaturan awal test suite agar browser terbuka menggunakan Suite Setup
...					Untuk menjalankan test case satu persatu gunakan line robot -t (nama test case) (direktori test suite)
Suite Setup       	Buka browser
#Suite Teardown    	Tutup browser
| Resource | 		resource.robot

*** Test Cases ***
List_report
    #list report input
    Go To									${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Creport%5Clistreport%5Ccase01
    #common input
    Go To									${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    Go To									${REPORT_URL}
    Title Should Be							Report - Voltras Agent Network
    Location Should Be						${REPORT_URL}
	Isi halaman
	#label VAN Report
	Page Should Contain Element				xpath=//div[@class='content']/div[2]/h3
	#label All report about your ticketing activity
	Page Should Contain Element				xpath=//div[@class='content']/div[2]/h3
	#gambar pesawat
	Page Should Contain Image				xpath=//img[@src='assets/img/airliner-plane-sunset.jpg']  
	#label GETTING STARTED
	Page Should Contain Element				xpath=//div[@class='content']/div[2]/div/div/div[2]/div/div/div
	#keterangan halaman
	Page Should Contain Element				xpath=//div[@id='main-content']/div/div/h3
	#list report
	Page Should Contain Element				xpath=//div[@class='content']/div[3]/div/div/div/div 
	Hak report admin
	
Statement_of_account
	:FOR    ${INDEX}    IN RANGE    		0				3
	\	${NAME}=		Evaluate			${INDEX}+1	
    #statement of account input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Creport%5Cstatementofaccount%5Ccase0${NAME}
    #common input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    \	${json}= 			Get file 		C:/Users/User/workspace/van-web4/WebContent/test/report/statementofaccount/case0${NAME}/input/ReportResponse.txt
    \	${object}= 			Evaluate 		json.loads('''${json}''') 			json
    \	Set Suite Variable	${json}
    \	Set Suite Variable	${object}
    \	Run Keyword If						${NAME}==1 or ${NAME}==2			textSOA
    \	Go To								${SOA_URL}
    \	Title Should Be						Statement of Account - Voltras Agent Network
    \	Location Should Be					${SOA_URL}
	\	Isi halaman
	\	List menu header
	\	List submenu header	
	\	Header menu
	\	Report default
	#label REFERENCE
	\	Page Should Contain Element			xpath=//table[@id='tableWithSearch']/thead/tr/th[5]
	#label DEBIT
	\	Page Should Contain Element			xpath=//table[@id='tableWithSearch']/thead/tr/th[6]
	#label CREDIT
	\	Page Should Contain Element			xpath=//table[@id='tableWithSearch']/thead/tr/th[7]
	#label BALANCE
	\	Page Should Contain Element			xpath=//table[@id='tableWithSearch']/thead/tr/th[8]
	\	Run Keyword If						${NAME}==1 or ${NAME}==2		Data statement of account
	\	...		ELSE IF						${NAME}==3						Invalid date
	
Airline_revenue
	:FOR    ${INDEX}    IN RANGE    		0				3
	\	${NAME}=		Evaluate			${INDEX}+1	
    #airline revenue input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Creport%5Cairlinerevenue%5Ccase0${NAME}
    #common input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    \	${json}= 			Get file 		C:/Users/User/workspace/van-web4/WebContent/test/report/airlinerevenue/case0${NAME}/input/ReportResponse.txt
    \	${object}= 			Evaluate 		json.loads('''${json}''') 			json
    \	Set Suite Variable	${json}
    \	Set Suite Variable	${object}
    \	Run Keyword If						${NAME}==1 or ${NAME}==2			textAR
    \	Go To								${AR_URL}
    \	Title Should Be						Airline Revenue - Voltras Agent Network
    \	Location Should Be					${AR_URL}
	\	Isi halaman
	\	List menu header
	\	List submenu header	
	\	Header menu
	\	Report default
	#label REFERENCE
	\	Page Should Contain Element			xpath=//table[@id='tableWithSearch']/thead/tr/th[5]
	#label DEBIT
	\	Page Should Contain Element			xpath=//table[@id='tableWithSearch']/thead/tr/th[6]
	#label CREDIT
	\	Page Should Contain Element			xpath=//table[@id='tableWithSearch']/thead/tr/th[7]
	\	Run Keyword If						${NAME}==1 or ${NAME}==2		Data airline revenue
	\	...		ELSE IF						${NAME}==3						Invalid date
	
Hotel_revenue
	:FOR    ${INDEX}    IN RANGE    		0				3
	\	${NAME}=		Evaluate			${INDEX}+1	
    #hotel revenue input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Creport%5Chotelrevenue%5Ccase0${NAME}
    #common input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    \	${json}= 			Get file 		C:/Users/User/workspace/van-web4/WebContent/test/report/hotelrevenue/case0${NAME}/input/ReportResponse.txt
    \	${object}= 			Evaluate 		json.loads('''${json}''') 			json
    \	Set Suite Variable	${json}
    \	Set Suite Variable	${object}
    \	Run Keyword If						${NAME}==1 or ${NAME}==2			textHR
    \	Go To								${HR_URL}
    \	Title Should Be						Hotel Revenue - Voltras Agent Network
    \	Location Should Be					${HR_URL}
	\	Isi halaman
	\	List menu header
	\	List submenu header	
	\	Header menu
	\	Report default
	#label REFERENCE
	\	Page Should Contain Element			xpath=//table[@id='tableWithSearch']/thead/tr/th[5]
	#label DEBIT
	\	Page Should Contain Element			xpath=//table[@id='tableWithSearch']/thead/tr/th[6]
	#label CREDIT
	\	Page Should Contain Element			xpath=//table[@id='tableWithSearch']/thead/tr/th[7]
	\	Run Keyword If						${NAME}==1 or ${NAME}==2		Data hotel revenue
	\	...		ELSE IF						${NAME}==3						Invalid date
	
Attraction_revenue
	:FOR    ${INDEX}    IN RANGE    		0				3
	\	${NAME}=		Evaluate			${INDEX}+1	
    #attraction revenue input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Creport%5Cattractionrevenue%5Ccase0${NAME}
    #common input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    \	${json}= 			Get file 		C:/Users/User/workspace/van-web4/WebContent/test/report/attractionrevenue/case0${NAME}/input/ReportResponse.txt
    \	${object}= 			Evaluate 		json.loads('''${json}''') 			json
    \	Set Suite Variable	${json}
    \	Set Suite Variable	${object}
    \	Run Keyword If						${NAME}==1 or ${NAME}==2			textATT
    \	Go To								${ATT_URL}
    \	Title Should Be						Themepark Revenue - Voltras Agent Network
    \	Location Should Be					${ATT_URL}
	\	Isi halaman
	\	List menu header
	\	List submenu header	
	\	Header menu
	\	Report default	
	#label REFERENCE
	\	Page Should Contain Element			xpath=//table[@id='tableWithSearch']/thead/tr/th[5]
	#label DEBIT
	\	Page Should Contain Element			xpath=//table[@id='tableWithSearch']/thead/tr/th[6]
	\	Run Keyword If						${NAME}==1 or ${NAME}==2		Data attraction revenue
	\	...		ELSE IF						${NAME}==3						Invalid date
	
Auto_ticket
	:FOR    ${INDEX}    IN RANGE    		0				3
	\	${NAME}=		Evaluate			${INDEX}+1	
    #auto ticket input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Creport%5Cautoticket%5Ccase0${NAME}
    #common input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    \	${json}= 			Get file 		C:/Users/User/workspace/van-web4/WebContent/test/report/autoticket/case0${NAME}/input/ReportResponse.txt
    \	${object}= 			Evaluate 		json.loads('''${json}''') 			json
    \	Set Suite Variable	${json}
    \	Set Suite Variable	${object}
    \	Run Keyword If						${NAME}==1 or ${NAME}==2			textAUT
    \	Go To								${AUT_URL}
    \	Title Should Be						Autoticket Report - Voltras Agent Network
    \	Location Should Be					${AUT_URL}
	\	Isi halaman
	\	List menu header
	\	List submenu header	
	\	Header menu
	#elemen booking code			
	\	Page Should Contain Element			xpath=//form[@id='form-work']/div/div/div/div/div/span	
	\	Page Should Contain Element			xpath=//form[@id='form-work']/div/div/div/div/div/div/ul
	#elemen input kode booking
	\	Page Should Contain Element			xpath=//input[contains(@class,'form-control col-sm-2') and @name='txtSearchBy']
	\	Page Should Contain Element			xpath=//input[contains(@class,'form-control col-sm-2') and @name='txtSearchBy']
	#elemen from date
	\	Page Should Contain Element			xpath=//input[@class='form-control' and @name='dateFrom']
	#elemen to date
	\	Page Should Contain Element			xpath=//input[@class='form-control' and @name='dateTo']
	#label STATUS
	\	Page Should Contain Element			xpath=//form[@id='form-work']/div/div/label
	\	Element Text Should Be				xpath=//form[@id='form-work']/div/div/label					STATUS
	#list status
	\	Page Should Contain Element			xpath=//form[@id='form-work']/div/div/div[5]/div/div/span
	\	Page Should Contain Element			xpath=//form[@id='form-work']/div/div/div[5]/div/div/div/ul
	\	Search export
	\	Header tabel
	#label TOTAL AMOUNT
	\	Page Should Contain Element			xpath=//table[@id='tableWithSearch']/thead/tr/th[5]
	#label PAYMENT TIME LIMIT
	\	Page Should Contain Element			xpath=//table[@id='tableWithSearch']/thead/tr/th[6]
	#label PAYMENT STATUS
	\	Page Should Contain Element			xpath=//table[@id='tableWithSearch']/thead/tr/th[7]
	#label PNR STATUS
	\	Page Should Contain Element			xpath=//table[@id='tableWithSearch']/thead/tr/th[8]
	#label CREATED BY
	\	Page Should Contain Element			xpath=//table[@id='tableWithSearch']/thead/tr/th[9]
	\	Run Keyword If						${NAME}==1 or ${NAME}==2		Data auto ticket
	\	...		ELSE IF						${NAME}==3						Invalid date
	
Credit_card
	:FOR    ${INDEX}    IN RANGE    		0				3
	\	${NAME}=		Evaluate			${INDEX}+1	
    #credit card input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Creport%5Ccreditcard%5Ccase0${NAME}
    #common input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    \	${json}= 			Get file 		C:/Users/User/workspace/van-web4/WebContent/test/report/creditcard/case0${NAME}/input/ReportResponse.txt
    \	${object}= 			Evaluate 		json.loads('''${json}''') 			json
    \	Set Suite Variable	${json}
    \	Set Suite Variable	${object}
    \	Run Keyword If						${NAME}==1 or ${NAME}==2			textCC
    \	Go To								${CC_URL}
    \	Title Should Be						Credit Card Report - Voltras Agent Network
    \	Location Should Be					${CC_URL}
	\	Isi halaman
	\	List menu header
	\	List submenu header	
	\	Header menu
	\	Report default
	\	Run Keyword If						${NAME}==1 or ${NAME}==2		Data credit card
	\	...		ELSE IF						${NAME}==3						Invalid date
	
Top_up
	:FOR    ${INDEX}    IN RANGE    		0				3
	\	${NAME}=		Evaluate			${INDEX}+1	
    #top up input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Creport%5Ctopup%5Ccase0${NAME}
    #common input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    \	${json}= 			Get file 		C:/Users/User/workspace/van-web4/WebContent/test/report/topup/case0${NAME}/input/ReportResponse.txt
    \	${object}= 			Evaluate 		json.loads('''${json}''') 			json
    \	Set Suite Variable	${json}
    \	Set Suite Variable	${object}
    \	Run Keyword If						${NAME}==1 or ${NAME}==2			textTU
    \	Go To								${TU_URL}
    \	Title Should Be						Topup Report - Voltras Agent Network
    \	Location Should Be					${TU_URL}
	\	Isi halaman
	\	List menu header
	\	List submenu header	
	\	Header menu
	\	Report default
	#label AMOUNT
	\	Page Should Contain Element			xpath=//table[@id='tableWithSearch']/thead/tr/th[5]
	#label ADMIN FEE
	\	Page Should Contain Element			xpath=//table[@id='tableWithSearch']/thead/tr/th[6]
	#label TOTAL
	\	Page Should Contain Element			xpath=//table[@id='tableWithSearch']/thead/tr/th[7]
	\	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[7]			TOTAL
	#label STATUS
	\	Page Should Contain Element			xpath=//table[@id='tableWithSearch']/thead/tr/th[8]
	\	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[8]			STATUS
	\	Run Keyword If						${NAME}==1 or ${NAME}==2		Data top up
	\	...		ELSE IF						${NAME}==3						Invalid date
	
Registered_members
	:FOR    ${INDEX}    IN RANGE    		0				3
	\	${NAME}=		Evaluate			${INDEX}+1	
    #registered members input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Creport%5Cregisteredmember%5Ccase0${NAME}
    #common input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    \	${json}= 			Get file 		C:/Users/User/workspace/van-web4/WebContent/test/report/registeredmember/case0${NAME}/input/ReportResponse.txt
    \	${object}= 			Evaluate 		json.loads('''${json}''') 			json
    \	Set Suite Variable	${json}
    \	Set Suite Variable	${object}
    \	Run Keyword If						${NAME}==1 or ${NAME}==2			textRM
    \	Go To								${RM_URL}
    \	Title Should Be						Registered Members - Voltras Agent Network
    \	Location Should Be					${RM_URL}
	\	Isi halaman
	\	List menu header
	\	List submenu header	
	\	Header menu
	\	Field default
	\	Search export
	#elemen export csv
	\	Page Should Contain Element			xpath=//div[@id='tableWithExportOptions_wrapper']/div/div/a/div/embed
	#elemen export excel
	\	Page Should Contain Element			xpath=//div[@id='tableWithExportOptions_wrapper']/div/div/a[2]/div/embed
	#elemen export pdf
	\	Page Should Contain Element			xpath=//div[@id='tableWithExportOptions_wrapper']/div/div/a[3]/div/embed
	#elemen copy data
	\	Page Should Contain Element			xpath=//div[@id='tableWithExportOptions_wrapper']/div/div/a[4]/div/embed
	#elemen DATE
	\	Page Should Contain Element			xpath=//table[@id='tableWithExportOptions']/thead/tr/th
	#elemen NAME
	\	Page Should Contain Element			xpath=//table[@id='tableWithExportOptions']/thead/tr/th[2]
	#elemen AGENT
	\	Page Should Contain Element			xpath=//table[@id='tableWithExportOptions']/thead/tr/th[3]
	#elemen PHONE
	\	Page Should Contain Element			xpath=//table[@id='tableWithExportOptions']/thead/tr/th[4]
	#elemen EMAIL
	\	Page Should Contain Element			xpath=//table[@id='tableWithExportOptions']/thead/tr/th[5]
	\	Element Text Should Be				xpath=//table[@id='tableWithExportOptions']/thead/tr/th[5]			EMAIL
	#elemen MOBILE
	\	Page Should Contain Element			xpath=//table[@id='tableWithExportOptions']/thead/tr/th[6]
	#elemen YM
	\	Page Should Contain Element			xpath=//table[@id='tableWithExportOptions']/thead/tr/th[7]
	\	Element Text Should Be				xpath=//table[@id='tableWithExportOptions']/thead/tr/th[7]			YM
	#elemen PACKAGE
	\	Page Should Contain Element			xpath=//table[@id='tableWithExportOptions']/thead/tr/th[8]
	#elemen VA NUMBER
	\	Page Should Contain Element			xpath=//table[@id='tableWithExportOptions']/thead/tr/th[9]
	#elemen AMOUNT
	\	Page Should Contain Element			xpath=//table[@id='tableWithExportOptions']/thead/tr/th[10]
	#elemen STATUS
	\	Page Should Contain Element			xpath=//table[@id='tableWithExportOptions']/thead/tr/th[11]
	\	Element Text Should Be				xpath=//table[@id='tableWithExportOptions']/thead/tr/th[11]			STATUS
	\	Run Keyword If						${NAME}==1 or ${NAME}==2		Data registered members
	\	...		ELSE IF						${NAME}==3						Invalid date
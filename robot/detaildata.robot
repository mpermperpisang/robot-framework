*** Settings ***
Documentation    	resource data
...					Menggunakan keyword dan variable dari resource.robot
...					Pengaturan awal test suite agar browser terbuka menggunakan Suite Setup
...					Untuk menjalankan test case satu persatu gunakan line robot -t (nama test case) (direktori test suite)

*** Keywords ***
#Pengaturan Data
Data login
	#mengambil data username dan password dari request json
    ${json}= 					Get file 		C:/Users/User/workspace/van-web4/WebContent/test/login/case01/assert/AuthenticationRequest.txt
    ${object}= 					Evaluate 		json.loads('''${json}''') 		json
	Isi username				${object["username"]}
	Isi password				${object["password"]}
#=============================================================================================================================================================================
Data office profile
	#pengisian data office profile diambil dari response json
    ${json}= 							Get file 		C:/Users/User/workspace/van-web4/WebContent/test/commoninput/input/SelfOfficeInformationResponse1.txt
    ${object}= 							Evaluate 		json.loads('''${json}''') 		json
#-----------------------------------------------------------------------------------------------------------------------------------------------
    Textfield Value Should Be			xpath=//form[@id='form-personal']/div/div[2]/div/input			${object["name"]}
    Textfield Value Should Be			xpath=//form[@id='form-personal']/div/div/div/input				${object["code"]}
    Textfield Value Should Be			xpath=//form[@id='form-personal']/div[2]/div/div/input			${object["packageName"]}
    Textfield Value Should Be			xpath=//form[@id='form-personal']/div[3]/div/div/input			${object["address"]}
    Textfield Value Should Be			xpath=//form[@id='form-personal']/div[4]/div/div/input			${object["phone"]}
    Textfield Value Should Be			xpath=//form[@id='form-personal']/div[6]/div/div/input			${object["contactPerson"]}
#-----------------------------------------------------------------------------------------------------------------------------------------------
	${EMAILSTRING}=						Get Value														xpath=//form[@id='form-personal']/div[5]/div/div/input    
    Should Be Equal   					${EMAILSTRING}   												${object["email"]}
#-----------------------------------------------------------------------------------------------------------------------------------------------
    Textfield Value Should Be			xpath=//form[@id='form-personal']/div[7]/div/div/input			${object["domesticServiceFee"]}
    Textfield Value Should Be			xpath=//form[@id='form-personal']/div[8]/div/div/input			${object["intlServiceFee"]}
    Textfield Value Should Be			xpath=//form[@id='form-personal']/div[9]/div/div/input			${object["hotelServiceFee"]}
#=============================================================================================================================================================================
Data user profile
	#pengisian data user profile diambil dari response json
    ${json}= 					Get file 		C:/Users/User/workspace/van-web4/WebContent/test/commoninput/input/SelfOfficeUserInformationResponse.txt
    ${object}= 					Evaluate 		json.loads('''${json}''') 		json
#-----------------------------------------------------------------------------------------------------------------------------------------------
    Textfield Value Should Be			xpath=//form[@id='form-password']/div/div/div/input				${object["officeUserInfo"]["principal"]}  
    Textfield Value Should Be			xpath=//form[@id='form-email']/div/div/div/input				${object["officeUserInfo"]["principal"]}
    ${text}=							Get Value			xpath=//form[@id='form-email']/div[2]/div/div/input	
   	Should Be Equal						${text}				${object["officeUserInfo"]["email"]}
#=============================================================================================================================================================================  
Data user maintenance
	#pengisian data user maintenance diambil dari response json
    ${json}= 					Get file 		C:/Users/User/workspace/van-web4/WebContent/test/settings/usermaintenance/case01/input/SelfListOfficeUserInformationResponse.txt
    ${object}= 					Evaluate 		json.loads('''${json}''') 		json
#-----------------------------------------------------------------------------------------------------------------------------------------------
	:FOR    ${INDEX}    IN RANGE    		0				4
	\	${NAME}=		Evaluate			${INDEX}+1	
    \	Element Should Contain				xpath=//table[@id='tableWithSearch-userlist']/tbody/tr[${NAME}]/td					${object["listOfficeUserInfo"][${INDEX}]["principal"]}
    \	Element Should Contain				xpath=//table[@id='tableWithSearch-userlist']/tbody/tr[${NAME}]/td[2]				${object["listOfficeUserInfo"][${INDEX}]["name"]}
    \	Element Should Contain				xpath=//table[@id='tableWithSearch-userlist']/tbody/tr[${NAME}]/td[3]				${object["listOfficeUserInfo"][${INDEX}]["email"]}	 
#============================================================================================================================================================================
Data list pnr
	#pengisian data list pnr diambil dari response json
	#mengarah ke retrieve.robot
	#10-Sep-2016 halaman list pnr belum menembak request service
#============================================================================================================================================================================
Data statement of account
	#isian tabel
	${length}=		Get Length			${object['listStatementOfAccount']}	
	Set Suite Variable					${length}
	Run Keyword If						${length}<>0		list data SOA
	...		ELSE IF						${length}==0		no list data
#============================================================================================================================================================================
Data airline revenue
	#isian tabel
	${length}=		Get Length			${object['listRevenue']}	
	Set Suite Variable					${length}
	Run Keyword If						${length}<>0		list data AR
	...		ELSE IF						${length}==0		no list data	
#============================================================================================================================================================================
Data hotel revenue
	#isian tabel
	${length}=		Get Length			${object['listRevenue']}	
	Set Suite Variable					${length}
	Run Keyword If						${length}<>0		list data HR
	...		ELSE IF						${length}==0		no list data	
#============================================================================================================================================================================
Data attraction revenue
	#isian tabel
	${length}=		Get Length			${object['listRevenueReports']}	
	Set Suite Variable					${length}
	Run Keyword If						${length}<>0		list data ATT
	...		ELSE IF						${length}==0		no list data	
#============================================================================================================================================================================
Data auto ticket
	#isian tabel
	${length}=		Get Length			${object['listAutoPaymentReport']}	
	Set Suite Variable					${length}
	Run Keyword If						${length}<>0		list data AUT
	...		ELSE IF						${length}==0		no list data
#============================================================================================================================================================================
Data credit card
	#isian tabel
	${length}=		Get Length			${object['listCreditCardReport']}	
	Set Suite Variable					${length}
	Run Keyword If						${length}<>0		list data CC
	...		ELSE IF						${length}==0		no list data
#============================================================================================================================================================================
Data top up
	#isian tabel
	${length}=		Get Length			${object['listTopUp']}	
	Set Suite Variable					${length}
	Run Keyword If						${length}<>0		list data TU
	...		ELSE IF						${length}==0		no list data
#============================================================================================================================================================================
Data registered members
	#isian tabel
	${length}=		Get Length			${object['listMgmReport']}	
	Set Suite Variable					${length}
	Run Keyword If						${length}<>0		list data RM
	...		ELSE IF						${length}==0		no list data mgm
#============================================================================================================================================================================
list data SOA
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/tbody/tr/td					No data available in table		
	:FOR    ${INDEX}    	IN RANGE    		0				${length}
	\	${NAME}=			Evaluate			${INDEX}+1	
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td			${object['listStatementOfAccount'][${INDEX}]['TRANSACTIONDATE']}
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td[2]		${object['listStatementOfAccount'][${INDEX}]['USERNAME']}
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td[3]		${object['listStatementOfAccount'][${INDEX}]['TYPE']}
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td[4]		${object['listStatementOfAccount'][${INDEX}]['ITEM']}
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td[5]		${object['listStatementOfAccount'][${INDEX}]['REFERENCENO']}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	\	${strdebit}=					Convert To String		${object['listStatementOfAccount'][${INDEX}]['DEBIT']}
	\	${debit}=						Replace String			${strdebit}		,		.			
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td[6]		${debit}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	\	${strcredit}=					Convert To String		${object['listStatementOfAccount'][${INDEX}]['CREDIT']}
	\	${credit}=						Replace String			${strcredit}		,		.			
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td[7]		${credit}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	\	${strsaldo}=					Convert To String		${object['listStatementOfAccount'][${INDEX}]['BALANCE']}
	\	${saldo}=						Replace String			${strsaldo}		,		.
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td[8]		${saldo}			
#============================================================================================================================================================================
list data AR
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/tbody/tr/td					No data available in table		
	:FOR    ${INDEX}    	IN RANGE    		0				${length}
	\	${NAME}=			Evaluate			${INDEX}+1	
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td			${object['listRevenue'][${INDEX}]['ITEMCODE']}
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td[2]		${object['listRevenue'][${INDEX}]['BOOKINGCODE']}
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td[3]		${object['listRevenue'][${INDEX}]['ISSUEDDATE']}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	\	${strfare}=						Convert To String		${object['listRevenue'][${INDEX}]['FARECOMMISSION']}
	\	${fare}=						Replace String			${strfare}		,		.
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td[4]		${fare}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	\	${strinsu}=						Convert To String		${object['listRevenue'][${INDEX}]['INSURANCECOMMISSION']}
	\	${insu}=						Replace String			${strinsu}		,		.
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td[5]		${insu}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	\	${strserv}=						Convert To String		${object['listRevenue'][${INDEX}]['SERVICEFEE']}
	\	${serv}=						Replace String			${strserv}		,		.
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td[6]		${serv}	
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	\	${strtotal}=					Convert To String		${object['listRevenue'][${INDEX}]['TOTALREVENUE']}
	\	${total}=						Replace String			${strtotal}		,		.
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td[7]		${total}
#============================================================================================================================================================================
list data HR
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/tbody/tr/td					No data available in table		
	:FOR    ${INDEX}    	IN RANGE    		0				${length}
	\	${NAME}=			Evaluate			${INDEX}+1	
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td			${object['listRevenue'][${INDEX}]['ITEMCODE']}
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td[2]		${object['listRevenue'][${INDEX}]['BOOKINGCODE']}
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td[3]		${object['listRevenue'][${INDEX}]['ISSUEDDATE']}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	\	${strfare}=						Convert To String		${object['listRevenue'][${INDEX}]['FARECOMMISSION']}
	\	${fare}=						Replace String			${strfare}		,		.
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td[4]		${fare}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	\	${strinsu}=						Convert To String		${object['listRevenue'][${INDEX}]['INSURANCECOMMISSION']}
	\	${insu}=						Replace String			${strinsu}		,		.
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td[5]		${insu}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	\	${strserv}=						Convert To String		${object['listRevenue'][${INDEX}]['SERVICEFEE']}
	\	${serv}=						Replace String			${strserv}		,		.
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td[6]		${serv}	
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	\	${strtotal}=					Convert To String		${object['listRevenue'][${INDEX}]['TOTALREVENUE']}
	\	${total}=						Replace String			${strtotal}		,		.
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td[7]		${total}
#============================================================================================================================================================================
list data ATT
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/tbody/tr/td					No data available in table		
	:FOR    ${INDEX}    	IN RANGE    		0				${length}
	\	${NAME}=			Evaluate			${INDEX}+1	
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td			${object['listRevenueReports'][${INDEX}]['attractionName']}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	\	${strcomm}=						Convert To String		${object['listRevenueReports'][${INDEX}]['commission']}
	\	${comm}=						Replace String			${strcomm}		,		.
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td[2]		${comm}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td[3]		${object['listRevenueReports'][${INDEX}]['issuedDate']}
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td[4]		${object['listRevenueReports'][${INDEX}]['orderNumber']}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	\	${strserv}=						Convert To String		${object['listRevenueReports'][${INDEX}]['serviceFee']}
	\	${serv}=						Replace String			${strserv}		,		.
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td[5]		${serv}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	\	${strtotal}=					Convert To String		${object['listRevenueReports'][${INDEX}]['totalRevenue']}
	\	${total}=						Replace String			${strtotal}		,		.
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td[6]		${total}	
#============================================================================================================================================================================
list data AUT
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/tbody/tr/td					No data available in table		
	:FOR    ${INDEX}    	IN RANGE    		0				${length}
	\	${NAME}=			Evaluate			${INDEX}+1	
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td			${object['listAutoPaymentReport'][${INDEX}]['CREATEDATE']}
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td[2]		${object['listAutoPaymentReport'][${INDEX}]['BOOKINGDATE']}
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td[3]		${object['listAutoPaymentReport'][${INDEX}]['PAYMENTCODE']}
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td[4]		${object['listAutoPaymentReport'][${INDEX}]['BOOKINGCODE']}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	\	${strserv}=						Convert To String		${object['listAutoPaymentReport'][${INDEX}]['TOTALAMOUNT']}
	\	${serv}=						Replace String			${strserv}		,		.
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td[5]		${serv}	
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td[6]		${object['listAutoPaymentReport'][${INDEX}]['TIMELIMIT']}
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td[7]		${object['listAutoPaymentReport'][${INDEX}]['PAYMENTSTATUS']}
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td[8]		${object['listAutoPaymentReport'][${INDEX}]['PNRSTATUS']}
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td[9]		${object['listAutoPaymentReport'][${INDEX}]['CREATEDBY']}
#============================================================================================================================================================================
list data CC
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/tbody/tr/td					No data available in table		
	:FOR    ${INDEX}    	IN RANGE    		0				${length}
	\	${NAME}=			Evaluate			${INDEX}+1	
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td			${object['listCreditCardReport'][${INDEX}]['REFERENCENO']}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	\	Element Should Not Contain		xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td[2]		,
	\	${teamount}=					Get Text				xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td[2]
	\	${reteamount}=					Replace String			${teamount}			.		${EMPTY}
	\	${stramount}=					Convert To String		${object['listCreditCardReport'][${INDEX}]['AMOUNT']}
	\	${amount}=						Replace String			${stramount}		,		.
	\	Should Be Equal					${reteamount}			${amount}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	\	Element Should Not Contain		xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td[3]		,
	\	${tefee}=						Get Text				xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td[3]
	\	${retefee}=						Replace String			${tefee}			.		${EMPTY}	
	\	${strfee}=						Convert To String		${object['listCreditCardReport'][${INDEX}]['MERCHANTADMINFEE']}
	\	${fee}=							Replace String			${strfee}		,		.
	\	Should Be Equal					${retefee}				${fee}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td[4]		${object['listCreditCardReport'][${INDEX}]['TRANSACTIONTIME']}
#============================================================================================================================================================================
list data TU
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/tbody/tr/td					No data available in table		
	:FOR    ${INDEX}    	IN RANGE    		0				${length}
	\	${NAME}=			Evaluate			${INDEX}+1	
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td			${object['listTopUp'][${INDEX}]['VA_NUMBER']}
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td[2]		${object['listTopUp'][${INDEX}]['CREATE_DATE']}
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td[3]		${object['listTopUp'][${INDEX}]['PAYMENT_DATE']}
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td[4]		${object['listTopUp'][${INDEX}]['PROCESSED_DATE']}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	\	${stramount}=					Convert To String		${object['listTopUp'][${INDEX}]['AMOUNT']}
	\	${amount}=						Replace String			${stramount}		,		.
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td[5]		${amount}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	\	${stradmin}=					Convert To String		${object['listTopUp'][${INDEX}]['ADMIN_FEE']}
	\	${admin}=						Replace String			${stradmin}		,		.
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td[6]		${admin}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	\	${strtotal}=					Convert To String		${object['listTopUp'][${INDEX}]['TOTAL']}
	\	${total}=						Replace String			${strtotal}		,		.
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td[7]		${total}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	\	Element Text Should Be			xpath=//table[@id='tableWithSearch']/tbody/tr[${NAME}]/td[8]		${object['listTopUp'][${INDEX}]['STATUS']}
#============================================================================================================================================================================
list data RM
	Element Should Not Contain			xpath=//table[@id='tableWithExportOptions']/tbody/tr/td					No data available in table		
	:FOR    ${INDEX}    	IN RANGE    		0				${length}
	\	${NAME}=			Evaluate			${INDEX}+1	
	\	Element Text Should Be			xpath=//table[@id='tableWithExportOptions']/tbody/tr[${NAME}]/td		${object['listMgmReport'][${INDEX}]['CREATEDDATE']}
	\	Element Text Should Be			xpath=//table[@id='tableWithExportOptions']/tbody/tr[${NAME}]/td[2]		${object['listMgmReport'][${INDEX}]['FULLNAME']}
	\	Element Text Should Be			xpath=//table[@id='tableWithExportOptions']/tbody/tr[${NAME}]/td[3]		${object['listMgmReport'][${INDEX}]['AGENTNAME']}
	\	Element Text Should Be			xpath=//table[@id='tableWithExportOptions']/tbody/tr[${NAME}]/td[4]		${object['listMgmReport'][${INDEX}]['PHONE']}
	\	Element Text Should Be			xpath=//table[@id='tableWithExportOptions']/tbody/tr[${NAME}]/td[5]		${object['listMgmReport'][${INDEX}]['EMAIL']}
	\	Element Text Should Be			xpath=//table[@id='tableWithExportOptions']/tbody/tr[${NAME}]/td[6]		${object['listMgmReport'][${INDEX}]['CELLPHONE']}
	\	Element Text Should Be			xpath=//table[@id='tableWithExportOptions']/tbody/tr[${NAME}]/td[7]		${object['listMgmReport'][${INDEX}]['YMID']}
	\	Element Text Should Be			xpath=//table[@id='tableWithExportOptions']/tbody/tr[${NAME}]/td[8]		${object['listMgmReport'][${INDEX}]['PACKAGENAME']}
	\	Element Text Should Be			xpath=//table[@id='tableWithExportOptions']/tbody/tr[${NAME}]/td[9]		${object['listMgmReport'][${INDEX}]['VA_NUMBER']}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	\	${stramount}=					Convert To String		${object['listMgmReport'][${INDEX}]['AMOUNT']}
	\	${amount}=						Replace String			${stramount}		,		.
	\	Element Text Should Be			xpath=//table[@id='tableWithExportOptions']/tbody/tr[${NAME}]/td[10]	${amount}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	\	Element Text Should Be			xpath=//table[@id='tableWithExportOptions']/tbody/tr[${NAME}]/td[11]	${object['listMgmReport'][${INDEX}]['STATUS']}
#============================================================================================================================================================================
textSOA
	${text}=		Get Length			${object['listStatementOfAccount']}
	Set Suite Variable					${text}
#============================================================================================================================================================================
textAR
	${text}=		Get Length			${object['listRevenue']}
	Set Suite Variable					${text}
#============================================================================================================================================================================
textHR
	${text}=		Get Length			${object['listRevenue']}
	Set Suite Variable					${text}
#============================================================================================================================================================================
textATT
	${text}=		Get Length			${object['listRevenueReports']}
	Set Suite Variable					${text}
#============================================================================================================================================================================
textAUT
	${text}=		Get Length			${object['listAutoPaymentReport']}
	Set Suite Variable					${text}
#============================================================================================================================================================================
textCC
	${text}=		Get Length			${object['listCreditCardReport']}
	Set Suite Variable					${text}
#============================================================================================================================================================================
textTU
	${text}=		Get Length			${object['listTopUp']}
	Set Suite Variable					${text}
#============================================================================================================================================================================
textRM
	${text}=		Get Length			${object['listMgmReport']}
	Set Suite Variable					${text}
#============================================================================================================================================================================
no list data
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/tbody/tr/td									No data available in table	
#============================================================================================================================================================================
no list data mgm
	Element Text Should Be				xpath=//table[@id='tableWithExportOptions']/tbody/tr/td								No data available in table	
#============================================================================================================================================================================
Data PNR	
	#booking code harus sama dengan response service
    Element Text Should Be				xpath=//div[@class='panel-heading']/div/div[2]/h4/span[2]							${object['itinerary']['bookingCode']}
    #booking status harus sama dengan response service
    Element Text Should Be				xpath=//div[@class='panel-heading']/div/div[2]/h4[2]/span[2]						${object['itinerary']['status']}
	#timelimit harus sama dengan response service
    ${uppertimelimit}=					Convert To Uppercase			   													${object['itinerary']['timeLimit']}
    Element Text Should Be				xpath=//div[@class='panel-heading']/div/div[2]/h5/span[2]							${uppertimelimit} WIB (GMT + 7)
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    #mengecek connnecting
    ${connect}=							Get Length							${object['itinerary']['itemGo']['listTransporter']}
    Set Suite Variable					${connect}
    Run Keyword If						${connect}<>0						connecting 
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    #nama kontak
    Element Text Should Be				xpath=//div[@class='panel-body']/div/div/div/div/h5									${object['itinerary']['passengerContact']["name"]}
    #nomor telepon kontak
    Element Text Should Be				xpath=//div[@class='panel-body']/div/div/div/div[2]/h5								${object['itinerary']['passengerContact']["phoneNo"]}
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#TABEL HARGA
	#kolom NTSA, baris AIRLINE TICKET
    ${strntsa}=							Convert To String					${object['itinerary']["ntsa"]}"]}
    ${repntsa1}=						Replace String						${strntsa}			.0		${EMPTY}
    ${repntsa3}=						Replace String						${repntsa1}			"]}		${EMPTY}
    ${txt}=								Get Text							xpath=//div[@class='panel-body']/div/div/table/tbody/tr/td
    ${repntsa2}=						Replace String						${txt}				.		${EMPTY}
   	Should Be Equal						${repntsa3}							${repntsa2}
   	#kolom COMMISSION, baris AIRLINE TICKET
   	${totalfare}=						Convert To String					${object['itinerary']["totalFare"]}
   	${reptotalfare}=					Replace String						${totalfare}		.0		${EMPTY}
   	${reptotalfare2}=					Replace String						${reptotalfare}		"]}		${EMPTY}
   	${ntsa}=							Convert To String					${object['itinerary']["ntsa"]}"]}
   	${repntsa}=							Replace String						${ntsa}				.0		${EMPTY}
   	${repntsa2}=						Replace String						${repntsa}			"]}		${EMPTY}
   	${commission}=						Evaluate							${reptotalfare2}-${repntsa2}
   	${textcommission}=					Get Text							xpath=//div[@class='panel-body']/div/div/table/tbody/tr/td[2]
   	${reptext}=							Replace String						${textcommission}	.		${EMPTY}
   	${conreptext}=						Convert To Integer					${reptext}
   	Should Be Equal						${conreptext}						${commission}
	#kolom DISCOUNT, baris AIRLINE TICKET
    Element Text Should Be				xpath=//div[@class='panel-body']/div/div/table/tbody/tr/td[3]			  			0
    #kolom PAX PAID, baris AIRLINE TICKET
    ${strtotntsa}=						Convert To String					${object['itinerary']["totalFare"]} 
    ${reptotntsa1}=						Replace String						${strtotntsa}		.0		${EMPTY}
    ${reptotntsa3}=						Replace String						${reptotntsa1}		"]}		${EMPTY}
    ${txttot}=							Get Text							xpath=//div[@class='panel-body']/div/div/table/tbody/tr/td[4]
    ${reptotntsa2}=						Replace String						${txttot}			.		${EMPTY}
   	Should Be Equal						${reptotntsa3}						${reptotntsa2}		
   	#kolom NTSA, baris TRAVEL INSURANCE
   	${insuntsa}=						Convert To String					${object['itinerary']["insuranceNtsa"]}
   	${repinsuntsa}=						Replace String						${insuntsa}			.0		${EMPTY}
   	${repinsuntsaa}=					Replace String						${repinsuntsa}		"]}		${EMPTY}
   	${repinsu}=							Replace String						${repinsuntsaa}		.		${EMPTY}
    ${geinsuntsa}=						Get Text							xpath=//div[@class='panel-body']/div/div/table/tbody/tr[2]/td
    ${repgeinsuntsa}=					Replace String						${geinsuntsa}		.		${EMPTY}
    Should Be Equal						${repgeinsuntsa}					${repinsu}
    #kolom COMMISSION, baris TRAVEL INSURANCE
   	${comminsu}=						Convert To String					${object['itinerary']["insuranceNtsa"]}
   	${repcomminsu}=						Replace String						${comminsu}			.0		${EMPTY}
   	${repcomminsu2}=					Replace String						${repcomminsu}		"]}		${EMPTY}
   	${insuntsa2}=						Convert To String					${object['itinerary']["insuranceTotal"]}
   	${repinsuntsa2}=					Replace String						${insuntsa}			.0		${EMPTY}
   	${repinsuntsa2}=					Replace String						${repinsuntsa}		"]}		${EMPTY}
   	${totinsucomm}=						Evaluate							${repinsuntsa2}-${repcomminsu2}
    ${gecomminsu}=						Get Text							xpath=//div[@class='panel-body']/div/div/table/tbody/tr[2]/td[2]
    ${repcomminsu}=						Replace String						${gecomminsu}		.		${EMPTY}
    ${intrepcommuinsu}=					Convert To Integer					${repcomminsu}
    Should Be Equal						${totinsucomm}						${intrepcommuinsu}
    #kolom DISCOUNT, baris TRAVEL INSURANCE
    Element Text Should Be				xpath=//div[@class='panel-body']/div/div/table/tbody/tr[2]/td[3]					0
    #kolom PAX PAID, baris TRAVEL INSURANCE
   	${paxtotinsu}=						Convert To String					${object['itinerary']["insuranceTotal"]}
   	${reppaxinsu}=						Replace String						${paxtotinsu}		.0		${EMPTY}
   	${reppaxtot}=						Replace String						${reppaxinsu}		"]}		${EMPTY}
   	${reppaxins}=						Replace String						${reppaxtot}		.		${EMPTY}
    ${gepaxinsu}=						Get Text							xpath=//div[@class='panel-body']/div/div/table/tbody/tr[2]/td[4]
    ${reptotinsu}=						Replace String						${gepaxinsu}		.		${EMPTY}
    Should Be Equal						${reptotinsu}						${reppaxins}
    #kolom NTSA, baris SERVICE FEE
    Element Text Should Be				xpath=//div[@class='panel-body']/div/div/table/tbody/tr[3]/td						0
    #kolom COMMISSION, baris SERVICE FEE
   	${commserv}=						Convert To String					${object['itinerary']["serviceFee"]}
   	${repcommserv}=						Replace String						${commserv}			.0		${EMPTY}
   	${paxcommserv}=						Replace String						${repcommserv}		"]}		${EMPTY}
   	${repcommservi}=					Replace String						${paxcommserv}		.		${EMPTY}
    ${gecommserv}=						Get Text							xpath=//div[@class='panel-body']/div/div/table/tbody/tr[3]/td[2]
    ${repgecommserv}=					Replace String						${gecommserv}		.		${EMPTY}
    Should Be Equal						${repgecommserv}					${repcommservi}
    #kolom DISCOUNT, baris SERVICE FEE
    Element Text Should Be				xpath=//div[@class='panel-body']/div/div/table/tbody/tr[3]/td[3]					0
    #kolom PAX PAID, baris SERVICE FEE
    ${strfee}=							Convert To String					${object['itinerary']["serviceFee"]}
    ${fee}=								Get Text							xpath=//div[@class='panel-body']/div/div/table/tbody/tr[3]/td[4]
    ${feerep}=							Replace String						${fee}				.		${EMPTY}
   	Should Be Equal						${feerep}							${strfee}	 					
   	#kolom NTSA, baris TOTAL
    ${strntsa2}=						Convert To String					${object['itinerary']["ntsa"]}"]}
    ${repntsa3}=						Replace String						${strntsa2}			.0		${EMPTY}
    ${repntsa5}=						Replace String						${repntsa3}			"]}		${EMPTY}
    ${intrepntsa6}=						Convert to Integer					${repntsa5}
    ${txt2}=							Get Text							xpath=//div[@class='panel-body']/div/div/table/tbody/tr[4]/td
    ${repntsa4}=						Replace String						${txt2}				.		${EMPTY}
    ${inrepntsa}=						Convert to Integer					${repntsa4}
    ${totalntsa}=						Get Text							xpath=//div[@class='panel-body']/div/div/table/tbody/tr[2]/td
    ${inttotntsa}=						Replace String						${totalntsa}		.		${EMPTY}
    ${intotal}=							Convert to Integer					${inttotntsa}
    ${insntsa}=							Evaluate							${intrepntsa6}+${intotal}
   	Should Be Equal						${insntsa}							${inrepntsa}
   	#kolom COMMISSION, baris TOTAL
   	${textcommission2}=		Get Text			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[4]/td[2]
   	${reptext2}=			Replace String		${textcommission2}	,		${EMPTY}
   	${conreptext2}=			Replace String		${reptext2}			.		${EMPTY}
   	${intconrep}=			Convert To Integer	${conreptext2}
   	${evtotcomm}=			Evaluate			${commission}+${repcommservi}
   	Should Be Equal			${intconrep}		${evtotcomm}
   	#kolom DISCOUNT, baris TOTAL
    Element Text Should Be				xpath=//div[@class='panel-body']/div/div/table/tbody/tr[4]/td[3]					0
    #kolom PAX PAID, baris TOTAL
    ${1}=								Get Text							xpath=//div[@class='panel-body']/div/div/table/tbody/tr[4]/td[4]
    ${2}=								Replace String						${1}				.		${EMPTY}
    ${3}=								Convert To Integer					${2}
    ${9}=								Get Text							xpath=//div[@class='panel-body']/div/div/table/tbody/tr/td[4] 
    ${10}=								Replace String						${9}				.		${EMPTY} 
    ${11}=								Convert To Integer					${10}	    
    ${strntsafare}=						Convert To String					${object['itinerary']["totalFare"]}
    ${repfarentsa1}=					Replace String						${strntsafare}		.0		${EMPTY}
    ${repfarentsa3}=					Replace String						${repfarentsa1}		"]}		${EMPTY}
    ${txtfare}=							Get Text							xpath=//div[@class='panel-body']/div/div/table/tbody/tr[2]/td[4]
    ${repfarentsa2}=					Replace String						${txtfare}			.		${EMPTY}
    ${4}=								Convert To Integer					${repfarentsa2}	
    ${6}=								Get Text							xpath=//div[@class='panel-body']/div/div/table/tbody/tr[3]/td[4]
    ${7}=								Replace String						${6}				.			${EMPTY}
    ${8}=								Convert To Integer					${7}
    ${5}=								Evaluate							${4}+${8}+${11}
    Should Be Equal						${5}								${3}
#=============================================================================================================================================================================
Data bagasi
	:FOR    ${IDBG}    					IN RANGE    	0					${length}
	\	${LISTBG}=						Evaluate		${IDBG}+1	
	\	Set Suite Variable				${IDBG}
	\	Set Suite Variable				${LISTBG}
	\	Run Keyword If					('${object['itinerary']['listPassenger'][${IDBG}]['type']}'=='ADULT' or '${object['itinerary']['listPassenger'][${IDBG}]['type']}'=='CHILD')		list bagasi
	\	...		ELSE IF					'${object['itinerary']['listPassenger'][${IDBG}]['type']}'=='INFANT'																				no pax baggage
#=============================================================================================================================================================================
list bagasi
	${connect}=			Get Length		${object['itinerary']['itemGo']['listTransporter']}
	Set Suite Variable					${connect}
	${rute2}=			Evaluate		${connect}-1
	Set Suite Variable					${rute2}
	Run Keyword If						${connect}<>0		data rute bagasi
	Element Text Should Be				xpath=//div[@class='modal-content']/div[2]/ul/li[${LISTBG}]/a													${object['itinerary']['listPassenger'][${IDBG}]['title']}. ${object['itinerary']['listPassenger'][${IDBG}]['firstName']} ${object['itinerary']['listPassenger'][${IDBG}]['lastName']}
	Element Should Contain				xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div/div/div/table/tbody/tr[3]/td[2]				.
	Element Should Not Contain			xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div/div/div/table/tbody/tr[3]/td[2]				,
#=============================================================================================================================================================================
data rute bagasi
	:FOR    ${IDX}    					IN RANGE    	0					${connect}
	\	${LISTIDX}=						Evaluate		${IDX}+1	
	\	Set Suite Variable				${IDX}
	\	Set Suite Variable				${LISTIDX}
	\	${paxbgg}=	Evaluate			${CLID}-1
	\	Element Text Should Be			xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div/div/div/table/tbody/tr[${connect}]/td			${object['itinerary']['itemGo']['listTransporter'][${rute2}]['departureCity']}-${object['itinerary']['itemGo']['listTransporter'][${rute2}]['arrivalCity']}
	\	Element Text Should Be			xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div/div/div/table/tbody/tr[${connect}]/td[2]			${object['itinerary']['listPassenger'][${paxbgg}]['listPassengerBaggage'][${rute2}]['baggageKilos']} kg
	\	Page Should Contain List		xpath=//select[@name='baggageOption' and contains(@class,'cs-select cs-skin-slide')][${connect}]
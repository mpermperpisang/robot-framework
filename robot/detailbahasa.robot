*** Settings ***
Documentation    	resource bahasa
...					Menggunakan keyword dan variable dari resource.robot
...					Pengaturan awal test suite agar browser terbuka menggunakan Suite Setup
...					Untuk menjalankan test case satu persatu gunakan line robot -t (nama test case) (direktori test suite)

*** Keywords ***
#Pengaturan bahasa default
Bahasa halaman in-ID
	#Bahasa indonesia dari elemen-elemen yang wajib ada di setiap halaman
	Menu in-ID
	Availability in-ID
#=============================================================================================================================================================================
Bahasa halaman en-US
	#Bahasa inggris dari elemen-elemen yang wajib ada di setiap halaman
	Menu en-US
	Availability en-US
#=============================================================================================================================================================================
Balance
	#saldo agar berisi titik
    ${json}= 					Get file 				C:/Users/User/workspace/van-web4/WebContent/test/commoninput/input/SelfOfficeInformationResponse1.txt
    ${object}= 					Evaluate 				json.loads('''${json}''') 			json
    Set Suite Variable			${json}
    Set Suite Variable			${object}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ${json2}= 					Get file 				C:/Users/User/workspace/van-web4/WebContent/test/commoninput/input/SelfOfficeUserInformationResponse.txt
    ${object2}= 				Evaluate 				json.loads('''${json2}''') 			json
    Set Suite Variable			${json2}
    Set Suite Variable			${object2}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${strbalance}=				Convert To String		${object['idrBalance']}
	Set Global Variable			${strbalance}
	${lenbalance}=				Get Length				${strbalance}
	Set Global Variable			${lenbalance}
	${div}=						Evaluate				${lenbalance}-3
	Run Keyword If				(${div}==0 or ${div}==3 or ${div}==6 or ${div}==9 or ${div}==12 or ${div}==15)			3digit
	...		ELSE IF				(${div}<>0 or ${div}<>3 or ${div}<>6 or ${div}<>9 or ${div}<>12 or ${div}<>15)			2digit				
#============================================================================================================================================================================
3digit
	#jika jumlah digit saldo dapat habis dibagi 3
	${fifth}=					Get Substring			${strbalance}		12		15
	Set Global Variable			${fifth}
	${cofifth}=		Get Length				${fifth}
	${fourth}=					Get Substring			${strbalance}		9		12
	Set Global Variable			${fourth}
	${cofourth}=	Get Length				${fourth}
	${third}=					Get Substring			${strbalance}		6		9
	Set Global Variable			${third}
	${cothird}=		Get Length				${third}
	${second}=					Get Substring			${strbalance}		3		6
	Set Global Variable			${second}
	${cosecond}=		Get Length				${second}
	${first}=					Get Substring			${strbalance}		0		3
	Set Global Variable			${first}
	${cofirst}=		Get Length				${first}
	Run Keyword If				${cofifth}==3			lima
	...		ELSE IF				${cofourth}==3			empat
	...		ELSE IF				${cothird}==3			tiga
	...		ELSE IF				${cosecond}==3			dua
	...		ELSE IF				${cofirst}==3			satu
#============================================================================================================================================================================
2digit
	#jika jumlah digit saldo tidak habis dibagi 2
	${fifth}=					Get Substring			${strbalance}		12		15
	${cofifth}=		Get Length				${fifth}
	${fourth}=					Get Substring			${strbalance}		9		12
	${cofourth}=	Get Length				${fourth}
	${third}=					Get Substring			${strbalance}		6		9
	${cothird}=		Get Length				${third}
	${second}=					Get Substring			${strbalance}		3		6
	${cosecond}=	Get Length				${second}
	${first}=					Get Substring			${strbalance}		0		3
	${cofirst}=		Get Length				${first}
	Run Keyword If				(${cofifth}==0 and ${cofourth}==0 and ${cothird}==0 and ${cosecond}==0 and (${cofirst}==1 or ${cofirst}==2 or ${cofirst}==3))			lima_2 
	...		ELSE IF				(${cofifth}==0 and ${cofourth}==0 and ${cothird}==0 and (${cosecond}==1 or ${cosecond}==2 or ${cosecond}==3) and (${cofirst}==1 or ${cofirst}==2 or ${cofirst}==3))							empat_2
	...		ELSE IF				(${cofifth}==0 and ${cofourth}==0 and (${cothird}==1 or ${cothird}==2 or ${cothird}==3) and (${cosecond}==1 or ${cosecond}==2 or ${cosecond}==3) and (${cofirst}==1 or ${cofirst}==2 or ${cofirst}==3))			tiga_2
	...		ELSE IF				(${cofifth}==0 and (${cofourth}==1 or ${cofourth}==2 or ${cofourth}==3) and (${cothird}==1 or ${cothird}==2 or ${cothird}==3) and (${cosecond}==1 or ${cosecond}==2 or ${cosecond}==3) and (${cofirst}==1 or ${cofirst}==2 or ${cofirst}==3))			dua_2
	...		ELSE IF				((${cofifth}==1 or ${cofifth}==2 or ${cofifth}==3) and (${cofourth}==1 or ${cofourth}==2 or ${cofourth}==3) and (${cothird}==1 or ${cothird}==2 or ${cothird}==3) and (${cosecond}==1 or ${cosecond}==2 or ${cosecond}==3) and (${cofirst}==1 or ${cofirst}==2 or ${cofirst}==3))			satu_2
#============================================================================================================================================================================	
lima
	${BALANCE}=					Catenate				SEPARATOR=. 		${first}	${second}	${third}	${fourth}	${fifth}
	Set Global Variable			${BALANCE}
#============================================================================================================================================================================
lima_2
	#log to console	lima_2
	${first}=					Get Substring			${strbalance}		0			${lenbalance}
	${BALANCE}=					Catenate				SEPARATOR=. 		${first}
	Set Global Variable			${BALANCE}
#============================================================================================================================================================================
empat
	${BALANCE}=					Catenate				SEPARATOR=. 		${first}	${second}	${third}	${fourth}
	Set Global Variable			${BALANCE}
#============================================================================================================================================================================
empat_2
	#log to console	empat_2
	${evlenbalance}=			Evaluate				${lenbalance}-3
	${first}=					Get Substring			${strbalance}		0						${evlenbalance}
	${second}=					Get Substring			${strbalance}		${evlenbalance}		${lenbalance}
	${BALANCE}=					Catenate				SEPARATOR=. 		${first}	${second}
	Set Global Variable			${BALANCE}
#============================================================================================================================================================================
tiga
	${BALANCE}=					Catenate				SEPARATOR=. 		${first}	${second}	${third}
	Set Global Variable			${BALANCE}
#============================================================================================================================================================================
tiga_2
	#log to console	tiga_2
	${evlenbalance}=			Evaluate				${lenbalance}-3
	${evlenbalance2}=			Evaluate				${evlenbalance}-3
	${first}=					Get Substring			${strbalance}		0						${evlenbalance2}
	${second}=					Get Substring			${strbalance}		${evlenbalance2}		${evlenbalance}
	${third}=					Get Substring			${strbalance}		${evlenbalance}			${lenbalance}
	${BALANCE}=					Catenate				SEPARATOR=. 		${first}	${second}	${third}
	Set Global Variable			${BALANCE}
#============================================================================================================================================================================
dua
	${BALANCE}=					Catenate				SEPARATOR=. 		${first}	${second}
	Set Global Variable			${BALANCE}
#============================================================================================================================================================================
dua_2
	#log to console	dua_2
	${evlenbalance}=			Evaluate				${lenbalance}-3
	${evlenbalance2}=			Evaluate				${evlenbalance}-3
	${evlenbalance3}=			Evaluate				${evlenbalance2}-3
	${first}=					Get Substring			${strbalance}		0						${evlenbalance3}
	${second}=					Get Substring			${strbalance}		${evlenbalance3}		${evlenbalance2}
	${third}=					Get Substring			${strbalance}		${evlenbalance2}		${evlenbalance}
	${fourth}=					Get Substring			${strbalance}		${evlenbalance}			${lenbalance}
	${BALANCE}=					Catenate				SEPARATOR=. 		${first}	${second}	${third}	${fourth}
	Set Global Variable			${BALANCE}	
#============================================================================================================================================================================
satu
	${BALANCE}=					Catenate				SEPARATOR=. 		${first}
	Set Global Variable			${BALANCE}
#============================================================================================================================================================================
satu_2
	#log to console	satu_2
	${evlenbalance}=			Evaluate				${lenbalance}-3
	${evlenbalance2}=			Evaluate				${evlenbalance}-3
	${evlenbalance3}=			Evaluate				${evlenbalance2}-3
	${evlenbalance4}=			Evaluate				${evlenbalance3}-3
	${first}=					Get Substring			${strbalance}		0						${evlenbalance4}
	${second}=					Get Substring			${strbalance}		${evlenbalance4}		${evlenbalance3}
	${third}=					Get Substring			${strbalance}		${evlenbalance3}		${evlenbalance2}
	${fourth}=					Get Substring			${strbalance}		${evlenbalance2}		${evlenbalance}
	${fifth}=					Get Substring			${strbalance}		${evlenbalance}			${lenbalance}
	${BALANCE}=					Catenate				SEPARATOR=. 		${first}	${second}	${third}	${fourth}	${fifth}
	Set Global Variable			${BALANCE}	
#============================================================================================================================================================================
Bahasapnr
	#pengaturan bahasa halaman PNR (Indonesia dan Inggris)
	:FOR	${IDX}    IN RANGE    			0				2
	\	${LIST}=		Evaluate			${IDX}+1
	\	Set Suite Variable	${IDX}	
	\	Set Suite Variable	${LIST}
    #language input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Clanguage%5Ccase0${LIST}
    \	Go To								${PNR_URL}?id=${idPNR}&transportationType=airline
    \	Location Should Be					${PNR_URL}?id=${idPNR}&transportationType=airline
	\	Select From List By Value			id=selectlanguage					${language${LIST}}
	\	List Selection Should Be			id=selectlanguage					${language${LIST}}
	\	Run Keyword If						${LIST}>${IDX}						Bahasa halaman ${language${LIST}}
	\	Run Keyword If						${LIST}>${IDX}						PNR ${language${LIST}}
    \	${STATUS}=							set variable						${object['itinerary']['status']}
    \	Set Suite Variable					${STATUS}
    \	${json}= 							Get file 		C:/Users/User/workspace/van-web4/WebContent/test/pnr/case0${NAME}/input/TransportationRetrieveByIdResponse.txt
    \	${object}= 							Evaluate 		json.loads('''${json}''') 			json
    \	Set Suite Variable					${json}
    \	Set Suite Variable					${object}
   	\	Run Keyword If						('${object['itinerary']['autoPaymentCreationDate']}'<>'None' and '${STATUS}' == 'BOOKED')		Auto tiket ${language${LIST}}
    \	...		ELSE IF						('${object['itinerary']['autoPaymentCreationDate']}'=='None' and '${STATUS}' == 'BOOKED')		No auto tiket ${language${LIST}}
    \	...		ELSE IF						('${object['itinerary']['autoPaymentCreationDate']}'<>'None' and ('${STATUS}' == 'CANCELED' or '${STATUS}' == 'TICKETED'))		No button auto tiket ${language${LIST}}
#=============================================================================================================================================================================
Bahasaavail
	#pengaturan bahasa halaman availability (Indonesia dan Inggris)
	:FOR	${IDX}    IN RANGE    			0				2
	\	${LIST}=		Evaluate			${IDX}+1
	\	Set Suite Variable	${IDX}	
	\	Set Suite Variable	${LIST}
	#language input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Clanguage%5Ccase0${LIST}
    \	Go To								${AVAIL_URL}  
    \	Location Should Be					${AVAIL_URL}
	\	Select From List By Value			id=selectlanguage					${language${LIST}}
	\	List Selection Should Be			id=selectlanguage					${language${LIST}}
	\	Run Keyword If						${NAME}>${INDEX}					Menu ${language${LIST}}
	\	Run Keyword If						${NAME}>${INDEX}					Availability result ${NAME} ${language${LIST}}
	\	Run Keyword If						${NAME}>${INDEX}					Availability fare ${NAME} ${language${LIST}}
#=============================================================================================================================================================================	
Bahasaretrieve
	#pengaturan bahasa halaman retrieve (Indonesia dan Inggris)
	:FOR	${IDX}    IN RANGE    			0				2
	\	${LIST}=		Evaluate			${IDX}+1
	\	Set Suite Variable	${IDX}	
	\	Set Suite Variable	${LIST}
	#language input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Clanguage%5Ccase0${LIST}
    \	Go To								${RETRIEVE_URL}
	\	Select From List By Value			id=selectlanguage					${language${LIST}}
	\	List Selection Should Be			id=selectlanguage					${language${LIST}}
	\	Run Keyword If						${NAME}>${INDEX}					Menu ${language${LIST}}
	\	Run Keyword If						${NAME}>${INDEX}					Retrieve ${language${LIST}}
#=============================================================================================================================================================================	
bahasaSOA
	#pengaturan bahasa halaman laporan Statement Of Account (Indonesia dan Inggris)
	:FOR	${IDX}    IN RANGE    			0				2
	\	${LIST}=		Evaluate			${IDX}+1
	\	Set Suite Variable	${IDX}	
	\	Set Suite Variable	${LIST}
	#language input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Clanguage%5Ccase0${LIST}
    \	Go To								${SOA_URL}
	\	Select From List By Value			id=selectlanguage					${language${LIST}}
	\	List Selection Should Be			id=selectlanguage					${language${LIST}}
	\	Run Keyword If						${NAME}>${INDEX}					Bahasa halaman ${language${LIST}}
	\	Run Keyword If						${NAME}>${INDEX}					SOA ${language${LIST}}
    \	${json}= 			Get file 		C:/Users/User/workspace/van-web4/WebContent/test/report/statementofaccount/case0${NAME}/input/ReportResponse.txt
    \	${object}= 			Evaluate 		json.loads('''${json}''') 			json
    \	Set Suite Variable	${json}
    \	Set Suite Variable	${object}
	\	${length}=		Get Length			${object['listStatementOfAccount']}	
	\	Set Suite Variable		${length}
	\	Run Keyword If						${length}==0						no data report ${language${LIST}}
#=============================================================================================================================================================================
bahasaAR
	#pengaturan bahasa halaman laporan Airline Revenue (Indonesia dan Inggris)
	:FOR	${IDX}    IN RANGE    			0				2
	\	${LIST}=		Evaluate			${IDX}+1
	\	Set Suite Variable	${IDX}	
	\	Set Suite Variable	${LIST}
	#language input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Clanguage%5Ccase0${LIST}
    \	Go To								${AR_URL}
	\	Select From List By Value			id=selectlanguage					${language${LIST}}
	\	List Selection Should Be			id=selectlanguage					${language${LIST}}
	\	Run Keyword If						${NAME}>${INDEX}					Bahasa halaman ${language${LIST}}
	\	Run Keyword If						${NAME}>${INDEX}					AR ${language${LIST}}
#=============================================================================================================================================================================
bahasaHR
	#pengaturan bahasa halaman laporan Hotel Revenue (Indonesia dan Inggris)
	:FOR	${IDX}    IN RANGE    			0				2
	\	${LIST}=		Evaluate			${IDX}+1
	\	Set Suite Variable	${IDX}	
	\	Set Suite Variable	${LIST}
	#language input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Clanguage%5Ccase0${LIST}
    \	Go To								${HR_URL}
	\	Select From List By Value			id=selectlanguage					${language${LIST}}
	\	List Selection Should Be			id=selectlanguage					${language${LIST}}
	\	Run Keyword If						${NAME}>${INDEX}					Bahasa halaman ${language${LIST}}
	\	Run Keyword If						${NAME}>${INDEX}					HR ${language${LIST}}
#=============================================================================================================================================================================
bahasaATT
	#pengaturan bahasa halaman laporan Attraction Revenue (Indonesia dan Inggris)
	:FOR	${IDX}    IN RANGE    			0				2
	\	${LIST}=		Evaluate			${IDX}+1
	\	Set Suite Variable	${IDX}	
	\	Set Suite Variable	${LIST}
	#language input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Clanguage%5Ccase0${LIST}
    \	Go To								${ATT_URL}
	\	Select From List By Value			id=selectlanguage					${language${LIST}}
	\	List Selection Should Be			id=selectlanguage					${language${LIST}}
	\	Run Keyword If						${NAME}>${INDEX}					Bahasa halaman ${language${LIST}}
	\	Run Keyword If						${NAME}>${INDEX}					ATT ${language${LIST}}
#=============================================================================================================================================================================
bahasaAUT
	#pengaturan bahasa halaman laporan Auto Ticket (Indonesia dan Inggris)
	:FOR	${IDX}    IN RANGE    			0				2
	\	${LIST}=		Evaluate			${IDX}+1
	\	Set Suite Variable	${IDX}	
	\	Set Suite Variable	${LIST}
	#language input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Clanguage%5Ccase0${LIST}
    \	Go To								${AUT_URL}
	\	Select From List By Value			id=selectlanguage					${language${LIST}}
	\	List Selection Should Be			id=selectlanguage					${language${LIST}}
	\	Run Keyword If						${NAME}>${INDEX}					Bahasa halaman ${language${LIST}}
	\	Run Keyword If						${NAME}>${INDEX}					AUT ${language${LIST}}
#=============================================================================================================================================================================
bahasaCC
	#pengaturan bahasa halaman laporan Credit Card (Indonesia dan Inggris)
	:FOR	${IDX}    IN RANGE    			0				2
	\	${LIST}=		Evaluate			${IDX}+1
	\	Set Suite Variable	${IDX}	
	\	Set Suite Variable	${LIST}
	#language input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Clanguage%5Ccase0${LIST}
    \	Go To								${CC_URL}
	\	Select From List By Value			id=selectlanguage					${language${LIST}}
	\	List Selection Should Be			id=selectlanguage					${language${LIST}}
	\	Run Keyword If						${NAME}>${INDEX}					Bahasa halaman ${language${LIST}}
	\	Run Keyword If						${NAME}>${INDEX}					CC ${language${LIST}}
#=============================================================================================================================================================================
bahasaTU
	#pengaturan bahasa halaman laporan Top Up (Indonesia dan Inggris)
	:FOR	${IDX}    IN RANGE    			0				2
	\	${LIST}=		Evaluate			${IDX}+1
	\	Set Suite Variable	${IDX}	
	\	Set Suite Variable	${LIST}
	#language input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Clanguage%5Ccase0${LIST}
    \	Go To								${TU_URL}
	\	Select From List By Value			id=selectlanguage					${language${LIST}}
	\	List Selection Should Be			id=selectlanguage					${language${LIST}}
	\	Run Keyword If						${NAME}>${INDEX}					Bahasa halaman ${language${LIST}}
	\	Run Keyword If						${NAME}>${INDEX}					TU ${language${LIST}}
#=============================================================================================================================================================================
bahasaRM
	#pengaturan bahasa halaman laporan Registered Members (Indonesia dan Inggris)
	:FOR	${IDX}    IN RANGE    			0				2
	\	${LIST}=		Evaluate			${IDX}+1
	\	Set Suite Variable	${IDX}	
	\	Set Suite Variable	${LIST}
	#language input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Clanguage%5Ccase0${LIST}
    \	Go To								${RM_URL}
	\	Select From List By Value			id=selectlanguage					${language${LIST}}
	\	List Selection Should Be			id=selectlanguage					${language${LIST}}
	\	Run Keyword If						${NAME}>${INDEX}					Bahasa halaman ${language${LIST}}
	\	Run Keyword If						${NAME}>${INDEX}					RM ${language${LIST}}
#============================================================================================================================================================================
bahasaCopyfare
	#pengaturan bahasa copy fare summary (Indonesia dan Inggris)
	:FOR	${IDX}    IN RANGE    			0				2
	\	${LIST}=		Evaluate			${IDX}+1
	\	Set Suite Variable	${IDX}	
	\	Set Suite Variable	${LIST}
	#language input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Clanguage%5Ccase0${LIST}
    \	Go To								${AVAIL_URL}
	\	Select From List By Value			id=selectlanguage					${language${LIST}}
	\	List Selection Should Be			id=selectlanguage					${language${LIST}}
    \	Click Button						xpath=//button[contains(@class,'btn btn-xs btn-primary inline')]
	\	Run Keyword If						${NAME}>${INDEX}					Menu ${language${LIST}}
	\	Run Keyword If						${NAME}>${INDEX}					Copy fare ${language${LIST}}
#============================================================================================================================================================================
bahasaBagasi
	#pengaturan bahasa edit bagasi (Indonesia dan Inggris)
	:FOR	${IDX}    IN RANGE    			0				2
	\	${LIST}=		Evaluate			${IDX}+1
	\	Set Suite Variable	${IDX}	
	\	Set Suite Variable	${LIST}
	#language input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Clanguage%5Ccase0${LIST}
    \	Go To								${AVAIL_URL}
	\	Select From List By Value			id=selectlanguage					${language${LIST}}
	\	List Selection Should Be			id=selectlanguage					${language${LIST}}
	\	Click Button						css=button#add-baggage-button.btn.btn-default.pull-right.btn-sm.m-l-5
	\	Run Keyword If						${NAME}>${INDEX}					Bahasa halaman ${language${LIST}}
	\	Run Keyword If						${NAME}>${INDEX}					Bagasi ${language${LIST}}
#============================================================================================================================================================================
Menu in-ID
	#terjemahan menu dalam bahasa indonesia	
	Balance
	Element Text Should Be				xpath=//div[@id='accountInfo']									Selamat Datang ${object2['officeUserInfo']['name']} , Saldo Anda adalah ${BALANCE} IDR (${object['packageName']}) Keluar	
	Element Should Not Contain			xpath=//div[@id='accountInfo']									Welcome ${object2['officeUserInfo']['name']} , Your Balance is ${BALANCE} IDR (${object['packageName']}) Logout		
	Element Text Should Be				xpath=//div[@class='content']/div/div[3]/ul/li/a/span			Beranda	
	Element Should Not Contain			xpath=//div[@class='content']/div/div[3]/ul/li/a/span			Home
	Element Text Should Be				xpath=//div[@class='content']/div/div[3]/ul/li[2]/a/span		Berita
	Element Should Not Contain			xpath=//div[@class='content']/div/div[3]/ul/li[2]/a/span		News
	Element Text Should Be				xpath=//div[@class='content']/div/div[3]/ul/li[3]/a/span		Laporan
	Element Should Not Contain			xpath=//div[@class='content']/div/div[3]/ul/li[3]/a/span		Report
	Element Text Should Be				xpath=//div[@class='content']/div/div[3]/ul/li[4]/a/span		Pengaturan
	Element Should Not Contain			xpath=//div[@class='content']/div/div[3]/ul/li[4]/a/span		Settings
	Element Text Should Be				xpath=//div[@class='content']/div/div[3]/ul/li[5]/a/span		Bantuan
	Element Should Not Contain			xpath=//div[@class='content']/div/div[3]/ul/li[5]/a/span		Help
#=============================================================================================================================================================================
Menu en-US
	#terjemahan menu dalam bahasa inggris
	Balance
	Element Should Not Contain			xpath=//div[@id='accountInfo']									Selamat Datang ${object2['officeUserInfo']['name']} , Saldo Anda adalah ${BALANCE} IDR (${object['packageName']}) Keluar	
	Element Text Should Be				xpath=//div[@id='accountInfo']									Welcome ${object2['officeUserInfo']['name']} , Your Balance is ${BALANCE} IDR (${object['packageName']}) Logout	
	Element Should Not Contain			xpath=//div[@class='content']/div/div[3]/ul/li/a/span			Beranda	
	Element Text Should Be				xpath=//div[@class='content']/div/div[3]/ul/li/a/span			Home
	Element Should Not Contain			xpath=//div[@class='content']/div/div[3]/ul/li[2]/a/span		Berita
	Element Text Should Be				xpath=//div[@class='content']/div/div[3]/ul/li[2]/a/span		News
	Element Should Not Contain			xpath=//div[@class='content']/div/div[3]/ul/li[3]/a/span		Laporan
	Element Text Should Be				xpath=//div[@class='content']/div/div[3]/ul/li[3]/a/span		Report
	Element Should Not Contain			xpath=//div[@class='content']/div/div[3]/ul/li[4]/a/span		Pengaturan
	Element Text Should Be				xpath=//div[@class='content']/div/div[3]/ul/li[4]/a/span		Settings
	Element Should Not Contain			xpath=//div[@class='content']/div/div[3]/ul/li[5]/a/span		Bantuan
	Element Text Should Be				xpath=//div[@class='content']/div/div[3]/ul/li[5]/a/span		Help
#=============================================================================================================================================================================	
Availability in-ID
	#terjemahan availability dalam bahasa indonesia
	Element Text Should Be				xpath=//form[@id='transPanel']/div/label						Sekali Jalan
	Element Should Not Contain			xpath=//form[@id='transPanel']/div/label						One Way
	Element Text Should Be				xpath=//form[@id='transPanel']/div/label[2]						Pulang Pergi
#-----------------------------------------------------------------------------------------------------------------------------------------------
	${depart}= 							Get WebElement  		xpath=//input[@id='tpFrom' and @name='departure']
	${DEPARTPLACEHOLDER}=			 	set variable			${depart.get_attribute('placeholder')} 
	${UPPERDEPART}=						Convert To Uppercase	${DEPARTPLACEHOLDER}
    Should Be Equal  					${UPPERDEPART}   												ASAL
	Should Not Be Equal					${UPPERDEPART}													FROM
#-----------------------------------------------------------------------------------------------------------------------------------------------	
	${arrive}= 							Get WebElement  		xpath=//input[@id='tpTo' and @name='arrival']
	${ARRIVEPLACEHOLDER}=			 	set variable			${arrive.get_attribute('placeholder')} 
	${UPPERARRIVE}=						Convert To Uppercase	${ARRIVEPLACEHOLDER}
    Should Be Equal						${UPPERARRIVE}   												TUJUAN
	Should Not Be Equal					${UPPERARRIVE}													TO
#-----------------------------------------------------------------------------------------------------------------------------------------------
	${date}= 							Get WebElement  		xpath=//input[@name='departdate']
	${DATEPLACEHOLDER}=				 	set variable			${date.get_attribute('placeholder')} 
    Should Be Equal						${DATEPLACEHOLDER}   											Tanggal Keberangkatan
	Should Not Be Equal					${DATEPLACEHOLDER}												Departure Date
#-----------------------------------------------------------------------------------------------------------------------------------------------
	Element Should Not Contain			xpath=//form[@id='transPanel']/div/label[2]						Return
	#List Selection Should Be			id=selectadult													Dewasa
	#Element Should Not Contain			id=selectadult													Adult
	List Selection Should Be			id=selectChild													Anak
	Element Should Not Contain			id=selectChild													Child
	List Selection Should Be			id=selectinfant													Bayi
	Element Should Not Contain			id=selectinfant													Infant
	Element Text Should Be				xpath=//form[@id='transPanel']/button							Cari Penerbangan/Kereta
	Element Should Not Contain			xpath=//form[@id='transPanel']/button							Search Flights/Train
#=============================================================================================================================================================================
Availability en-US
	#terjemahan availability dalam bahasa inggris
	Element Should Not Contain			xpath=//form[@id='transPanel']/div/label						Sekali Jalan
	Element Text Should Be				xpath=//form[@id='transPanel']/div/label						One Way
	Element Should Not Contain			xpath=//form[@id='transPanel']/div/label[2]						Pulang Pergi
#-----------------------------------------------------------------------------------------------------------------------------------------------
	${depart}= 							Get WebElement  		xpath=//input[@id='tpFrom' and @name='departure']
	${DEPARTPLACEHOLDER}=			 	set variable			${depart.get_attribute('placeholder')} 
	${UPPERDEPART}=						Convert To Uppercase	${DEPARTPLACEHOLDER}
    Should Not Be Equal					${UPPERDEPART}   												DARI
	Should Be Equal						${UPPERDEPART}													FROM
#-----------------------------------------------------------------------------------------------------------------------------------------------
	${arrive}= 							Get WebElement  		xpath=//input[@id='tpTo' and @name='arrival']
	${ARRIVEPLACEHOLDER}=			 	set variable			${arrive.get_attribute('placeholder')} 
	${UPPERARRIVE}=						Convert To Uppercase	${ARRIVEPLACEHOLDER}
    Should Not Be Equal					${UPPERARRIVE}   												TUJUAN
	Should Be Equal						${UPPERARRIVE}													TO
#-----------------------------------------------------------------------------------------------------------------------------------------------
	${date}= 							Get WebElement  		xpath=//input[@name='departdate']
	${DATEPLACEHOLDER}=				 	set variable			${date.get_attribute('placeholder')} 
    Should Not Be Equal					${DATEPLACEHOLDER}   											Tanggal Keberangkatan
	Should Be Equal						${DATEPLACEHOLDER}												Departure Date
#-----------------------------------------------------------------------------------------------------------------------------------------------
	Element Text Should Be				xpath=//form[@id='transPanel']/div/label[2]						Return
	#Element Should Not Contain			id=selectadult													Dewasa
	#List Selection Should Be			id=selectadult													Adult
	Element Should Not Contain			id=selectChild													Anak
	List Selection Should Be			id=selectChild													Child
	Element Should Not Contain			id=selectinfant													Bayi
	List Selection Should Be			id=selectinfant													Infant
	Element Should Not Contain			xpath=//form[@id='transPanel']/button							Cari Penerbangan/Kereta
	Element Text Should Be				xpath=//form[@id='transPanel']/button							Search Flights/Train
#=============================================================================================================================================================================	
Settings in-ID
	#terjemahan settings dalam bahasa indonesia
	Element Text Should Be				xpath=//div[@class='content']/div[2]/h3							Pengaturan
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/h3							Settings
	#Element Text Should Be				xpath=//div[@class='content']/div[2]							Di sini anda dapat mengubah peraturan
	#Element Should Not Contain			xpath=//div[@class='content']/div[2]							Here you can change setting your VAN user and profileour VAN user and profile
#=============================================================================================================================================================================
Settings en-US
	#terjemahan settings dalam bahasa inggris
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/h3							Pengaturan
	Element Text Should Be				xpath=//div[@class='content']/div[2]/h3							Settings
	#Element Should Not Contain			xpath=//div[@class='content']/div[2]							Di sini anda dapat mengubah peraturan
	#Element Text Should Be				xpath=//div[@class='content']/div[2]							Here you can change setting your VAN user and profileour VAN user and profile
#=============================================================================================================================================================================
Login in-ID
	#terjemahan login dalam bahasa indonesia
	Element Text Should Be				xpath=//p[@class='p-t-35']					Masuk ke akun VAN Anda
	Element Should Not Contain			xpath=//p[@class='p-t-35']					Sign into your VAN account 
	Element Text Should Be				xpath=//form[@id='form-login']/div/label	NAMA PENGGUNA								 
	Element Should Not Contain			xpath=//form[@id='form-login']/div/label	USERNAME									
#-----------------------------------------------------------------------------------------------------------------------------------------------
	${username}= 						Get WebElement  							username
	${USERNAMEPLACEHOLDER}=			 	set variable								${username.get_attribute('placeholder')} 
    Should Be Equal   					${USERNAMEPLACEHOLDER}   					Masukkan Nama Pengguna
    Should Not Be Equal   				${USERNAMEPLACEHOLDER}   					Input Username
#-----------------------------------------------------------------------------------------------------------------------------------------------
	Element Text Should Be				xpath=//form[@id='form-login']/div[2]/label	KATA SANDI									 
	Element Should Not Contain			xpath=//form[@id='form-login']/div[2]/label	PASSWORD									
#-----------------------------------------------------------------------------------------------------------------------------------------------
	${password}= 						Get WebElement  							password
	${PASSWORDPLACEHOLDER}=			 	set variable								${password.get_attribute('placeholder')} 
    Should Be Equal   					${PASSWORDPLACEHOLDER}   					Masukkan Kata Sandi
    Should Not Be Equal   				${PASSWORDPLACEHOLDER}   					Input Password
#-----------------------------------------------------------------------------------------------------------------------------------------------
	Element Text Should Be				xpath=//a[@id='linkForgot']					Lupa Kata Sandi? Klik Disini
	Element Should Not Contain			xpath=//a[@id='linkForgot']					Forgot Password? Click Here 
	Element Text Should Be				xpath=//form[@id='form-login']/button		Masuk												
	Element Should Not Contain			xpath=//form[@id='form-login']/button		Sign in										
	Element Text Should Be				xpath=//div[@class='bg-pic']/div/h2			The Real Online Travel Agent				
	Element Text Should Be				xpath=//div[@class='bg-pic']/div/p			Bebas ribet dan bebas rumit bagi bisnis travel agent Anda.
	Element Should Not Contain			xpath=//div[@class='bg-pic']/div/p			Easiest way for your travel agent business.
#=============================================================================================================================================================================
Login en-US
	#terjemahan login dalam bahasa inggris
	Element Should Not Contain			xpath=//p[@class='p-t-35']					Masuk ke akun VAN Anda
	Element Text Should Be				xpath=//p[@class='p-t-35']					Sign into your VAN account 	
	Element Should Not Contain			xpath=//form[@id='form-login']/div/label	NAMA PENGGUNA								 
	Element Text Should Be				xpath=//form[@id='form-login']/div/label	USERNAME									
#-----------------------------------------------------------------------------------------------------------------------------------------------
	${username}= 						Get WebElement  							username
	${USERNAMEPLACEHOLDER}=			 	set variable								${username.get_attribute('placeholder')} 
    Should Not Be Equal					${USERNAMEPLACEHOLDER}   					Masukkan Nama Pengguna
    Should Be Equal   					${USERNAMEPLACEHOLDER}   					Input Username
#-----------------------------------------------------------------------------------------------------------------------------------------------
	Element Should Not Contain			xpath=//form[@id='form-login']/div[2]/label	KATA SANDI									 
	Element Text Should Be				xpath=//form[@id='form-login']/div[2]/label	PASSWORD									
#-----------------------------------------------------------------------------------------------------------------------------------------------
	${password}= 						Get WebElement  							password
	${PASSWORDPLACEHOLDER}=			 	set variable								${password.get_attribute('placeholder')} 
    Should Not Be Equal					${PASSWORDPLACEHOLDER}   					Masukkan Kata Sandi
    Should Be Equal   					${PASSWORDPLACEHOLDER}   					Input Password
#-----------------------------------------------------------------------------------------------------------------------------------------------
	Element Should Not Contain			xpath=//a[@id='linkForgot']					Lupa Kata Sandi? Klik Disini
	Element Text Should Be				xpath=//a[@id='linkForgot']					Forgot Password? Click Here 
	Element Should Not Contain			xpath=//form[@id='form-login']/button		Masuk												
	Element Text Should Be				xpath=//form[@id='form-login']/button		Sign in										
	Element Text Should Be				xpath=//div[@class='bg-pic']/div/h2			The Real Online Travel Agent				
	Element Should Not Contain			xpath=//div[@class='bg-pic']/div/p			Bebas ribet dan bebas rumit bagi bisnis travel agent Anda.
	Element Text Should Be				xpath=//div[@class='bg-pic']/div/p			Easiest way for your travel agent business.
#=============================================================================================================================================================================	
Office profile in-ID
	#terjemahan office profile dalam bahasa indonesia
	Settings in-ID
	Element Text Should Be				xpath=//div[@id='office']/div/div/div/div/div					PENGATURAN PROFIL KANTOR
	Element Should Not Contain			xpath=//div[@id='office']/div/div/div/div/div					OFFICE PROFILE SETTING
	Element Text Should Be				xpath=//form[@id='form-personal']/div/div/div/label				KODE KANTOR
	Element Should Not Contain			xpath=//form[@id='form-personal']/div/div/div/label				OFFICE CODE
	Element Text Should Be				xpath=//form[@id='form-personal']/div/div[2]/div/label			NAMA KANTOR
	Element Should Not Contain			xpath=//form[@id='form-personal']/div/div[2]/div/label			OFFICE NAME
	Element Text Should Be				xpath=//form[@id='form-personal']/div[2]/div/div/label			NAMA PAKET
	Element Should Not Contain			xpath=//form[@id='form-personal']/div[2]/div/div/label			PACKAGE NAME
	Element Text Should Be				xpath=//form[@id='form-personal']/div[3]/div/div/label			ALAMAT
	Element Should Not Contain			xpath=//form[@id='form-personal']/div[3]/div/div/label			ADDRESS
	Element Text Should Be				xpath=//form[@id='form-personal']/div[4]/div/div/label			NOMOR TELEPON
	Element Should Not Contain			xpath=//form[@id='form-personal']/div[4]/div/div/label			PHONE NUMBER
	Element Text Should Be				xpath=//form[@id='form-personal']/div[6]/div/div/label			KONTAK PERSON
	Element Should Not Contain			xpath=//form[@id='form-personal']/div[6]/div/div/label			CONTACT PERSON
	Element Text Should Be				xpath=//form[@id='form-personal']/div[7]/div/div/label			KEUNTUNGAN LAYANAN PENERBANGAN DOMESTIK
	Element Should Not Contain			xpath=//form[@id='form-personal']/div[7]/div/div/label			DOMESTIC FLIGHT SERVICE FEE
	Element Text Should Be				xpath=//form[@id='form-personal']/div[8]/div/div/label			KEUNTUNGAN LAYANAN PENERBANGAN INTERNASIONAL
	Element Should Not Contain			xpath=//form[@id='form-personal']/div[8]/div/div/label			INTERNATIONAL FLIGHT SERVICE FEE
	Element Text Should Be				xpath=//form[@id='form-personal']/div[9]/div/div/label			KEUNTUNGAN LAYANAN HOTEL
	Element Should Not Contain			xpath=//form[@id='form-personal']/div[9]/div/div/label			HOTEL SERVICE FEE
	Element Text Should Be				xpath=//form[@id='form-personal']/div[10]/div/div/label			SEMBUNYIKAN DETAIL PEMBAYARAN
	Element Should Not Contain			xpath=//form[@id='form-personal']/div[10]/div/div/label			HIDE PAYMENT DETAIL
#-----------------------------------------------------------------------------------------------------------------------------------------------
	${logo}=  							Get WebElement  		image-place
	${LOGOPLACEHOLDER}=				 	set variable			${logo.get_attribute('placeholder')} 
    Should Be Equal   					${LOGOPLACEHOLDER}   											Ukuran logo tidak dapat lebih dari 200x100 pixel
    Should Not Be Equal   				${LOGOPLACEHOLDER}   											Max image size 200x100 pixel
#-----------------------------------------------------------------------------------------------------------------------------------------------
	${receipt}=  						Get WebElement  		xpath=//textarea[@id='receipt']
	${RECEIPTPLACEHOLDER}=			 	set variable			${receipt.get_attribute('placeholder')}
    Should Be Equal   					${RECEIPTPLACEHOLDER}   										Informasi tanda terima Anda
    Should Not Be Equal   				${RECEIPTPLACEHOLDER}   										Your receipt info
#-----------------------------------------------------------------------------------------------------------------------------------------------
	Element Text Should Be				xpath=//form[@id='form-personal']/button						Simpan
	Element Should Not Contain			xpath=//form[@id='form-personal']/button						Submit
	Element Text Should Be				xpath=//form[@id='form-personal']/button[2]						Lihat Tanda Terima	
	Element Should Not Contain			xpath=//form[@id='form-personal']/button[2]						Preview Receipt
#=============================================================================================================================================================================
Office profile en-US
	#terjemahan office profile dalam bahasa inggris
	Settings en-US
	Element Should Not Contain			xpath=//div[@id='office']/div/div/div/div/div					PENGATURAN PROFIL KANTOR
	Element Text Should Be				xpath=//div[@id='office']/div/div/div/div/div					OFFICE PROFILE SETTING
	Element Should Not Contain			xpath=//form[@id='form-personal']/div/div/div/label				KODE KANTOR
	Element Text Should Be				xpath=//form[@id='form-personal']/div/div/div/label				OFFICE CODE
	Element Should Not Contain			xpath=//form[@id='form-personal']/div/div[2]/div/label			NAMA KANTOR
	Element Text Should Be				xpath=//form[@id='form-personal']/div/div[2]/div/label			OFFICE NAME
	Element Should Not Contain			xpath=//form[@id='form-personal']/div[2]/div/div/label			NAMA PAKET
	Element Text Should Be				xpath=//form[@id='form-personal']/div[2]/div/div/label			PACKAGE NAME
	Element Should Not Contain			xpath=//form[@id='form-personal']/div[3]/div/div/label			ALAMAT
	Element Text Should Be				xpath=//form[@id='form-personal']/div[3]/div/div/label			ADDRESS
	Element Should Not Contain			xpath=//form[@id='form-personal']/div[4]/div/div/label			NOMOR TELEPON
	Element Text Should Be				xpath=//form[@id='form-personal']/div[4]/div/div/label			PHONE NUMBER
	Element Should Not Contain			xpath=//form[@id='form-personal']/div[6]/div/div/label			KONTAK PERSON
	Element Text Should Be				xpath=//form[@id='form-personal']/div[6]/div/div/label			CONTACT PERSON
	Element Should Not Contain			xpath=//form[@id='form-personal']/div[7]/div/div/label			KEUNTUNGAN LAYANAN PENERBANGAN DOMESTIK
	Element Text Should Be				xpath=//form[@id='form-personal']/div[7]/div/div/label			DOMESTIC FLIGHT SERVICE FEE
	Element Should Not Contain			xpath=//form[@id='form-personal']/div[8]/div/div/label			KEUNTUNGAN LAYANAN PENERBANGAN INTERNASIONAL
	Element Text Should Be				xpath=//form[@id='form-personal']/div[8]/div/div/label			INTERNATIONAL FLIGHT SERVICE FEE
	Element Should Not Contain			xpath=//form[@id='form-personal']/div[9]/div/div/label			KEUNTUNGAN LAYANAN HOTEL
	Element Text Should Be				xpath=//form[@id='form-personal']/div[9]/div/div/label			HOTEL SERVICE FEE
	Element Should Not Contain			xpath=//form[@id='form-personal']/div[10]/div/div/label			SEMBUNYIKAN DETAIL PEMBAYARAN
	Element Text Should Be				xpath=//form[@id='form-personal']/div[10]/div/div/label			HIDE PAYMENT DETAIL
#-----------------------------------------------------------------------------------------------------------------------------------------------
	${logo}=  							Get WebElement  		image-place
	${LOGOPLACEHOLDER}=				 	set variable			${logo.get_attribute('placeholder')} 
    Should Be Equal   					${LOGOPLACEHOLDER}   											Max image size 200x100 pixel
    Should Not Be Equal					${LOGOPLACEHOLDER}												Ukuran logo tidak dapat lebih dari 200x100 pixel
#-----------------------------------------------------------------------------------------------------------------------------------------------
	${receipt}=  						Get WebElement  		xpath=//textarea[@id='receipt']
	${RECEIPTPLACEHOLDER}=			 	set variable			${receipt.get_attribute('placeholder')}
    Should Be Equal   					${RECEIPTPLACEHOLDER}   										Your receipt info
    Should Not Be Equal					${RECEIPTPLACEHOLDER}											Informasi tanda terima Anda
#-----------------------------------------------------------------------------------------------------------------------------------------------
	Element Should Not Contain			xpath=//form[@id='form-personal']/button						Simpan
	Element Text Should Be				xpath=//form[@id='form-personal']/button						Submit
	Element Should Not Contain			xpath=//form[@id='form-personal']/button[2]						Lihat Tanda Terima	
	Element Text Should Be				xpath=//form[@id='form-personal']/button[2]						Preview Receipt
#=============================================================================================================================================================================	
User Profile in-ID
	#terjemahan user profile dalam bahasa indonesia
	Settings in-ID
	Element Text Should Be				xpath=//div[@id='user']/div/div/div/div/div						PENGATURAN PROFIL PEMAKAI
	Element Should Not Contain			xpath=//div[@id='user']/div/div/div/div/div						USER PROFILE SETTING 
	Element Text Should Be				xpath=//form[@id='form-password']/div/div/div/label				NAMA PENGGUNA
	Element Should Not Contain			xpath=//form[@id='form-password']/div/div/div/label				USERNAME
	Element Text Should Be				xpath=//form[@id='form-password']/div[2]/div/div/label			KATA SANDI LAMA
	Element Should Not Contain			xpath=//form[@id='form-password']/div[2]/div/div/label			OLD PASSWORD
	Element Text Should Be				xpath=//form[@id='form-password']/div[3]/div/div/label			KATA SANDI BARU
	Element Should Not Contain			xpath=//form[@id='form-password']/div[3]/div/div/label			NEW PASSWORD	
	Element Text Should Be				xpath=//form[@id='form-password']/div[4]/div/div/label			KONFIRMASI KATA SANDI BARU
	Element Should Not Contain			xpath=//form[@id='form-password']/div[4]/div/div/label			CONFIRM NEW PASSWORD
	Element Text Should Be				xpath=//form[@id='form-password']/button						Simpan Kata Sandi
	Element Should Not Contain			xpath=//form[@id='form-password']/button						Save Password
#-----------------------------------------------------------------------------------------------------------------------------------------------
	#terjemahan user email dalam bahasa indonesia
	Element Text Should Be				xpath=//div[@id='user']/div/div[3]/div/div/div					PENGATURAN EMAIL PENGGUNA
	Element Should Not Contain			xpath=//div[@id='user']/div/div[3]/div/div/div					USER EMAIL SETTING
	Element Text Should Be				xpath=//form[@id='form-email']/div/div/div/label				NAMA PENGGUNA
	Element Should Not Contain			xpath=//form[@id='form-email']/div/div/div/label				USERNAME
	Element Text Should Be				xpath=//form[@id='form-email']/div[2]/div/div/label				ALAMAT EMAIL LAMA
	Element Should Not Contain			xpath=//form[@id='form-email']/div[2]/div/div/label				OLD EMAIL ADDRESS
	Element Text Should Be				xpath=//form[@id='form-email']/div[3]/div/div/label				ALAMAT EMAIL BARU
	Element Should Not Contain			xpath=//form[@id='form-email']/div[3]/div/div/label				NEW EMAIL ADDRESS
	Element Text Should Be				xpath=//form[@id='form-email']/button							Simpan Email
	Element Should Not Contain			xpath=//form[@id='form-email']/button							Save Email
#=============================================================================================================================================================================
User Profile en-US
	#terjemahan user profile dalam bahasa inggris
	Settings en-US
	Element Should Not Contain			xpath=//div[@id='user']/div/div/div/div/div						PENGATURAN PROFIL PEMAKAI
	Element Text Should Be				xpath=//div[@id='user']/div/div/div/div/div						USER PROFILE SETTING 
	Element Should Not Contain			xpath=//form[@id='form-password']/div/div/div/label				NAMA PENGGUNA
	Element Text Should Be				xpath=//form[@id='form-password']/div/div/div/label				USERNAME
	Element Should Not Contain			xpath=//form[@id='form-password']/div[2]/div/div/label			KATA SANDI LAMA
	Element Text Should Be				xpath=//form[@id='form-password']/div[2]/div/div/label			OLD PASSWORD
	Element Should Not Contain			xpath=//form[@id='form-password']/div[3]/div/div/label			KATA SANDI BARU
	Element Text Should Be				xpath=//form[@id='form-password']/div[3]/div/div/label			NEW PASSWORD	
	Element Should Not Contain			xpath=//form[@id='form-password']/div[4]/div/div/label			KONFIRMASI KATA SANDI BARU
	Element Text Should Be				xpath=//form[@id='form-password']/div[4]/div/div/label			CONFIRM NEW PASSWORD
	Element Should Not Contain			xpath=//form[@id='form-password']/button						Simpan Kata Sandi
	Element Text Should Be				xpath=//form[@id='form-password']/button						Save Password
#-----------------------------------------------------------------------------------------------------------------------------------------------
	#terjemahan user email dalam bahasa inggris
	Element Should Not Contain			xpath=//div[@id='user']/div/div[3]/div/div/div					PENGATURAN EMAIL PENGGUNA
	Element Text Should Be				xpath=//div[@id='user']/div/div[3]/div/div/div					USER EMAIL SETTING
	Element Should Not Contain			xpath=//form[@id='form-email']/div/div/div/label				NAMA PENGGUNA
	Element Text Should Be				xpath=//form[@id='form-email']/div/div/div/label				USERNAME
	Element Should Not Contain			xpath=//form[@id='form-email']/div[2]/div/div/label				ALAMAT EMAIL LAMA
	Element Text Should Be				xpath=//form[@id='form-email']/div[2]/div/div/label				OLD EMAIL ADDRESS
	Element Should Not Contain			xpath=//form[@id='form-email']/div[3]/div/div/label				ALAMAT EMAIL BARU
	Element Text Should Be				xpath=//form[@id='form-email']/div[3]/div/div/label				NEW EMAIL ADDRESS
	Element Should Not Contain			xpath=//form[@id='form-email']/button							Simpan Email
	Element Text Should Be				xpath=//form[@id='form-email']/button							Save Email
#=============================================================================================================================================================================	
User maintenance in-ID
	#terjemahan user maintenance dalam bahasa indonesia
	Settings in-ID
	Element Text Should Be				xpath=//div[@id='user-maintain']/div/div/div/div									KELOLA PENGGUNA
	Element Should Not Contain			xpath=//div[@id='user-maintain']/div/div/div/div									USER MAINTENANCE
	Element Text Should Be				xpath=//button[@data-target='#addUser']												Tambah Pengguna
	Element Should Not Contain			xpath=//button[@data-target='#addUser']												Add User
	Element Text Should Be				xpath=//table[@id='tableWithSearch-userlist']/thead/tr/th							NAMA PENGGUNA
	Element Should Not Contain			xpath=//table[@id='tableWithSearch-userlist']/thead/tr/th							USERNAME
	Element Text Should Be				xpath=//table[@id='tableWithSearch-userlist']/thead/tr/th[2]						NAMA LENGKAP
	Element Should Not Contain			xpath=//table[@id='tableWithSearch-userlist']/thead/tr/th[2]						FULLNAME
	Element Text Should Be				xpath=//table[@id='tableWithSearch-userlist']/tbody/tr/td[4]/form/button			Ubah Pengguna
	Element Should Not Contain			xpath=//table[@id='tableWithSearch-userlist']/tbody/tr/td[4]/form/button			Edit User
	Element Text Should Be				xpath=//div[@id='tableWithSearch-userlist_info' and @class='dataTables_info']		Menampilkan 1 sampai 5 dari 60 daftar
	Element Should Not Contain			xpath=//div[@id='tableWithSearch-userlist_info' and @class='dataTables_info']		Showing 1 to 5 of 60 entries
	Element Text Should Be				xpath=//div[@id='tableWithDynamicRows_info' and @class='dataTables_info']			Kuota User 5 sekarang 1
	Element Should Not Contain			xpath=//div[@id='tableWithDynamicRows_info' and @class='dataTables_info']			User Quota 5 current 1
#=============================================================================================================================================================================
User maintenance en-US
	#terjemahan user maintenance dalam bahasa inggris
	Settings en-US
	Element Text Should Be				xpath=//div[@id='user-maintain']/div/div/div/div									KELOLA PENGGUNA
	Element Should Not Contain			xpath=//div[@id='user-maintain']/div/div/div/div									USER MAINTENANCE
	Element Should Not Contain			xpath=//button[@data-target='#addUser']												Tambah Pengguna
	Element Text Should Be				xpath=//button[@data-target='#addUser']												Add User
	Element Should Not Contain			xpath=//table[@id='tableWithSearch-userlist']/thead/tr/th							NAMA PENGGUNA
	Element Text Should Be				xpath=//table[@id='tableWithSearch-userlist']/thead/tr/th							USERNAME
	Element Should Not Contain			xpath=//table[@id='tableWithSearch-userlist']/thead/tr/th[2]						NAMA LENGKAP
	Element Text Should Be				xpath=//table[@id='tableWithSearch-userlist']/thead/tr/th[2]						FULLNAME
	Element Should Not Contain			xpath=//table[@id='tableWithSearch-userlist']/tbody/tr/td[4]/form/button			Ubah Pengguna
	Element Text Should Be				xpath=//table[@id='tableWithSearch-userlist']/tbody/tr/td[4]/form/button			Edit User
	Element Should Not Contain			xpath=//div[@id='tableWithSearch-userlist_info' and @class='dataTables_info']		Menampilkan 1 sampai 5 dari 60 daftar
	Element Text Should Be				xpath=//div[@id='tableWithSearch-userlist_info' and @class='dataTables_info']		Showing 1 to 5 of 60 entries
	Element Should Not Contain			xpath=//div[@id='tableWithDynamicRows_info' and @class='dataTables_info']			Kuota User 5 sekarang 1
	Element Text Should Be				xpath=//div[@id='tableWithDynamicRows_info' and @class='dataTables_info']			User Quota 5 current 1
#=============================================================================================================================================================================
PNR in-ID
	#terjemahan pnr dalam bahasa indonesia
	Element Text Should Be				xpath=//div[@class='panel-heading']/div/div[2]/h4/span												KODE BOOKING
	Element Should Not Contain			xpath=//div[@class='panel-heading']/div/div[2]/h4/span												BOOKING CODE
	Element Text Should Be				xpath=//div[@class='panel-heading']/div/div[2]/h5/span												BATAS WAKTU
	Element Should Not Contain			xpath=//div[@class='panel-heading']/div/div[2]/h5/span												TIME LIMIT
	Element Should Contain				xpath=//div[@class='panel-body']/div/div/h5/span													pada
	Element Should Not Contain			xpath=//div[@class='panel-body']/div/div/h5/span													on
	Element Text Should Be				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[2]/div/h4/span					RINCIAN PEMESANAN
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[2]/div/h4/span					RESERVATION DETAIL	
	Element Text Should Be				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/h4/span 					RINCIAN PENUMPANG
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/h4/span					PASSENGER DETAIL	
	Pause Execution						message=View detail (manual). Press OK to continue.
	Element Should Contain				xpath=//div[@id='pas1']/div/div/div																	Tanggal Lahir
	Element Should Not Contain			xpath=//div[@id='pas1']/div/div/div																	Date of Birth
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Run Keyword If						(${dob2}==1 and ${dob3}==0)		dob2 in-ID
	...		ELSE IF						(${dob2}==1 and ${dob3}==1)		dob3 in-ID
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    Run Keyword If						'${obyek['mapTransportation']['${namaairline}']['supportFrequentFlyer']}'=='Y'						frequent flyer in-ID
    ...		ELSE IF						'${obyek['mapTransportation']['${namaairline}']['supportFrequentFlyer']}'<>'Y'						No frequent flyer in-ID
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Element Text Should Be				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[2]/div/h4/span		RINCIAN KONTAK
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[2]/div/h4/span		CONTACT DETAIL
	${1}=								Get Text	xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[3]/div/h4/span
	Run Keyword If						'${1}'=='KETERANGAN'		pnr-keterangan in-ID
	...		ELSE IF						'${1}'<>'KETERANGAN'		pnr-rinciantarif in-ID						
#-------------------------------------------------------------------------------------------------------------------------
	${STATUS}=							Get Text					xpath=//div[@class='panel-heading']/div/div[2]/h4[2]/span[2]
	${CLASS}=							Get Text					xpath=//div[@class='panel-body']/div/div/div/div[4]/h4/span
	${TEXT}=							Get Text					xpath=//div[@class='panel-body']/div/div/div/div/h4/span
	${CODE}=							Fetch From Left				${TEXT}				${SPACE}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
	Run Keyword If						('${STATUS}' == 'BOOKED') and (('${CLASS}' == 'N' or '${CLASS}' == 'K' or '${CLASS}' == 'M' or '${CLASS}' == 'B' or '${CLASS}' == 'Y' or '${CLASS}' == 'I' or '${CLASS}' == 'D' or '${CLASS}' == 'C' or '${CLASS}' == 'J') and '${CODE}'=='GA')		editseat in-ID
	...		ELSE IF						('${CODE}'=='QZ' or '${CODE}'=='QG' or '${CODE}'=='1B')																																																editseat in-ID
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${btninsurance}=					Get Text		xpath=//div[@class='panel-body']/div/div/table/tbody/tr[2]/td[4]	
	Run Keyword If						('${btninsurance}'=='0' and '${STATUS}'=='BOOKED')		addinsurance in-ID
	...		ELSE IF						('${btninsurance}'<>'0' and '${STATUS}'=='BOOKED')		removeinsurance in-ID	
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${btnservicefee}=					Get Text		xpath=//div[@class='panel-body']/div/div/table/tbody/tr[3]/td[4]	
	Run Keyword If						('${btnservicefee}'=='0' and '${STATUS}' == 'BOOKED')	addservicefee in-ID
	...		ELSE IF						('${btnservicefee}'<>'0' and '${STATUS}' == 'BOOKED')	removeservicefee in-ID	
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
	Run Keyword If 						'${STATUS}' == 'BOOKED'								tombolbooked in-ID
	...		ELSE IF						'${STATUS}' == 'TICKETED'							tombolticketed in-ID
#=============================================================================================================================================================================    
frequent flyer in-ID
	Run Keyword If						'${STATUS}'=='BOOKED'															Edit flyer in-ID
    ...		ELSE IF						('${STATUS}'=='CANCELED' or '${STATUS}'=='TICKETED')							No edit flyer
    Element Should Contain				xpath=//div[@id='pas1']/div/div/div												Kebangsaan 
    Element Should Not Contain			xpath=//div[@id='pas1']/div/div/div												Nationality
    Element Should Contain				xpath=//div[@id='pas1']/div/div/div[2]											Nomor Identitas/Passpor
    Element Should Not Contain			xpath=//div[@id='pas1']/div/div/div[2]											Identity/Passport Number
    Element Should Contain				xpath=//div[@id='pas1']/div/div/div[2]											Negara Penerbitan Passpor
    Element Should Not Contain			xpath=//div[@id='pas1']/div/div/div[2]											Passport Issuing Country
    Element Should Contain				xpath=//div[@id='pas1']/div/div/div[2]											Tanggal Kadaluarsa Passpor
    Element Should Not Contain			xpath=//div[@id='pas1']/div/div/div[2]											Passport Expiry Date
    #label FLIGHT SEGMENT
    Element Text Should Be				xpath=//div[@id='pas1']/div/div[2]/table/thead/tr/th							JALUR PENERBANGAN
    Element Should Not Contain			xpath=//div[@id='pas1']/div/div[2]/table/thead/tr/th							FLIGHT SEGEMENT
    #label SEAT NUMBER
    Element Text Should Be				xpath=//div[@id='pas1']/div/div[2]/table/thead/tr/th[2]							SEAT NUMBER
    Element Should Not Contain			xpath=//div[@id='pas1']/div/div[2]/table/thead/tr/th[2]							NOMOR TEMPAT DUDUK
    #label BAGGAGE
    Element Text Should Be				xpath=//div[@id='pas1']/div/div[2]/table/thead/tr/th[3]							BAGGAGE
    Element Should Not Contain			xpath=//div[@id='pas1']/div/div[2]/table/thead/tr/th[3]							BAGASI
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${count1}=	Get Matching Xpath Count		xpath=//a[@href='#pas2']
	${count2}=	Get Matching Xpath Count		xpath=//a[@href='#pas3']
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    Run Keyword If						(${count1}==1 and ${count2}==0)													paxpas2 in-ID
    ...		ELSE IF						(${count1}==1 and ${count2}==1)													paxpas3	in-ID
#============================================================================================================================================================================
paxpas2 in-ID
    Pause Execution						message=View detail (manual). Press OK to continue.	
    Run Keyword If						'${STATUS}'=='BOOKED'															Edit flyer in-ID
    ...		ELSE IF						('${STATUS}'=='CANCELED' or '${STATUS}'=='TICKETED')							No edit flyer
    Element Should Contain				xpath=//div[@id='pas2']/div/div/div												Kebangsaan 
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div/div												Nationality
    Element Should Contain				xpath=//div[@id='pas2']/div/div/div[2]											Nomor Identitas/Passpor
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div/div[2]											Identity/Passport Number
    Element Should Contain				xpath=//div[@id='pas2']/div/div/div[2]											Negara Penerbitan Passpor
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div/div[2]											Passport Issuing Country
    Element Should Contain				xpath=//div[@id='pas2']/div/div/div[2]											Tanggal Kadaluarsa Passpor
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div/div[2]											Passport Expiry Date    
    #label FLIGHT SEGMENT
    Element Text Should Be				xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th							JALUR PENERBANGAN
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th							FLIGHT SEGEMENT
    #label SEAT NUMBER
    Element Text Should Be				xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th[2]							SEAT NUMBER
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th[2]							NOMOR TEMPAT DUDUK
    #label BAGGAGE
    Element Text Should Be				xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th[3]							BAGGAGE
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th[3]							BAGASI
#============================================================================================================================================================================
paxpas3 in-ID
    Pause Execution						message=View detail (manual). Press OK to continue.
	Run Keyword If						'${STATUS}'=='BOOKED'															Edit flyer in-ID
    ...		ELSE IF						('${STATUS}'=='CANCELED' or '${STATUS}'=='TICKETED')							No edit flyer
    Element Should Contain				xpath=//div[@id='pas2']/div/div/div												Kebangsaan 
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div/div												Nationality
    Element Should Contain				xpath=//div[@id='pas2']/div/div/div[2]											Nomor Identitas/Passpor
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div/div[2]											Identity/Passport Number
    Element Should Contain				xpath=//div[@id='pas2']/div/div/div[2]											Negara Penerbitan Passpor
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div/div[2]											Passport Issuing Country
    Element Should Contain				xpath=//div[@id='pas2']/div/div/div[2]											Tanggal Kadaluarsa Passpor
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div/div[2]											Passport Expiry Date 	   
    #label FLIGHT SEGMENT
    Element Text Should Be				xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th							JALUR PENERBANGAN
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th							FLIGHT SEGEMENT
    #label SEAT NUMBER
    Element Text Should Be				xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th[2]							SEAT NUMBER
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th[2]							NOMOR TEMPAT DUDUK
    #label BAGGAGE
    Element Text Should Be				xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th[3]							BAGGAGE
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th[3]							BAGASI
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    Run Keyword If						'${STATUS}'=='BOOKED'															Edit flyer in-ID
    ...		ELSE IF						('${STATUS}'=='CANCELED' or '${STATUS}'=='TICKETED')							No edit flyer	
    Element Should Contain				xpath=//div[@id='pas3']/div/div/div												Kebangsaan 
    Element Should Not Contain			xpath=//div[@id='pas3']/div/div/div												Nationality
    Element Should Contain				xpath=//div[@id='pas3']/div/div/div[2]											Nomor Identitas/Passpor
    Element Should Not Contain			xpath=//div[@id='pas3']/div/div/div[2]											Identity/Passport Number
    Element Should Contain				xpath=//div[@id='pas3']/div/div/div[2]											Negara Penerbitan Passpor
    Element Should Not Contain			xpath=//div[@id='pas3']/div/div/div[2]											Passport Issuing Country
    Element Should Contain				xpath=//div[@id='pas3']/div/div/div[2]											Tanggal Kadaluarsa Passpor
    Element Should Not Contain			xpath=//div[@id='pas3']/div/div/div[2]											Passport Expiry Date 	   
    #label FLIGHT SEGMENT
    Element Text Should Be				xpath=//div[@id='pas3']/div/div[2]/table/thead/tr/th							JALUR PENERBANGAN
    Element Should Not Contain			xpath=//div[@id='pas3']/div/div[2]/table/thead/tr/th							FLIGHT SEGEMENT
    #label SEAT NUMBER
    Element Text Should Be				xpath=//div[@id='pas3']/div/div[2]/table/thead/tr/th[2]							SEAT NUMBER
    Element Should Not Contain			xpath=//div[@id='pas3']/div/div[2]/table/thead/tr/th[2]							NOMOR TEMPAT DUDUK
    #label BAGGAGE
    Element Text Should Be				xpath=//div[@id='pas3']/div/div[2]/table/thead/tr/th[3]							BAGGAGE
    Element Should Not Contain			xpath=//div[@id='pas3']/div/div[2]/table/thead/tr/th[3]							BAGASI
#============================================================================================================================================================================
No frequent flyer in-ID
	Run Keyword If						'${STATUS}'=='BOOKED'															Edit flyer in-ID
    ...		ELSE IF						('${STATUS}'=='CANCELED' or '${STATUS}'=='TICKETED')							No edit flyer
    Element Should Contain				xpath=//div[@id='pas1']/div/div/div												Kebangsaan 
    Element Should Not Contain			xpath=//div[@id='pas1']/div/div/div												Nationality
    Element Should Contain				xpath=//div[@id='pas1']/div/div/div[2]											Nomor Identitas/Passpor
    Element Should Not Contain			xpath=//div[@id='pas1']/div/div/div[2]											Identity/Passport Number
    Element Should Contain				xpath=//div[@id='pas1']/div/div/div[2]											Negara Penerbitan Passpor
    Element Should Not Contain			xpath=//div[@id='pas1']/div/div/div[2]											Passport Issuing Country
    Element Should Contain				xpath=//div[@id='pas1']/div/div/div[2]											Tanggal Kadaluarsa Passpor
    Element Should Not Contain			xpath=//div[@id='pas1']/div/div/div[2]											Passport Expiry Date
    #label FLIGHT SEGMENT
    Element Text Should Be				xpath=//table[contains(@class,'table table-condensed')]/thead/tr/th				JALUR PENERBANGAN
    Element Should Not Contain			xpath=//table[contains(@class,'table table-condensed')]/thead/tr/th				FLIGHT SEGEMENT
    #label SEAT NUMBER
    Element Text Should Be				xpath=//table[contains(@class,'table table-condensed')]/thead/tr/th[2]			SEAT NUMBER
    Element Should Not Contain			xpath=//table[contains(@class,'table table-condensed')]/thead/tr/th[2]			NOMOR TEMPAT DUDUK
    #label BAGGAGE
    Element Text Should Be				xpath=//table[contains(@class,'table table-condensed')]/thead/tr/th[3]			BAGGAGE
    Element Should Not Contain			xpath=//table[contains(@class,'table table-condensed')]/thead/tr/th[3]			BAGASI
    
	${count1}=	Get Matching Xpath Count		xpath=//a[@href='#pas2']
	${count2}=	Get Matching Xpath Count		xpath=//a[@href='#pas3']
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    Run Keyword If						(${count1}==1 and ${count2}==0)													no paxpas2 in-ID
    ...		ELSE IF						(${count1}==1 and ${count2}==1)													no paxpas3 in-ID
#============================================================================================================================================================================
no paxpas2 in-ID
	Pause Execution						message=View detail (manual). Press OK to continue.
    Element Should Contain				xpath=//div[@id='pas2']/div/div/div												Kebangsaan 
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div/div												Nationality
    Element Should Contain				xpath=//div[@id='pas2']/div/div/div[2]											Nomor Identitas/Passpor
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div/div[2]											Identity/Passport Number
    Element Should Contain				xpath=//div[@id='pas2']/div/div/div[2]											Negara Penerbitan Passpor
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div/div[2]											Passport Issuing Country
    Element Should Contain				xpath=//div[@id='pas2']/div/div/div[2]											Tanggal Kadaluarsa Passpor
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div/div[2]											Passport Expiry Date 	   
    #label FLIGHT SEGMENT
    Element Text Should Be				xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th							JALUR PENERBANGAN
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th							FLIGHT SEGEMENT
    #label SEAT NUMBER
    Element Text Should Be				xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th[2]							SEAT NUMBER
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th[2]							NOMOR TEMPAT DUDUK
    #label BAGGAGE
    Element Text Should Be				xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th[3]							BAGGAGE
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th[3]							BAGASI
#============================================================================================================================================================================
no paxpas3 in-ID
	Pause Execution						message=View detail (manual). Press OK to continue.
    Element Should Contain				xpath=//div[@id='pas2']/div/div/div												Kebangsaan 
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div/div												Nationality
    Element Should Contain				xpath=//div[@id='pas2']/div/div/div[2]											Nomor Identitas/Passpor
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div/div[2]											Identity/Passport Number
    Element Should Contain				xpath=//div[@id='pas2']/div/div/div[2]											Negara Penerbitan Passpor
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div/div[2]											Passport Issuing Country
    Element Should Contain				xpath=//div[@id='pas2']/div/div/div[2]											Tanggal Kadaluarsa Passpor
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div/div[2]											Passport Expiry Date 	   
    #label FLIGHT SEGMENT
    Element Text Should Be				xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th							JALUR PENERBANGAN
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th							FLIGHT SEGEMENT
    #label SEAT NUMBER
    Element Text Should Be				xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th[2]							SEAT NUMBER
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th[2]							NOMOR TEMPAT DUDUK
    #label BAGGAGE
    Element Text Should Be				xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th[3]							BAGGAGE
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th[3]							BAGASI
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Run Keyword If						'${STATUS}'=='BOOKED'															Edit flyer in-ID
    ...		ELSE IF						('${STATUS}'=='CANCELED' or '${STATUS}'=='TICKETED')							No edit flyer	
    Element Should Contain				xpath=//div[@id='pas3']/div/div/div												Kebangsaan 
    Element Should Not Contain			xpath=//div[@id='pas3']/div/div/div												Nationality
    Element Should Contain				xpath=//div[@id='pas3']/div/div/div[2]											Nomor Identitas/Passpor
    Element Should Not Contain			xpath=//div[@id='pas3']/div/div/div[2]											Identity/Passport Number
    Element Should Contain				xpath=//div[@id='pas3']/div/div/div[2]											Negara Penerbitan Passpor
    Element Should Not Contain			xpath=//div[@id='pas3']/div/div/div[2]											Passport Issuing Country
    Element Should Contain				xpath=//div[@id='pas3']/div/div/div[2]											Tanggal Kadaluarsa Passpor
    Element Should Not Contain			xpath=//div[@id='pas3']/div/div/div[2]											Passport Expiry Date 	   
    #label FLIGHT SEGMENT
    Element Text Should Be				xpath=//div[@id='pas3']/div/div[2]/table/thead/tr/th							JALUR PENERBANGAN
    Element Should Not Contain			xpath=//div[@id='pas3']/div/div[2]/table/thead/tr/th							FLIGHT SEGEMENT
    #label SEAT NUMBER
    Element Text Should Be				xpath=//div[@id='pas3']/div/div[2]/table/thead/tr/th[2]							SEAT NUMBER
    Element Should Not Contain			xpath=//div[@id='pas3']/div/div[2]/table/thead/tr/th[2]							NOMOR TEMPAT DUDUK
    #label BAGGAGE
    Element Text Should Be				xpath=//div[@id='pas3']/div/div[2]/table/thead/tr/th[3]							BAGGAGE
    Element Should Not Contain			xpath=//div[@id='pas3']/div/div[2]/table/thead/tr/th[3]							BAGASI
#============================================================================================================================================================================
dob2 in-ID
	Element Should Contain				xpath=//div[@id='pas2']/div/div/div												Tanggal Lahir
	Element Should Not Contain			xpath=//div[@id='pas2']/div/div/div												Date of Birth
#============================================================================================================================================================================
dob3 in-ID
	Element Should Contain				xpath=//div[@id='pas2']/div/div/div												Tanggal Lahir
	Element Should Not Contain			xpath=//div[@id='pas2']/div/div/div												Date of Birth
	Element Should Contain				xpath=//div[@id='pas3']/div/div/div												Tanggal Lahir
	Element Should Not Contain			xpath=//div[@id='pas3']/div/div/div												Date of Birth
#============================================================================================================================================================================
Edit flyer in-ID
	Element Text Should Be				xpath=//button[contains(@class,'btn btn-xs btn-default inline')]				Ubah
	Element Should Not Contain			xpath=//button[contains(@class,'btn btn-xs btn-default inline')]				Edit
#============================================================================================================================================================================
tombolbooked in-ID	
    Element Text Should Be				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[3]				Tiket Otomatis
    Element Should Not Contain			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[3]				Autoticket
    Element Text Should Be				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[4]				Modifikasi
    Element Should Not Contain			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[4]				Modification
    Element Text Should Be				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[5]				Batal
    Element Should Not Contain			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[5]				Cancel
    Element Text Should Be				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[3]/div/h4/button		Print Pemesanan		
   	Element Should Not Contain			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[3]/div/h4/button		Print Reservation			
    Element Text Should Be				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[3]/div/h4/button[2]	Email Pemesanan		
    Element Should Not Contain			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[3]/div/h4/button[2]	Email Reservation
#=============================================================================================================================================================================    
tombolticketed in-ID			
    Element Text Should Be				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[3]/div/h4/button		Print Tiket
    Element Should Not Contain			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[3]/div/h4/button		Print Ticket					
    Element Text Should Be				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[3]/div/h4/button[2]	Email Tiket				
    Element Should Not Contain			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[3]/div/h4/button[2]	Email Ticket
#=============================================================================================================================================================================    
addinsurance in-ID
    Element Text Should Be				xpath=//div[@class='panel-body']/div/div/table/tbody/tr[2]/td[5]/button								Tambah
    Element Should Not Contain			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[2]/td[5]/button								Add
#=============================================================================================================================================================================    
removeinsurance in-ID
    Element Text Should Be				xpath=//div[@class='panel-body']/div/div/table/tbody/tr[2]/td[5]/button								Hapus
    Element Should Not Contain			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[2]/td[5]/button								Remove
#=============================================================================================================================================================================    
addservicefee in-ID
    Element Text Should Be				xpath=//div[@class='panel-body']/div/div/table/tbody/tr[3]/td[5]/button					 			Tambah
    Element Should Not Contain			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[3]/td[5]/button					 			Add
#=============================================================================================================================================================================    
removeservicefee in-ID		
    Element Text Should Be				xpath=//div[@class='panel-body']/div/div/table/tbody/tr[3]/td[5]/button					 			Ubah
    Element Should Not Contain			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[3]/td[5]/button					 			Edit
#=============================================================================================================================================================================
pnr-keterangan in-ID
	Element Text Should Be				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[3]/div/h4/span		KETERANGAN
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[3]/div/h4/span		REMARKS	
	Element Text Should Be				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[4]/div/h4/span		RINCIAN TARIF
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[4]/div/h4/span		FARE DETAIL
	Element Text Should Be				xpath=//div[@class='panel-body']/div/div/table/tbody/tr/th											TIKET AIRLINE
	Element Should Not Contain			xpath=//div[@class='panel-body']/div/div/table/tbody/tr/th											AIRLINE TICKET     
    Element Text Should Be				xpath=//div[@class='panel-body']/div/div/table/tbody/tr[2]/th								        ASURANSI PERJALANAN
    Element Should Not Contain			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[2]/th								        TRAVEL INSURANCE
    Element Text Should Be				xpath=//div[@class='panel-body']/div/div/table/tbody/tr[3]/th										BIAYA TARIF
    Element Should Not Contain			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[3]/th										SERVICE FEE
    Element Text Should Be				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[4]/div/h4/button		Print Pemesanan		
   	Element Should Not Contain			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[4]/div/h4/button		Print Booking			
    Element Text Should Be				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[4]/div/h4/button[2]	Email Pemesanan		
    Element Should Not Contain			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[4]/div/h4/button[2]	Email Booking
#=============================================================================================================================================================================
pnr-rinciantarif in-ID
	Element Text Should Be				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[3]/div/h4/span		RINCIAN TARIF
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[3]/div/h4/span		FARE DETAIL
#=============================================================================================================================================================================
editseat in-ID
	${split}=							Get Text					xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/h4/button
	Run Keyword If						('${split}'=='Pisahkan')				pnr-editseatsplit in-ID
	...		ELSE IF						('${split}'=='Ubah Tempat Duduk')		pnr-editseat in-ID
#=============================================================================================================================================================================
pnr-editseatsplit in-ID
	Element Text Should Be				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/h4/button[2]/span 				Ubah Tempat Duduk
    Element Should Not Contain			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/h4/button[2]/span 				Edit Seat
	Element Text Should Be				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/h4/button/span	 				Pisahkan
    Element Should Not Contain			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/h4/button/span	 				Split
#=============================================================================================================================================================================
pnr-editseat in-ID
	Element Text Should Be				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/h4/button 				Ubah Tempat Duduk
    Element Should Not Contain			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/h4/button 				Edit Seat
#=============================================================================================================================================================================
Auto tiket in-ID
	Page Should Contain					DETAIL AUTOTICKET
	Page Should Not Contain				AUTOTICKET DETAIL
	Page Should Contain					Kirim Email
	Page Should Not Contain				Resend Email
	Page Should Contain					Hapus Autoticket
	Page Should Not Contain				Remove Autoticket
#============================================================================================================================================================================
No auto tiket in-ID
	Page Should Contain Button			xpath=//button[@data-target='#autoticketpnr']
	Page Should Contain 				Modifikasi
	Page Should Not Contain 			Modification
#============================================================================================================================================================================
No button auto tiket in-ID
	Page Should Contain					DETAIL AUTOTICKET
	Page Should Not Contain				AUTOTICKET DETAIL
#============================================================================================================================================================================
PNR en-US
	#terjemahan pnr dalam bahasa inggris
	Element Should Not Contain			xpath=//div[@class='panel-heading']/div/div[2]/h4/span						KODE BOOKING
	Element Text Should Be				xpath=//div[@class='panel-heading']/div/div[2]/h4/span						BOOKING CODE
	Element Should Not Contain			xpath=//div[@class='panel-heading']/div/div[2]/h5/span						BATAS WAKTU
	Element Text Should Be				xpath=//div[@class='panel-heading']/div/div[2]/h5/span						TIME LIMIT
	Element Should Not Contain			xpath=//div[@class='panel-body']/div/div/h5/span					pada
	Element Should Contain				xpath=//div[@class='panel-body']/div/div/h5/span					on
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[2]/div/h4/span					RINCIAN PEMESANAN
	Element Text Should Be				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[2]/div/h4/span					RESERVATION DETAIL
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/h4/span					RINCIAN PENUMPANG
	Element Text Should Be				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/h4/span					PASSENGER DETAIL	
	Pause Execution						message=View detail (manual). Press OK to continue.
	Element Should Not Contain			xpath=//div[@id='pas1']/div/div/div																	Tanggal Lahir
	Element Should Contain				xpath=//div[@id='pas1']/div/div/div																	Date of Birth
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Run Keyword If						(${dob2}==1 and ${dob3}==0)		dob2 en-US
	...		ELSE IF						(${dob2}==1 and ${dob3}==1)		dob3 en-US
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    Run Keyword If						'${obyek['mapTransportation']['${namaairline}']['supportFrequentFlyer']}'=='Y'						frequent flyer in-ID
    ...		ELSE IF						'${obyek['mapTransportation']['${namaairline}']['supportFrequentFlyer']}'<>'Y'						No frequent flyer in-ID
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[2]/div/h4/span		RINCIAN KONTAK
	Element Text Should Be				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[2]/div/h4/span		CONTACT DETAIL	
	${1}=								Get Text	xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[3]/div/h4/span
	Run Keyword If						'${1}'=='REMARKS'		pnr-keterangan en-US
	...		ELSE IF						'${1}'<>'REMARKS'		pnr-rinciantarif en-US												
#-------------------------------------------------------------------------------------------------------------------------
	${STATUS}=							Get Text					xpath=//div[@class='panel-heading']/div/div[2]/h4[2]/span[2]
	${CLASS}=							Get Text					xpath=//div[@class='panel-body']/div/div/div/div[4]/h4/span
	${TEXT}=							Get Text					xpath=//div[@class='panel-body']/div/div/div/div/h4/span
	${CODE}=							Fetch From Left				${TEXT}				${SPACE}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Run Keyword If						('${STATUS}' == 'BOOKED') and ('${CLASS}' == 'N' or '${CLASS}' == 'K' or '${CLASS}' == 'M' or '${CLASS}' == 'B' or '${CLASS}' == 'Y' or '${CLASS}' == 'I' or '${CLASS}' == 'D' or '${CLASS}' == 'C' or '${CLASS}' == 'J' and '${CODE}'=='GA')		editseat en-US
	...		ELSE IF						('${CODE}'=='QZ' or '${CODE}'=='QG' or '${CODE}'=='1B')																																																editseat en-US
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${btninsurance}=					Get Text		xpath=//div[@class='panel-body']/div/div/table/tbody/tr[2]/td[4]
	Run Keyword If						('${btninsurance}'=='0' and '${STATUS}' == 'BOOKED')		addinsurance en-US
	...		ELSE IF						('${btninsurance}'<>'0' and '${STATUS}' == 'BOOKED')		removeinsurance en-US	
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${btnservicefee}=					Get Text		xpath=//div[@class='panel-body']/div/div/table/tbody/tr[3]/td[4]	
	Run Keyword If						('${btnservicefee}'=='0' and '${STATUS}' == 'BOOKED')		addservicefee en-US
	...		ELSE IF						('${btnservicefee}'<>'0' and '${STATUS}' == 'BOOKED')		removeservicefee en-US		
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Run Keyword If 						'${STATUS}' == 'BOOKED'								tombolbooked en-US	
	...		ELSE IF						'${STATUS}' == 'TICKETED'							tombolticketed en-US
#============================================================================================================================================================================= 
frequent flyer en-US
	Run Keyword If						'${STATUS}'=='BOOKED'															Edit flyer en-US
    ...		ELSE IF						('${STATUS}'=='CANCELED' or '${STATUS}'=='TICKETED')							No edit flyer
    Element Should Not Contain			xpath=//div[@id='pas1']/div/div/div												Kebangsaan 
    Element Should Contain				xpath=//div[@id='pas1']/div/div/div												Nationality
    Element Should Not Contain			xpath=//div[@id='pas1']/div/div/div[2]											Nomor Identitas/Passpor
    Element Should Contain				xpath=//div[@id='pas1']/div/div/div[2]											Identity/Passport Number
    Element Should Not Contain			xpath=//div[@id='pas1']/div/div/div[2]											Negara Penerbitan Passpor
    Element Should Contain				xpath=//div[@id='pas1']/div/div/div[2]											Passport Issuing Country
    Element Should Not Contain			xpath=//div[@id='pas1']/div/div/div[2]											Tanggal Kadaluarsa Passpor
    Element Should Contain				xpath=//div[@id='pas1']/div/div/div[2]											Passport Expiry Date
    #label FLIGHT SEGMENT
    Element Should Not Contain			xpath=//div[@id='pas1']/div/div[2]/table/thead/tr/th							JALUR PENERBANGAN
    Element Text Should Be				xpath=//div[@id='pas1']/div/div[2]/table/thead/tr/th							FLIGHT SEGEMENT
    #label SEAT NUMBER
    Element Should Not Contain			xpath=//div[@id='pas1']/div/div[2]/table/thead/tr/th[2]							SEAT NUMBER
    Element Text Should Be				xpath=//div[@id='pas1']/div/div[2]/table/thead/tr/th[2]							NOMOR TEMPAT DUDUK
    #label BAGGAGE
    Element Should Not Contain			xpath=//div[@id='pas1']/div/div[2]/table/thead/tr/th[3]							BAGGAGE
    Element Text Should Be				xpath=//div[@id='pas1']/div/div[2]/table/thead/tr/th[3]							BAGASI
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${count1}=	Get Matching Xpath Count		xpath=//a[@href='#pas2']
	${count2}=	Get Matching Xpath Count		xpath=//a[@href='#pas3']
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    Run Keyword If						(${count1}==1 and ${count2}==0)													paxpas2 en-US
    ...		ELSE IF						(${count1}==1 and ${count2}==1)													paxpas3	en-US
#============================================================================================================================================================================
paxpas2 en-US
    Pause Execution						message=View detail (manual). Press OK to continue.	
    Run Keyword If						'${STATUS}'=='BOOKED'															Edit flyer en-US
    ...		ELSE IF						('${STATUS}'=='CANCELED' or '${STATUS}'=='TICKETED')							No edit flyer
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div/div												Kebangsaan 
    Element Should Contain				xpath=//div[@id='pas2']/div/div/div												Nationality
    nElement Should Not Contain			xpath=//div[@id='pas2']/div/div/div[2]											Nomor Identitas/Passpor
    Element Should Contai				xpath=//div[@id='pas2']/div/div/div[2]											Identity/Passport Number
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div/div[2]											Negara Penerbitan Passpor
    Element Should Contain				xpath=//div[@id='pas2']/div/div/div[2]											Passport Issuing Country
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div/div[2]											Tanggal Kadaluarsa Passpor
    Element Should Contain				xpath=//div[@id='pas2']/div/div/div[2]											Passport Expiry Date    
    #label FLIGHT SEGMENT
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th							JALUR PENERBANGAN
    Element Text Should Be				xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th							FLIGHT SEGEMENT
    #label SEAT NUMBER
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th[2]							SEAT NUMBER
    Element Text Should Be				xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th[2]							NOMOR TEMPAT DUDUK
    #label BAGGAGE
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th[3]							BAGGAGE
    Element Text Should Be				xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th[3]							BAGASI
#============================================================================================================================================================================    
paxpas3 en-US
    Pause Execution						message=View detail (manual). Press OK to continue.
	Run Keyword If						'${STATUS}'=='BOOKED'															Edit flyer en-US
    ...		ELSE IF						('${STATUS}'=='CANCELED' or '${STATUS}'=='TICKETED')							No edit flyer
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div/div												Kebangsaan 
    Element Should Contain				xpath=//div[@id='pas2']/div/div/div												Nationality
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div/div[2]											Nomor Identitas/Passpor
    Element Should Contain				xpath=//div[@id='pas2']/div/div/div[2]											Identity/Passport Number
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div/div[2]											Negara Penerbitan Passpor
    Element Should Contain				xpath=//div[@id='pas2']/div/div/div[2]											Passport Issuing Country
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div/div[2]											Tanggal Kadaluarsa Passpor
    Element Should Contain				xpath=//div[@id='pas2']/div/div/div[2]											Passport Expiry Date 	   
    #label FLIGHT SEGMENT
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th							JALUR PENERBANGAN
    Element Text Should Be				xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th							FLIGHT SEGEMENT
    #label SEAT NUMBER
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th[2]							SEAT NUMBER
    Element Text Should Be				xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th[2]							NOMOR TEMPAT DUDUK
    #label BAGGAGE
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th[3]							BAGGAGE
    Element Text Should Be				xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th[3]							BAGASI
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    Run Keyword If						'${STATUS}'=='BOOKED'															Edit flyer en-US
    ...		ELSE IF						('${STATUS}'=='CANCELED' or '${STATUS}'=='TICKETED')							No edit flyer	
    Element Should Not Contain			xpath=//div[@id='pas3']/div/div/div												Kebangsaan 
    Element Should Contain				xpath=//div[@id='pas3']/div/div/div												Nationality
    Element Should Not Contain			xpath=//div[@id='pas3']/div/div/div[2]											Nomor Identitas/Passpor
    Element Should Contain				xpath=//div[@id='pas3']/div/div/div[2]											Identity/Passport Number
    Element Should Not Contain			xpath=//div[@id='pas3']/div/div/div[2]											Negara Penerbitan Passpor
    Element Should Contain				xpath=//div[@id='pas3']/div/div/div[2]											Passport Issuing Country
    Element Should Not Contain			xpath=//div[@id='pas3']/div/div/div[2]											Tanggal Kadaluarsa Passpor
    Element Should Contain				xpath=//div[@id='pas3']/div/div/div[2]											Passport Expiry Date 	   
    #label FLIGHT SEGMENT
    Element Should Not Contain			xpath=//div[@id='pas3']/div/div[2]/table/thead/tr/th							JALUR PENERBANGAN
    Element Text Should Be				xpath=//div[@id='pas3']/div/div[2]/table/thead/tr/th							FLIGHT SEGEMENT
    #label SEAT NUMBER
    Element Should Not Contain			xpath=//div[@id='pas3']/div/div[2]/table/thead/tr/th[2]							SEAT NUMBER
    Element Text Should Be				xpath=//div[@id='pas3']/div/div[2]/table/thead/tr/th[2]							NOMOR TEMPAT DUDUK
    #label BAGGAGE
    Element Should Not Contain			xpath=//div[@id='pas3']/div/div[2]/table/thead/tr/th[3]							BAGGAGE
    Element Text Should Be				xpath=//div[@id='pas3']/div/div[2]/table/thead/tr/th[3]							BAGASI
#============================================================================================================================================================================    
No frequent flyer en-US
	Run Keyword If						'${STATUS}'=='BOOKED'															Edit flyer en-US
    ...		ELSE IF						('${STATUS}'=='CANCELED' or '${STATUS}'=='TICKETED')							No edit flyer
    Element Should Not Contain			xpath=//div[@id='pas1']/div/div/div												Kebangsaan 
    Element Should Contain				xpath=//div[@id='pas1']/div/div/div												Nationality
    Element Should Not Contain			xpath=//div[@id='pas1']/div/div/div[2]											Nomor Identitas/Passpor
    Element Should Contain				xpath=//div[@id='pas1']/div/div/div[2]											Identity/Passport Number
    Element Should Not Contain			xpath=//div[@id='pas1']/div/div/div[2]											Negara Penerbitan Passpor
    Element Should Contain				xpath=//div[@id='pas1']/div/div/div[2]											Passport Issuing Country
    Element Should Not Contain			xpath=//div[@id='pas1']/div/div/div[2]											Tanggal Kadaluarsa Passpor
    Element Should Contain				xpath=//div[@id='pas1']/div/div/div[2]											Passport Expiry Date
    #label FLIGHT SEGMENT
    Element Should Not Contain			xpath=//table[contains(@class,'table table-condensed')]/thead/tr/th				JALUR PENERBANGAN
    Element Text Should Be				xpath=//table[contains(@class,'table table-condensed')]/thead/tr/th				FLIGHT SEGEMENT
    #label SEAT NUMBER
    Element Should Not Contain			xpath=//table[contains(@class,'table table-condensed')]/thead/tr/th[2]			SEAT NUMBER
    Element Text Should Be				xpath=//table[contains(@class,'table table-condensed')]/thead/tr/th[2]			NOMOR TEMPAT DUDUK
    #label BAGGAGE
    Element Should Not Contain			xpath=//table[contains(@class,'table table-condensed')]/thead/tr/th[3]			BAGGAGE
    Element Text Should Be				xpath=//table[contains(@class,'table table-condensed')]/thead/tr/th[3]			BAGASI
    
	${count1}=	Get Matching Xpath Count		xpath=//a[@href='#pas2']
	${count2}=	Get Matching Xpath Count		xpath=//a[@href='#pas3']
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    Run Keyword If						(${count1}==1 and ${count2}==0)													no paxpas2 en-US
    ...		ELSE IF						(${count1}==1 and ${count2}==1)													no paxpas3 en-US
#============================================================================================================================================================================    
no paxpas2 en-US
	Pause Execution						message=View detail (manual). Press OK to continue.
	Run Keyword If						'${STATUS}'=='BOOKED'															Edit flyer en-US
    ...		ELSE IF						('${STATUS}'=='CANCELED' or '${STATUS}'=='TICKETED')							No edit flyer
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div/div												Kebangsaan 
    Element Should Contain				xpath=//div[@id='pas2']/div/div/div												Nationality
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div/div[2]											Nomor Identitas/Passpor
    Element Should Contain				xpath=//div[@id='pas2']/div/div/div[2]											Identity/Passport Number
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div/div[2]											Negara Penerbitan Passpor
    Element Should Contain				xpath=//div[@id='pas2']/div/div/div[2]											Passport Issuing Country
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div/div[2]											Tanggal Kadaluarsa Passpor
    Element Should Contain				xpath=//div[@id='pas2']/div/div/div[2]											Passport Expiry Date 	   
    #label FLIGHT SEGMENT
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th							JALUR PENERBANGAN
    Element Text Should Be				xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th							FLIGHT SEGEMENT
    #label SEAT NUMBER
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th[2]							SEAT NUMBER
    Element Text Should Be				xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th[2]							NOMOR TEMPAT DUDUK
    #label BAGGAGE
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th[3]							BAGGAGE
    Element Text Should Be				xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th[3]							BAGASI
#============================================================================================================================================================================    
no paxpas3 en-US
	Pause Execution						message=View detail (manual). Press OK to continue.
	Run Keyword If						'${STATUS}'=='BOOKED'															Edit flyer en-US
    ...		ELSE IF						('${STATUS}'=='CANCELED' or '${STATUS}'=='TICKETED')							No edit flyer
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div/div												Kebangsaan 
    Element Should Contain				xpath=//div[@id='pas2']/div/div/div												Nationality
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div/div[2]											Nomor Identitas/Passpor
    Element Should Contain				xpath=//div[@id='pas2']/div/div/div[2]											Identity/Passport Number
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div/div[2]											Negara Penerbitan Passpor
    Element Should Contain				xpath=//div[@id='pas2']/div/div/div[2]											Passport Issuing Country
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div/div[2]											Tanggal Kadaluarsa Passpor
    Element Should Contain				xpath=//div[@id='pas2']/div/div/div[2]											Passport Expiry Date 	   
    #label FLIGHT SEGMENT
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th							JALUR PENERBANGAN
    Element Text Should Be				xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th							FLIGHT SEGEMENT
    #label SEAT NUMBER
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th[2]							SEAT NUMBER
    Element Text Should Be				xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th[2]							NOMOR TEMPAT DUDUK
    #label BAGGAGE
    Element Should Not Contain			xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th[3]							BAGGAGE
    Element Text Should Be				xpath=//div[@id='pas2']/div/div[2]/table/thead/tr/th[3]							BAGASI
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Run Keyword If						'${STATUS}'=='BOOKED'															Edit flyer en-US
    ...		ELSE IF						('${STATUS}'=='CANCELED' or '${STATUS}'=='TICKETED')							No edit flyer	
    Element Should Not Contain			xpath=//div[@id='pas3']/div/div/div												Kebangsaan 
    Element Should Contain				xpath=//div[@id='pas3']/div/div/div												Nationality
    Element Should Not Contain			xpath=//div[@id='pas3']/div/div/div[2]											Nomor Identitas/Passpor
    Element Should Contain				xpath=//div[@id='pas3']/div/div/div[2]											Identity/Passport Number
    Element Should Not Contain 			xpath=//div[@id='pas3']/div/div/div[2]											Negara Penerbitan Passpor
    Element Should Contain				xpath=//div[@id='pas3']/div/div/div[2]											Passport Issuing Country
    Element Should Not Contain			xpath=//div[@id='pas3']/div/div/div[2]											Tanggal Kadaluarsa Passpor
    Element Should Contain				xpath=//div[@id='pas3']/div/div/div[2]											Passport Expiry Date 	   
    #label FLIGHT SEGMENT
    Element Should Not Contain			xpath=//div[@id='pas3']/div/div[2]/table/thead/tr/th							JALUR PENERBANGAN
    Element Text Should Be				xpath=//div[@id='pas3']/div/div[2]/table/thead/tr/th							FLIGHT SEGEMENT
    #label SEAT NUMBER
    Element Should Not Contain			xpath=//div[@id='pas3']/div/div[2]/table/thead/tr/th[2]							SEAT NUMBER
    Element Text Should Be				xpath=//div[@id='pas3']/div/div[2]/table/thead/tr/th[2]							NOMOR TEMPAT DUDUK
    #label BAGGAGE
    Element Should Not Contain			xpath=//div[@id='pas3']/div/div[2]/table/thead/tr/th[3]							BAGGAGE
    Element Text Should Be				xpath=//div[@id='pas3']/div/div[2]/table/thead/tr/th[3]							BAGASI
#============================================================================================================================================================================    
dob2 en-US
	Element Should Not Contain			xpath=//div[@id='pas2']/div/div/div												Tanggal Lahir
	Element Should Contain				xpath=//div[@id='pas2']/div/div/div												Date of Birth
#============================================================================================================================================================================
dob3 en-US
	Element Should Not Contain			xpath=//div[@id='pas2']/div/div/div												Tanggal Lahir
	Element Should Contain				xpath=//div[@id='pas2']/div/div/div												Date of Birth
	Element Should Not Contain			xpath=//div[@id='pas3']/div/div/div												Tanggal Lahir
	Element Should Contain				xpath=//div[@id='pas3']/div/div/div												Date of Birth
#============================================================================================================================================================================
Edit flyer en-US
	Element Should Not Contain			xpath=//button[contains(@class,'btn btn-xs btn-default inline')]				Ubah
	Element Text Should Be				xpath=//button[contains(@class,'btn btn-xs btn-default inline')]				Edit
#============================================================================================================================================================================
tombolbooked en-US
    Element Should Not Contain			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[3]				Tiket Otomatis
    Element Text Should Be				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[3]				Autoticket
    Element Should Not Contain			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[4]				Modifikasi
    Element Text Should Be				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[4]				Modification
    Element Should Not Contain			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[5]				Batal
    Element Text Should Be				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/button[5]				Cancel	
    Element Should Not Contain			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[3]/div/h4/button		Print Pemesanan		
   	Element Text Should Be				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[3]/div/h4/button		Print Reservation			
    Element Should Not Contain			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[3]/div/h4/button[2]	Email Pemesanan		
    Element Text Should Be				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[3]/div/h4/button[2]	Email Reservation
#=============================================================================================================================================================================
tombolticketed en-US			
    Element Should Not Contain			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[3]/div/h4/button		Print Tiket
    Element Text Should Be				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[3]/div/h4/button		Print Ticket					
    Element Should Not Contain			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[3]/div/h4/button[2]	Email Tiket				
    Element Text Should Be				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[3]/div/h4/button[2]	Email Ticket
#=============================================================================================================================================================================
addinsurance en-US
    Element Should Not Contain			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[2]/td[5]/button								Tambah
    Element Text Should Be				xpath=//div[@class='panel-body']/div/div/table/tbody/tr[2]/td[5]/button								Add
#=============================================================================================================================================================================
removeinsurance en-US
    Element Should Not Contain			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[2]/td[5]/button								Hapus
    Element Text Should Be				xpath=//div[@class='panel-body']/div/div/table/tbody/tr[2]/td[5]/button								Remove
#=============================================================================================================================================================================
addservicefee en-US
    Element Should Not Contain			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[3]/td[5]/button					 			Tambah
    Element Text Should Be				xpath=//div[@class='panel-body']/div/div/table/tbody/tr[3]/td[5]/button					 			Add
#=============================================================================================================================================================================
removeservicefee en-US
    Element Should Not Contain			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[3]/td[5]/button					 			Ubah
    Element Text Should Be				xpath=//div[@class='panel-body']/div/div/table/tbody/tr[3]/td[5]/button					 			Edit
#=============================================================================================================================================================================
pnr-keterangan en-US
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[3]/div/h4/span		KETERANGAN
	Element Text Should Be				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[3]/div/h4/span		REMARKS	
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[4]/div/h4/span		RINCIAN TARIF
	Element Text Should Be				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[4]/div/h4/span		FARE DETAIL	
	Element Text Should Be				xpath=//div[@class='panel-body']/div/div/table/tbody/tr/th											TIKET AIRLINE
	Element Should Not Contain			xpath=//div[@class='panel-body']/div/div/table/tbody/tr/th											AIRLINE TICKET     
    Element Text Should Be				xpath=//div[@class='panel-body']/div/div/table/tbody/tr[2]/th								        ASURANSI PERJALANAN
    Element Should Not Contain			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[2]/th								        TRAVEL INSURANCE
    Element Text Should Be				xpath=//div[@class='panel-body']/div/div/table/tbody/tr[3]/th										BIAYA TARIF
    Element Should Not Contain			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[3]/th										SERVICE FEE
    Element Should Not Contain			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[4]/div/h4/button		Print Pemesanan		
   	Element Text Should Be				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[4]/div/h4/button		Print Booking			
    Element Should Not Contain			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[4]/div/h4/button[2]	Email Pemesanan		
    Element Text Should Be				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[4]/div/h4/button[2]	Email Booking
#=============================================================================================================================================================================
pnr-rinciantarif en-US	
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[3]/div/h4/span		RINCIAN TARIF
	Element Text Should Be				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[3]/div/h4/span		FARE DETAIL
#=============================================================================================================================================================================
editseat en-US
	${split}=							Get Text								xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/h4/button
	Run Keyword If						('${split}'=='Pisahkan')				pnr-editseatsplit en-US
	...		ELSE IF						('${split}'=='Ubah Tempat Duduk')		pnr-editseat in-ID
#=============================================================================================================================================================================
pnr-editseatsplit en-US
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/h4/button[2]/span 		Ubah Tempat Duduk
    Element Text Should Be				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/h4/button[2]/span 		Edit Seat
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/h4/button/span	 		Pisahkan
    Element Text Should Be				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/h4/button/span	 		Split
#=============================================================================================================================================================================
pnr-editseat en-US
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/h4/button 				Ubah Tempat Duduk
    Element Text Should Be				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/h4/button 				Edit Seat
#============================================================================================================================================================================
Auto tiket en-US
	Page Should Contain					DETAIL AUTOTICKET
	Page Should Not Contain				AUTOTICKET DETAIL
	Page Should Contain					Kirim Email
	Page Should Not Contain				Resend Email
	Page Should Contain					Hapus Autoticket
	Page Should Not Contain				Remove Autoticket
#============================================================================================================================================================================
No auto tiket en-US
	Page Should Contain Button			xpath=//button[@data-target='#autoticketpnr']
	Page Should Contain 				Modifikasi
	Page Should Not Contain 			Modification
#============================================================================================================================================================================
No button auto tiket en-US
	Page Should Contain					DETAIL AUTOTICKET
	Page Should Not Contain				AUTOTICKET DETAIL
#============================================================================================================================================================================
Availability result 1 in-ID
	Element Text Should Be				xpath=//div[@class='content']/div[2]/div/div[8]/div/label		Saya setuju untuk menggunakan jaminan dari travel. Mohon baca Syarat dan Ketentuan
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/div/div[8]/div/label		I agree to use the travel insurance. Please Read Term and Condition
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div/label					Dewasa
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div/label					Adult
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div/div/div/div/span			Gelar
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div/div/div/div/span			Title
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${name}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div/div[2]/input
	${NAMEPLACEHOLDER}=			 		set variable			${name.get_attribute('placeholder')}
	Should Be Equal						${NAMAPLACEHOLDER}		Nama Lengkap
	Should Not Be Equal					${NAMAPLACEHOLDER}		Full Name
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 	${idtty}= 							Get WebElement  		xpath=//form[@id='form-work']div/div[3]/input
	${IDPLACEHOLDER}=			 		set variable			${idtty.get_attribute('placeholder')}
	Should Be Equal						${IDPLACEHOLDER}		No. Identitas
	Should Not Be Equal					${IDPLACEHOLDER}		Identity Number
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div/div[5]/button			Cari
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div/div[5]/button			Search
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div/label					KONTAK
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div/label					CONTACT
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div/div/label				PELANGGAN
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div/div/label				CUSTOMER
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${fullname}=						Get WebElement  		xpath=//form[@id='form-work']/div/div[2]/input
	${FULLPLACEHOLDER}=			 		set variable			${fullname.get_attribute('placeholder')}
	Should Be Equal						${FULLPLACEHOLDER}		Nama Lengkap
	Should Not Be Equal					${FULLPLACEHOLDER}		Full Name
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${orgphone}=						Get WebElement  		xpath=//form[@id='form-work']/div/div[3]/input
	${ORGPPLACEHOLDER}=			 		set variable			${orgphone.get_attribute('placeholder')}
	Should Be Equal						${ORGPPLACEHOLDER}		Telepon 1
	Should Not Be Equal					${ORGPPLACEHOLDER}		Origin Phone
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${othphone}=						Get WebElement  		xpath=//form[@id='form-work']/div/div[4]/input
	${OTHPPLACEHOLDER}=			 		set variable			${othphone.get_attribute('placeholder')}
	Should Be Equal						${OTHPPLACEHOLDER}		Telepon 2
	Should Not Be Equal					${OTHPPLACEHOLDER}		Other Phone
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div/div[5]/button			Cari
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div/div[5]/button			Search
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div[2]/label					Agen
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div[2]/label					Agent
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${agtname}=							Get WebElement  		xpath=//form[@id='form-work']/div[2]/div[2]/input
	${AGTNPLACEHOLDER}=			 		set variable			${agtname.get_attribute('placeholder')}
	Should Be Equal						${AGTNPLACEHOLDER}		Nama Lengkap
	Should Not Be Equal					${AGTNPLACEHOLDER}		Full Name
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${agtemail}=						Get WebElement  		xpath=//form[@id='form-work']/div[2]/div[3]/input
	${AGTEPLACEHOLDER}=			 		set variable			${agtemail.get_attribute('placeholder')}
	Should Be Equal						${AGTEPLACEHOLDER}		Email Agen
	Should Not Be Equal					${AGTEPLACEHOLDER}		Agent Email
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${agtphone}=						Get WebElement  		xpath=//form[@id='form-work']/div[2]/div[4]/input
	${AGTPPLACEHOLDER}=			 		set variable			${agtphone.get_attribute('placeholder')}
	Should Be Equal						${AGTPPLACEHOLDER}		Telepon Agen
	Should Not Be Equal					${AGTPPLACEHOLDER}		Agent Phone
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Element Text Should Be				xpath=//div[contains(@class,'panel col-sm-12 panel-default')]/div[3]/label						Tujuan Pemesanan
	Element Should Not Contain			xpath=//div[contains(@class,'panel col-sm-12 panel-default')]/div[3]/label						Booking Purpose
	Element Text Should Be				xpath=//div[contains(@class,'col-sm-6 checkbox check-primary checkbox-circle')]/label			Simpan Penumpang
	Element Should Not Contain			xpath=//div[contains(@class,'col-sm-6 checkbox check-primary checkbox-circle')]/label			Save Passenger				
#============================================================================================================================================================================
Availability result 2 in-ID
	Availability result 1 in-ID
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div/div/div/span		Gelar
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div/div/div/span		Title	
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------									
	${name2}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form[@id='form-work']div/div[2]/input
	${NAMEPLACEHOLDER2}=			 	set variable			${name2.get_attribute('placeholder')}
	Should Be Equal						${NAMAPLACEHOLDER2}		Nama Lengkap
	Should Not Be Equal					${NAMAPLACEHOLDER2}		Full Name
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 	${idtty2}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form[@id='form-work']div/div[3]/input
	${IDPLACEHOLDER2}=			 		set variable			${idtty2.get_attribute('placeholder')}
	Should Be Equal						${IDPLACEHOLDER2}		No. Identitas
	Should Not Be Equal					${IDPLACEHOLDER2}		Identity Number
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div[5]/button			Cari
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div[5]/button			Search
#============================================================================================================================================================================
Availability result 3 in-ID
	Availability result 1 in-ID
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/label						Anak
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/label						Child
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/div/div/div/span			Gelar
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/div/div/div/span			Title
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${name2}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/div[2]/input
	${NAMEPLACEHOLDER2}=			 	set variable			${name2.get_attribute('placeholder')}
	Should Be Equal						${NAMAPLACEHOLDER2}		Nama Lengkap
	Should Not Be Equal					${NAMAPLACEHOLDER2}		Full Name
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 	${idtty2}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/div[3]/input
	${IDPLACEHOLDER2}=			 		set variable			${idtty2.get_attribute('placeholder')}
	Should Be Equal						${IDPLACEHOLDER2}		No. Identitas
	Should Not Be Equal					${IDPLACEHOLDER2}		Identity Number
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/div[5]/button				Cari
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/div[5]/button				Search
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div[2]/div[2]/label			TTL
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div[2]/div[2]/label			DOB
#============================================================================================================================================================================
Availability result 4 in-ID
	Availability result 3 in-ID
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/label						Bayi
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/label						Infant
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div/div/div/span			Gelar
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div/div/div/span			Title
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${name3}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div[2]/input
	${NAMEPLACEHOLDER3}=			 	set variable			${name3.get_attribute('placeholder')}
	Should Be Equal						${NAMAPLACEHOLDER3}		Nama Lengkap
	Should Not Be Equal					${NAMAPLACEHOLDER3}		Full Name
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 	${idtty3}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div[3]/input
	${IDPLACEHOLDER3}=			 		set variable			${idtty3.get_attribute('placeholder')}
	Should Be Equal						${IDPLACEHOLDER3}		No. Identitas
	Should Not Be Equal					${IDPLACEHOLDER3}		Identity Number
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div[5]/button				Cari
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div[5]/button				Search
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div[2]/div[2]/label			TTL
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div[2]/div[2]/label			DOB
#============================================================================================================================================================================
Availability result 5 in-ID
	Availability result 2 in-ID
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/label						Bayi
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/label						Infant
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div/div/div/span			Gelar
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div/div/div/span			Title
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/label					Bayi
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/label					Infant
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/div/div/div/span		Gelar
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/div/div/div/span		Title
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${name3}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div[2]/input
	${NAMEPLACEHOLDER3}=			 	set variable			${name3.get_attribute('placeholder')}
	Should Be Equal						${NAMAPLACEHOLDER3}		Nama Lengkap
	Should Not Be Equal					${NAMAPLACEHOLDER3}		Full Name
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${name4}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/div[2]/input
	${NAMEPLACEHOLDER4}=			 	set variable			${name4.get_attribute('placeholder')}
	Should Be Equal						${NAMAPLACEHOLDER4}		Nama Lengkap
	Should Not Be Equal					${NAMAPLACEHOLDER4}		Full Name
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 	${idtty3}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div[3]/input
	${IDPLACEHOLDER3}=			 		set variable			${idtty3.get_attribute('placeholder')}
	Should Be Equal						${IDPLACEHOLDER3}		No. Identitas
	Should Not Be Equal					${IDPLACEHOLDER3}		Identity Number
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 	${idtty4}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/div[3]/input
	${IDPLACEHOLDER4}=			 		set variable			${idtty4.get_attribute('placeholder')}
	Should Be Equal						${IDPLACEHOLDER4}		No. Identitas
	Should Not Be Equal					${IDPLACEHOLDER4}		Identity Number
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div[5]/button				Cari
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div[5]/button				Search
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div[2]/div[2]/label			TTL
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div[2]/div[2]/label			DOB		
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/div[5]/button			Cari
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/div[5]/button			Search
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div[2]/div[2]/label			TTL
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div[2]/div[2]/label			DOB					
#============================================================================================================================================================================
Availability result 6 in-ID
	Availability result 4 in-ID
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/label					Dewasa
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/label					Adult
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div/div/div/span		Gelar
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div/div/div/span		Title
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][3]/form/div/label					Dewasa
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][3]/form/div/label					Adult
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][3]/form/div/div/div/div/span		Gelar
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][3]/form/div/div/div/div/span		Title
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][4]/form/div/label					Dewasa
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][4]/form/div/label					Adult
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][4]/form/div/div/div/div/span		Gelar
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][4]/form/div/div/div/div/span		Title
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][5]/form/div/label					Dewasa
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][5]/form/div/label					Adult
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][5]/form/div/div/div/div/span		Gelar
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][5]/form/div/div/div/div/span		Title
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][6]/form/div/label					Dewasa
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][6]/form/div/label					Adult
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][6]/form/div/div/div/div/span		Gelar
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][6]/form/div/div/div/div/span		Title
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][2]/form/div/label					Anak
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][2]/form/div/label					Child
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][2]/form/div/div/div/div/span		Gelar
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][2]/form/div/div/div/div/span		Title
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][3]/form/div/label					Anak
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][3]/form/div/label					Child
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][3]/form/div/div/div/div/span		Gelar
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][3]/form/div/div/div/div/span		Title
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][4]/form/div/label					Anak
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][4]/form/div/label					Child
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][4]/form/div/div/div/div/span		Gelar
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][4]/form/div/div/div/div/span		Title
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][5]/form/div/label					Anak
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][5]/form/div/label					Child
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][5]/form/div/div/div/div/span		Gelar
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][5]/form/div/div/div/div/span		Title
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][6]/form/div/label					Anak
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][6]/form/div/label					Child
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][6]/form/div/div/div/div/span		Gelar
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][6]/form/div/div/div/div/span		Title
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/label					Bayi
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/label					Infant
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/div/div/div/span		Gelar
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/div/div/div/span		Title
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][3]/form/div/label					Bayi
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][3]/form/div/label					Infant
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][3]/form/div/div/div/div/span		Gelar
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][3]/form/div/div/div/div/span		Title
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][4]/form/div/label					Bayi
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][4]/form/div/label					Infant
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][4]/form/div/div/div/div/span		Gelar
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][4]/form/div/div/div/div/span		Title
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][5]/form/div/label					Bayi
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][5]/form/div/label					Infant
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][5]/form/div/div/div/div/span		Gelar
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][5]/form/div/div/div/div/span		Title
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][6]/form/div/label					Bayi
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][6]/form/div/label					Infant
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][6]/form/div/div/div/div/span		Gelar
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][6]/form/div/div/div/div/span		Title
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${name4}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div[2]/input
	${NAMEPLACEHOLDER4}=				set variable			${name4.get_attribute('placeholder')}
	Should Be Equal						${NAMEPLACEHOLDER4}		Nama Lengkap
	Should Not Be Equal					${NAMEPLACEHOLDER4}		Full Name
	${name5}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][3]/form/div/div[2]/input
	${NAMEPLACEHOLDER5}=				set variable			${name5.get_attribute('placeholder')}
	Should Be Equal						${NAMEPLACEHOLDER5}		Nama Lengkap
	Should Not Be Equal					${NAMEPLACEHOLDER5}		Full Name
	${name6}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][4]/form/div/div[2]/input
	${NAMEPLACEHOLDER6}=				set variable			${name6.get_attribute('placeholder')}
	Should Be Equal						${NAMEPLACEHOLDER6}		Nama Lengkap
	Should Not Be Equal					${NAMEPLACEHOLDER6}		Full Name
	${name7}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][5]/form/div/div[2]/input
	${NAMEPLACEHOLDER7}=				set variable			${name7.get_attribute('placeholder')}
	Should Be Equal						${NAMEPLACEHOLDER7}		Nama Lengkap
	Should Not Be Equal					${NAMEPLACEHOLDER7}		Full Name
	${name8}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][6]/form/div/div[2]/input
	${NAMEPLACEHOLDER8}=				set variable			${name8.get_attribute('placeholder')}
	Should Be Equal						${NAMEPLACEHOLDER8}		Nama Lengkap
	Should Not Be Equal					${NAMEPLACEHOLDER8}		Full Name
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${name9}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][2]/form/div/div[2]/input
	${NAMEPLACEHOLDER9}=				set variable			${name9.get_attribute('placeholder')}
	Should Be Equal						${NAMEPLACEHOLDER9}		Nama Lengkap
	Should Not Be Equal					${NAMEPLACEHOLDER9}		Full Name
	${name10}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][3]/form/div/div[2]/input
	${NAMEPLACEHOLDER10}=				set variable			${name10.get_attribute('placeholder')}
	Should Be Equal						${NAMEPLACEHOLDER10}	Nama Lengkap
	Should Not Be Equal					${NAMEPLACEHOLDER10}	Full Name
	${name11}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][4]/form/div/div[2]/input
	${NAMEPLACEHOLDER11}=				set variable			${name11.get_attribute('placeholder')}
	Should Be Equal						${NAMEPLACEHOLDER11}	Nama Lengkap
	Should Not Be Equal					${NAMEPLACEHOLDER11}	Full Name
	${name12}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][5]/form/div/div[2]/input
	${NAMEPLACEHOLDER12}=				set variable			${name12.get_attribute('placeholder')}
	Should Be Equal						${NAMEPLACEHOLDER12}	Nama Lengkap
	Should Not Be Equal					${NAMEPLACEHOLDER12}	Full Name
	${name13}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][6]/form/div/div[2]/input
	${NAMEPLACEHOLDER13}=				set variable			${name13.get_attribute('placeholder')}
	Should Be Equal						${NAMEPLACEHOLDER13}	Nama Lengkap
	Should Not Be Equal					${NAMEPLACEHOLDER13}	Full Name
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${name14}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/div[2]/input
	${NAMEPLACEHOLDER14}=				set variable			${name14.get_attribute('placeholder')}
	Should Be Equal						${NAMEPLACEHOLDER14}	Nama Lengkap
	Should Not Be Equal					${NAMEPLACEHOLDER14}	Full Name
	${name15}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][3]/form/div/div[2]/input
	${NAMEPLACEHOLDER15}=				set variable			${name15.get_attribute('placeholder')}
	Should Be Equal						${NAMEPLACEHOLDER15}	Nama Lengkap
	Should Not Be Equal					${NAMEPLACEHOLDER15}	Full Name
	${name16}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][4]/form/div/div[2]/input
	${NAMEPLACEHOLDER16}=				set variable			${name16.get_attribute('placeholder')}
	Should Be Equal						${NAMEPLACEHOLDER16}	Nama Lengkap
	Should Not Be Equal					${NAMEPLACEHOLDER16}	Full Name
	${name17}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][5]/form/div/div[2]/input
	${NAMEPLACEHOLDER17}=				set variable			${name17.get_attribute('placeholder')}
	Should Be Equal						${NAMEPLACEHOLDER17}	Nama Lengkap
	Should Not Be Equal					${NAMEPLACEHOLDER17}	Full Name
	${name18}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][6]/form/div/div[2]/input
	${NAMEPLACEHOLDER18}=				set variable			${name18.get_attribute('placeholder')}
	Should Be Equal						${NAMEPLACEHOLDER18}	Nama Lengkap
	Should Not Be Equal					${NAMEPLACEHOLDER18}	Full Name
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 	${idtty4}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div[3]/input
	${IDPLACEHOLDER4}=			 		set variable			${idtty4.get_attribute('placeholder')}
	Should Be Equal						${IDPLACEHOLDER4}		No. Identitas
	Should Not Be Equal					${IDPLACEHOLDER4}		Identity Number
 	${idtty5}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][3]/form/div/div[3]/input
	${IDPLACEHOLDER5}=			 		set variable			${idtty5.get_attribute('placeholder')}
	Should Be Equal						${IDPLACEHOLDER5}		No. Identitas
	Should Not Be Equal					${IDPLACEHOLDER5}		Identity Number
 	${idtty6}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][4]/form/div/div[3]/input
	${IDPLACEHOLDER6}=			 		set variable			${idtty6.get_attribute('placeholder')}
	Should Be Equal						${IDPLACEHOLDER6}		No. Identitas
	Should Not Be Equal					${IDPLACEHOLDER6}		Identity Number
 	${idtty7}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][5]/form/div/div[3]/input
	${IDPLACEHOLDER7}=			 		set variable			${idtty7.get_attribute('placeholder')}
	Should Be Equal						${IDPLACEHOLDER7}		No. Identitas
	Should Not Be Equal					${IDPLACEHOLDER7}		Identity Number
 	${idtty8}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][6]/form/div/div[3]/input
	${IDPLACEHOLDER8}=			 		set variable			${idtty8.get_attribute('placeholder')}
	Should Be Equal						${IDPLACEHOLDER8}		No. Identitas
	Should Not Be Equal					${IDPLACEHOLDER8}		Identity Number
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 	${idtty9}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][2]/form/div/div[3]/input
	${IDPLACEHOLDER9}=			 		set variable			${idtty9.get_attribute('placeholder')}
	Should Be Equal						${IDPLACEHOLDER9}		No. Identitas
	Should Not Be Equal					${IDPLACEHOLDER9}		Identity Number
 	${idtty10}= 						Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][3]/form/div/div[3]/input
	${IDPLACEHOLDER10}=			 		set variable			${idtty10.get_attribute('placeholder')}
	Should Be Equal						${IDPLACEHOLDER10}		No. Identitas
	Should Not Be Equal					${IDPLACEHOLDER10}		Identity Number
 	${idtty11}= 						Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][4]/form/div/div[3]/input
	${IDPLACEHOLDER11}=			 		set variable			${idtty11.get_attribute('placeholder')}
	Should Be Equal						${IDPLACEHOLDER11}		No. Identitas
	Should Not Be Equal					${IDPLACEHOLDER11}		Identity Number
 	${idtty12}= 						Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][5]/form/div/div[3]/input
	${IDPLACEHOLDER12}=			 		set variable			${idtty12.get_attribute('placeholder')}
	Should Be Equal						${IDPLACEHOLDER12}		No. Identitas
	Should Not Be Equal					${IDPLACEHOLDER12}		Identity Number
 	${idtty13}= 						Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][6]/form/div/div[3]/input
	${IDPLACEHOLDER13}=			 		set variable			${idtty13.get_attribute('placeholder')}
	Should Be Equal						${IDPLACEHOLDER13}		No. Identitas
	Should Not Be Equal					${IDPLACEHOLDER13}		Identity Number	
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 	${idtty14}= 						Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/div[3]/input
	${IDPLACEHOLDER14}=			 		set variable			${idtty14.get_attribute('placeholder')}
	Should Be Equal						${IDPLACEHOLDER14}		No. Identitas
	Should Not Be Equal					${IDPLACEHOLDER14}		Identity Number
 	${idtty15}= 						Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][3]/form/div/div[3]/input
	${IDPLACEHOLDER15}=			 		set variable			${idtty15.get_attribute('placeholder')}
	Should Be Equal						${IDPLACEHOLDER15}		No. Identitas
	Should Not Be Equal					${IDPLACEHOLDER15}		Identity Number
 	${idtty16}= 						Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][4]/form/div/div[3]/input
	${IDPLACEHOLDER16}=			 		set variable			${idtty16.get_attribute('placeholder')}
	Should Be Equal						${IDPLACEHOLDER16}		No. Identitas
	Should Not Be Equal					${IDPLACEHOLDER16}		Identity Number
 	${idtty17}= 						Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][5]/form/div/div[3]/input
	${IDPLACEHOLDER17}=			 		set variable			${idtty17.get_attribute('placeholder')}
	Should Be Equal						${IDPLACEHOLDER17}		No. Identitas
	Should Not Be Equal					${IDPLACEHOLDER17}		Identity Number
 	${idtty18}= 						Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][6]/form/div/div[3]/input
	${IDPLACEHOLDER18}=			 		set variable			${idtty18.get_attribute('placeholder')}
	Should Be Equal						${IDPLACEHOLDER18}		No. Identitas
	Should Not Be Equal					${IDPLACEHOLDER18}		Identity Number	
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div[5]/button			Cari
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div[5]/button			Search
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][3]/form/div/div[5]/button			Cari
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][3]/form/div/div[5]/button			Search
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][4]/form/div/div[5]/button			Cari
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][4]/form/div/div[5]/button			Search
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][5]/form/div/div[5]/button			Cari
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][5]/form/div/div[5]/button			Search
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][6]/form/div/div[5]/button			Cari
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][6]/form/div/div[5]/button			Search
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][2]/form/div/div[5]/button			Cari
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][2]/form/div/div[5]/button			Search
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][2]/form/div[2]/div[2]/label		TTL
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][2]/form/div[2]/div[2]/label		DOB		
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][3]/form/div/div[5]/button			Cari
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][3]/form/div/div[5]/button			Search
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][3]/form/div[2]/div[2]/label		TTL
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][3]/form/div[2]/div[2]/label		DOB		
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][4]/form/div/div[5]/button			Cari
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][4]/form/div/div[5]/button			Search
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][4]/form/div[2]/div[2]/label		TTL
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][4]/form/div[2]/div[2]/label		DOB		
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][5]/form/div/div[5]/button			Cari
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][5]/form/div/div[5]/button			Search
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][5]/form/div[2]/div[2]/label		TTL
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][5]/form/div[2]/div[2]/label		DOB		
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][6]/form/div/div[5]/button			Cari
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][6]/form/div/div[5]/button			Search
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][6]/form/div[2]/div[2]/label		TTL
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][6]/form/div[2]/div[2]/label		DOB	
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/div[5]/button			Cari
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/div[5]/button			Search
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div[2]/div[2]/label			TTL
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div[2]/div[2]/label			DOB		
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][3]/form/div/div[5]/button			Cari
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][3]/form/div/div[5]/button			Search
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][3]/form/div[2]/div[2]/label			TTL
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][3]/form/div[2]/div[2]/label			DOB		
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][4]/form/div/div[5]/button			Cari
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][4]/form/div/div[5]/button			Search
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][4]/form/div[2]/div[2]/label			TTL
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][4]/form/div[2]/div[2]/label			DOB		
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][5]/form/div/div[5]/button			Cari
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][5]/form/div/div[5]/button			Search
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][5]/form/div[2]/div[2]/label			TTL
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][5]/form/div[2]/div[2]/label			DOB		
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][6]/form/div/div[5]/button			Cari
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][6]/form/div/div[5]/button			Search
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][6]/form/div[2]/div[2]/label			TTL
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][6]/form/div[2]/div[2]/label			DOB	
#============================================================================================================================================================================
Availability result 1 en-US
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/div/div[8]/div/label		Saya setuju untuk menggunakan jaminan dari travel. Mohon baca Syarat dan Ketentuan
	Element Text Should Be				xpath=//div[@class='content']/div[2]/div/div[8]/div/label		I agree to use the travel insurance. Please Read Term and Condition
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div/label					Dewasa
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div/label					Adult
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div/div/div/div/span			Gelar
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div/div/div/div/span			Title
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${name}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div/div[2]/input
	${NAMEPLACEHOLDER}=			 		set variable			${name.get_attribute('placeholder')}
	Should Not Be Equal					${NAMAPLACEHOLDER}		Nama Lengkap
	Should Be Equal						${NAMAPLACEHOLDER}		Full Name
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 	${idtty}= 							Get WebElement  		xpath=//form[@id='form-work']div/div[3]/input
	${IDPLACEHOLDER}=			 		set variable			${idtty.get_attribute('placeholder')}
	Should Not Be Equal					${IDPLACEHOLDER}		No. Identitas
	Should Be Equal						${IDPLACEHOLDER}		Identity Number
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div/div[5]/button			Cari
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div/div[5]/button			Search
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div/label					KONTAK
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div/label					CONTACT
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div/div/label				PELANGGAN
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div/div/label				CUSTOMER
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${fullname}=						Get WebElement  		xpath=//form[@id='form-work']/div/div[2]/input
	${FULLPLACEHOLDER}=			 		set variable			${fullname.get_attribute('placeholder')}
	Should Not Be Equal					${FULLPLACEHOLDER}		Nama Lengkap
	Should Be Equal						${FULLPLACEHOLDER}		Full Name
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${orgphone}=						Get WebElement  		xpath=//form[@id='form-work']/div/div[3]/input
	${ORGPPLACEHOLDER}=			 		set variable			${orgphone.get_attribute('placeholder')}
	Should Not Be Equal					${ORGPPLACEHOLDER}		Telepon 1
	Should Be Equal						${ORGPPLACEHOLDER}		Origin Phone
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${othphone}=						Get WebElement  		xpath=//form[@id='form-work']/div/div[4]/input
	${OTHPPLACEHOLDER}=			 		set variable			${othphone.get_attribute('placeholder')}
	Should Not Be Equal					${OTHPPLACEHOLDER}		Telepon 2
	Should Be Equal						${OTHPPLACEHOLDER}		Other Phone
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div/div[5]/button			Cari
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div/div[5]/button			Search
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div[2]/label					Agen
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')]/form/div[2]/label					Agent
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${agtname}=							Get WebElement  		xpath=//form[@id='form-work']/div[2]/div[2]/input
	${AGTNPLACEHOLDER}=			 		set variable			${agtname.get_attribute('placeholder')}
	Should Not Be Equal					${AGTNPLACEHOLDER}		Nama Lengkap
	Should Be Equal						${AGTNPLACEHOLDER}		Full Name
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${agtemail}=						Get WebElement  		xpath=//form[@id='form-work']/div[2]/div[3]/input
	${AGTEPLACEHOLDER}=			 		set variable			${agtemail.get_attribute('placeholder')}
	Should Not Be Equal					${AGTEPLACEHOLDER}		Email Agen
	Should Be Equal						${AGTEPLACEHOLDER}		Agent Email
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${agtphone}=						Get WebElement  		xpath=//form[@id='form-work']/div[2]/div[4]/input
	${AGTPPLACEHOLDER}=			 		set variable			${agtphone.get_attribute('placeholder')}
	Should Not Be Equal					${AGTPPLACEHOLDER}		Telepon Agen
	Should Be Equal						${AGTPPLACEHOLDER}		Agent Phone
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Element Should Not Contain			xpath=//div[contains(@class,'panel col-sm-12 panel-default')]/div[3]/label						Tujuan Pemesanan
	Element Text Should Be				xpath=//div[contains(@class,'panel col-sm-12 panel-default')]/div[3]/label						Booking Purpose
	Element Should Not Contain			xpath=//div[contains(@class,'col-sm-6 checkbox check-primary checkbox-circle')]/label			Simpan Penumpang
	Element Text Should Be				xpath=//div[contains(@class,'col-sm-6 checkbox check-primary checkbox-circle')]/label			Save Passenger				
#============================================================================================================================================================================
Availability result 2 en-US
	Availability result 1 en-US
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div/div/div/span		Gelar
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div/div/div/span		Title	
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------									
	${name2}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form[@id='form-work']div/div[2]/input
	${NAMEPLACEHOLDER2}=			 	set variable			${name2.get_attribute('placeholder')}
	Should Not Be Equal					${NAMAPLACEHOLDER2}		Nama Lengkap
	Should Be Equal						${NAMAPLACEHOLDER2}		Full Name
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 	${idtty2}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form[@id='form-work']div/div[3]/input
	${IDPLACEHOLDER2}=			 		set variable			${idtty2.get_attribute('placeholder')}
	Should Not Be Equal					${IDPLACEHOLDER2}		No. Identitas
	Should Be Equal						${IDPLACEHOLDER2}		Identity Number
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div[5]/button			Cari
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div[5]/button			Search
#============================================================================================================================================================================
Availability result 3 en-US
	Availability result 1 en-US
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/label						Anak
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/label						Child
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/div/div/div/span			Gelar
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/div/div/div/span			Title
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${name2}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/div[2]/input
	${NAMEPLACEHOLDER2}=			 	set variable			${name2.get_attribute('placeholder')}
	Should Not Be Equal					${NAMAPLACEHOLDER2}		Nama Lengkap
	Should Be Equal						${NAMAPLACEHOLDER2}		Full Name
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 	${idtty2}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/div[3]/input
	${IDPLACEHOLDER2}=			 		set variable			${idtty2.get_attribute('placeholder')}
	Should Not Be Equal					${IDPLACEHOLDER2}		No. Identitas
	Should Be Equal						${IDPLACEHOLDER2}		Identity Number
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/div[5]/button				Cari
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div/div[5]/button				Search
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div[2]/div[2]/label			TTL
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')]/form/div[2]/div[2]/label			DOB
#============================================================================================================================================================================
Availability result 4 en-US
	Availability result 3 en-US
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/label						Bayi
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/label						Infant
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div/div/div/span			Gelar
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div/div/div/span			Title
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${name3}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div[2]/input
	${NAMEPLACEHOLDER3}=			 	set variable			${name3.get_attribute('placeholder')}
	Should Not Be Equal					${NAMAPLACEHOLDER3}		Nama Lengkap
	Should Be Equal						${NAMAPLACEHOLDER3}		Full Name
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 	${idtty3}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div[3]/input
	${IDPLACEHOLDER3}=			 		set variable			${idtty3.get_attribute('placeholder')}
	Should Not Be Equal					${IDPLACEHOLDER3}		No. Identitas
	Should Be Equal						${IDPLACEHOLDER3}		Identity Number
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div[5]/button				Cari
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div[5]/button				Search
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div[2]/div[2]/label			TTL
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div[2]/div[2]/label			DOB
#============================================================================================================================================================================
Availability result 5 en-US
	Availability result 2 en-US
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/label						Bayi
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/label						Infant
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div/div/div/span			Gelar
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div/div/div/span			Title
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/label					Bayi
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/label					Infant
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/div/div/div/span		Gelar
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/div/div/div/span		Title
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${name3}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div[2]/input
	${NAMEPLACEHOLDER3}=			 	set variable			${name3.get_attribute('placeholder')}
	Should Not Be Equal					${NAMAPLACEHOLDER3}		Nama Lengkap
	Should Be Equal						${NAMAPLACEHOLDER3}		Full Name
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${name4}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/div[2]/input
	${NAMEPLACEHOLDER4}=			 	set variable			${name4.get_attribute('placeholder')}
	Should Not Be Equal					${NAMAPLACEHOLDER4}		Nama Lengkap
	Should Be Equal						${NAMAPLACEHOLDER4}		Full Name
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 	${idtty3}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div[3]/input
	${IDPLACEHOLDER3}=			 		set variable			${idtty3.get_attribute('placeholder')}
	Should Not Be Equal					${IDPLACEHOLDER3}		No. Identitas
	Should Be Equal						${IDPLACEHOLDER3}		Identity Number
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 	${idtty4}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/div[3]/input
	${IDPLACEHOLDER4}=			 		set variable			${idtty4.get_attribute('placeholder')}
	Should Not Be Equal					${IDPLACEHOLDER4}		No. Identitas
	Should Be Equal						${IDPLACEHOLDER4}		Identity Number
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div[5]/button				Cari
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div/div[5]/button				Search
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div[2]/div[2]/label			TTL
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')]/form/div[2]/div[2]/label			DOB		
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/div[5]/button			Cari
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/div[5]/button			Search
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div[2]/div[2]/label			TTL
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div[2]/div[2]/label			DOB					
#============================================================================================================================================================================
Availability result 6 en-US
	Availability result 4 en-US
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/label					Dewasa
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/label					Adult
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div/div/div/span		Gelar
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div/div/div/span		Title
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][3]/form/div/label					Dewasa
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][3]/form/div/label					Adult
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][3]/form/div/div/div/div/span		Gelar
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][3]/form/div/div/div/div/span		Title
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][4]/form/div/label					Dewasa
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][4]/form/div/label					Adult
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][4]/form/div/div/div/div/span		Gelar
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][4]/form/div/div/div/div/span		Title
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][5]/form/div/label					Dewasa
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][5]/form/div/label					Adult
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][5]/form/div/div/div/div/span		Gelar
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][5]/form/div/div/div/div/span		Title
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][6]/form/div/label					Dewasa
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][6]/form/div/label					Adult
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][6]/form/div/div/div/div/span		Gelar
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][6]/form/div/div/div/div/span		Title
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][2]/form/div/label					Anak
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][2]/form/div/label					Child
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][2]/form/div/div/div/div/span		Gelar
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][2]/form/div/div/div/div/span		Title
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][3]/form/div/label					Anak
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][3]/form/div/label					Child
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][3]/form/div/div/div/div/span		Gelar
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][3]/form/div/div/div/div/span		Title
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][4]/form/div/label					Anak
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][4]/form/div/label					Child
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][4]/form/div/div/div/div/span		Gelar
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][4]/form/div/div/div/div/span		Title
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][5]/form/div/label					Anak
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][5]/form/div/label					Child
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][5]/form/div/div/div/div/span		Gelar
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][5]/form/div/div/div/div/span		Title
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][6]/form/div/label					Anak
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][6]/form/div/label					Child
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][6]/form/div/div/div/div/span		Gelar
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][6]/form/div/div/div/div/span		Title
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/label					Bayi
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/label					Infant
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/div/div/div/span		Gelar
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/div/div/div/span		Title
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][3]/form/div/label					Bayi
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][3]/form/div/label					Infant
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][3]/form/div/div/div/div/span		Gelar
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][3]/form/div/div/div/div/span		Title
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][4]/form/div/label					Bayi
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][4]/form/div/label					Infant
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][4]/form/div/div/div/div/span		Gelar
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][4]/form/div/div/div/div/span		Title
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][5]/form/div/label					Bayi
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][5]/form/div/label					Infant
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][5]/form/div/div/div/div/span		Gelar
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][5]/form/div/div/div/div/span		Title
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][6]/form/div/label					Bayi
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][6]/form/div/label					Infant
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][6]/form/div/div/div/div/span		Gelar
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][6]/form/div/div/div/div/span		Title
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${name4}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div[2]/input
	${NAMEPLACEHOLDER4}=				set variable			${name4.get_attribute('placeholder')}
	Should Not Be Equal					${NAMEPLACEHOLDER4}		Nama Lengkap
	Should Be Equal						${NAMEPLACEHOLDER4}		Full Name
	${name5}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][3]/form/div/div[2]/input
	${NAMEPLACEHOLDER5}=				set variable			${name5.get_attribute('placeholder')}
	Should Not Be Equal					${NAMEPLACEHOLDER5}		Nama Lengkap
	Should Be Equal						${NAMEPLACEHOLDER5}		Full Name
	${name6}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][4]/form/div/div[2]/input
	${NAMEPLACEHOLDER6}=				set variable			${name6.get_attribute('placeholder')}
	Should Not Be Equal					${NAMEPLACEHOLDER6}		Nama Lengkap
	Should Be Equal						${NAMEPLACEHOLDER6}		Full Name
	${name7}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][5]/form/div/div[2]/input
	${NAMEPLACEHOLDER7}=				set variable			${name7.get_attribute('placeholder')}
	Should Not Be Equal					${NAMEPLACEHOLDER7}		Nama Lengkap
	Should Be Equal						${NAMEPLACEHOLDER7}		Full Name
	${name8}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][6]/form/div/div[2]/input
	${NAMEPLACEHOLDER8}=				set variable			${name8.get_attribute('placeholder')}
	Should Not Be Equal					${NAMEPLACEHOLDER8}		Nama Lengkap
	Should Be Equal						${NAMEPLACEHOLDER8}		Full Name
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${name9}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][2]/form/div/div[2]/input
	${NAMEPLACEHOLDER9}=				set variable			${name9.get_attribute('placeholder')}
	Should Not Be Equal					${NAMEPLACEHOLDER9}		Nama Lengkap
	Should Be Equal						${NAMEPLACEHOLDER9}		Full Name
	${name10}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][3]/form/div/div[2]/input
	${NAMEPLACEHOLDER10}=				set variable			${name10.get_attribute('placeholder')}
	Should Not Be Equal					${NAMEPLACEHOLDER10}	Nama Lengkap
	Should Be Equal						${NAMEPLACEHOLDER10}	Full Name
	${name11}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][4]/form/div/div[2]/input
	${NAMEPLACEHOLDER11}=				set variable			${name11.get_attribute('placeholder')}
	Should Not Be Equal					${NAMEPLACEHOLDER11}	Nama Lengkap
	Should Be Equal						${NAMEPLACEHOLDER11}	Full Name
	${name12}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][5]/form/div/div[2]/input
	${NAMEPLACEHOLDER12}=				set variable			${name12.get_attribute('placeholder')}
	Should Not Be Equal					${NAMEPLACEHOLDER12}	Nama Lengkap
	Should Be Equal						${NAMEPLACEHOLDER12}	Full Name
	${name13}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][6]/form/div/div[2]/input
	${NAMEPLACEHOLDER13}=				set variable			${name13.get_attribute('placeholder')}
	Should Not Be Equal					${NAMEPLACEHOLDER13}	Nama Lengkap
	Should Be Equal						${NAMEPLACEHOLDER13}	Full Name
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${name14}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/div[2]/input
	${NAMEPLACEHOLDER14}=				set variable			${name14.get_attribute('placeholder')}
	Should Not Be Equal					${NAMEPLACEHOLDER14}	Nama Lengkap
	Should Be Equal						${NAMEPLACEHOLDER14}	Full Name
	${name15}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][3]/form/div/div[2]/input
	${NAMEPLACEHOLDER15}=				set variable			${name15.get_attribute('placeholder')}
	Should Not Be Equal					${NAMEPLACEHOLDER15}	Nama Lengkap
	Should Be Equal						${NAMEPLACEHOLDER15}	Full Name
	${name16}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][4]/form/div/div[2]/input
	${NAMEPLACEHOLDER16}=				set variable			${name16.get_attribute('placeholder')}
	Should Not Be Equal					${NAMEPLACEHOLDER16}	Nama Lengkap
	Should Be Equal						${NAMEPLACEHOLDER16}	Full Name
	${name17}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][5]/form/div/div[2]/input
	${NAMEPLACEHOLDER17}=				set variable			${name17.get_attribute('placeholder')}
	Should Not Be Equal					${NAMEPLACEHOLDER17}	Nama Lengkap
	Should Be Equal						${NAMEPLACEHOLDER17}	Full Name
	${name18}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][6]/form/div/div[2]/input
	${NAMEPLACEHOLDER18}=				set variable			${name18.get_attribute('placeholder')}
	Should Not Be Equal					${NAMEPLACEHOLDER18}	Nama Lengkap
	Should Be Equal						${NAMEPLACEHOLDER18}	Full Name
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 	${idtty4}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div[3]/input
	${IDPLACEHOLDER4}=			 		set variable			${idtty4.get_attribute('placeholder')}
	Should Not Be Equal					${IDPLACEHOLDER4}		No. Identitas
	Should Be Equal						${IDPLACEHOLDER4}		Identity Number
 	${idtty5}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][3]/form/div/div[3]/input
	${IDPLACEHOLDER5}=			 		set variable			${idtty5.get_attribute('placeholder')}
	Should Not Be Equal					${IDPLACEHOLDER5}		No. Identitas
	Should Be Equal						${IDPLACEHOLDER5}		Identity Number
 	${idtty6}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][4]/form/div/div[3]/input
	${IDPLACEHOLDER6}=			 		set variable			${idtty6.get_attribute('placeholder')}
	Should Not Be Equal					${IDPLACEHOLDER6}		No. Identitas
	Should Be Equal						${IDPLACEHOLDER6}		Identity Number
 	${idtty7}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][5]/form/div/div[3]/input
	${IDPLACEHOLDER7}=			 		set variable			${idtty7.get_attribute('placeholder')}
	Should Not Be Equal					${IDPLACEHOLDER7}		No. Identitas
	Should Be Equal						${IDPLACEHOLDER7}		Identity Number
 	${idtty8}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][6]/form/div/div[3]/input
	${IDPLACEHOLDER8}=			 		set variable			${idtty8.get_attribute('placeholder')}
	Should Not Be Equal					${IDPLACEHOLDER8}		No. Identitas
	Should Be Equal						${IDPLACEHOLDER8}		Identity Number
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 	${idtty9}= 							Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][2]/form/div/div[3]/input
	${IDPLACEHOLDER9}=			 		set variable			${idtty9.get_attribute('placeholder')}
	Should Not Be Equal					${IDPLACEHOLDER9}		No. Identitas
	Should Be Equal						${IDPLACEHOLDER9}		Identity Number
 	${idtty10}= 						Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][3]/form/div/div[3]/input
	${IDPLACEHOLDER10}=			 		set variable			${idtty10.get_attribute('placeholder')}
	Should Not Be Equal					${IDPLACEHOLDER10}		No. Identitas
	Should Be Equal						${IDPLACEHOLDER10}		Identity Number
 	${idtty11}= 						Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][4]/form/div/div[3]/input
	${IDPLACEHOLDER11}=			 		set variable			${idtty11.get_attribute('placeholder')}
	Should Not Be Equal					${IDPLACEHOLDER11}		No. Identitas
	Should Be Equal						${IDPLACEHOLDER11}		Identity Number
 	${idtty12}= 						Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][5]/form/div/div[3]/input
	${IDPLACEHOLDER12}=			 		set variable			${idtty12.get_attribute('placeholder')}
	Should Not Be Equal					${IDPLACEHOLDER12}		No. Identitas
	Should Be Equal						${IDPLACEHOLDER12}		Identity Number
 	${idtty13}= 						Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][6]/form/div/div[3]/input
	${IDPLACEHOLDER13}=			 		set variable			${idtty13.get_attribute('placeholder')}
	Should Not Be Equal					${IDPLACEHOLDER13}		No. Identitas
	Should Be Equal						${IDPLACEHOLDER13}		Identity Number	
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 	${idtty14}= 						Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/div[3]/input
	${IDPLACEHOLDER14}=			 		set variable			${idtty14.get_attribute('placeholder')}
	Should Not Be Equal					${IDPLACEHOLDER14}		No. Identitas
	Should Be Equal						${IDPLACEHOLDER14}		Identity Number
 	${idtty15}= 						Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][3]/form/div/div[3]/input
	${IDPLACEHOLDER15}=			 		set variable			${idtty15.get_attribute('placeholder')}
	Should Not Be Equal					${IDPLACEHOLDER15}		No. Identitas
	Should Be Equal						${IDPLACEHOLDER15}		Identity Number
 	${idtty16}= 						Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][4]/form/div/div[3]/input
	${IDPLACEHOLDER16}=			 		set variable			${idtty16.get_attribute('placeholder')}
	Should Not Be Equal					${IDPLACEHOLDER16}		No. Identitas
	Should Be Equal						${IDPLACEHOLDER16}		Identity Number
 	${idtty17}= 						Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][5]/form/div/div[3]/input
	${IDPLACEHOLDER17}=			 		set variable			${idtty17.get_attribute('placeholder')}
	Should Not Be Equal					${IDPLACEHOLDER17}		No. Identitas
	Should Be Equal						${IDPLACEHOLDER17}		Identity Number
 	${idtty18}= 						Get WebElement  		xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][6]/form/div/div[3]/input
	${IDPLACEHOLDER18}=			 		set variable			${idtty18.get_attribute('placeholder')}
	Should Not Be Equal					${IDPLACEHOLDER18}		No. Identitas
	Should Be Equal						${IDPLACEHOLDER18}		Identity Number	
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div[5]/button			Cari
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][2]/form/div/div[5]/button			Search
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][3]/form/div/div[5]/button			Cari
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][3]/form/div/div[5]/button			Search
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][4]/form/div/div[5]/button			Cari
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][4]/form/div/div[5]/button			Search
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][5]/form/div/div[5]/button			Cari
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][5]/form/div/div[5]/button			Search
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][6]/form/div/div[5]/button			Cari
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-complete-lighter')][6]/form/div/div[5]/button			Search
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][2]/form/div/div[5]/button			Cari
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][2]/form/div/div[5]/button			Search
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][2]/form/div[2]/div[2]/label		TTL
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][2]/form/div[2]/div[2]/label		DOB		
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][3]/form/div/div[5]/button			Cari
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][3]/form/div/div[5]/button			Search
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][3]/form/div[2]/div[2]/label		TTL
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][3]/form/div[2]/div[2]/label		DOB		
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][4]/form/div/div[5]/button			Cari
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][4]/form/div/div[5]/button			Search
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][4]/form/div[2]/div[2]/label		TTL
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][4]/form/div[2]/div[2]/label		DOB		
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][5]/form/div/div[5]/button			Cari
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][5]/form/div/div[5]/button			Search
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][5]/form/div[2]/div[2]/label		TTL
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][5]/form/div[2]/div[2]/label		DOB		
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][6]/form/div/div[5]/button			Cari
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][6]/form/div/div[5]/button			Search
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][6]/form/div[2]/div[2]/label		TTL
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-warning-lighter')][6]/form/div[2]/div[2]/label		DOB	
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/div[5]/button			Cari
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div/div[5]/button			Search
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div[2]/div[2]/label			TTL
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][2]/form/div[2]/div[2]/label			DOB		
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][3]/form/div/div[5]/button			Cari
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][3]/form/div/div[5]/button			Search
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][3]/form/div[2]/div[2]/label			TTL
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][3]/form/div[2]/div[2]/label			DOB		
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][4]/form/div/div[5]/button			Cari
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][4]/form/div/div[5]/button			Search
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][4]/form/div[2]/div[2]/label			TTL
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][4]/form/div[2]/div[2]/label			DOB		
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][5]/form/div/div[5]/button			Cari
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][5]/form/div/div[5]/button			Search
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][5]/form/div[2]/div[2]/label			TTL
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][5]/form/div[2]/div[2]/label			DOB		
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][6]/form/div/div[5]/button			Cari
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][6]/form/div/div[5]/button			Search
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][6]/form/div[2]/div[2]/label			TTL
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-12 bg-danger-lighter')][6]/form/div[2]/div[2]/label			DOB	
#============================================================================================================================================================================
Availability fare 1 in-ID
	Element Text Should Be				xpath=//div[@class='col-lg-3']/div/div/div/table/thead/tr/th													BERANGKAT
	Element Should Not Contain			xpath=//div[@class='col-lg-3']/div/div/div/table/thead/tr/th													DEPART
	Element Text Should Be				xpath=//table[contains(@class,'table m-r-5 m-l-0 m-t-0 m-b-5 no-padding fs-12')]/thead/tr[2]/th					MASKAPAI
	Element Should Not Contain			xpath=//table[contains(@class,'table m-r-5 m-l-0 m-t-0 m-b-5 no-padding fs-12')]/thead/tr[2]/th					AIRLINE
	Element Text Should Be				xpath=//table[contains(@class,'table m-r-5 m-l-0 m-t-0 m-b-5 no-padding fs-12')]/thead/tr[2]/th[2]				NOMOR PENERBANGAN
	Element Should Not Contain			xpath=//table[contains(@class,'table m-r-5 m-l-0 m-t-0 m-b-5 no-padding fs-12')]/thead/tr[2]/th[2]				FLIGHT NO
	Element Text Should Be				xpath=//table[contains(@class,'table m-r-5 m-l-0 m-t-0 m-b-5 no-padding fs-12')]/thead/tr[2]/th[3]				RUTE
	Element Should Not Contain			xpath=//table[contains(@class,'table m-r-5 m-l-0 m-t-0 m-b-5 no-padding fs-12')]/thead/tr[2]/th[3]				ROUTE
	Element Text Should Be				xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/tbody/tr[2]/td						SERVICE FEE/DISKON
	Element Should Not Contain			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/tbody/tr[2]/td						SERVICE FEE/DISCOUNT
	Element Text Should Be				xpath=//div[@class='col-lg-3']/div/div[2]//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]			Catatan
	Element Should Not Contain			xpath=//div[@class='col-lg-3']/div/div[2]//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]			Notes
#============================================================================================================================================================================
Availability fare 2 in-ID
	Availability fare 1 in-ID
#============================================================================================================================================================================
Availability fare 3 in-ID
	Availability fare 1 in-ID	
#============================================================================================================================================================================
Availability fare 4 in-ID
	Availability fare 1 in-ID
	Element Text Should Be				xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/thead/tr/th							PULANG
	Element Should Not Contain			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/thead/tr/th							RETURN
	Element Text Should Be				xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/thead/tr[2]/th						MASKAPAI
	Element Should Not Contain			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/thead/tr[2]/th						AIRLINE
	Element Text Should Be				xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/thead/tr[2]/th[2]					NOMOR PENERBANGAN
	Element Should Not Contain			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/thead/tr[2]/th[2]					FLIGHT NO
	Element Text Should Be				xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/thead/tr[2]/th[3]					RUTE
	Element Should Not Contain			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/thead/tr[2]/th[3]					ROUTE	
#============================================================================================================================================================================	
Availability fare 5 in-ID
	Availability fare 1 in-ID
#============================================================================================================================================================================
Availability fare 6 in-ID
	Availability fare 1 in-ID
#============================================================================================================================================================================
Availability fare 7 in-ID
	Availability fare 1 in-ID
#============================================================================================================================================================================
Availability fare 1 en-US
	Element Should Not Contain			xpath=//div[@class='col-lg-3']/div/div/div/table/thead/tr/th					BERANGKAT
	Element Text Should Be				xpath=//div[@class='col-lg-3']/div/div/div/table/thead/tr/th					DEPART
	Element Should Not Contain			xpath=//table[contains(@class,'table m-r-5 m-l-0 m-t-0 m-b-5 no-padding fs-12')]/thead/tr[2]/th					MASKAPAI
	Element Text Should Be				xpath=//table[contains(@class,'table m-r-5 m-l-0 m-t-0 m-b-5 no-padding fs-12')]/thead/tr[2]/th					AIRLINE
	Element Should Not Contain			xpath=//table[contains(@class,'table m-r-5 m-l-0 m-t-0 m-b-5 no-padding fs-12')]/thead/tr[2]/th[2]				NOMOR PENERBANGAN
	Element Text Should Be				xpath=//table[contains(@class,'table m-r-5 m-l-0 m-t-0 m-b-5 no-padding fs-12')]/thead/tr[2]/th[2]				FLIGHT NO
	Element Should Not Contain			xpath=//table[contains(@class,'table m-r-5 m-l-0 m-t-0 m-b-5 no-padding fs-12')]/thead/tr[2]/th[3]				RUTE
	Element Text Should Be				xpath=//table[contains(@class,'table m-r-5 m-l-0 m-t-0 m-b-5 no-padding fs-12')]/thead/tr[2]/th[3]				ROUTE
	Element Should Not Contain			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/tbody/tr[2]/td						SERVICE FEE/DISKON
	Element Text Should Be				xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/tbody/tr[2]/td						SERVICE FEE/DISCOUNT
	Element Should Not Contain			xpath=//div[@class='col-lg-3']/div/div[2]//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]			Catatan
	Element Text Should Be				xpath=//div[@class='col-lg-3']/div/div[2]//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]			Notes
#============================================================================================================================================================================
Availability fare 2 en-US
	Availability fare 1 en-US
#============================================================================================================================================================================
Availability fare 3 en-US
	Availability fare 1 en-US	
#============================================================================================================================================================================
Availability fare 4 en-US
	Availability fare 1 en-US
	Element Should Not Contain			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/thead/tr/th							PULANG
	Element Text Should Be				xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/thead/tr/th							RETURN
	Element Should Not Contain			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/thead/tr[2]/th						MASKAPAI
	Element Text Should Be				xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/thead/tr[2]/th						AIRLINE
	Element Should Not Contain			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/thead/tr[2]/th[2]					NOMOR PENERBANGAN
	Element Text Should Be				xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/thead/tr[2]/th[2]					FLIGHT NO
	Element Should Not Contain			xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/thead/tr[2]/th[3]					RUTE
	Element Text Should Be				xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]/table[2]/thead/tr[2]/th[3]					ROUTE	
#============================================================================================================================================================================	
Availability fare 5 en-US
	Availability fare 1 en-US
#============================================================================================================================================================================
Availability fare 6 en-US
	Availability fare 1 en-US
#============================================================================================================================================================================
Availability fare 7 en-US
	Availability fare 1 en-US
#============================================================================================================================================================================
Report in-ID
	Element Text Should Be				xpath=//div[@class='content']/div[2]/h3										Laporan VAN
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/h3										VAN Report
	Element Text Should Be				xpath=//div[@class='content']/div[2]/p										Semua laporan mengenai aktifitas ticketing anda
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/p										All report about your ticketing activity
	Element Text Should Be				xpath=//div[@id='main-content']/div/div/h3									Anda dapat memilih tombol untuk melihat laporan, seperti Laporan Transaksi, Pendapatan, dan lain-lain.
	Element Should Not Contain			xpath=//div[@id='main-content']/div/div/h3									Here you can click the button(s) to view the reports, such as Statement of Account, Revenue, etc.
	Element Text Should Be				xpath=//div[@class='panel-body']/div/div/div/div/button/span[2]				LAPORAN TRANSAKSI
	Element Should Not Contain			xpath=//div[@class='panel-body']/div/div/div/div/button/span[2]				STATEMENT OF ACCOUNT
	Element Text Should Be				xpath=//div[@class='panel-body']/div/div/div[2]/div/button/span[2]			KEUNTUNGAN PENERBANGAN
	Element Should Not Contain			xpath=//div[@class='panel-body']/div/div/div[2]/div/button/span[2]			AIRLINE REVENUE
	Element Text Should Be				xpath=//div[@class='panel-body']/div/div/div[3]/div/button/span[2]			KEUNTUNGAN HOTEL
	Element Should Not Contain			xpath=//div[@class='panel-body']/div/div/div[3]/div/button/span[2]			HOTEL REVENUE
	Element Text Should Be				xpath=//div[@class='panel-body']/div/div/div[4]/div/button/span[2]			KEUNTUNGAN THEMEPARK
	Element Should Not Contain			xpath=//div[@class='panel-body']/div/div/div[4]/div/button/span[2]			THEMEPARK REVENUE
	Element Text Should Be				xpath=//div[@class='panel-body']/div[2]/div/div/div/button/span[2]			LAPORAN AUTO TICKET
	Element Should Not Contain			xpath=//div[@class='panel-body']/div[2]/div/div/div/button/span[2]			AUTO TICKET REPORT
	Element Text Should Be				xpath=//div[@class='panel-body']/div[2]/div/div[2]/div/button/span[2]		LAPORAN KARTU KREDIT
	Element Should Not Contain			xpath=//div[@class='panel-body']/div[2]/div/div[2]/div/button/span[2]		CREDIT CARD REPORT
	Element Text Should Be				xpath=//div[@class='panel-body']/div[2]/div/div[3]/div/button/span[2]		LAPORAN TOP UP
	Element Should Not Contain			xpath=//div[@class='panel-body']/div[2]/div/div[3]/div/button/span[2]		TOP UP REPORT
	Element Text Should Be				xpath=//div[@class='panel-body']/div[2]/div/div[3]/div/button/span[2]		MEMBER YANG TERDAFTAR
	Element Should Not Contain			xpath=//div[@class='panel-body']/div[2]/div/div[3]/div/button/span[2]		REGISTERED MEMBERS
#============================================================================================================================================================================				
Report en-US
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/h3										Laporan VAN
	Element Text Should Be				xpath=//div[@class='content']/div[2]/h3										VAN Report
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/p										Semua laporan mengenai aktifitas ticketing anda
	Element Text Should Be				xpath=//div[@class='content']/div[2]/p										All report about your ticketing activity
	Element Should Not Contain			xpath=//div[@id='main-content']/div/div/h3									Anda dapat memilih tombol untuk melihat laporan, seperti Laporan Transaksi, Pendapatan, dan lain-lain.
	Element Text Should Be				xpath=//div[@id='main-content']/div/div/h3									Here you can click the button(s) to view the reports, such as Statement of Account, Revenue, etc.
	Element Should Not Contain			xpath=//div[@class='panel-body']/div/div/div/div/button/span[2]				LAPORAN TRANSAKSI
	Element Text Should Be				xpath=//div[@class='panel-body']/div/div/div/div/button/span[2]				STATEMENT OF ACCOUNT
	Element Should Not Contain			xpath=//div[@class='panel-body']/div/div/div[2]/div/button/span[2]			KEUNTUNGAN PENERBANGAN
	Element Text Should Be				xpath=//div[@class='panel-body']/div/div/div[2]/div/button/span[2]			AIRLINE REVENUE
	Element Should Not Contain			xpath=//div[@class='panel-body']/div/div/div[3]/div/button/span[2]			KEUNTUNGAN HOTEL
	Element Text Should Be				xpath=//div[@class='panel-body']/div/div/div[3]/div/button/span[2]			HOTEL REVENUE
	Element Should Not Contain			xpath=//div[@class='panel-body']/div/div/div[4]/div/button/span[2]			KEUNTUNGAN THEMEPARK
	Element Text Should Be				xpath=//div[@class='panel-body']/div/div/div[4]/div/button/span[2]			THEMEPARK REVENUE
	Element Should Not Contain			xpath=//div[@class='panel-body']/div[2]/div/div/div/button/span[2]			LAPORAN AUTO TICKET
	Element Text Should Be				xpath=//div[@class='panel-body']/div[2]/div/div/div/button/span[2]			AUTO TICKET REPORT
	Element Should Not Contain			xpath=//div[@class='panel-body']/div[2]/div/div[2]/div/button/span[2]		LAPORAN KARTU KREDIT
	Element Text Should Be				xpath=//div[@class='panel-body']/div[2]/div/div[2]/div/button/span[2]		CREDIT CARD REPORT
	Element Should Not Contain			xpath=//div[@class='panel-body']/div[2]/div/div[3]/div/button/span[2]		LAPORAN TOP UP
	Element Text Should Be				xpath=//div[@class='panel-body']/div[2]/div/div[3]/div/button/span[2]		TOP UP REPORT
	Element Should Not Contain			xpath=//div[@class='panel-body']/div[2]/div/div[3]/div/button/span[2]		MEMBER YANG TERDAFTAR
	Element Text Should Be				xpath=//div[@class='panel-body']/div[2]/div/div[3]/div/button/span[2]		REGISTERED MEMBERS
#============================================================================================================================================================================	
Retrieve in-ID
	Element Text Should Be				xpath=//div[@class='content']/div[2]/ul/li/a								BERANDA
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/ul/li/a								HOME
	Element Text Should Be				xpath=//div[@class='content']/div[2]/ul/li[2]/a								DAFTAR PNR
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/ul/li[2]/a								PNR LIST
	Element Text Should Be				xpath=//div[@class='content']/div[2]/h3										Daftar PNR
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/h3										PNR List
	Element Should Contain				xpath=//div[@class='content']/div[2]										Daftar Semua PNR
	Element Should Not Contain			xpath=//div[@class='content']/div[2]										List All PNR
	Element Text Should Be				xpath=//form[@id='form-work']/div/div/label									PILIH DAFTAR
	Element Should Not Contain			xpath=//form[@id='form-work']/div/div/label									LIST BY
	Element Text Should Be				xpath=//form[@id='form-work']/div/div/div/div/div/span						Semua Maskapai
	Element Should Not Contain			xpath=//form[@id='form-work']/div/div/div/div/div/span						All Airline
	Element Text Should Be				xpath=//form[@id='form-work']/div/div[2]/div/div/label						TANGGAL PEMESANAN
	Element Should Not Contain			xpath=//form[@id='form-work']/div/div[2]/div/div/label						BOOKING DATE
	Element Text Should Be				xpath=//form[@id='form-work']/div/div[2]/label								DARI
	Element Should Not Contain			xpath=//form[@id='form-work']/div/div[2]/label								FROM
	Element Text Should Be				xpath=//form[@id='form-work']/div/div[2]/label[2]							SAMPAI
	Element Should Not Contain			xpath=//form[@id='form-work']/div/div[2]/label[2]							TO
	Element Text Should Be				xpath=//form[@id='form-work']/div/div[2]/div[4]/div/div/span				Semua
	Element Should Not Contain			xpath=//form[@id='form-work']/div/div[2]/div[4]/div/div/span				All
	Element Text Should Be				xpath=//form[@id='form-work']/div/div[3]/div/div/label						KODE PEMESANAN
	Element Should Not Contain			xpath=//form[@id='form-work']/div/div[3]/div/div/label						BOOKING CODE
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${bookingcode}= 					Get WebElement  															xpath=//input[@id='bookcodefield' and @name='bookingcode']
	${BOOKINGPLACEHOLDER}=			 	set variable																${bookingcode.get_attribute('placeholder')} 
    Should Be Equal  					${BOOKINGPLACEHOLDER}   													Kode Pemesanan
	Should Not Be Equal					${BOOKINGPLACEHOLDER}														Booking Code
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Element Text Should Be				xpath=//div[@class='content']/div[3]/div/div[2]/div/span					Catatan: Pemesanan/Pembatalan status PNR mengindikasikan bahwa PNR tidak terissued. Retrieve kembali untuk mendapatkan status terbaru.
	Element Should Not Contain			xpath=//div[@class='content']/div[3]/div/div[2]/div/span					Note: Book/Cancel PNR status indicates that PNR has not issued. Retrieve again to get current status.
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${count}=	Get Matching Xpath Count		xpath=//div[@class='content']/div[3]/div/div[3]/div/div/div/strong
	Run Keyword If						${count}==0							detail retrieve in-ID	
	...		ELSE IF						${count}==1							no detail retrieve in-ID
#============================================================================================================================================================================	
detail retrieve in-ID
	Element Text Should Be				xpath=//div[@class='content']/div[3]/div/div[3]/div/div/div/div[2]/span			Maskapai
	Element Should Not Contain			xpath=//div[@class='content']/div[3]/div/div[3]/div/div/div/div[2]/span			Airline
	Element Text Should Be				xpath=//div[@class='content']/div[3]/div/div[3]/div/div/div/div[3]/span			Nomor Tiket
	Element Should Not Contain			xpath=//div[@class='content']/div[3]/div/div[3]/div/div/div/div[3]/span			Ticket Number
	Element Text Should Be				xpath=//div[@class='content']/div[3]/div/div[3]/div/div/div/div[4]/span			Tanggal Pemesanan
	Element Should Not Contain			xpath=//div[@class='content']/div[3]/div/div[3]/div/div/div/div[4]/span			Booking Date
	Element Text Should Be				xpath=//div[@class='content']/div[3]/div/div[3]/div/div[2]/div/div/span			Nama
	Element Should Not Contain			xpath=//div[@class='content']/div[3]/div/div[3]/div/div[2]/div/div/span			Name		
	Element Text Should Be				xpath=//div[@class='content']/div[3]/div/div[3]/div/div[2]/div/div[2]/span		Rute
	Element Should Not Contain			xpath=//div[@class='content']/div[3]/div/div[3]/div/div[2]/div/div[2]/span		Route		
	Element Text Should Be				xpath=//div[@class='content']/div[3]/div/div[3]/div/div[2]/div/div[3]/span		Kode Pemesanan
	Element Should Not Contain			xpath=//div[@class='content']/div[3]/div/div[3]/div/div[2]/div/div[3]/span		Booking Code		
	Element Text Should Be				xpath=//div[@class='content']/div[3]/div/div[3]/div/div[2]/div/div[4]/span		Batas Waktu
	Element Should Not Contain			xpath=//div[@class='content']/div[3]/div/div[3]/div/div[2]/div/div[4]/span		Timelimit			
	Element Text Should Be				xpath=//div[@class='content']/div[3]/div/div[3]/div/div[3]/div/div[3]/span		Komisi
	Element Should Not Contain			xpath=//div[@class='content']/div[3]/div/div[3]/div/div[3]/div/div[3]/span		Commission			
	Element Text Should Be				xpath=//form[@action='retrievePNRaction']/button 								Buka
	Element Should Not Contain			xpath=//form[@action='retrievePNRaction']/button 								Open
#============================================================================================================================================================================	
no detail retrieve in-ID	
	Element Text Should Be				xpath=//div[@class='content']/div[3]/div/div[3]/div/div/div/strong 			Tidak Ada Data Yang Sesuai Dengan Kriteria Pencarian
	Element Should Not Contain			xpath=//div[@class='content']/div[3]/div/div[3]/div/div/div/strong 			No Retrieve Data Matching With Search Criteria 
#============================================================================================================================================================================
Retrieve en-US
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/ul/li/a								BERANDA
	Element Text Should Be				xpath=//div[@class='content']/div[2]/ul/li/a								HOME
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/ul/li[2]/a								DAFTAR PNR
	Element Text Should Be				xpath=//div[@class='content']/div[2]/ul/li[2]/a								PNR LIST
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/h3										Daftar PNR
	Element Text Should Be				xpath=//div[@class='content']/div[2]/h3										PNR List
	Element Should Not Contain			xpath=//div[@class='content']/div[2]										Daftar Semua PNR
	Element Should Contain				xpath=//div[@class='content']/div[2]										List All PNR
	Element Should Not Contain			xpath=//form[@id='form-work']/div/div/label									PILIH DAFTAR
	Element Text Should Be				xpath=//form[@id='form-work']/div/div/label									LIST BY
	Element Should Not Contain			xpath=//form[@id='form-work']/div/div/div/div/div/span						Semua Maskapai
	Element Text Should Be				xpath=//form[@id='form-work']/div/div/div/div/div/span						All Airline
	Element Should Not Contain			xpath=//form[@id='form-work']/div/div[2]/div/div/label						TANGGAL PEMESANAN
	Element Text Should Be				xpath=//form[@id='form-work']/div/div[2]/div/div/label						BOOKING DATE
	Element Should Not Contain			xpath=//form[@id='form-work']/div/div[2]/label								DARI
	Element Text Should Be				xpath=//form[@id='form-work']/div/div[2]/label								FROM
	Element Should Not Contain			xpath=//form[@id='form-work']/div/div[2]/label[2]							SAMPAI
	Element Text Should Be				xpath=//form[@id='form-work']/div/div[2]/label[2]							TO
	Element Should Not Contain			xpath=//form[@id='form-work']/div/div[2]/div[4]/div/div/span				Semua
	Element Text Should Be				xpath=//form[@id='form-work']/div/div[2]/div[4]/div/div/span				All
	Element Should Not Contain			xpath=//form[@id='form-work']/div/div[3]/div/div/label						KODE PEMESANAN
	Element Text Should Be				xpath=//form[@id='form-work']/div/div[3]/div/div/label						BOOKING CODE
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${bookingcode}= 					Get WebElement  															xpath=//input[@id='bookcodefield' and @name='bookingcode']
	${BOOKINGPLACEHOLDER}=			 	set variable																${bookingcode.get_attribute('placeholder')} 
    Should Not Be Equal					${BOOKINGPLACEHOLDER}   													Kode Pemesanan
	Should Be Equal						${BOOKINGPLACEHOLDER}														Booking Code
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Element Should Not Contain			xpath=//div[@class='content']/div[3]/div/div[2]/div/span					Catatan: Pemesanan/Pembatalan status PNR mengindikasikan bahwa PNR tidak terissued. Retrieve kembali untuk mendapatkan status terbaru.
	Element Text Should Be				xpath=//div[@class='content']/div[3]/div/div[2]/div/span					Note: Book/Cancel PNR status indicates that PNR has not issued. Retrieve again to get current status.
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${count}=	Get Matching Xpath Count		xpath=//div[@class='content']/div[3]/div/div[3]/div/div/div/strong
	Run Keyword If						${count}==0							detail retrieve en-US
	...		ELSE IF						${count}==1							no detail retrieve en-US
#============================================================================================================================================================================	
detail retrieve en-US
	Element Should Not Contain			xpath=//div[@class='content']/div[3]/div/div[3]/div/div/div/div[2]/span			Maskapai
	Element Text Should Be				xpath=//div[@class='content']/div[3]/div/div[3]/div/div/div/div[2]/span			Airline
	Element Should Not Contain			xpath=//div[@class='content']/div[3]/div/div[3]/div/div/div/div[3]/span			Nomor Tiket
	Element Text Should Be				xpath=//div[@class='content']/div[3]/div/div[3]/div/div/div/div[3]/span			Ticket Number
	Element Should Not Contain			xpath=//div[@class='content']/div[3]/div/div[3]/div/div/div/div[4]/span			Tanggal Pemesanan
	Element Text Should Be				xpath=//div[@class='content']/div[3]/div/div[3]/div/div/div/div[4]/span			Booking Date
	Element Should Not Contain			xpath=//div[@class='content']/div[3]/div/div[3]/div/div[2]/div/div/span			Nama
	Element Text Should Be				xpath=//div[@class='content']/div[3]/div/div[3]/div/div[2]/div/div/span			Name		
	Element Should Not Contain			xpath=//div[@class='content']/div[3]/div/div[3]/div/div[2]/div/div[2]/span		Rute
	Element Text Should Be				xpath=//div[@class='content']/div[3]/div/div[3]/div/div[2]/div/div[2]/span		Route		
	Element Should Not Contain			xpath=//div[@class='content']/div[3]/div/div[3]/div/div[2]/div/div[3]/span		Kode Pemesanan
	Element Text Should Be				xpath=//div[@class='content']/div[3]/div/div[3]/div/div[2]/div/div[3]/span		Booking Code		
	Element Should Not Contain			xpath=//div[@class='content']/div[3]/div/div[3]/div/div[2]/div/div[4]/span		Batas Waktu
	Element Text Should Be				xpath=//div[@class='content']/div[3]/div/div[3]/div/div[2]/div/div[4]/span		Timelimit			
	Element Should Not Contain			xpath=//div[@class='content']/div[3]/div/div[3]/div/div[3]/div/div[3]/span		Komisi
	Element Text Should Be				xpath=//div[@class='content']/div[3]/div/div[3]/div/div[3]/div/div[3]/span		Commission			
	Element Should Not Contain			xpath=//form[@action='retrievePNRaction']/button 								Buka
	Element Text Should Be				xpath=//form[@action='retrievePNRaction']/button 								Open
#============================================================================================================================================================================	
no detail retrieve en-US	
	Element Should Not Contain			xpath=//div[@class='content']/div[3]/div/div[3]/div/div/div/strong 				Tidak Ada Data Yang Sesuai Dengan Kriteria Pencarian
	Element Text Should Be				xpath=//div[@class='content']/div[3]/div/div[3]/div/div/div/strong 				No Retrieve Data Matching With Search Criteria 
#============================================================================================================================================================================
List berita in-ID
	Element Text Should Be				xpath=//div[@class='content']/div[2]/ul/li/a									BERANDA
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/ul/li/a									HOME
	Element Text Should Be				xpath=//div[@class='content']/div[2]/ul/li[2]/a									BERITA VAN
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/ul/li[2]/a									VAN NEWS
	Element Text Should Be				xpath=//div[@class='content']/div[2]/h3											Berita Van
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/h3											Van News
	Element Text Should Be				xpath=//div[@class='content']/div[2]/p											Arsip berita kami, berdasarkan berita terkini
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/p											Archive of our news, based on newest date	
	Element Text Should Be				xpath=//span[contains(@class,'label label-info font-montserrat fs-11')]			BERITA VAN
	Element Should Not Contain			xpath=//span[contains(@class,'label label-info font-montserrat fs-11')]			VAN NEWS		
	Element Text Should Be				xpath=//span[contains(@class,'label label-info font-montserrat fs-11')][2]		BERITA AGENT
	Element Should Not Contain			xpath=//span[contains(@class,'label label-info font-montserrat fs-11')][2]		AGENT NEWS			
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-6 col-md-6')]/a								Baca Selanjutnya
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-6 col-md-6')]/a								Read More			
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-3 col-md-3')]/div/div/div					KATEGORI
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-3 col-md-3')]/div/div/div					CATEGORIES		
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-3 col-md-3')]div/div[2]/ul/li/a				BERITA VAN
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-3 col-md-3')]div/div[2]/ul/li/a				VAN NEWS		
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-3 col-md-3')]div/div[2]/ul/li[2]/a			BERITA AGENT
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-3 col-md-3')]div/div[2]/ul/li[2]/a			AGENT NEWS
	Page Should Contain					Berita Lama
	Page Should Not Contain				Older
#============================================================================================================================================================================
List berita en-US
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/ul/li/a									BERANDA
	Element Text Should Be				xpath=//div[@class='content']/div[2]/ul/li/a									HOME
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/ul/li[2]/a									BERITA VAN
	Element Text Should Be				xpath=//div[@class='content']/div[2]/ul/li[2]/a									VAN NEWS
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/h3											Berita Van
	Element Text Should Be				xpath=//div[@class='content']/div[2]/h3											Van News
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/p											Arsip berita kami, berdasarkan berita terkini
	Element Text Should Be				xpath=//div[@class='content']/div[2]/p											Archive of our news, based on newest date	
	Element Should Not Contain			xpath=//span[contains(@class,'label label-info font-montserrat fs-11')]			BERITA VAN
	Element Text Should Be				xpath=//span[contains(@class,'label label-info font-montserrat fs-11')]			VAN NEWS		
	Element Should Not Contain			xpath=//span[contains(@class,'label label-info font-montserrat fs-11')][2]		BERITA AGENT
	Element Text Should Be				xpath=//span[contains(@class,'label label-info font-montserrat fs-11')][2]		AGENT NEWS			
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-6 col-md-6')]/a								Baca Selanjutnya
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-6 col-md-6')]/a								Read More			
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-3 col-md-3')]/div/div/div					KATEGORI
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-3 col-md-3')]/div/div/div					CATEGORIES		
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-3 col-md-3')]div/div[2]/ul/li/a				BERITA VAN
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-3 col-md-3')]div/div[2]/ul/li/a				VAN NEWS		
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-3 col-md-3')]div/div[2]/ul/li[2]/a			BERITA AGENT
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-3 col-md-3')]div/div[2]/ul/li[2]/a			AGENT NEWS
	Page Should Not Contain				Berita Lama
	Page Should Contain					Older
#============================================================================================================================================================================
Berita in-ID
	Element Text Should Be				xpath=//div[@class='content']/div[2]/ul/li/a									BERANDA
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/ul/li/a									HOME
	Element Text Should Be				xpath=//div[@class='content']/div[2]/ul/li[2]/a									BERITA VAN
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/ul/li[2]/a									VAN NEWS
	Element Text Should Be				xpath=//div[@class='content']/div[2]/h3											Berita Van
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/h3											Van News
	Element Text Should Be				xpath=//div[@class='content']/div[2]/p											Arsip berita kami, berdasarkan berita terkini
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/p											Archive of our news, based on newest date	
	Element Text Should Be				xpath=//span[contains(@class,'label label-info font-montserrat fs-11')]			BERITA VAN
	Element Should Not Contain			xpath=//span[contains(@class,'label label-info font-montserrat fs-11')]			VAN NEWS		
	Element Text Should Be				xpath=//span[contains(@class,'label label-info font-montserrat fs-11')][2]		BERITA AGENT
	Element Should Not Contain			xpath=//span[contains(@class,'label label-info font-montserrat fs-11')][2]		AGENT NEWS			
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-3 col-md-3')]/div/div/div					KATEGORI
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-3 col-md-3')]/div/div/div					CATEGORIES		
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-3 col-md-3')]div/div[2]/ul/li/a				BERITA VAN
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-3 col-md-3')]div/div[2]/ul/li/a				VAN NEWS		
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-3 col-md-3')]div/div[2]/ul/li[2]/a			BERITA AGENT
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-3 col-md-3')]div/div[2]/ul/li[2]/a			AGENT NEWS
	Element Text Should Be				xpath=//div[contains(@class,'row full-width center-margin')]/ul/li				Berita Terbaru
	Element Should Not Contain			xpath=//div[contains(@class,'row full-width center-margin')]/ul/li				Newer
	Element Text Should Be				xpath=//div[contains(@class,'row full-width center-margin')]/ul/li[2]			Indeks Berita Terbaru
	Element Should Not Contain			xpath=//div[contains(@class,'row full-width center-margin')]/ul/li[2]			Newest Index
	Element Text Should Be				xpath=//div[contains(@class,'row full-width center-margin')]/ul/li[3]			Berita Lama
	Element Should Not Contain			xpath=//div[contains(@class,'row full-width center-margin')]/ul/li[3]			Older
#============================================================================================================================================================================
Berita en-US
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/ul/li/a									BERANDA
	Element Text Should Be				xpath=//div[@class='content']/div[2]/ul/li/a									HOME
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/ul/li[2]/a									BERITA VAN
	Element Text Should Be				xpath=//div[@class='content']/div[2]/ul/li[2]/a									VAN NEWS
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/h3											Berita Van
	Element Text Should Be				xpath=//div[@class='content']/div[2]/h3											Van News
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/p											Arsip berita kami, berdasarkan berita terkini
	Element Text Should Be				xpath=//div[@class='content']/div[2]/p											Archive of our news, based on newest date	
	Element Should Not Contain			xpath=//span[contains(@class,'label label-info font-montserrat fs-11')]			BERITA VAN
	Element Text Should Be				xpath=//span[contains(@class,'label label-info font-montserrat fs-11')]			VAN NEWS		
	Element Should Not Contain			xpath=//span[contains(@class,'label label-info font-montserrat fs-11')][2]		BERITA AGENT
	Element Text Should Be				xpath=//span[contains(@class,'label label-info font-montserrat fs-11')][2]		AGENT NEWS			
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-3 col-md-3')]/div/div/div					KATEGORI
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-3 col-md-3')]/div/div/div					CATEGORIES		
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-3 col-md-3')]div/div[2]/ul/li/a				BERITA VAN
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-3 col-md-3')]div/div[2]/ul/li/a				VAN NEWS		
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-3 col-md-3')]div/div[2]/ul/li[2]/a			BERITA AGENT
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-3 col-md-3')]div/div[2]/ul/li[2]/a			AGENT NEWS
	Element Should Not Contain			xpath=//div[contains(@class,'row full-width center-margin')]/ul/li				Berita Terbaru
	Element Text Should Be				xpath=//div[contains(@class,'row full-width center-margin')]/ul/li				Newer
	Element Should Not Contain			xpath=//div[contains(@class,'row full-width center-margin')]/ul/li[2]			Indeks Berita Terbaru
	Element Text Should Be				xpath=//div[contains(@class,'row full-width center-margin')]/ul/li[2]			Newest Index
	Element Should Not Contain			xpath=//div[contains(@class,'row full-width center-margin')]/ul/li[3]			Berita Lama
	Element Text Should Be				xpath=//div[contains(@class,'row full-width center-margin')]/ul/li[3]			Older
#============================================================================================================================================================================
List tips in-ID
	Element Text Should Be				xpath=//div[@class='content']/div[2]/ul/li/a									BERANDA
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/ul/li/a									HOME
	Element Text Should Be				xpath=//div[@class='content']/div[2]/p											Serbi-serbi tips ala Chelsy yang tak ingin anda lewatkan!
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/p											Chelsy's powerfull tips that you don't want to miss!		
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-6 col-md-6')]/a								Baca Selanjutnya
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-6 col-md-6')]/a								Read More
	Page Should Contain					Berita Lama
	Page Should Not Contain				Older
#============================================================================================================================================================================
List tips en-US
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/ul/li/a									BERANDA
	Element Text Should Be				xpath=//div[@class='content']/div[2]/ul/li/a									HOME
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/p											Serbi-serbi tips ala Chelsy yang tak ingin anda lewatkan!
	Element Text Should Be				xpath=//div[@class='content']/div[2]/p											Chelsy's powerfull tips that you don't want to miss!		
	Element Should Not Contain			xpath=//div[contains(@class,'col-lg-6 col-md-6')]/a								Baca Selanjutnya
	Element Text Should Be				xpath=//div[contains(@class,'col-lg-6 col-md-6')]/a								Read More
	Page Should Not Contain				Berita Lama
	Page Should Contain					Older
#============================================================================================================================================================================
Tips in-ID
	Element Text Should Be				xpath=//div[@class='content']/div[2]/ul/li/a									BERANDA
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/ul/li/a									HOME
	Element Text Should Be				xpath=//div[@class='content']/div[2]/p											Serbi-serbi tips ala Chelsy yang tak ingin anda lewatkan!
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/p											Chelsy's powerfull tips that you don't want to miss!
	Element Text Should Be				xpath=//div[contains(@class,'row full-width center-margin')]/ul/li				Indeks Berita Terbaru
	Element Should Not Contain			xpath=//div[contains(@class,'row full-width center-margin')]/ul/li				Newest Index
	Element Text Should Be				xpath=//div[contains(@class,'row full-width center-margin')]/ul/li[2]			Berita Lama
	Element Should Not Contain			xpath=//div[contains(@class,'row full-width center-margin')]/ul/li[2]			Older
#============================================================================================================================================================================
Tips en-US
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/ul/li/a									BERANDA
	Element Text Should Be				xpath=//div[@class='content']/div[2]/ul/li/a									HOME
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/p											Serbi-serbi tips ala Chelsy yang tak ingin anda lewatkan!
	Element Text Should Be				xpath=//div[@class='content']/div[2]/p											Chelsy's powerfull tips that you don't want to miss!
	Element Should Not Contain			xpath=//div[contains(@class,'row full-width center-margin')]/ul/li				Indeks Berita Terbaru
	Element Text Should Be				xpath=//div[contains(@class,'row full-width center-margin')]/ul/li				Newest Index
	Element Should Not Contain			xpath=//div[contains(@class,'row full-width center-margin')]/ul/li[2]			Berita Lama
	Element Text Should Be				xpath=//div[contains(@class,'row full-width center-margin')]/ul/li[2]			Older
#============================================================================================================================================================================
Report default in-ID
	Element Text Should Be				xpath=//div[@class='content']/div[2]/ul/li/a									BERANDA
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/ul/li/a									HOME
	Element Text Should Be				xpath=//div[@class='content']/div[2]/ul/li[2]/a									LAPORAN
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/ul/li[2]/a									REPORT
	Page Should Not Contain				Mata uang dalam IDR
#============================================================================================================================================================================
Report default en-US
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/ul/li/a									BERANDA
	Element Text Should Be				xpath=//div[@class='content']/div[2]/ul/li/a									HOME
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/ul/li[2]/a									LAPORAN
	Element Text Should Be				xpath=//div[@class='content']/div[2]/ul/li[2]/a									REPORT
	Page Should Not Contain				Currency in IDR
#============================================================================================================================================================================
SOA in-ID
	Report default in-ID
	Element Text Should Be				xpath=//div[@class='content']/div[2]/ul/li[3]/a									LAPORAN TRANSAKSI
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/ul/li[3]/a									STATEMENT OF ACCOUNT
	Element Text Should Be				xpath=//div[@class='content']/div[2]/h3											Statement Of Account
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/h3											Laporan Transaksi
	Element Text Should Be				xpath=//div[@class='content']/div[2]/p											Pada halaman ini Anda dapat melihat riwayat transaksi yang pernah dilakukan 
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/p											Here you can view account history 		
	Element Text Should Be				xpath=//div[@class='form-group']/label											DARI
	Element Should Not Contain			xpath=//div[@class='form-group']/label											FROM		
	Element Text Should Be				xpath=//div[@class='form-group']/label[2]										TO
	Element Should Not Contain			xpath=//div[@class='form-group']/label[2]										SAMPAI	
	Element Text Should Be				xpath=//div[@class='form-group']/label[3]										MATA UANG
	Element Should Not Contain			xpath=//div[@class='form-group']/label[3]										CURRENCY	
	Element Text Should Be				xpath=//button[contains(@class,'btn btn-primary pull-right btn-block')]			Cari
	Element Should Not Contain			xpath=//button[contains(@class,'btn btn-primary pull-right btn-block')]			Search	
	Element Text Should Be				xpath=//button[contains(@class,'btn btn-primary btn-cons') and @id='modalSlideUp1']			Export
	Element Should Not Contain			xpath=//button[contains(@class,'btn btn-primary btn-cons') and @id='modalSlideUp1']			Ekspor	
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th								TANGGAL (GMT+0700)
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th								DATE (GMT+0700)	
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[2]								ID PENGGUNA
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[2]								USER ID	
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[3]								TIPE
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[3]								TYPE	
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[5]								REFERENSI
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[5]								REFERENCE
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[7]								KREDIT
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[7]								CREDIT	
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[8]								SALDO
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[8]								BALANCE
#============================================================================================================================================================================		
SOA en-US
	Report default en-US
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/ul/li[3]/a									LAPORAN TRANSAKSI
	Element Text Should Be				xpath=//div[@class='content']/div[2]/ul/li[3]/a									STATEMENT OF ACCOUNT
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/h3											Statement Of Account
	Element Text Should Be				xpath=//div[@class='content']/div[2]/h3											Laporan Transaksi
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/p											Pada halaman ini Anda dapat melihat riwayat transaksi yang pernah dilakukan 
	Element Text Should Be				xpath=//div[@class='content']/div[2]/p											Here you can view account history 		
	Element Should Not Contain			xpath=//div[@class='form-group']/label											DARI
	Element Text Should Be				xpath=//div[@class='form-group']/label											FROM		
	Element Should Not Contain			xpath=//div[@class='form-group']/label[2]										TO
	Element Text Should Be				xpath=//div[@class='form-group']/label[2]										SAMPAI	
	Element Should Not Contain			xpath=//div[@class='form-group']/label[3]										MATA UANG
	Element Text Should Be				xpath=//div[@class='form-group']/label[3]										CURRENCY	
	Element Should Not Contain			xpath=//button[contains(@class,'btn btn-primary pull-right btn-block')]			Cari
	Element Text Should Be				xpath=//button[contains(@class,'btn btn-primary pull-right btn-block')]			Search	
	Element Should Not Contain			xpath=//button[contains(@class,'btn btn-primary btn-cons') and @id='modalSlideUp1']			Export
	Element Text Should Be				xpath=//button[contains(@class,'btn btn-primary btn-cons') and @id='modalSlideUp1']			Ekspor	
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th								TANGGAL (GMT+0700)
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th								DATE (GMT+0700)	
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[2]								ID PENGGUNA
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[2]								USER ID	
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[3]								TIPE
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[3]								TYPE	
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[5]								REFERENSI
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[5]								REFERENCE
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[7]								KREDIT
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[7]								CREDIT	
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[8]								SALDO
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[8]								BALANCE	
#============================================================================================================================================================================	
AR in-ID
	Report default in-ID
	Element Text Should Be				xpath=//div[@class='content']/div[2]/ul/li[3]/a									KEUNTUNGAN PENERBANGAN
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/ul/li[3]/a									AIRLINE REVENUE
	Element Text Should Be				xpath=//div[@class='content']/div[2]/h3											Keuntungan Penerbangan
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/h3											Airline Revenue
	Element Text Should Be				xpath=//div[@class='content']/div[2]/p											Pada halaman ini Anda dapat melihat riwayat transaksi yang pernah dilakukan 
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/p											Here you can view account revenue history		
	Element Text Should Be				xpath=//div[@class='form-group']/label											DARI
	Element Should Not Contain			xpath=//div[@class='form-group']/label											FROM		
	Element Text Should Be				xpath=//div[@class='form-group']/label[2]										TO
	Element Should Not Contain			xpath=//div[@class='form-group']/label[2]										SAMPAI	
	Element Text Should Be				xpath=//div[@class='form-group']/label[3]										MATA UANG
	Element Should Not Contain			xpath=//div[@class='form-group']/label[3]										CURRENCY	
	Element Text Should Be				xpath=//button[contains(@class,'btn btn-primary pull-right btn-block')]			Cari
	Element Should Not Contain			xpath=//button[contains(@class,'btn btn-primary pull-right btn-block')]			Search	
	Element Text Should Be				xpath=//button[contains(@class,'btn btn-primary btn-cons') and @id='modalSlideUp1']			Export
	Element Should Not Contain			xpath=//button[contains(@class,'btn btn-primary btn-cons') and @id='modalSlideUp1']			Ekspor	
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th								MASKAPAI
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th								AIRLINE	
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[2]								BOOKING CODE
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[2]								KODE PEMESANAN
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[3]								TANGGAL ISSUE
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[3]								ISSUED DATE
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[4]								KOMISI FARE
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[4]								FARE COMMISSION
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[5]								KOMISI ASURANSI
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[5]								INSURANCE COMMISSION
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[6]								UPAH LAYANAN
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[6]								SERVICE FEE
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[7]								PENDAPATAN TOTAL
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[7]								TOTAL REVENUE
#============================================================================================================================================================================	
AR en-US
	Report default en-US
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/ul/li[3]/a									KEUNTUNGAN PENERBANGAN
	Element Text Should Be				xpath=//div[@class='content']/div[2]/ul/li[3]/a									AIRLINE REVENUE
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/h3											Keuntungan Penerbangan
	Element Text Should Be				xpath=//div[@class='content']/div[2]/h3											Airline Revenue
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/p											Pada halaman ini Anda dapat melihat riwayat transaksi yang pernah dilakukan 
	Element Text Should Be				xpath=//div[@class='content']/div[2]/p											Here you can view account history 		
	Element Should Not Contain			xpath=//div[@class='form-group']/label											DARI
	Element Text Should Be				xpath=//div[@class='form-group']/label											FROM		
	Element Should Not Contain			xpath=//div[@class='form-group']/label[2]										TO
	Element Text Should Be				xpath=//div[@class='form-group']/label[2]										SAMPAI	
	Element Should Not Contain			xpath=//div[@class='form-group']/label[3]										MATA UANG
	Element Text Should Be				xpath=//div[@class='form-group']/label[3]										CURRENCY	
	Element Should Not Contain			xpath=//button[contains(@class,'btn btn-primary pull-right btn-block')]			Cari
	Element Text Should Be				xpath=//button[contains(@class,'btn btn-primary pull-right btn-block')]			Search	
	Element Should Not Contain			xpath=//button[contains(@class,'btn btn-primary btn-cons') and @id='modalSlideUp1']			Export
	Element Text Should Be				xpath=//button[contains(@class,'btn btn-primary btn-cons') and @id='modalSlideUp1']			Ekspor	
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th								MASKAPAI
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th								AIRLINE	
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[2]								BOOKING CODE
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[2]								KODE PEMESANAN
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[3]								TANGGAL ISSUE
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[3]								ISSUED DATE
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[4]								KOMISI FARE
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[4]								FARE COMMISSION
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[5]								KOMISI ASURANSI
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[5]								INSURANCE COMMISSION
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[6]								UPAH LAYANAN
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[6]								SERVICE FEE
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[7]								PENDAPATAN TOTAL
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[7]								TOTAL REVENUE
#============================================================================================================================================================================	
HR in-ID
	Report default in-ID
	Element Text Should Be				xpath=//div[@class='content']/div[2]/ul/li[3]/a									KEUNTUNGAN HOTEL
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/ul/li[3]/a									HOTEL REVENUE
	Element Text Should Be				xpath=//div[@class='content']/div[2]/h3											Keuntungan Hotel
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/h3											Hotel Revenue
	Element Text Should Be				xpath=//div[@class='content']/div[2]/p											Pada halaman ini Anda dapat melihat riwayat transaksi yang pernah dilakukan 
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/p											Here you can view account revenue history		
	Element Text Should Be				xpath=//div[@class='form-group']/label											DARI
	Element Should Not Contain			xpath=//div[@class='form-group']/label											FROM		
	Element Text Should Be				xpath=//div[@class='form-group']/label[2]										TO
	Element Should Not Contain			xpath=//div[@class='form-group']/label[2]										SAMPAI	
	Element Text Should Be				xpath=//div[@class='form-group']/label[3]										MATA UANG
	Element Should Not Contain			xpath=//div[@class='form-group']/label[3]										CURRENCY	
	Element Text Should Be				xpath=//button[contains(@class,'btn btn-primary pull-right btn-block')]			Cari
	Element Should Not Contain			xpath=//button[contains(@class,'btn btn-primary pull-right btn-block')]			Search	
	Element Text Should Be				xpath=//button[contains(@class,'btn btn-primary btn-cons') and @id='modalSlideUp1']			Export
	Element Should Not Contain			xpath=//button[contains(@class,'btn btn-primary btn-cons') and @id='modalSlideUp1']			Ekspor	
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th								TANGGAL (GMT+0700)
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th								DATE (GMT+0700)	
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[2]								ID PENGGUNA
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[2]								USER ID	
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[3]								TIPE
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[3]								TYPE	
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[5]								REFERENSI
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[5]								REFERENCE
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[7]								KREDIT
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[7]								CREDIT	
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[8]								SALDO
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[8]								BALANCE
#============================================================================================================================================================================	
HR en-US
	Report default en-US
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/ul/li[3]/a									KEUNTUNGAN HOTEL
	Element Text Should Be				xpath=//div[@class='content']/div[2]/ul/li[3]/a									HOTEL REVENUE
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/h3											Keuntungan Hotel
	Element Text Should Be				xpath=//div[@class='content']/div[2]/h3											Hotel Revenue
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/p											Pada halaman ini Anda dapat melihat riwayat transaksi yang pernah dilakukan 
	Element Text Should Be				xpath=//div[@class='content']/div[2]/p											Here you can view account history 		
	Element Should Not Contain			xpath=//div[@class='form-group']/label											DARI
	Element Text Should Be				xpath=//div[@class='form-group']/label											FROM		
	Element Should Not Contain			xpath=//div[@class='form-group']/label[2]										TO
	Element Text Should Be				xpath=//div[@class='form-group']/label[2]										SAMPAI	
	Element Should Not Contain			xpath=//div[@class='form-group']/label[3]										MATA UANG
	Element Text Should Be				xpath=//div[@class='form-group']/label[3]										CURRENCY	
	Element Should Not Contain			xpath=//button[contains(@class,'btn btn-primary pull-right btn-block')]			Cari
	Element Text Should Be				xpath=//button[contains(@class,'btn btn-primary pull-right btn-block')]			Search	
	Element Should Not Contain			xpath=//button[contains(@class,'btn btn-primary btn-cons') and @id='modalSlideUp1']			Export
	Element Text Should Be				xpath=//button[contains(@class,'btn btn-primary btn-cons') and @id='modalSlideUp1']			Ekspor	
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th								TANGGAL (GMT+0700)
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th								DATE (GMT+0700)	
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[2]								ID PENGGUNA
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[2]								USER ID	
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[3]								TIPE
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[3]								TYPE	
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[5]								REFERENSI
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[5]								REFERENCE
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[7]								KREDIT
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[7]								CREDIT	
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[8]								SALDO
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[8]								BALANCE	
#============================================================================================================================================================================	
ATT in-ID
	Report default in-ID
	Element Text Should Be				xpath=//div[@class='content']/div[2]/ul/li[3]/a									KEUNTUNGAN THEMEPARK
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/ul/li[3]/a									THEMEPARK REVENUE
	Element Text Should Be				xpath=//div[@class='content']/div[2]/h3											Keuntungan Themepark
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/h3											Themepark Revenue
	Element Text Should Be				xpath=//div[@class='content']/div[2]/p											Pada halaman ini Anda dapat melihat riwayat transaksi yang pernah dilakukan
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/p											Here you can view account revenue history		
	Element Text Should Be				xpath=//div[@class='form-group']/label											DARI
	Element Should Not Contain			xpath=//div[@class='form-group']/label											FROM		
	Element Text Should Be				xpath=//div[@class='form-group']/label[2]										TO
	Element Should Not Contain			xpath=//div[@class='form-group']/label[2]										SAMPAI	
	Element Text Should Be				xpath=//div[@class='form-group']/label[3]										MATA UANG
	Element Should Not Contain			xpath=//div[@class='form-group']/label[3]										CURRENCY	
	Element Text Should Be				xpath=//button[contains(@class,'btn btn-primary pull-right btn-block')]			Cari
	Element Should Not Contain			xpath=//button[contains(@class,'btn btn-primary pull-right btn-block')]			Search	
	Element Text Should Be				xpath=//button[contains(@class,'btn btn-primary btn-cons') and @id='modalSlideUp1']			Export
	Element Should Not Contain			xpath=//button[contains(@class,'btn btn-primary btn-cons') and @id='modalSlideUp1']			Ekspor	
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th								THEME PARK
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th								THEME PARK	
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[2]								KOMISI
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[2]								COMMISSION
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[3]								TANGGAL ISSUED
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[3]								ISSUED DATE
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[5]								NOMOR PEMESANAN
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[5]								ORDER NUMBER
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[7]								UPAH LAYANAN
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[7]								SERVICE FEE	
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[8]								TOTAL TRANSAKSI
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[8]								TOTAL REVENUE
#============================================================================================================================================================================	
ATT en-US
	Report default en-US
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/ul/li[3]/a									KEUNTUNGAN THEMEPARK
	Element Text Should Be				xpath=//div[@class='content']/div[2]/ul/li[3]/a									THEMEPARK REVENUE
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/h3											Keuntungan Themepark
	Element Text Should Be				xpath=//div[@class='content']/div[2]/h3											Themepark Revenue
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/p											Pada halaman ini Anda dapat melihat riwayat transaksi yang pernah dilakukan
	Element Text Should Be				xpath=//div[@class='content']/div[2]/p											Here you can view account revenue history		
	Element Should Not Contain			xpath=//div[@class='form-group']/label											DARI
	Element Text Should Be				xpath=//div[@class='form-group']/label											FROM		
	Element Should Not Contain			xpath=//div[@class='form-group']/label[2]										TO
	Element Text Should Be				xpath=//div[@class='form-group']/label[2]										SAMPAI	
	Element Should Not Contain			xpath=//div[@class='form-group']/label[3]										MATA UANG
	Element Text Should Be				xpath=//div[@class='form-group']/label[3]										CURRENCY	
	Element Should Not Contain			xpath=//button[contains(@class,'btn btn-primary pull-right btn-block')]			Cari
	Element Text Should Be				xpath=//button[contains(@class,'btn btn-primary pull-right btn-block')]			Search	
	Element Should Not Contain			xpath=//button[contains(@class,'btn btn-primary btn-cons') and @id='modalSlideUp1']			Export
	Element Text Should Be				xpath=//button[contains(@class,'btn btn-primary btn-cons') and @id='modalSlideUp1']			Ekspor	
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th								THEME PARK
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th								THEME PARK	
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[2]								KOMISI
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[2]								COMMISSION
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[3]								TANGGAL ISSUED
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[3]								ISSUED DATE
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[5]								NOMOR PEMESANAN
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[5]								ORDER NUMBER
	eElement Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[7]								UPAH LAYANAN
	Element Text Should B				xpath=//table[@id='tableWithSearch']/thead/tr/th[7]								SERVICE FEE	
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[8]								TOTAL TRANSAKSI
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[8]								TOTAL REVENUE
#============================================================================================================================================================================	
AUT in-ID
	Report default in-ID
	Element Text Should Be				xpath=//div[@class='content']/div[2]/ul/li[3]/a									KEUNTUNGAN THEMEPARK
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/ul/li[3]/a									THEMEPARK REVENUE
	Element Text Should Be				xpath=//div[@class='content']/div[2]/h3											Keuntungan Themepark
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/h3											Themepark Revenue
	Element Text Should Be				xpath=//div[@class='content']/div[2]/p											Pada halaman ini Anda dapat melihat riwayat transaksi yang pernah dilakukan
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/p											Here you can view account revenue history			
	Element Text Should Be				xpath=//form[@id='form-work']/div/div/div/div/div/span							Kode Pemesanan
	Element Should Not Contain			xpath=//form[@id='form-work']/div/div/div/div/div/span							Booking Code
	Element Text Should Be				xpath=//form[@id='form-work']/div/div/div[5]/div/div/span						SEMUA
	Element Should Not Contain			xpath=//form[@id='form-work']/div/div/div[5]/div/div/span						ALL		
	Element Text Should Be				xpath=//button[contains(@class,'btn btn-primary pull-right btn-block')]			Cari
	Element Should Not Contain			xpath=//button[contains(@class,'btn btn-primary pull-right btn-block')]			Search	
	Element Text Should Be				xpath=//button[contains(@class,'btn btn-primary btn-cons') and @id='modalSlideUp1']			Export
	Element Should Not Contain			xpath=//button[contains(@class,'btn btn-primary btn-cons') and @id='modalSlideUp1']			Ekspor	
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th								TANGGAL DIBUAT
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th								CREATED DATE	
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[2]								TANGGAL BOOKING
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[2]								BOOKING DATE
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[3]								KODE PEMBAYARAN
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[3]								PAYMENT CODE
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[4]								KODE PEMESANAN
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[4]								BOOKING CODE
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[5]								JUMLAH PEMBAYARAN
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[5]								TOTAL AMOUNT
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[6]								BATAS WAKTU PEMBAYARAN
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[6]								PAYMENT TIME LIMIT
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[7]								STATUS PEMBAYARAN
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[7]								PAYMENT STATUS
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[8]								STATUS PNR
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[8]								PNR STATUS
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[9]								DIBUAT OLEH
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[9]								CREATED BY
#============================================================================================================================================================================	
AUT en-US
	Report default en-US
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/ul/li[3]/a									KEUNTUNGAN THEMEPARK
	Element Text Should Be				xpath=//div[@class='content']/div[2]/ul/li[3]/a									THEMEPARK REVENUE
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/h3											Keuntungan Themepark
	Element Text Should Be				xpath=//div[@class='content']/div[2]/h3											Themepark Revenue
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/p											Pada halaman ini Anda dapat melihat riwayat transaksi yang pernah dilakukan
	Element Text Should Be				xpath=//div[@class='content']/div[2]/p											Here you can view account revenue history			
	Element Should Not Contain			xpath=//form[@id='form-work']/div/div/div/div/div/span							Kode Pemesanan
	Element Text Should Be				xpath=//form[@id='form-work']/div/div/div/div/div/span							Booking Code
	Element Should Not Contain			xpath=//form[@id='form-work']/div/div/div[5]/div/div/span						SEMUA
	Element Text Should Be				xpath=//form[@id='form-work']/div/div/div[5]/div/div/span						ALL		
	Element Should Not Contain			xpath=//button[contains(@class,'btn btn-primary pull-right btn-block')]			Cari
	Element Text Should Be				xpath=//button[contains(@class,'btn btn-primary pull-right btn-block')]			Search	
	Element Should Not Contain			xpath=//button[contains(@class,'btn btn-primary btn-cons') and @id='modalSlideUp1']			Export
	Element Text Should Be				xpath=//button[contains(@class,'btn btn-primary btn-cons') and @id='modalSlideUp1']			Ekspor	
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th								TANGGAL DIBUAT
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th								CREATED DATE	
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[2]								TANGGAL BOOKING
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[2]								BOOKING DATE
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[3]								KODE PEMBAYARAN
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[3]								PAYMENT CODE
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[4]								KODE PEMESANAN
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[4]								BOOKING CODE
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[5]								JUMLAH PEMBAYARAN
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[5]								TOTAL AMOUNT
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[6]								BATAS WAKTU PEMBAYARAN
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[6]								PAYMENT TIME LIMIT
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[7]								STATUS PEMBAYARAN
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[7]								PAYMENT STATUS
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[8]								STATUS PNR
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[8]								PNR STATUS
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[9]								DIBUAT OLEH
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[9]								CREATED BY
#============================================================================================================================================================================	
CC in-ID
	Report default in-ID
	Element Text Should Be				xpath=//div[@class='content']/div[2]/ul/li[3]/a									LAPORAN KARTU KREDIT
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/ul/li[3]/a									CREDIT CARD REPORT
	Element Text Should Be				xpath=//div[@class='content']/div[2]/h3											Laporan Kartu Kredit
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/h3											Report Credit Card
	Element Text Should Be				xpath=//div[@class='content']/div[2]/p											Pada halaman ini Anda dapat melihat riwayat transaksi yang pernah dilakukan
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/p											Here you can view Credit Card history 	
	Element Text Should Be				xpath=//div[@class='form-group']/label											DARI
	Element Should Not Contain			xpath=//div[@class='form-group']/label											FROM		
	Element Text Should Be				xpath=//div[@class='form-group']/label[2]										TO
	Element Should Not Contain			xpath=//div[@class='form-group']/label[2]										SAMPAI	
	Element Text Should Be				xpath=//div[@class='form-group']/label[3]										MATA UANG
	Element Should Not Contain			xpath=//div[@class='form-group']/label[3]										CURRENCY	
	Element Text Should Be				xpath=//button[contains(@class,'btn btn-primary pull-right btn-block')]			Cari
	Element Should Not Contain			xpath=//button[contains(@class,'btn btn-primary pull-right btn-block')]			Search	
	Element Text Should Be				xpath=//button[contains(@class,'btn btn-primary btn-cons') and @id='modalSlideUp1']			Export
	Element Should Not Contain			xpath=//button[contains(@class,'btn btn-primary btn-cons') and @id='modalSlideUp1']			Ekspor	
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th								KODE PEMESANAN
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th								BOOKING CODE
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[2]								NTSA
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[2]								NTSA
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[3]								UPAH LAYANAN
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[3]								ADMIN FEE
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[4]								TANGGAL PEMBAYARAN
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[4]								PAYMENT DATE
#============================================================================================================================================================================	
CC en-US
	Report default en-US
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/ul/li[3]/a									LAPORAN KARTU KREDIT
	Element Text Should Be				xpath=//div[@class='content']/div[2]/ul/li[3]/a									CREDIT CARD REPORT
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/h3											Laporan Kartu Kredit
	Element Text Should Be				xpath=//div[@class='content']/div[2]/h3											Report Credit Card
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/p											Pada halaman ini Anda dapat melihat riwayat transaksi yang pernah dilakukan
	Element Text Should Be				xpath=//div[@class='content']/div[2]/p											Here you can view Credit Card history 	
	Element Should Not Contain			xpath=//div[@class='form-group']/label											DARI
	Element Text Should Be				xpath=//div[@class='form-group']/label											FROM		
	Element Should Not Contain			xpath=//div[@class='form-group']/label[2]										TO
	Element Text Should Be				xpath=//div[@class='form-group']/label[2]										SAMPAI	
	Element Should Not Contain			xpath=//div[@class='form-group']/label[3]										MATA UANG
	Element Text Should Be				xpath=//div[@class='form-group']/label[3]										CURRENCY	
	Element Should Not Contain			xpath=//button[contains(@class,'btn btn-primary pull-right btn-block')]			Cari
	Element Text Should Be				xpath=//button[contains(@class,'btn btn-primary pull-right btn-block')]			Search	
	Element Should Not Contain			xpath=//button[contains(@class,'btn btn-primary btn-cons') and @id='modalSlideUp1']			Export
	Element Text Should Be				xpath=//button[contains(@class,'btn btn-primary btn-cons') and @id='modalSlideUp1']			Ekspor	
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th								KODE PEMESANAN
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th								BOOKING CODE
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[2]								NTSA
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[2]								NTSA
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[3]								UPAH LAYANAN
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[3]								ADMIN FEE
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[4]								TANGGAL PEMBAYARAN
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[4]								PAYMENT DATE
#============================================================================================================================================================================	
TU in-ID
	Report default in-ID
	Element Text Should Be				xpath=//div[@class='content']/div[2]/ul/li[3]/a									LAPORAN TOP UP
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/ul/li[3]/a									TOP UP REPORT
	Element Text Should Be				xpath=//div[@class='content']/div[2]/h3											Laporan Top Up
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/h3											Top Up Report
	Element Text Should Be				xpath=//div[@class='content']/div[2]/p											Pada halaman ini Anda dapat melihat riwayat transaksi yang pernah dilakukan
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/p											Here you can view Top Up history 
	Element Text Should Be				xpath=//div[@class='form-group']/label											DARI
	Element Should Not Contain			xpath=//div[@class='form-group']/label											FROM		
	Element Text Should Be				xpath=//div[@class='form-group']/label[2]										TO
	Element Should Not Contain			xpath=//div[@class='form-group']/label[2]										SAMPAI	
	Element Text Should Be				xpath=//div[@class='form-group']/label[3]										MATA UANG
	Element Should Not Contain			xpath=//div[@class='form-group']/label[3]										CURRENCY	
	Element Text Should Be				xpath=//button[contains(@class,'btn btn-primary pull-right btn-block')]			Cari
	Element Should Not Contain			xpath=//button[contains(@class,'btn btn-primary pull-right btn-block')]			Search	
	Element Text Should Be				xpath=//button[contains(@class,'btn btn-primary btn-cons') and @id='modalSlideUp1']			Export
	Element Should Not Contain			xpath=//button[contains(@class,'btn btn-primary btn-cons') and @id='modalSlideUp1']			Ekspor	
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th								NOMOR VIRTUAL
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th								VA NUMBER
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[2]								TANGGAL DIBUAT
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[2]								CREATED DATE
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[3]								TANGGAL PEMBAYARAN
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[3]								PAYMENT DATE
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[4]								TANGGAL PROSES
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[4]								PROCESSED DATE
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[5]								JUMLAH
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[5]								AMOUNT
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[6]								UPAH LAYANAN
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[6]								ADMIN FEE
#============================================================================================================================================================================	
TU en-US
	Report default en-US
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/ul/li[3]/a									LAPORAN TOP UP
	Element Text Should Be				xpath=//div[@class='content']/div[2]/ul/li[3]/a									TOP UP REPORT
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/h3											Laporan Top Up
	Element Text Should Be				xpath=//div[@class='content']/div[2]/h3											Top Up Report
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/p											Pada halaman ini Anda dapat melihat riwayat transaksi yang pernah dilakukan
	Element Text Should Be				xpath=//div[@class='content']/div[2]/p											Here you can view Top Up history 
	Element Should Not Contain			xpath=//div[@class='form-group']/label											DARI
	Element Text Should Be				xpath=//div[@class='form-group']/label											FROM		
	Element Should Not Contain			xpath=//div[@class='form-group']/label[2]										TO
	Element Text Should Be				xpath=//div[@class='form-group']/label[2]										SAMPAI	
	Element Should Not Contain			xpath=//div[@class='form-group']/label[3]										MATA UANG
	Element Text Should Be				xpath=//div[@class='form-group']/label[3]										CURRENCY	
	Element Should Not Contain			xpath=//button[contains(@class,'btn btn-primary pull-right btn-block')]			Cari
	Element Text Should Be				xpath=//button[contains(@class,'btn btn-primary pull-right btn-block')]			Search	
	Element Should Not Contain			xpath=//button[contains(@class,'btn btn-primary btn-cons') and @id='modalSlideUp1']			Export
	Element Text Should Be				xpath=//button[contains(@class,'btn btn-primary btn-cons') and @id='modalSlideUp1']			Ekspor	
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th								NOMOR VIRTUAL
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th								VA NUMBER
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[2]								TANGGAL DIBUAT
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[2]								CREATED DATE
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[3]								TANGGAL PEMBAYARAN
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[3]								PAYMENT DATE
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[4]								TANGGAL PROSES
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[4]								PROCESSED DATE
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[5]								JUMLAH
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[5]								AMOUNT
	Element Should Not Contain			xpath=//table[@id='tableWithSearch']/thead/tr/th[6]								UPAH LAYANAN
	Element Text Should Be				xpath=//table[@id='tableWithSearch']/thead/tr/th[6]								ADMIN FEE
#============================================================================================================================================================================	
RM in-ID
	Report default in-ID
	Element Text Should Be				xpath=//div[@class='content']/div[2]/ul/li[3]/a										MEMBER TERDAFTAR
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/ul/li[3]/a										REGISTERED MEMBERS
	Element Text Should Be				xpath=//div[@class='content']/div[2]/h3												Member Terdaftar
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/h3												Registere Members
	Element Text Should Be				xpath=//div[@class='content']/div[2]/p												Pada halaman ini Anda dapat melihat riwayat transaksi yang pernah dilakukan
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/p												Here you can view all members registered by you 
	Element Text Should Be				xpath=//div[@class='form-group']/label												DARI
	Element Should Not Contain			xpath=//div[@class='form-group']/label												FROM		
	Element Text Should Be				xpath=//div[@class='form-group']/label[2]											TO
	Element Should Not Contain			xpath=//div[@class='form-group']/label[2]											SAMPAI		
	Element Text Should Be				xpath=//button[contains(@class,'btn btn-primary pull-right btn-block')]				Cari
	Element Should Not Contain			xpath=//button[contains(@class,'btn btn-primary pull-right btn-block')]				Search	
	Element Text Should Be				xpath=//button[contains(@class,'btn btn-primary btn-cons') and @id='modalSlideUp1']			Export
	Element Should Not Contain			xpath=//button[contains(@class,'btn btn-primary btn-cons') and @id='modalSlideUp1']			Ekspor	
	Element Text Should Be				xpath=//table[@id='tableWithExportOptions']/thead/tr/th								TANGGAL
	Element Should Not Contain			xpath=//table[@id='tableWithExportOptions']/thead/tr/th								DATE
	Element Text Should Be				xpath=//table[@id='tableWithExportOptions']/thead/tr/th[2]							NAMA
	Element Should Not Contain			xpath=//table[@id='tableWithExportOptions']/thead/tr/th[2]							NAME
	Element Text Should Be				xpath=//table[@id='tableWithExportOptions']/thead/tr/th[3]							AGEN
	Element Should Not Contain			xpath=//table[@id='tableWithExportOptions']/thead/tr/th[3]							AGENT
	Element Text Should Be				xpath=//table[@id='tableWithExportOptions']/thead/tr/th[4]							PHONE
	Element Should Not Contain			xpath=//table[@id='tableWithExportOptions']/thead/tr/th[4]							TELEPON
	Element Text Should Be				xpath=//table[@id='tableWithExportOptions']/thead/tr/th[6]							MOBILE
	Element Should Not Contain			xpath=//table[@id='tableWithExportOptions']/thead/tr/th[6]							HANDPHONE
	Element Text Should Be				xpath=//table[@id='tableWithExportOptions']/thead/tr/th[8]							PAKET
	Element Should Not Contain			xpath=//table[@id='tableWithExportOptions']/thead/tr/th[8]							PACKAGE
	Element Text Should Be				xpath=//table[@id='tableWithExportOptions']/thead/tr/th[9]							NOMOR VIRTUAL
	Element Should Not Contain			xpath=//table[@id='tableWithExportOptions']/thead/tr/th[9]							VA NUMBER
	Element Text Should Be				xpath=//table[@id='tableWithExportOptions']/thead/tr/th[10]							JUMLAH
	Element Should Not Contain			xpath=//table[@id='tableWithExportOptions']/thead/tr/th[10]							AMOUNT
#============================================================================================================================================================================	
RM en-US
	Report default en-US
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/ul/li[3]/a										MEMBER TERDAFTAR
	Element Text Should Be				xpath=//div[@class='content']/div[2]/ul/li[3]/a										REGISTERED MEMBERS
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/h3												Member Terdaftar
	Element Text Should Be				xpath=//div[@class='content']/div[2]/h3												Registere Members
	Element Should Not Contain			xpath=//div[@class='content']/div[2]/p												Pada halaman ini Anda dapat melihat riwayat transaksi yang pernah dilakukan
	Element Text Should Be				xpath=//div[@class='content']/div[2]/p												Here you can view all members registered by you 
	Element Should Not Contain			xpath=//div[@class='form-group']/label												DARI
	Element Text Should Be				xpath=//div[@class='form-group']/label												FROM		
	Element Should Not Contain			xpath=//div[@class='form-group']/label[2]											TO
	Element Text Should Be				xpath=//div[@class='form-group']/label[2]											SAMPAI		
	Element Should Not Contain			xpath=//button[contains(@class,'btn btn-primary pull-right btn-block')]				Cari
	Element Text Should Be				xpath=//button[contains(@class,'btn btn-primary pull-right btn-block')]				Search	
	Element Should Not Contain			xpath=//button[contains(@class,'btn btn-primary btn-cons') and @id='modalSlideUp1']			Export
	Element Text Should Be				xpath=//button[contains(@class,'btn btn-primary btn-cons') and @id='modalSlideUp1']			Ekspor	
	Element Should Not Contain			xpath=//table[@id='tableWithExportOptions']/thead/tr/th								TANGGAL
	Element Text Should Be				xpath=//table[@id='tableWithExportOptions']/thead/tr/th								DATE
	Element Should Not Contain			xpath=//table[@id='tableWithExportOptions']/thead/tr/th[2]							NAMA
	Element Text Should Be				xpath=//table[@id='tableWithExportOptions']/thead/tr/th[2]							NAME
	Element Should Not Contain			xpath=//table[@id='tableWithExportOptions']/thead/tr/th[3]							AGEN
	Element Text Should Be				xpath=//table[@id='tableWithExportOptions']/thead/tr/th[3]							AGENT
	Element Should Not Contain			xpath=//table[@id='tableWithExportOptions']/thead/tr/th[4]							PHONE
	Element Text Should Be				xpath=//table[@id='tableWithExportOptions']/thead/tr/th[4]							TELEPON
	Element Should Not Contain			xpath=//table[@id='tableWithExportOptions']/thead/tr/th[6]							MOBILE
	Element Text Should Be				xpath=//table[@id='tableWithExportOptions']/thead/tr/th[6]							HANDPHONE
	Element Should Not Contain			xpath=//table[@id='tableWithExportOptions']/thead/tr/th[8]							PAKET
	Element Text Should Be				xpath=//table[@id='tableWithExportOptions']/thead/tr/th[8]							PACKAGE
	Element Should Not Contain			xpath=//table[@id='tableWithExportOptions']/thead/tr/th[9]							NOMOR VIRTUAL
	Element Text Should Be				xpath=//table[@id='tableWithExportOptions']/thead/tr/th[9]							VA NUMBER
	Element Should Not Contain			xpath=//table[@id='tableWithExportOptions']/thead/tr/th[10]							JUMLAH
	Element Text Should Be				xpath=//table[@id='tableWithExportOptions']/thead/tr/th[10]							AMOUNT
#============================================================================================================================================================================
Copy fare in-ID
	Element Text Should Be				xpath=//button[contains(@class,'btn btn-xs btn-primary inline')]					Salin
	Element Should Not Contain			xpath=//button[contains(@class,'btn btn-xs btn-primary inline')]					Copy
	Element Text Should Be				xpath=//div[@class='modal-content']/div/h5/span										Salin Rincian Harga
	Element Should Not Contain			xpath=//div[@class='modal-content']/div/h5/span										Copy Fare Summary
	Element Should Contain				xpath=//textarea[@id='copyNote']													Berangkat
	Element Should Contain				xpath=//textarea[@id='copyNote']													dari
	Element Should Contain				xpath=//textarea[@id='copyNote']													ke	
	Element Should Not Contain			xpath=//textarea[@id='copyNote']													Depart			
	Element Should Not Contain			xpath=//textarea[@id='copyNote']													from
	Element Should Not Contain			xpath=//textarea[@id='copyNote']													to
	Element Should Not Contain			xpath=//textarea[@id='copyNote']													???label.summarycopy.DepartTo???
	Element Text Should Be				sizzle=button#copyFareButton.btn.btn-xs.btn-primary.inline							Salin
	Element Should Not Contain			sizzle=button#copyFareButton.btn.btn-xs.btn-primary.inline							Copy
	Element Text Should Be				sizzle=button#copyFareCancelButton.btn.btn-xs.btn-primary.inline					Batal
	Element Should Not Contain			sizzle=button#copyFareCancelButton.btn.btn-xs.btn-primary.inline					Cancel
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
	${getxpath}=	Get Matching Xpath Count		xpath=//table[contains(@class,'table m-r-5 m-l-0 m-t-0 m-b-5 no-padding fs-12')]/tbody[2]		
	Run Keyword If						${getxpath}==1					connect copy fare in-ID	
	...		ELSE IF						${getxpath}==0					no connect copy fare in-ID
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${getxpath2}=	Get Matching Xpath Count		xpath=//table[contains(@class,'table m-r-5 m-l-0 m-t-5 m-b-5 no-padding fs-12')][2]
	Run Keyword If						${getxpath2}==1					return copy fare in-ID
	...		ELSE IF						${getxpath2}==0					no return copy fare in-ID
#============================================================================================================================================================================
connect copy fare in-ID
	Element Should Contain				Transit
	Element Should Not Contain			Connecting
#============================================================================================================================================================================		
no connect copy fare in-ID	
	Element Should Not Contain			Transit
	Element Should Not Contain			Connecting
#============================================================================================================================================================================
return copy fare in-ID
	Element Should Contain				Pulang
	Element Should Not Contain			Return
#============================================================================================================================================================================
no return copy fare in-ID
	Element Should Not Contain			Pulang
	Element Should Not Contain			Return
#============================================================================================================================================================================
Copy fare en-US
	Element Should Not Contain			xpath=//button[contains(@class,'btn btn-xs btn-primary inline')]					Salin
	Element Text Should Be				xpath=//button[contains(@class,'btn btn-xs btn-primary inline')]					Copy
	Element Should Not Contain			xpath=//div[@class='modal-content']/div/h5/span										Salin Rincian Harga
	Element Text Should Be				xpath=//div[@class='modal-content']/div/h5/span										Copy Fare Summary
	Element Should Not Contain			xpath=//textarea[@id='copyNote']													Berangkat
	Element Should Not Contain			xpath=//textarea[@id='copyNote']													dari
	Element Should Not Contain			xpath=//textarea[@id='copyNote']													ke	
	Element Should Contain				xpath=//textarea[@id='copyNote']													Depart			
	Element Should Contain				xpath=//textarea[@id='copyNote']													from
	Element Should Contain				xpath=//textarea[@id='copyNote']													to
	Element Should Not Contain			xpath=//textarea[@id='copyNote']													???label.summarycopy.DepartTo???
	Element Should Not Contain			sizzle=button#copyFareButton.btn.btn-xs.btn-primary.inline							Salin
	Element Text Should Be				sizzle=button#copyFareButton.btn.btn-xs.btn-primary.inline							Copy
	Element Should Not Contain			sizzle=button#copyFareCancelButton.btn.btn-xs.btn-primary.inline					Batal
	Element Text Should Be				sizzle=button#copyFareCancelButton.btn.btn-xs.btn-primary.inline					Cancel		
	${getxpath}=	Get Matching Xpath Count		xpath=//table[contains(@class,'table m-r-5 m-l-0 m-t-0 m-b-5 no-padding fs-12')]/tbody[2]		
	Run Keyword If						${getxpath}==1					connect copy fare en-US
	...		ELSE IF						${getxpath}==0					no connect copy fare en-US		
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${getxpath2}=	Get Matching Xpath Count		xpath=//table[contains(@class,'table m-r-5 m-l-0 m-t-5 m-b-5 no-padding fs-12')][2]
	Run Keyword If						${getxpath2}==1					return copy fare in-ID
	...		ELSE IF						${getxpath2}==0					no return copy fare in-ID
#============================================================================================================================================================================
connect copy fare en-US
	Element Should Not Contain			Transit
	Element Should Contain				Connecting
#============================================================================================================================================================================		
no connect copy fare en-US	
	Element Should Not Contain			Transit
	Element Should Not Contain			Connecting
#============================================================================================================================================================================
return copy fare en-US
	Element Should Not Contain			Pulang
	Element Should Contain				Return
#============================================================================================================================================================================
no return copy fare en-US
	Element Should Not Contain			Pulang
	Element Should Not Contain			Return
#============================================================================================================================================================================
no data report in-ID
	Elemen Text Should Be				xpath=//table[@id='tableWithSearch']/tbody/tr/td									Data tidak ditemukan
	Elemen Should Not Contain			xpath=//table[@id='tableWithSearch']/tbody/tr/td									No data available in table 	
#============================================================================================================================================================================	
no data report en-US
	Elemen Should Not Contain			xpath=//table[@id='tableWithSearch']/tbody/tr/td									Data tidak ditemukan
	Elemen Text Should Be				xpath=//table[@id='tableWithSearch']/tbody/tr/td									No data available in table
#============================================================================================================================================================================
Bagasi in-ID
	Element Text Should Be				xpath=//div[@class='modal-content']/div/h3/span										Bagasi Tambahan
	Element Should Not Contain			xpath=//div[@class='modal-content']/div/h3/span										Additional Baggage
	Element Text Should Be				xpath=//div[@class='modal-content']/div/p											Biaya tambahan bagasi tidak bisa di refund
	Element Should Not Contain			xpath=//div[@class='modal-content']/div/p											Additional Baggage cost is non-refundable
	Page Should Contain					SEGMEN PENERBANGAN
	Page Should Not Contain				FLIGHT SEGMENT
	Page Should Contain					SAAT INI
	Page Should Not Contain				CURRENT
	Page Should Contain					TAMBAH
	Page Should Not Contain				ADD
	Page Should Contain					BIAYA
	Page Should Not Contain				COST
	Page Should Contain					Total Biaya Tambahan
	Page Should Not Contain	 			Total Additional Cost
	Page Should Contain					Harga Baru
	Page Should Not Contain				New Pax Paid
	Element Text Should Be				xpath=//button[contains(@class,'btn btn-success btn-cons semi-bold tutorial_T_pnr_flight_addbaggage_process_html')]		Proses
	Element Should Not Contain			xpath=//button[contains(@class,'btn btn-success btn-cons semi-bold tutorial_T_pnr_flight_addbaggage_process_html')]		Process
	Element Text Should Be				xpath=//button[contains(@class,'btn btn-danger btn-cons semi-bold tutorial_T_pnr_flight_addbaggage_cancel_html')]		Batal
	Element Should Not Contain			xpath=//button[contains(@class,'btn btn-danger btn-cons semi-bold tutorial_T_pnr_flight_addbaggage_cancel_html')]		Cancel
#============================================================================================================================================================================
Bagasi en-US 	
	Element Should Not Contain			xpath=//div[@class='modal-content']/div/h3/span										Bagasi Tambahan
	Element Text Should Be				xpath=//div[@class='modal-content']/div/h3/span										Additional Baggage
	Element Should Not Contain			xpath=//div[@class='modal-content']/div/p											Biaya tambahan bagasi tidak bisa di refund
	Element Text Should Be				xpath=//div[@class='modal-content']/div/p											Additional Baggage cost is non-refundable
	Page Should Not Contain				SEGMEN PENERBANGAN
	Page Should Contain					FLIGHT SEGMENT
	Page Should Not Contain				SAAT INI
	Page Should Contain					CURRENT
	Page Should Not Contain				TAMBAH
	Page Should Contain					ADD
	Page Should Not Contain				BIAYA
	Page Should Contain					COST
	Page Should Not Contain				Total Biaya Tambahan
	Page Should Contain	 				Total Additional Cost
	Page Should Not Contain				Harga Baru
	Page Should Contain					New Pax Paid
	Element Should Not Contain			xpath=//button[contains(@class,'btn btn-success btn-cons semi-bold tutorial_T_pnr_flight_addbaggage_process_html')]		Proses
	Element Text Should Be				xpath=//button[contains(@class,'btn btn-success btn-cons semi-bold tutorial_T_pnr_flight_addbaggage_process_html')]		Process
	Element Should Not Contain			xpath=//button[contains(@class,'btn btn-danger btn-cons semi-bold tutorial_T_pnr_flight_addbaggage_cancel_html')]		Batal
	Element Text Should Be				xpath=//button[contains(@class,'btn btn-danger btn-cons semi-bold tutorial_T_pnr_flight_addbaggage_cancel_html')]		Cancel
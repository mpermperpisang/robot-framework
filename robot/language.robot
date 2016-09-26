*** Settings ***
Documentation    	Test suite tentang bahasa berisi perubahan bahasa per halaman				
...					Menggunakan keyword dan variable dari resource.robot
...					Pengaturan awal test suite agar browser terbuka menggunakan Suite Setup
...					Untuk menjalankan test case satu persatu gunakan line robot -t (nama test case) (direktori test suite)
Suite Setup       	Buka browser
#Suite Teardown    	Tutup browser
| Resource | 		resource.robot

*** Test Cases ***
#Language di halaman login
Login	 
	${language1}=		set variable 	in-ID
	${language2}=		set variable 	en-US
#-----------------------------------------------------------------------------------------------------------------------------------------------
	:FOR	${INDEX}    IN RANGE    		0				2
	\	${NAME}=		Evaluate			${INDEX}+1
	#\	log to console	${NAME}
	\	Menuju login
	\	Select From List By Value			id=selectlanguage					${language${NAME}}
	\	List Selection Should Be			id=selectlanguage					${language${NAME}}		
	\	Run Keyword If						${NAME}>${INDEX}					Login ${language${NAME}}
	\	Sleep								1s
	
#Language di halaman settings-office profile
Office_profile
	${language1}=		set variable		in-ID
	${language2}=		set variable		en-US
#-----------------------------------------------------------------------------------------------------------------------------------------------
	:FOR    ${INDEX}    IN RANGE    		0				2
	\	${NAME}=		Evaluate			${INDEX}+1	
    #office profile input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Csettings%5Cofficeprofile%5Ccase01
    #common input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
	#language input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Clanguage%5Ccase0${NAME}
    \	Go To								${SETTINGS_URL}
	#\	log to console	${NAME}
	\	Select From List By Value			id=selectlanguage					${language${NAME}}
	\	List Selection Should Be			id=selectlanguage					${language${NAME}}
	\	Run Keyword If						${NAME}>${INDEX}					Bahasa halaman ${language${NAME}}
	\	Run Keyword If						${NAME}>${INDEX}					Office profile ${language${NAME}}
	\	Sleep								1s

#Language di halaman settings-user profile
User_profile
	${language1}=		set variable		in-ID
	${language2}=		set variable		en-US
#-----------------------------------------------------------------------------------------------------------------------------------------------
	:FOR    ${INDEX}    IN RANGE    		0				2
	\	${NAME}=		Evaluate			${INDEX}+1	
    #common input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
	#language input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Clanguage%5Ccase0${NAME}
    \	Go To								${USERPROFILE_URL} 
	\	Select From List By Value			id=selectlanguage					${language${NAME}}
	\	List Selection Should Be			id=selectlanguage					${language${NAME}}
	\	Run Keyword If						${NAME}>${INDEX}					Bahasa halaman ${language${NAME}}
	\	Run Keyword If						${NAME}>${INDEX}					User profile ${language${NAME}}
	\	Sleep								1s

#Language di halaman settings-user maintenance
User_maintenance
	${language1}=		set variable		in-ID
	${language2}=		set variable		en-US
#-----------------------------------------------------------------------------------------------------------------------------------------------
	:FOR    ${INDEX}    IN RANGE    		0				2
	\	${NAME}=		Evaluate			${INDEX}+1	
    #common input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
	#language input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Clanguage%5Ccase0${NAME}
    \	Go To								${USERMAINTENANCE_URL}
	#\	log to console	${NAME}   
	\	Select From List By Value			id=selectlanguage					${language${NAME}}
	\	List Selection Should Be			id=selectlanguage					${language${NAME}}
	\	Run Keyword If						${NAME}>${INDEX}					Bahasa halaman ${language${NAME}}
	\	Run Keyword If						${NAME}>${INDEX}					User maintenance ${language${NAME}}
	\	Sleep								1s
	
PNR_flight
	${language1}=		set variable		in-ID
	${language2}=		set variable		en-US
	Set Suite Variable						${language1}
	Set Suite Variable						${language2}
#-----------------------------------------------------------------------------------------------------------------------------------------------
	${idPNR}=			set variable		5301
	Set Global Variable						${idPNR}
	:FOR    ${INDEX}    IN RANGE    		0				20
	\	${NAME}=		Evaluate			${INDEX}+1	
	\	Set Test Variable	${INDEX}
	\	Set Test Variable	${NAME}
	#\	log to console 	${idPNR}			
	#pnr input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Cpnr%5Ccase0${NAME}
	#common input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    \	${json}= 							Get file 		C:/Users/User/workspace/van-web4/WebContent/test/commoninput/input/SelfOfficeInformationResponse1.txt
    \	${object}= 							Evaluate 		json.loads('''${json}''') 			json
    \	Set Suite Variable	${json}
    \	Set Suite Variable	${object}
    \	Bahasapnr
	\	${idPNR}=			Evaluate		${idPNR}+1
	\	Sleep								1s
	
Availability
	${language1}=		set variable		in-ID
	${language2}=		set variable		en-US
	Set Suite Variable						${language1}
	Set Suite Variable						${language2}
#-----------------------------------------------------------------------------------------------------------------------------------------------
	:FOR    ${INDEX}    IN RANGE    		0				7
	\	${NAME}=		Evaluate			${INDEX}+1	
	\	Set Test Variable	${INDEX} 
	\	Set Test Variable	${NAME}
	#fare input (ini juga sudah termasuk avail result)
	\	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Cavailability%5Ccase0${NAME}
	#common input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
	\	Bahasaavail
	\	Sleep								1s
	
List_laporan
	${language1}=		set variable		in-ID
	${language2}=		set variable		en-US
	:FOR    ${INDEX}    IN RANGE    		0				2
	\	${NAME}=		Evaluate			${INDEX}+1	
	#report input
	\	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Creport%5Clistreport%5Ccase01
	#common input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
	#language input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Clanguage%5Ccase0${NAME}
	\	Go To								${REPORT_URL}
	\	Select From List By Value			id=selectlanguage					${language${NAME}}
	\	List Selection Should Be			id=selectlanguage					${language${NAME}}
	\	Run Keyword If						${NAME}>${INDEX}					Bahasa halaman ${language${NAME}}
	\	Run Keyword If						${NAME}>${INDEX}					Report ${language${NAME}}
	\	Sleep								1s
	
Retrieve
	#list pnr
	${language1}=		set variable		in-ID
	${language2}=		set variable		en-US
	Set Suite Variable						${language1}
	Set Suite Variable						${language2}
	:FOR    ${INDEX}    IN RANGE    		0				11
	\	${NAME}=		Evaluate			${INDEX}+1	
	\	Set Test Variable	${INDEX}
	\	Set Test Variable	${NAME}
	#retrieve input
	\	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Cretrieve%5Ccase0${NAME}
	#common input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    \	Bahasaretrieve
	\	Sleep								1s
	
List_berita
	#list news
	${language1}=		set variable		in-ID
	${language2}=		set variable		en-US
	Set Suite Variable						${language1}
	Set Suite Variable						${language2}
	:FOR    ${INDEX}    IN RANGE    		0				2
	\	${NAME}=		Evaluate			${INDEX}+1	
	\	Set Test Variable	${INDEX}
	\	Set Test Variable	${NAME}
	#retrieve input
	\	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Cnews%5Ccase01
	#common input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
	#language input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Clanguage%5Ccase0${NAME}
    \	Go To								${NEWS_URL}
	\	Select From List By Value			id=selectlanguage					${language${NAME}}
	\	List Selection Should Be			id=selectlanguage					${language${NAME}}
	\	Run Keyword If						${NAME}>${INDEX}					Bahasa halaman ${language${NAME}}
	\	Run Keyword If						${NAME}>${INDEX}					List berita ${language${NAME}}
	\	Sleep								1s
	
Berita
	#list news
	${language1}=		set variable		in-ID
	${language2}=		set variable		en-US
	Set Suite Variable						${language1}
	Set Suite Variable						${language2}
	:FOR    ${INDEX}    IN RANGE    		0				2
	\	${NAME}=		Evaluate			${INDEX}+1	
	\	Set Test Variable	${INDEX}
	\	Set Test Variable	${NAME}
	#retrieve input
	\	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Cnews%5Ccase02
	#common input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
	#language input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Clanguage%5Ccase0${NAME}
    \	Go To								${NEWS_URL}
	\	Select From List By Value			id=selectlanguage					${language${NAME}}
	\	List Selection Should Be			id=selectlanguage					${language${NAME}}
	\	Run Keyword If						${NAME}>${INDEX}					Bahasa halaman ${language${NAME}}
	\	Run Keyword If						${NAME}>${INDEX}					Berita ${language${NAME}}
	\	Sleep								1s
	
List_tips
	#list news
	${language1}=		set variable		in-ID
	${language2}=		set variable		en-US
	Set Suite Variable						${language1}
	Set Suite Variable						${language2}
	:FOR    ${INDEX}    IN RANGE    		0				2
	\	${NAME}=		Evaluate			${INDEX}+1	
	\	Set Test Variable	${INDEX}
	\	Set Test Variable	${NAME}
	#retrieve input
	\	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ctips%5Ccase01
	#common input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
	#language input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Clanguage%5Ccase0${NAME}
    \	Go To								${LISTTIPS_URL}
	\	Select From List By Value			id=selectlanguage					${language${NAME}}
	\	List Selection Should Be			id=selectlanguage					${language${NAME}}
	\	Run Keyword If						${NAME}>${INDEX}					Bahasa halaman ${language${NAME}}
	\	Run Keyword If						${NAME}>${INDEX}					List tips ${language${NAME}}
	\	Sleep								1s
	
Tips
	#list news
	${language1}=		set variable		in-ID
	${language2}=		set variable		en-US
	Set Suite Variable						${language1}
	Set Suite Variable						${language2}
	:FOR    ${INDEX}    IN RANGE    		0				2
	\	${NAME}=		Evaluate			${INDEX}+1	
	\	Set Test Variable	${INDEX}
	\	Set Test Variable	${NAME}
	#retrieve input
	\	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ctips%5Ccase02
	#common input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
	#language input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Clanguage%5Ccase0${NAME}
    \	Go To								${TIPS_URL}
	\	Select From List By Value			id=selectlanguage					${language${NAME}}
	\	List Selection Should Be			id=selectlanguage					${language${NAME}}
	\	Run Keyword If						${NAME}>${INDEX}					Bahasa halaman ${language${NAME}}
	\	Run Keyword If						${NAME}>${INDEX}					Tips ${language${NAME}}
	\	Sleep								1s
	
Report_SOA
	#report Statement Of Account
	${language1}=		set variable		in-ID
	${language2}=		set variable		en-US
	Set Suite Variable						${language1}
	Set Suite Variable						${language2}
	:FOR    ${INDEX}    IN RANGE    		0				3
	\	${NAME}=		Evaluate			${INDEX}+1	
	\	Set Test Variable	${INDEX}
	\	Set Test Variable	${NAME}
	#retrieve input
	\	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Creport%5Cstatementofaccount%5Ccase0${NAME}
	#common input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    \	bahasaSOA
	\	Sleep								1s	
	
Report_AR
	#report Airline Revenue
	${language1}=		set variable		in-ID
	${language2}=		set variable		en-US
	Set Suite Variable						${language1}
	Set Suite Variable						${language2}
	:FOR    ${INDEX}    IN RANGE    		0				3
	\	${NAME}=		Evaluate			${INDEX}+1	
	\	Set Test Variable	${INDEX}
	\	Set Test Variable	${NAME}
	#retrieve input
	\	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Creport%5Cairlinerevenue%5Ccase0${NAME}
	#common input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    \	bahasaAR
	\	Sleep								1s	
	
Report_HR
	#report Hotel Revenue
	${language1}=		set variable		in-ID
	${language2}=		set variable		en-US
	Set Suite Variable						${language1}
	Set Suite Variable						${language2}
	:FOR    ${INDEX}    IN RANGE    		0				3
	\	${NAME}=		Evaluate			${INDEX}+1	
	\	Set Test Variable	${INDEX}
	\	Set Test Variable	${NAME}
	#retrieve input
	\	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Creport%5Chotelrevenue%5Ccase0${NAME}
	#common input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    \	bahasaHR
	\	Sleep								1s	
	
Report_ATT
	#report Attraction Revenue
	${language1}=		set variable		in-ID
	${language2}=		set variable		en-US
	Set Suite Variable						${language1}
	Set Suite Variable						${language2}
	:FOR    ${INDEX}    IN RANGE    		0				3
	\	${NAME}=		Evaluate			${INDEX}+1	
	\	Set Test Variable	${INDEX}
	\	Set Test Variable	${NAME}
	#retrieve input
	\	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Creport%5Cattractionrevenue%5Ccase0${NAME}
	#common input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    \	bahasaATT
	\	Sleep								1s	
	
Report_AUT
	#report Auto Ticket
	${language1}=		set variable		in-ID
	${language2}=		set variable		en-US
	Set Suite Variable						${language1}
	Set Suite Variable						${language2}
	:FOR    ${INDEX}    IN RANGE    		0				3
	\	${NAME}=		Evaluate			${INDEX}+1	
	\	Set Test Variable	${INDEX}
	\	Set Test Variable	${NAME}
	#retrieve input
	\	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Creport%5Cautoticket%5Ccase0${NAME}
	#common input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    \	bahasaAUT
	\	Sleep								1s	
	
Report_CC
	#report Credit Card
	${language1}=		set variable		in-ID
	${language2}=		set variable		en-US
	Set Suite Variable						${language1}
	Set Suite Variable						${language2}
	:FOR    ${INDEX}    IN RANGE    		0				3
	\	${NAME}=		Evaluate			${INDEX}+1	
	\	Set Test Variable	${INDEX}
	\	Set Test Variable	${NAME}
	#retrieve input
	\	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Creport%5Ccreditcard%5Ccase0${NAME}
	#common input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    \	bahasaCC
	\	Sleep								1s	
	
Report_TU
	#report Top Up
	${language1}=		set variable		in-ID
	${language2}=		set variable		en-US
	Set Suite Variable						${language1}
	Set Suite Variable						${language2}
	:FOR    ${INDEX}    IN RANGE    		0				3
	\	${NAME}=		Evaluate			${INDEX}+1	
	\	Set Test Variable	${INDEX}
	\	Set Test Variable	${NAME}
	#retrieve input
	\	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Creport%5Ctopup%5Ccase0${NAME}
	#common input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    \	bahasaTU
	\	Sleep								1s	
	
Report_RM
	#report Top Up
	${language1}=		set variable		in-ID
	${language2}=		set variable		en-US
	Set Suite Variable						${language1}
	Set Suite Variable						${language2}
	:FOR    ${INDEX}    IN RANGE    		0				3
	\	${NAME}=		Evaluate			${INDEX}+1	
	\	Set Test Variable	${INDEX}
	\	Set Test Variable	${NAME}
	#retrieve input
	\	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Creport%5Cregisteredmember%5Ccase0${NAME}
	#common input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    \	bahasaRM
	\	Sleep								1s	
	
Copyfare_flight
	#copy fare summary
	${language1}=		set variable		in-ID
	${language2}=		set variable		en-US
	Set Suite Variable						${language1}
	Set Suite Variable						${language2}
	:FOR    ${INDEX}    IN RANGE    		3				4
	\	${NAME}=		Evaluate			${INDEX}+1	
	\	Set Test Variable	${INDEX}
	\	Set Test Variable	${NAME}
	#copyfare input
	\	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccopyfare%5Ccase0${NAME}
	#common input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    \	bahasaCopyfare
	\	Sleep								1s
	
Edit_bagasi
	#edit bagasi flight
	${language1}=		set variable		in-ID
	${language2}=		set variable		en-US
	Set Suite Variable						${language1}
	Set Suite Variable						${language2}
	:FOR    ${INDEX}    IN RANGE    		0				4
	\	${NAME}=		Evaluate			${INDEX}+1	
	\	Set Test Variable	${INDEX}
	\	Set Test Variable	${NAME}
	#copyfare input
	\	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ceditbaggage%5Ccase0${NAME}
	#common input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    \	bahasaBagasi
	\	Sleep								1s		
*** Settings ***
Documentation    	Test case authorization
...					Menggunakan keyword dan variable dari resource.robot
...					Pengaturan awal test suite agar browser terbuka menggunakan Suite Setup
...					Untuk menjalankan test case satu persatu gunakan line robot -t (nama test case) (direktori test suite)
Suite Setup       	Buka browser
#Suite Teardown    	Tutup browser
| Resource | 		resource.robot

*** Test Cases ***     
Hak_akses_settings
	#halaman settings
	:FOR    ${INDEX}    	IN RANGE    1				13		
	\	${NAME}=			Evaluate	${INDEX}+1
	\	Set Suite Variable	${INDEX}
	\	Set Suite Variable	${NAME}
	\	Run Keyword If					'${NAME}'=='11'			settings_admin
	\	...		ELSE IF					'${NAME}'<>'11'			settings_noadmin
	
Hak_akses_pnrflight
	#halaman pnr flight
	${idRolepnr}=						set variable	5301
	:FOR    ${INDEX}    	IN RANGE    0				20
	\	${NAME}=						Evaluate		${INDEX}+1
	\	Set Suite Variable				${INDEX}
	\	Set Suite Variable				${NAME}
    #pnr input
    \	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Cpnr%5Ccase0${NAME}
	\	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
	\	Set Global Variable				${idRolepnr}
    \	rolepnr
    \	${idRolepnr}=					Evaluate		${idRolepnr}+1
    \	Sleep							1s
    
Hak_akses_menu
	#semua menu (HOME, NEWS, REPORT, SETTINGS, HELP)
	:FOR    ${INDEX}    	IN RANGE    0				13
	\	${NAME}=			Evaluate	${INDEX}+1
	\	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Cmenu%5Ccase01
	\	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
	\	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Chakakses%5Ccase0${NAME}
	\	Go To							${HOME_URL}
	\	Run Keyword If					'${NAME}'=='1' or '${NAME}'=='2' or '${NAME}'=='3' or '${NAME}'=='5' or '${NAME}'=='6' or '${NAME}'=='7' or '${NAME}'=='9' or '${NAME}'=='12' or '${NAME}'=='13'	No hak menu report
	\	...		ELSE IF					('${NAME}'=='4' or '${NAME}'=='8' or '${NAME}'=='10' or '${NAME}'=='11')		Hak menu report
    
Hak_akses_report
	#halaman report
	:FOR    ${INDEX}    	IN RANGE    0				13
	\	${NAME}=			Evaluate	${INDEX}+1
	\	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Creport%5Clistreport%5Ccase01
	\	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Chakakses%5Ccase0${NAME}
	\	Go To							${REPORT_URL}
	\	Run Keyword If					'${NAME}'=='1' or '${NAME}'=='2' or '${NAME}'=='3' or '${NAME}'=='5' or '${NAME}'=='6' or '${NAME}'=='7' or '${NAME}'=='9' or '${NAME}'=='12' or '${NAME}'=='13'		No hak report
	\	...		ELSE IF					'${NAME}'=='4'							Hak report attraction
	\	...		ELSE IF					('${NAME}'=='8' or '${NAME}'=='10'		Hak report not admin
	\	...		ELSE IF					'${NAME}'=='11'							Hak report admin
	
Hak_akses_avail
	:FOR    ${INDEX}    	IN RANGE    0				7
	\	${NAME}=			Evaluate	${INDEX}+1
	\	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Cavailability%5Ccase0${NAME}
    \	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
	\	roleAvail
	\	Sleep							1s
	
Hak_akses_retrieveflight
	#halaman retrieve flight by date
	:FOR    ${INDEX}    	IN RANGE    0				11
	\	${NAME}=			Evaluate	${INDEX}+1
	\	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Cretrieve%5Ccase0${NAME}
    \	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
	\	roleRetrieve
	\	Sleep							1s
	
Hak_akses_listnews
	#halaman list news
	:FOR    ${INDEX}    	IN RANGE    0				13
	\	${NAME}=			Evaluate	${INDEX}+1
	#news input
	\	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Cnews%5Ccase01
	#common input
    \	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    #authorization input
	\	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Chakakses%5Ccase0${NAME}
	\	Go To							${LISTNEWS_URL}
	\	Location Should Be				${LISTNEWS_URL}
	\	Page Should Not Contain			You do not have authorization to access this service
	\	Sleep							1s	
	
Hak_akses_news
	#halaman news
	:FOR    ${INDEX}    	IN RANGE    0				13
	\	${NAME}=			Evaluate	${INDEX}+1
	#news input
	\	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Cnews%5Ccase02
	#common input
    \	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    #authorization input
	\	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Chakakses%5Ccase0${NAME}
	\	Go To							${LISTNEWS_URL}
	\	Location Should Be				${LISTNEWS_URL}
	\	Page Should Not Contain			You do not have authorization to access this service
	\	Sleep							1s	
	
Hak_akses_listtips
	#halaman list news
	:FOR    ${INDEX}    	IN RANGE    0				13
	\	${NAME}=			Evaluate	${INDEX}+1
	#news input
	\	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ctips%5Ccase01
	#common input
    \	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    #authorization input
	\	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Chakakses%5Ccase0${NAME}
	\	Go To							${LISTTIPS_URL}
	\	Location Should Be				${LISTTIPS_URL}
	\	Page Should Not Contain			You do not have authorization to access this service
	\	Sleep							1s	
	
Hak_akses_tips
	#halaman list news
	:FOR    ${INDEX}    	IN RANGE    0				13
	\	${NAME}=			Evaluate	${INDEX}+1
	#news input
	\	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ctips%5Ccase02
	#common input
    \	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    #authorization input
	\	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Chakakses%5Ccase0${NAME}
	\	Go To							${TIPS_URL}
	\	Location Should Be				${TIPS_URL}
	\	Page Should Not Contain			You do not have authorization to access this service
	\	Sleep							1s	
	
Hak_akses_listreport
	#halaman list news
	:FOR    ${INDEX}    	IN RANGE    0				2
	\	${NAME}=			Evaluate	${INDEX}+1
	#news input
	\	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Creport%5Clistreport%5Ccase0${NAME}
	#common input
    \	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    \	roleListReport
	\	Sleep							1s	
	
Hak_akses_reportSOA
	#halaman report statement of account
	:FOR    ${INDEX}    	IN RANGE    0				2
	\	${NAME}=			Evaluate	${INDEX}+1
	#news input
	\	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Creport%5Cstatementofaccount%5Ccase0${NAME}
	#common input
    \	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    \	roleSOA
	\	Sleep							1s	
	
Hak_akses_reportAR
	#halaman report airline revenue
	:FOR    ${INDEX}    	IN RANGE    0				2
	\	${NAME}=			Evaluate	${INDEX}+1
	#news input
	\	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Creport%5Cairlinerevenue%5Ccase0${NAME}
	#common input
    \	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    \	roleAR
	\	Sleep							1s	
	
Hak_akses_reportHR
	#halaman report hotel revenue
	:FOR    ${INDEX}    	IN RANGE    0				2
	\	${NAME}=			Evaluate	${INDEX}+1
	#news input
	\	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Creport%5Chotelrevenue%5Ccase0${NAME}
	#common input
    \	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    \	roleHR
	\	Sleep							1s		
	
Hak_akses_reportATT
	#halaman report attraction revenue
	:FOR    ${INDEX}    	IN RANGE    0				2
	\	${NAME}=			Evaluate	${INDEX}+1
	#news input
	\	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Creport%5Cattractionrevenue%5Ccase0${NAME}
	#common input
    \	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    \	roleATT
	\	Sleep							1s			
	
Hak_akses_reportAUT
	#halaman report auto ticket
	:FOR    ${INDEX}    	IN RANGE    0				2
	\	${NAME}=			Evaluate	${INDEX}+1
	#news input
	\	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Creport%5Cautoticket%5Ccase0${NAME}
	#common input
    \	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    \	roleAUT
	\	Sleep							1s			
	
Hak_akses_reportCC
	#halaman report credit card
	:FOR    ${INDEX}    	IN RANGE    0				2
	\	${NAME}=			Evaluate	${INDEX}+1
	#news input
	\	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Creport%5Ccreditcard%5Ccase0${NAME}
	#common input
    \	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    \	roleCC
	\	Sleep							1s		
	
Hak_akses_reportTU
	#halaman report top up
	:FOR    ${INDEX}    	IN RANGE    0				2
	\	${NAME}=			Evaluate	${INDEX}+1
	#news input
	\	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Creport%5Ctopup%5Ccase0${NAME}
	#common input
    \	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    \	roleTU
	\	Sleep							1s		
	
Hak_akses_reportRM
	#halaman report top up
	:FOR    ${INDEX}    	IN RANGE    0				2
	\	${NAME}=			Evaluate	${INDEX}+1
	#news input
	\	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Creport%5Cregisteredmember%5Ccase0${NAME}
	#common input
    \	Go To							${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    \	roleRM
	\	Sleep							1s		
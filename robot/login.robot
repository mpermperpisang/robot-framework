*** Settings ***
Documentation    	Test suite authentication
...					Menggunakan keyword dan variable dari resource.robot
...					Pengaturan awal test suite agar browser terbuka menggunakan Suite Setup
...					Untuk menjalankan test case satu persatu gunakan line robot -t (nama test case) (direktori test suite)
Suite Setup       	Buka browser
Suite Teardown    	Tutup browser
| Resource | 		resource.robot

*** Test Cases ***			
Username_kosong
	#tidak membutuhkan response
	Menuju login	
    ${json}= 					Get file 		C:/Users/User/workspace/van-web4/WebContent/test/login/case01/assert/AuthenticationRequest.txt
    ${object}= 					Evaluate 		json.loads('''${json}''') 		json
	Isi username				${EMPTY}
	Isi password				${object["password"]}	
	Submit Login
	#Harus tampil validasi karena memasukkan username yang kosong
	Field user kosong
	Sleep						1s
		
Password_kosong
	#tidak membutuhkan response
	Menuju login	
    ${json}= 					Get file 		C:/Users/User/workspace/van-web4/WebContent/test/login/case01/assert/AuthenticationRequest.txt
    ${object}= 					Evaluate 		json.loads('''${json}''') 		json
	Isi username				${object["username"]}
	Isi password				${EMPTY}	
	Submit Login
	#Harus tampil validasi karena memasukkan password yang kosong
	Field pword kosong
	Sleep						1s
	
Username_password_salah
	Delete All Cookies
	Sleep						2s
	#Response exception invalid username or  password
    Go To						${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Clogin%5Ccase02
	Menuju login
    ${json}= 					Get file 		C:/Users/User/workspace/van-web4/WebContent/test/login/case02/assert/AuthenticationRequest-1.txt
    ${object}= 					Evaluate 		json.loads('''${json}''') 		json
	Isi username				${object["username"]}
	Isi password				${object["password"]}
	Submit Login
	#Harus tampil validasi karena memasukkan username dan password yang salah
	Invalid user
	Sleep						1s
	
Username_salah
	Delete All Cookies
	Sleep						2s
	#Response exception invalid username or  password
    Go To						${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Clogin%5Ccase02
	Menuju login
    ${json}= 					Get file 		C:/Users/User/workspace/van-web4/WebContent/test/login/case02/assert/AuthenticationRequest-2.txt
    ${object}= 					Evaluate 		json.loads('''${json}''') 		json
	Isi username				${object["username"]}
	Isi password				${object["password"]}
	Submit Login
	#Harus tampil validasi karena memasukkan username yang salah
	Invalid user
	Sleep						1s
	
Password_salah
	Delete All Cookies
	Sleep						2s
	#Response exception invalid username or  password
    Go To						${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Clogin%5Ccase02
	Menuju login
    ${json}= 					Get file 		C:/Users/User/workspace/van-web4/WebContent/test/login/case02/assert/AuthenticationRequest-3.txt
    ${object}= 					Evaluate 		json.loads('''${json}''') 		json
	Isi username				${object["username"]}
	Isi password				${object["password"]}
	Submit Login
	#Harus tampil validasi karena memasukkan password yang salah
	Invalid user
	Sleep						1s
	
Login_berhasil
	Delete All Cookies
	Sleep						2s
	#login input
    Go To						${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Clogin%5Ccase01
    #common input
    Go To						${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    Menuju login
   	Data login
    Submit Login
	Judul beranda
	Sleep						1s
	
Go_url
	Delete All Cookies
	Sleep						2s
    Go To						${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Clogin%5Ccase03
	Go To						${HOME_URL}				
	Location Should Be			${LOGIN_URL}?locale=en-US
	Not login
	Sleep						1s
	
abc
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Delete All Cookies
	Sleep						2s
    Go To						${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Clogin%5Ccase03
	Go To						${PNR_URL}					
	Location Should Be			${LOGIN_URL}?locale=en-US
	Not login
	Sleep						1s
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Delete All Cookies
	Sleep						2s
    Go To						${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Clogin%5Ccase03
	Go To						${REPORT_URL}				
	Location Should Be			${LOGIN_URL}?locale=en-US
	Not login
	Sleep						1s
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Delete All Cookies
	Sleep						2s
    Go To						${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Clogin%5Ccase03
	Go To						${SETTINGS_URL}				
	Location Should Be			${LOGIN_URL}?locale=en-US
	Not login
	Sleep						1s
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Delete All Cookies
	Sleep						2s
    Go To						${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Clogin%5Ccase03
	Go To						${USERPROFILE_URL}			
	Location Should Be			${LOGIN_URL}?locale=en-US
	Not login
	Sleep						1s
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Delete All Cookies
	Sleep						2s
    Go To						${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Clogin%5Ccase03
	Go To						${USERMAINTENANCE_URL}		
	Location Should Be			${LOGIN_URL}?locale=en-US
	Not login
	Sleep						1s
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Delete All Cookies
	Sleep						2s
    Go To						${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Clogin%5Ccase03
	Go To						${AVAIL_URL}				
	Location Should Be			${LOGIN_URL}?locale=en-US
	Not login
	Sleep						1s
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Delete All Cookies
	Sleep						2s
    Go To						${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Clogin%5Ccase03
	Go To						${RETRIEVE_URL}				
	Location Should Be			${LOGIN_URL}?locale=en-US
	Not login
	Sleep						1s
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Delete All Cookies
	Sleep						2s
    Go To						${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Clogin%5Ccase03
	Go To						${LISTNEWS_URL}				
	Location Should Be			${LOGIN_URL}?locale=en-US
	Not login
	Sleep						1s
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Delete All Cookies
	Sleep						2s
    Go To						${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Clogin%5Ccase03
	Go To						${NEWS_URL}				
	Location Should Be			${LOGIN_URL}?locale=en-US
	Not login
	Sleep						1s
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Delete All Cookies
	Sleep						2s
    Go To						${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Clogin%5Ccase03
	Go To						${LISTTIPS_URL}				
	Location Should Be			${LOGIN_URL}?locale=en-US
	Not login
	Sleep						1s
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Delete All Cookies
	Sleep						2s
    Go To						${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Clogin%5Ccase03
	Go To						${SOA_URL}				
	Location Should Be			${LOGIN_URL}?locale=en-US
	Not login
	Sleep						1s
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Delete All Cookies
	Sleep						2s
    Go To						${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Clogin%5Ccase03
	Go To						${AR_URL}				
	Location Should Be			${LOGIN_URL}?locale=en-US
	Not login
	Sleep						1s
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Delete All Cookies
	Sleep						2s
    Go To						${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Clogin%5Ccase03
	Go To						${HR_URL}				
	Location Should Be			${LOGIN_URL}?locale=en-US
	Not login
	Sleep						1s
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Delete All Cookies
	Sleep						2s
    Go To						${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Clogin%5Ccase03
	Go To						${ATT_URL}				
	Location Should Be			${LOGIN_URL}?locale=en-US
	Not login
	Sleep						1s
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Delete All Cookies
	Sleep						2s
    Go To						${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Clogin%5Ccase03
	Go To						${AUT_URL}				
	Location Should Be			${LOGIN_URL}?locale=en-US
	Not login
	Sleep						1s
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Delete All Cookies
	Sleep						2s
    Go To						${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Clogin%5Ccase03
	Go To						${CC_URL}				
	Location Should Be			${LOGIN_URL}?locale=en-US
	Not login
	Sleep						1s
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Delete All Cookies
	Sleep						2s
    Go To						${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Clogin%5Ccase03
	Go To						${TU_URL}				
	Location Should Be			${LOGIN_URL}?locale=en-US
	Not login
	Sleep						1s
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Delete All Cookies
	Sleep						2s
    Go To						${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Clogin%5Ccase03
	Go To						${RM_URL}				
	Location Should Be			${LOGIN_URL}?locale=en-US
	Not login
	Sleep						1s
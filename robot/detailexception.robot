*** Settings ***
Documentation    	resource exception
...					Menggunakan keyword dan variable dari resource.robot
...					Pengaturan awal test suite agar browser terbuka menggunakan Suite Setup
...					Untuk menjalankan test case satu persatu gunakan line robot -t (nama test case) (direktori test suite)

*** Keywords ***    
#Pengaturan exception
#============================================================================================================================================================================
Field user kosong	
	Page Should Contain Element			xpath=//label[@id='username-error'] 
	Element Text Should Be				xpath=//label[@id='username-error']				This field is required.
#============================================================================================================================================================================
Field pword kosong	
	Page Should Contain Element			xpath=//label[@id='password-error'] 
	Element Text Should Be				xpath=//label[@id='password-error']				This field is required.
#============================================================================================================================================================================
Invalid user
	Page Should Contain Element			xpath=//span[@id='errorMSG']
	Element Text Should Be				xpath=//span[@id='errorMSG']					Invalid user name or password
#============================================================================================================================================================================
Not login
	Page Should Contain Element			xpath=//span[@id='errorMSG']
	Element Text Should Be				xpath=//span[@id='errorMSG']					User is not logged
#============================================================================================================================================================================
Invalid date
	Page Should Contain					Invalid date range
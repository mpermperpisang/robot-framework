*** Settings ***
Documentation    	Test suite berisi office profile, user setting dan user maintenance
...					Menggunakan keyword dan variable dari resource.robot
...					Pengaturan awal test suite agar browser terbuka menggunakan Suite Setup
...					Untuk menjalankan test case satu persatu gunakan line robot -t (nama test case) (direktori test suite)
Suite Setup       	Buka browser
Suite Teardown    	Tutup browser
| Resource | 		resource.robot

*** Test Cases ***
Office_profile 	
    #office profile input
    Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Csettings%5Cofficeprofile%5Ccase01
    #common input
    Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    Go To								${SETTINGS_URL}
    Title Should Be						Settings - Voltras Agent Network
    Location Should Be					${SETTINGS_URL}
    #elemen yang wajib ada di setiap halaman
	Isi halaman
	#label office code
    Page Should Contain Element			xpath=//form[@id='form-personal']/div/div/div/label	
	#office code
    Page Should Contain Element			xpath=//form[@id='form-personal']/div/div/div/input
    Element Should Be Visible			xpath=//form[@id='form-personal']/div/div/div/input
    Element Should Be Disabled			xpath=//form[@id='form-personal']/div/div/div/input
    #lable office name
    Page Should Contain Element			xpath=//form[@id='form-personal']/div/div[2]/div/label
    #office name	
    Page Should Contain Element			xpath=//form[@id='form-personal']/div/div[2]/div/input
    Element Should Be Visible			xpath=//form[@id='form-personal']/div/div[2]/div/input
    Element Should Be Disabled			xpath=//form[@id='form-personal']/div/div[2]/div/input
    #label package name
    Page Should Contain Element			xpath=//form[@id='form-personal']/div[2]/div/div/label
    #package name	
    Page Should Contain Element			xpath=//form[@id='form-personal']/div[2]/div/div/input
    Element Should Be Visible			xpath=//form[@id='form-personal']/div[2]/div/div/input
    Element Should Be Disabled			xpath=//form[@id='form-personal']/div[2]/div/div/input
    #label address
    Page Should Contain Element			xpath=//form[@id='form-personal']/div[3]/div/div/label
    #address	
    Page Should Contain Element			xpath=//form[@id='form-personal']/div[3]/div/div/input
    Element Should Be Visible			xpath=//form[@id='form-personal']/div[3]/div/div/input
    Element Should Be Enabled			xpath=//form[@id='form-personal']/div[3]/div/div/input
    #label phone number
    Page Should Contain Element			xpath=//form[@id='form-personal']/div[4]/div/div/label
    #phone number	
    Page Should Contain Element			xpath=//form[@id='form-personal']/div[4]/div/div/input	
    Element Should Be Visible			xpath=//form[@id='form-personal']/div[4]/div/div/input	
    Element Should Be Enabled			xpath=//form[@id='form-personal']/div[4]/div/div/input
    #label email
    Page Should Contain Element			xpath=//form[@id='form-personal']/div[5]/div/div/label
    #email	
    Page Should Contain Element			xpath=//form[@id='form-personal']/div[5]/div/div/input	
    Element Should Be Visible			xpath=//form[@id='form-personal']/div[5]/div/div/input	
    Element Should Be Enabled			xpath=//form[@id='form-personal']/div[5]/div/div/input
    #label contact person
    Page Should Contain Element			xpath=//form[@id='form-personal']/div[6]/div/div/label
    #contact person	
    Page Should Contain Element			xpath=//form[@id='form-personal']/div[6]/div/div/input	
    Element Should Be Visible			xpath=//form[@id='form-personal']/div[6]/div/div/input	
    Element Should Be Enabled			xpath=//form[@id='form-personal']/div[6]/div/div/input
    #label domestic flight service fee
    Page Should Contain Element			xpath=//form[@id='form-personal']/div[7]/div/div/label
    #domestic flight service fee	
    Page Should Contain Element			xpath=//form[@id='form-personal']/div[7]/div/div/input
    Element Should Be Visible			xpath=//form[@id='form-personal']/div[7]/div/div/input	
    #checkbox domestic flight service fee (flat)
    Page Should Contain Element			xpath=//form[@id='form-personal']/div[7]/div[2]/div/input	
    Checkbox Should Be Selected			xpath=//form[@id='form-personal']/div[7]/div[2]/div/input
    #checkbox domestic flight service fee (percentage)
    Page Should Contain Element			xpath=//form[@id='form-personal']/div[7]/div[2]/div/input[2]
    Checkbox Should Not Be Selected		xpath=//form[@id='form-personal']/div[7]/div[2]/div/input[2]
    #label international flight service fee
    Page Should Contain Element			xpath=//form[@id='form-personal']/div[8]/div/div/label
    #international flight service fee		
    Page Should Contain Element			xpath=//form[@id='form-personal']/div[8]/div/div/input	
    Element Should Be Visible			xpath=//form[@id='form-personal']/div[8]/div/div/input		
    #checkbox international flight service fee (flat)
    Page Should Contain Element			xpath=//form[@id='form-personal']/div[8]/div[2]/div/input	
    Checkbox Should Be Selected			xpath=//form[@id='form-personal']/div[8]/div[2]/div/input		
    #checkbox international flight service fee (percentage)	
    Page Should Contain Element			xpath=//form[@id='form-personal']/div[8]/div[2]/div/input[2]		
    Checkbox Should Not Be Selected		xpath=//form[@id='form-personal']/div[8]/div[2]/div/input[2]
    #label hotel service fee
    Page Should Contain Element			xpath=//form[@id='form-personal']/div[9]/div/div/label
    #hotel service fee
    Page Should Contain Element			xpath=//form[@id='form-personal']/div[9]/div/div/input			
    Element Should Be Enabled			xpath=//form[@id='form-personal']/div[9]/div/div/input
    #checkbox hotel service fee (flat)	
    Page Should Contain Element			xpath=//form[@id='form-personal']/div[9]/div[2]/div/input		
    Checkbox Should Be Selected			xpath=//form[@id='form-personal']/div[9]/div[2]/div/input
    #checkbox hotel service fee (percentage)		
    Page Should Contain Element			xpath=//form[@id='form-personal']/div[9]/div[2]/div/input[2]		
    Checkbox Should Not Be Selected		xpath=//form[@id='form-personal']/div[9]/div[2]/div/input[2]	
    #label hide payment detail
    Page Should Contain Element			xpath=//form[@id='form-personal']/div[10]/div/div/label	
    #checkbox hide payment detail (yes)
    Page Should Contain Element			xpath=//form[@id='form-personal']/div[10]/div[2]/div/input			
    Checkbox Should Be Selected			xpath=//form[@id='form-personal']/div[10]/div[2]/div/input
    #checkbox hide payment detail (no)		
    Page Should Contain Element			xpath=//form[@id='form-personal']/div[10]/div[2]/div/input[2]		
    Checkbox Should Not Be Selected		xpath=//form[@id='form-personal']/div[10]/div[2]/div/input[2]
    #label logo
    Page Should Contain Element			xpath=//form[@id='form-personal']/div[11]/div/div/label
    #logo
    Page Should Contain Element			xpath=//form[@id='form-personal']/div[11]/div/div/input
    #tombol browse file
    Page Should Contain Element			xpath=//form[@id='form-personal']/div[11]/div/div/span
    #label receipt footer
    Page Should Contain Element			xpath=//form[@id='form-personal']/div[12]/div/div/label
    #receipt footer
    Page Should Contain Element			xpath=//form[@id='form-personal']/div[12]/div/div/textarea
    #tombol Submit		
    Page Should Contain Button			sizzle=button.btn.btn-primary.tutorial_T_office_profile_save_html
    Element Should Be Visible			sizzle=button.btn.btn-primary.tutorial_T_office_profile_save_html
    #tombol Preview Receipt	
    Page Should Contain Button			sizzle=button.btn.btn-primary.tutorial_T_office_profile_receipt_html		
    Element Should Be Visible			sizzle=button.btn.btn-primary.tutorial_T_office_profile_receipt_html
    #attraction service fee	
    #Page Should Contain					Attraction service fee
    #flexy service fee
    #Page Should Contain					Flexy service fee
    #tombol Start Tutorial
    #start tutorial
    #elemen article
    Page Should Contain Element			xpath=//div[@id='main-content']/div/div/h3
    Page Should Contain Element			xpath=//div[@id='main-content']/div/div/article
    #mengisi data office profile
    Data office profile
    
User_profile
	#user profile input
    Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Csettings%5Cuserprofile%5Ccase01
    #common input
    Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    Go To								${USERPROFILE_URL}  	       
    Title Should Be						Settings - Voltras Agent Network
    Location Should Be					${USERPROFILE_URL}
    #elemen yang wajib ada di setiap halaman
    Isi halaman
    #pengaturan user profile
    #username
    Page Should Contain Element			xpath=//form[@id='form-password']/div/div/div/input	
    Element Should Be Visible			xpath=//form[@id='form-password']/div/div/div/input
    Element Should Be Disabled			xpath=//form[@id='form-password']/div/div/div/input
    #old password		
    Page Should Contain Element			xpath=//form[@id='form-password']/div[2]/div/div/input 	
    Element Should Be Visible			xpath=//form[@id='form-password']/div[2]/div/div/input 
    Element Should Be Enabled			xpath=//form[@id='form-password']/div[2]/div/div/input 
#-----------------------------------------------------------------------------------------------------------------------------------------------
	${pass}=  							Get WebElement  		oldpass
	${TYPEPASSWORD}=				 	set variable			${pass.get_attribute('type')} 
    Should Be Equal   					${TYPEPASSWORD}   												password
#-----------------------------------------------------------------------------------------------------------------------------------------------
	#new password    
    Page Should Contain Element			xpath=//form[@id='form-password']/div[3]/div/div/input 	
    Element Should Be Visible			xpath=//form[@id='form-password']/div[3]/div/div/input
    Element Should Be Enabled			xpath=//form[@id='form-password']/div[3]/div/div/input
    #confirm new password		    
    Page Should Contain Element			xpath=//form[@id='form-password']/div[4]/div/div/input		
    Element Should Be Visible			xpath=//form[@id='form-password']/div[4]/div/div/input	
    Element Should Be Enabled			xpath=//form[@id='form-password']/div[4]/div/div/input
    #tombol save password			
    Page Should Contain Button			sizzle=button.btn.btn-primary.tutorial_R_user_profile_password_savepassword_html	
    Element Should Be Visible			sizzle=button.btn.btn-primary.tutorial_R_user_profile_password_savepassword_html			
#-----------------------------------------------------------------------------------------------------------------------------------------------
	#pengaturan user email
	#username
    Page Should Contain Element			xpath=//form[@id='form-email']/div/div/div/input	
    Element Should Be Visible			xpath=//form[@id='form-email']/div/div/div/input	
    Element Should Be Disabled			xpath=//form[@id='form-email']/div/div/div/input
    #old email address			  
    Page Should Contain Element			xpath=//form[@id='form-email']/div[2]/div/div/input		
    Element Should Be Visible			xpath=//form[@id='form-email']/div[2]/div/div/input	
    Element Should Be Disabled			xpath=//form[@id='form-email']/div[2]/div/div/input
    #new email address			
    Page Should Contain Element			xpath=//form[@id='form-email']/div[3]/div/div/input			
    Element Should Be Visible			xpath=//form[@id='form-email']/div[3]/div/div/input	
    Element Should Be Enabled			xpath=//form[@id='form-email']/div[3]/div/div/input
    #tombol save email
    Page Should Contain Button			sizzle=button.btn.btn-primary.tutorial_R_user_profile_password_savepassword_html
    Element Should Be Visible			sizzle=button.btn.btn-primary.tutorial_R_user_profile_password_savepassword_html
    #tombol Start Tutorial
    #start tutorial
    #elemen article
    Page Should Contain Element			xpath=//div[@id='main-content']/div/div/h3
    Page Should Contain Element			xpath=//div[@id='main-content']/div/div/article
    Page Should Contain Element			xpath=//div[@id='main-content'][2]/div/div/h3
    Page Should Contain Element			xpath=//div[@id='main-content'][2]/div/div/article
    #mengisi data user profile dan user email	
    Data user profile
    
User_maintenance
	#user maintenance input
    Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Csettings%5Cusermaintenance%5Ccase01
    #common input
    Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    Go To								${USERMAINTENANCE_URL}     	
    Title Should Be						Settings - Voltras Agent Network
    Location Should Be					${USERMAINTENANCE_URL}
    #elemen yang wajib ada di setiap halaman 
   	Isi halaman	
   	#tombol add user		
    Page Should Contain Button			sizzle=button.btn.btn-primary.btn-cons.tutorial_L_user_maintain_buttonadd_html
    Element Should Be Visible			sizzle=button.btn.btn-primary.btn-cons.tutorial_L_user_maintain_buttonadd_html
    #username						
    Page Should Contain Element			xpath=//table[@id='tableWithSearch-userlist']/thead/tr/th		
    Element Should Be Visible			xpath=//table[@id='tableWithSearch-userlist']/thead/tr/th
    #full name		
    Page Should Contain Element			xpath=//table[@id='tableWithSearch-userlist']/thead/tr/th[2]			
    Element Should Be Visible			xpath=//table[@id='tableWithSearch-userlist']/thead/tr/th[2]
    #email address
    Page Should Contain Element			xpath=//table[@id='tableWithSearch-userlist']/thead/tr/th[3]		
    Element Should Be Visible			xpath=//table[@id='tableWithSearch-userlist']/thead/tr/th[3]
    #isian username					
    Page Should Contain Element			xpath=//table[@id='tableWithSearch-userlist']/tbody/tr/td	
    Element Should Be Visible			xpath=//table[@id='tableWithSearch-userlist']/tbody/tr/td
    #isian full name		
    Page Should Contain Element			xpath=//table[@id='tableWithSearch-userlist']/tbody/tr/td[2]	
    Element Should Be Visible			xpath=//table[@id='tableWithSearch-userlist']/tbody/tr/td[2]
    #isian email address	
    Page Should Contain Element			xpath=//table[@id='tableWithSearch-userlist']/tbody/tr/td[3]	
    Element Should Be Visible			xpath=//table[@id='tableWithSearch-userlist']/tbody/tr/td[3]
    #tombol edit user	
    Page Should Contain Element			xpath=//table[@id='tableWithSearch-userlist']/tbody/tr/td[4]/form/button	
    Element Should Be Visible			xpath=//table[@id='tableWithSearch-userlist']/tbody/tr/td[4]/form/button
    #Showing 1 to 5 of 68 entries
    Page Should Contain Element			xpath=//div[@id='tableWithSearch-userlist_info' and @class='dataTables_info']
    Element Should Be Visible			xpath=//div[@id='tableWithSearch-userlist_info' and @class='dataTables_info']
    #paging
    Page Should Contain Element			xpath=//div[@id='tableWithSearch-userlist_paginate']
    Element Should Be Visible			xpath=//div[@id='tableWithSearch-userlist_paginate']
    #User Quota 999 current 68
    Page Should Contain Element			xpath=//div[@id='tableWithDynamicRows_info' and @class='dataTables_info']
    Element Should Be Visible			xpath=//div[@id='tableWithDynamicRows_info' and @class='dataTables_info']
    #tombol Start Tutorial
    #start tutorial
    #elemen article
    Page Should Contain Element			xpath=//div[@id='main-content']/div/div/h3
    Page Should Contain Element			xpath=//div[@id='main-content']/div/div/article
    #mengisi data user maintenance 
    Data user maintenance
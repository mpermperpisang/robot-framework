*** Settings ***
Documentation    	Test suite availability
...					Menggunakan keyword dan variable dari resource.robot
...					Pengaturan awal test suite agar browser terbuka menggunakan Suite Setup
...					Untuk menjalankan test case satu persatu gunakan line robot -t (nama test case) (direktori test suite)
Suite Setup       	Buka browser
#Suite Teardown    	Tutup browser
| Resource | 		resource.robot

*** Test Cases ***    
availability_flight
	#berisi assert field jumlah pax dan fare (karena halamannya sama maka dijadikan 1 case)
	:FOR    ${INDEX}    	IN RANGE    		0				7
	\	${NAME}=			Evaluate			${INDEX}+1	
	#availability input
	\	Go To				${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Cavailability%5Ccase0${NAME}
	#common input
    \	Go To				${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
	\	Go To				${AVAIL_URL}
    #harus mengandung elemen yang wajib ada di setiap halaman
    #\	Isi halaman
    \	Page Should Contain Element				xpath=//div[contains(@class,'panel-body p-l-5 p-r-5 p-b-5 p-t-5')]
    \	Run Keyword If		${NAME}				fare${NAME}
    
copyfare_flight	
	:FOR    ${INDEX}    	IN RANGE    		0				1
	\	${NAME}=			Evaluate			${INDEX}+1	
	#copy fare input
	\	Go To									${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccopyfare%5Ccase0${NAME}
	#common input
    \	Go To									${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    \	Go To									${AVAIL_URL}
    #elemen dialog copy fare summary tidak boleh ada sebelum tombol Copy fare ditekan
    \	Element Should Not Be Visible			sizzle=div#fareSummaryCopyModal.modal.fade.slide-up.disable-scroll.in
    #elemen tombol copy fare summary
    \	Click Button							xpath=//button[contains(@class,'btn btn-xs btn-primary inline')]
    #elemen dialog copy fare summary harus ada setelah tombol Copy fare ditekan
    \	Element Should Be Visible				sizzle=div#fareSummaryCopyModal.modal.fade.slide-up.disable-scroll.in
    #elemen Copy Fare Summary
    \	Element Should Be Visible				xpath=//div[@id='fareSummaryCopyModal']/div/div/div/div/h5/span		
    #field copy fare
    \	Element Should Be Visible				xpath=//textarea[@id='copyNote']
    #tombol copy
    \	Page Should Contain Button				sizzle=button#copyFareButton.btn.btn-xs.btn-primary.inline
    \	Element Should Be Visible				sizzle=button#copyFareButton.btn.btn-xs.btn-primary.inline
    #tombol cancel
    \	Page Should Contain Button				sizzle=button#copyFareCancelButton.btn.btn-xs.btn-primary.inline
    \	Element Should Be Visible				sizzle=button#copyFareCancelButton.btn.btn-xs.btn-primary.inline
    #karena belum nembak service fare maka field inputan di dalam copy fare belum bisa diassert (detaildata.robot)
    #Data copyfare
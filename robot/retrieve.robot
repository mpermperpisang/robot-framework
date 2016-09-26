*** Settings ***
Documentation    	Test suite retrieve pnr
...					Menggunakan keyword dan variable dari resource.robot
...					Pengaturan awal test suite agar browser terbuka menggunakan Suite Setup
...					Untuk menjalankan test case satu persatu gunakan line robot -t (nama test case) (direktori test suite)
Suite Setup       	Buka browser
#Suite Teardown    	Tutup browser
| Resource | 		resource.robot

*** Test Cases ***
retrieve_bydate_flight	
	:FOR    ${INDEX}    	IN RANGE    	0				11
	\	${NAME}=			Evaluate		${INDEX}+1	
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Cretrieve%5Ccase0${NAME}
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    \	Go To								${RETRIEVE_URL}
    \	Title Should Be						PNR List - Voltras Agent Network
    \	Location Should Be					${RETRIEVE_URL}
	\	Isi halaman
	#Home>(nama menu)
	\	List menu
	#elemen label PNR List
	\	Page Should Contain Element			xpath=//div[@class='content']/div[2]/h3
	#elemen label List All PNR
	\	Page Should Contain Element			xpath=//div[@class='content']/div[2]
	#elemen label LIST BY
	\	Page Should Contain Element			xpath=//form[@id='form-work']/div/div/label
	#element list transportation (all airline)
	\	Page Should Contain Element			xpath=//form[@id='form-work']/div/div/div/div/div/div/ul/li
	\	Click Element						xpath=//form[@id='form-work']/div/div/div/div/div/span
	#element list transportation (QG)
	\	Page Should Contain Element			xpath=//form[@id='form-work']/div/div/div/div/div/div/ul/li[2]
	\	Element Text Should Be				xpath=//form[@id='form-work']/div/div/div/div/div/div/ul/li[2]/span			QG - Citilink
	#element list transportation (SJ)
	\	Page Should Contain Element			xpath=//form[@id='form-work']/div/div/div/div/div/div/ul/li[3]
	#\	Element Text Should Be				xpath=//form[@id='form-work']/div/div/div/div/div/div/ul/li[3]/span			SJ - Sriwijaya Air
	#element list transportation (GA)
	\	Page Should Contain Element			xpath=//form[@id='form-work']/div/div/div/div/div/div/ul/li[4]
	#\	Element Text Should Be				xpath=//form[@id='form-work']/div/div/div/div/div/div/ul/li[4]/span			GA - Garuda Indonesia
	#element list transportation (JT)
	\	Page Should Contain Element			xpath=//form[@id='form-work']/div/div/div/div/div/div/ul/li[5]
	#\	Element Text Should Be				xpath=//form[@id='form-work']/div/div/div/div/div/div/ul/li[5]/span			JT - Lion Air
	#element list transportation (1B)
	\	Page Should Contain Element			xpath=//form[@id='form-work']/div/div/div/div/div/div/ul/li[6]
	#\	Element Text Should Be				xpath=//form[@id='form-work']/div/div/div/div/div/div/ul/li[6]/span			1B - International Airline
	#element list transportation (QZ)
	\	Page Should Contain Element			xpath=//form[@id='form-work']/div/div/div/div/div/div/ul/li[7]
	#\	Element Text Should Be				xpath=//form[@id='form-work']/div/div/div/div/div/div/ul/li[7]/span			QZ - Air Asia
	#element list transportation (KA)
	\	Page Should Contain Element			xpath=//form[@id='form-work']/div/div/div/div/div/div/ul/li[8]
	#\	Element Text Should Be				xpath=//form[@id='form-work']/div/div/div/div/div/div/ul/li[8]/span			KA - Train
	#elemen radio button booking date
	\	Page Should Contain Radio Button	xpath=//form[@id='form-work']/div/div[2]/div/div/input
	#elemen label pilihan BOOKING DATE
	\	Page Should Contain Element			xpath=//form[@id='form-work']/div/div[2]/div/div/label
	#elemen label FROM
	\	Page Should Contain Element			xpath=//form[@id='form-work']/div/div[2]/label
	#elemen field from retrieve date
	\	Page Should Contain Element			xpath=//form[@id='form-work']/div/div[2]/div[2]/div/input
	\	Page Should Contain Element			xpath=//form[@id='form-work']/div/div[2]/div[2]/div/span/i
	#elemen label TO
	\	Page Should Contain Element			xpath=//form[@id='form-work']/div/div[2]/label[2]
	#element field to retrieve date
	\	Page Should Contain Element			xpath=//form[@id='form-work']/div/div[2]/div[3]/div/input
	\	Page Should Contain Element			xpath=//form[@id='form-work']/div/div[2]/div[3]/div/span/i
	#elemen label status
	\	Page Should Contain Element			xpath=//form[@id='form-work']/div/div[2]/label[3]
	#elemen list status pnr (all status)
	\	Page Should Contain Element			xpath=//form[@id='form-work']/div/div[2]/div[4]/div/div/div/ul/li
	#elemen	list status pnr	(TICKETED)	
	\	Page Should Contain Element			xpath=//form[@id='form-work']/div/div[2]/div[4]/div/div/div/ul/li[2]
	#\	Element Text Should Be				xpath=//form[@id='form-work']/div/div[2]/div[4]/div/div/div/ul/li[2]/span		TICKETED		
	#elemen	list status pnr	(BOOKED)	
	\	Page Should Contain Element			xpath=//form[@id='form-work']/div/div[2]/div[4]/div/div/div/ul/li[3]
	#\	Element Text Should Be				xpath=//form[@id='form-work']/div/div[2]/div[4]/div/div/div/ul/li[3]/span		BOOKED	
	#elemen	list status pnr	(CANCELED)	
	\	Page Should Contain Element			xpath=//form[@id='form-work']/div/div[2]/div[4]/div/div/div/ul/li[4]
	#\	Element Text Should Be				xpath=//form[@id='form-work']/div/div[2]/div[4]/div/div/div/ul/li[4]/span		CANCELED
	#elemen radio button booking code
	\	Page Should Contain Element			xpath=//form[@id='form-work']/div/div[3]/div/div/input
	#elemen label pilihan BOOKING CODE
	\	Page Should Contain Element			xpath=//form[@id='form-work']/div/div[3]/div/div/label
	#elemen field booking code
	\	Page Should Contain Element			xpath=//form[@id='form-work']/div/div[3]/div[2]/input
	#elemen tombol Retrieve
	\	Page Should Contain Button			xpath=//form[@id='form-work']/div/div[3]/div[4]/button
	\	Element Text Should Be				xpath=//form[@id='form-work']/div/div[3]/div[4]/button							Retrieve
	#elemen Note
	\	Page Should Contain Element			xpath=//div[@class='content']/div[3]/div/div[2]/div/span
	#elemen tombol export
	\	${count}=	Get Matching Xpath Count		xpath=//div[@class='content']/div[3]/div/div[3]/div/div/div/strong
	\	Element Text Should Be				xpath=//button[@id='modalSlideUp1']												Export
	\	Run Keyword If						${count}==0			export button
	\	...		ELSE IF						${count}==1			no export button														
	#elemen list pnr	
	\	Run Keyword If						${count}==0			detail list pnr
	\	...		ELSE IF						${count}==1			no detail list pnr
	#isi data list pnr (karena belum mengarah ke service jadi belum bisa diassert by robot)
	#Data list pnr
	#\	Pause Execution
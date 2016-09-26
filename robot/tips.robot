*** Settings ***
Documentation    	Test suite berisi tips dari sesosok Chelsy
...					Menggunakan keyword dan variable dari resource.robot
...					Pengaturan awal test suite agar browser terbuka menggunakan Suite Setup
...					Untuk menjalankan test case satu persatu gunakan line robot -t (nama test case) (direktori test suite)
Suite Setup       	Buka browser
#Suite Teardown    	Tutup browser
| Resource | 		resource.robot

*** Test Cases ***
List_chelsy
    #common input
    Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    #office profile input
    Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ctips%5Ccase01
    Go To								${LISTTIPS_URL}
    Title Should Be						Tips Chelsi - Voltras Agent Network
    Location Should Be					${LISTTIPS_URL}
	Isi halaman
	#Home>(nama menu)
	List menu header
	Element Text Should Be				xpath=//div[@class='content']/div[2]/ul/li[2]/a			TIPS CHELSY
	Header menu
	Element Text Should Be				xpath=//div[@class='content']/div[2]/h3					Tips Chelsy
	Date Subyek
	Content list
	Element Text Should Be				xpath=//span[contains(@class,'label label-info font-montserrat fs-11')]		TIPS CHELSI
	Paging
	
Chelsy
    #common input
    Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    #office profile input
    Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ctips%5Ccase02
    Go To								${TIPS_URL}
    Title Should Be						Tips Chelsi - Voltras Agent Network
    Location Should Be					${TIPS_URL}
	Isi halaman
	#Home>(nama menu)
	List menu header
	Element Text Should Be				xpath=//div[@class='content']/div[2]/ul/li[2]/a			TIPS CHELSY
	Header menu
	Element Text Should Be				xpath=//div[@class='content']/div[2]/h3					Tips Chelsy
	Date Subyek	
	Element Text Should Be				xpath=//span[contains(@class,'label label-info font-montserrat fs-11')]		TIPS CHELSI
	Indeks
	#elemen content tips
	Page Should Contain Element			xpath=//div[@id='content']
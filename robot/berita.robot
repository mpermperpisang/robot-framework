*** Settings ***
Documentation    	Test suite berisi halaman news
...					Menggunakan keyword dan variable dari resource.robot
...					Pengaturan awal test suite agar browser terbuka menggunakan Suite Setup
...					Untuk menjalankan test case satu persatu gunakan line robot -t (nama test case) (direktori test suite)
Suite Setup       	Buka browser
#Suite Teardown    	Tutup browser
| Resource | 		resource.robot

*** Test Cases ***
List_berita
    #common input
    Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    #list news input
    Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Cnews%5Ccase01
    Go To								${LISTNEWS_URL}
    Title Should Be						News - Voltras Agent Network
    Location Should Be					${LISTNEWS_URL}
	Isi halaman
	#Home>(nama menu)
	List menu header
	Header menu
	Date Subyek
	Kategori news
	Content list
	Paging
	
Berita
    #common input
    Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    #news detail input
    Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Cnews%5Ccase02
    Go To								${NEWS_URL}
    Title Should Be						News - Voltras Agent Network
    Location Should Be					${NEWS_URL}
	Isi halaman
	#Home>(nama menu)
	List menu header
	Header menu
	Date Subyek
	Kategori news	
	Indeks		
	#elemen older
	Page Should Contain Element			xpath=//div[contains(@class,'row full-width center-margin')]/ul/li[3]
	#elemen content news
	Page Should Contain Element			xpath=//div[contains(@class,'col-lg-12 col-md-12')]
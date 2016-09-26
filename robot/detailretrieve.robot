*** Settings ***
Documentation    	resource detail retrieve
...					Menggunakan keyword dan variable dari resource.robot
...					Pengaturan awal test suite agar browser terbuka menggunakan Suite Setup
...					Untuk menjalankan test case satu persatu gunakan line robot -t (nama test case) (direktori test suite)

*** Keywords ***
#Pengaturan detail di halaman pnr list
detail list pnr
	#label ID
	Page Should Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div/div/div/span
	Element Text Should Be				xpath=//div[@class='content']/div[3]/div/div[3]/div/div/div/div/span									ID
	#nomor ID contoh #5165 
	Page Should Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div/div/div
	#label Airline
	Page Should Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div/div/div[2]/span
	#nama airline
	Page Should Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div/div/div[2]/strong
	#label Ticket Number
	Page Should Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div/div/div[3]/span
	#nomor tiket
	Page Should Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div/div/div[3]
	#label Booking Date
	Page Should Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div/div/div[4]/span 
	#waktu booking
	Page Should Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div/div/div[4]
	#label Name
	Page Should Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div[2]/div/div/span
	#daftar nama penumpang
	Page Should Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div[2]/div/div
	#label Route
	Page Should Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div[2]/div/div[2]/span
	#rute penerbangan
	Page Should Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div[2]/div/div[2]/strong
	#label Booking Code
	Page Should Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div[2]/div/div[3]/span
	#kode booking
	Page Should Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div[2]/div/div[3]
	#Timelimit
	Page Should Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div[2]/div/div[4]/span
	#batas waktu
	Page Should Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div[2]/div/div[4]
	#label Total Fare
	Page Should Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div[3]/div/div/span  
	#jumlah fare
	Page Should Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div[3]/div/div
	#label NTSA
	Page Should Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div[3]/div/div[2]/span
	#jumlah NTSA
	Page Should Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div[3]/div/div[2]
	#label Commission
	Page Should Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div[3]/div/div[3]/span
	#jumlah komisi
	Page Should Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div[3]/div/div[3]
	#label Status
	Page Should Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div[3]/div/div[4]/span
	#status PNR
	Page Should Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div[3]/div/div[4]
	#tombol Open
	Page Should Contain Button			xpath=//form[@action='retrievePNRaction']/button
#============================================================================================================================================================================  
no detail list pnr
	#label ID
	Page Should Not Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div/div/div/span
	Element Should Not Contain				xpath=//div[@class='content']/div[3]/div/div[3]/div/div/div/div/span									ID
	#nomor ID contoh #5165 
	Page Should Not Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div/div/div
	#label Airline
	Page Should Not Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div/div/div[2]/span
	#nama airline
	Page Should Not Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div/div/div[2]/strong
	#label Ticket Number
	Page Should Not Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div/div/div[3]/span
	#nomor tiket
	Page Should Not Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div/div/div[3]
	#label Booking Date
	Page Should Not Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div/div/div[4]/span 
	#waktu booking
	Page Should Not Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div/div/div[4]
	#label Name
	Page Should Not Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div[2]/div/div/span
	#daftar nama penumpang
	Page Should Not Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div[2]/div/div
	#label Route
	Page Should Not Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div[2]/div/div[2]/span
	#rute penerbangan
	Page Should Not Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div[2]/div/div[2]/strong
	#label Booking Code
	Page Should Not Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div[2]/div/div[3]/span
	#kode booking
	Page Should Not Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div[2]/div/div[3]
	#Timelimit
	Page Should Not Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div[2]/div/div[4]/span
	#batas waktu
	Page Should Not Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div[2]/div/div[4]
	#label Total Fare
	Page Should Not Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div[3]/div/div/span  
	#jumlah fare
	Page Should Not Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div[3]/div/div
	#label NTSA
	Page Should Not Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div[3]/div/div[2]/span
	#jumlah NTSA
	Page Should Not Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div[3]/div/div[2]
	#label Commission
	Page Should Not Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div[3]/div/div[3]/span
	#jumlah komisi
	Page Should Not Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div[3]/div/div[3]
	#label Status
	Page Should Not Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div[3]/div/div[4]/span
	#status PNR
	Page Should Not Contain Element			xpath=//div[@class='content']/div[3]/div/div[3]/div/div[3]/div/div[4]
	#tombol Open
	Page Should Not Contain Button			xpath=//form[@action='retrievePNRaction']/button
	#pesan retrieve tidak ditemukan
	Page Should Contain Element				xpath=//div[@class='content']/div[3]/div/div[3]/div/div/div/strong 
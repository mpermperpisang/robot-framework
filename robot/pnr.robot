*** Settings ***
Documentation    	Test suite berisi pnr dengan status booked, canceled dan ticketed
...					Menggunakan keyword dan variable dari resource.robot
...					Pengaturan awal test suite agar browser terbuka menggunakan Suite Setup
...					Untuk menjalankan test case satu persatu gunakan line robot -t (nama test case) (direktori test suite)
Suite Setup       	Buka browser
#Suite Teardown    	Tutup browser
| Resource | 		resource.robot

*** Test Cases ***
PNR_flight
	${id}=					set variable		5301
	:FOR    ${INDEX}    	IN RANGE    		0				20
	\	${NAME}=			Evaluate			${INDEX}+1	
	#menjadikan variable INDEX dan NAME dapat dipakai selama masih dalam 1 suite case
	\	Set Suite Variable	${INDEX}
	\	Set Suite Variable	${NAME}
	#pnr input
	\	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Cpnr%5Ccase0${NAME}
	#common input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    #menuju url pnr
    \	Go To								${PNR_URL}?id=${id}&transportationType=airline
    \	Title Should Be						Passenger Name Record - Voltras Agent Network
    \	Location Should Be					${PNR_URL}?id=${id}&transportationType=airline
	\	${id}=			Evaluate			${id}+1	
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    #mengambil data dari file TransportationRetrieveByIdResponse.txt
    \	${json}= 							Get file 		C:/Users/User/workspace/van-web4/WebContent/test/pnr/case0${NAME}/input/TransportationRetrieveByIdResponse.txt
    \	${object}= 							Evaluate 		json.loads('''${json}''') 			json
    \	Set Suite Variable	${json}
    \	Set Suite Variable	${object}
    #mengambil kode airline
	\	${namaairline}=						set variable	${object['itinerary']['airlineCode']}
	\	Set Suite Variable					${namaairline}
	#mengambil data dari file GetTransportationDataResponse.txt
    \	${json2}= 							Get file 		C:/Users/User/workspace/van-web4/WebContent/test/commoninput/input/GetTransportationDataResponse.txt
    \	${obyek}= 							Evaluate 		json.loads('''${json2}''') 			json
    \	Set Suite Variable					${json2}
    \	Set Suite Variable					${obyek}
    #mengambil data class airline yang mendukung edit seat
    \	${itung}=	Get Length				${obyek['mapTransportation']['${namaairline}']['listAvailableBlockSeatClass']}
    \	Run Keyword If						${itung}<>0		listClass
    \	...		ELSE IF						${itung}==0		no listClass
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
    #harus mengandung elemen yang wajib ada di setiap halaman
    #\	Isi halaman
    #elemen gambar airline
    \	Page Should Contain Image			xpath=//img[@src='images/${namaairline}.jpg']
    #elemen label BOOKING CODE
    \	Page Should Contain Element			xpath=//div[@class='panel-heading']/div/div[2]/h4/span
    #elemen kode booking
    \	Page Should Contain Element			xpath=//div[@class='panel-heading']/div/div[2]/h4/span[2]
    #elemen label STATUS
    \	Page Should Contain Element			xpath=//div[@class='panel-heading']/div/div[2]/h4[2]/span
    #karena status dalam In dan En sama saja maka tidak diassert di language
    \	Element Text Should Be				xpath=//div[@class='panel-heading']/div/div[2]/h4[2]/span						STATUS
    #elemen status booking
    \	Page Should Contain Element			xpath=//div[@class='panel-heading']/div/div[2]/h4[2]/span[2]
    #elemen label timelimit  
    \	Page Should Contain Element			xpath=//div[@class='panel-heading']/div/div[2]/h5/span
    #elemen waktu timelimit 
    \	Page Should Contain Element			xpath=//div[@class='panel-heading']/div/div[2]/h5/span[2] 
    #elemen BOOKED by  
    \	Page Should Contain Element			xpath=//div[@class='panel-body']/div/div/h5/span  
    #elemen label RESERVATION DETAIL	    
    \	Page Should Contain Element			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[2]/div/h4/span
    #elemen label PASSENGER DETAIL
    \	Page Should Contain Element			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/h4/span	 
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 	\	${listpax}=				Get Length	${object['itinerary']['listPassenger']}
    \	Set Suite Variable					${listpax}
	\	Run Keyword If						${listpax}<>0							detail penumpang    
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#remark
	\	${jsoncount}=	Get Length			(${object['itinerary']['listRemark']})
    \	Run Keyword If						${jsoncount}<>4							Remark
    \	...		ELSE IF						${jsoncount}==4							No remark
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#elemen label CONTACT DETAIL
    \	Page Should Contain Element			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[2]/div/h4/span
    #elemen nama kontak
    \	Page Should Contain Element			xpath=//div[@class='panel-body']/div/div/div/div/h5
    #elemen nomor telepon kontak										
    \	Page Should Contain Element			xpath=//div[@class='panel-body']/div/div/div/div[2]/h5
    #elemen label FARE DETAIL
    \	Page Should Contain Element			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[3]/div/h4/span
    #elemen label NTSA									 									
    \	Page Should Contain Element			xpath=//div[@class='panel-body']/div/div/table/thead/tr/th[2]										
    \	Element Text Should Be				xpath=//div[@class='panel-body']/div/div/table/thead/tr/th[2]						NTSA
    #elemen label COMMISSION
    \	Page Should Contain Element			xpath=//div[@class='panel-body']/div/div/table/thead/tr/th[3]
    #elemen label DISCOUNT						
    \	Page Should Contain Element			xpath=//div[@class='panel-body']/div/div/table/thead/tr/th[4]
    #elemen label PAX PAID						
    \	Page Should Contain Element			xpath=//div[@class='panel-body']/div/div/table/thead/tr/th[5]						
    \	Element Text Should Be				xpath=//div[@class='panel-body']/div/div/table/thead/tr/th[5]						PAX PAID
    #elemen label AIRLINE TICKET
    \	Page Should Contain Element			xpath=//div[@class='panel-body']/div/div/table/tbody/tr/th    
    \	Page Should Contain Element			xpath=//div[@class='panel-body']/div/div/table/tbody/tr/td    
    \	Page Should Contain Element			xpath=//div[@class='panel-body']/div/div/table/tbody/tr/td[2]    
    \	Page Should Contain Element			xpath=//div[@class='panel-body']/div/div/table/tbody/tr/td[3]    
    \	Page Should Contain Element			xpath=//div[@class='panel-body']/div/div/table/tbody/tr/td[4]  
    #elemen label TRAVEL INSURANCE
    \	Page Should Contain Element			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[2]/th
    \	Page Should Contain Element			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[2]/td
    \	Page Should Contain Element			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[2]/td[2]
    \	Page Should Contain Element			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[2]/td[3]
    \	Page Should Contain Element			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[2]/td[4]
    #elemen label SERVICE FEE				        
    \	Page Should Contain Element			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[3]/th
    \	Page Should Contain Element			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[3]/td
    \	Page Should Contain Element			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[3]/td[2]
    \	Page Should Contain Element			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[3]/td[3]
    \	Page Should Contain Element			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[3]/td[4]
    #elemen label TOTAL			
    \	Page Should Contain Element			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[4]/th
    \	Element Text Should Be				xpath=//div[@class='panel-body']/div/div/table/tbody/tr[4]/th						TOTAL
    \	Page Should Contain Element			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[4]/td
    \	Page Should Contain Element			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[4]/td[2]
    \	Page Should Contain Element			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[4]/td[3]
    \	Page Should Contain Element			xpath=//div[@class='panel-body']/div/div/table/tbody/tr[4]/td[4]  
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#melihat status PNR
    \	${STATUS}=							set variable									${object['itinerary']['status']}
    \	Set Suite Variable					${STATUS}
	\	Run Keyword If 						'${STATUS}'=='BOOKED'							Status Booked		#kalau status=BOOKED, tombol-tombol yang harus/tidak boleh ada, ada di keyword Status Booked
	\	...		ELSE IF 					'${STATUS}'=='CANCELED'							Status Canceled		#kalau status=CANCELED, tombol-tombol yang harus/tidak boleh ada, ada di keyword Status Canceled
	\	...		ELSE IF						'${STATUS}'=='TICKETED'							Status Ticketed 	#kalau status=TICKETED, tombol-tombol yang harus/tidak boleh ada, ada di keyword Status Ticketed
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#tombol-tombol
	#tombol seat selection ada di detailpnr.robot keyword class airline
    #mengambil nama class
	\	Select seat
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
	#Split Reservation (split pax berdasarkan maskapai GA, JT, SJ, KD, IL, MV)
	\	Run Keyword If						('${STATUS}'=='BOOKED' and '${obyek['mapTransportation']['${namaairline}']['supportSplit']}'=='True')					Split reservation
    \	...		ELSE IF						('${STATUS}'=='BOOKED' and '${obyek['mapTransportation']['${namaairline}']['supportSplit']}'=='False')					No split reservation 
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#Edit Baggage (edit bagasi berdasarkan maskapai QG dan QZ) 
    \	Run Keyword If						('${STATUS}'=='BOOKED' and '${obyek['mapTransportation']['${namaairline}']['baggageOptionEnabled']}'=='true')			Edit baggage
    \	...		ELSE IF						('${STATUS}'=='BOOKED' and '${obyek['mapTransportation']['${namaairline}']['baggageOptionEnabled']}'=='false')			No edit baggage
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#Print reservation
    \	Run Keyword If						('${object['itinerary']['status']}' == 'BOOKED')								Print reservation
    \	...		ELSE IF						('${object['itinerary']['status']}' <> 'BOOKED')								No print reservation
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#Print tickket
    \	Run Keyword If						('${object['itinerary']['status']}' == 'TICKETED')								Print ticket
    \	...		ELSE IF						('${object['itinerary']['status']}' <> 'TICKETED')								No print ticket
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#Print Polis (hanya tampil jika status=TICKETED dan insurance<>0)
	#mengambil amount insurance untuk dijadikan variable
    \	${polis}=	Convert To String				${object['itinerary']['insuranceTotal']}
    \	${polis2}=	Replace String	${polis}	.	${EMPTY}
    #membandingkan amount insurance yang ada di response dengan yang ada di UI
    \	Should Be Equal						${object['itinerary']['insuranceTotal']}			${polis2}
    \	Run Keyword If						('${object['itinerary']['status']}' == 'TICKETED') and ('${polis}'<>'0')		Print polis
    \	...		ELSE IF						('${object['itinerary']['status']}' <> 'TICKETED')								No print polis
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#Print Receipt (hanya tampil jika status=TICKETED)
    \	Run Keyword If						('${STATUS}' == 'TICKETED')														Print receipt
    \	...		ELSE IF						('${STATUS}' <> 'TICKETED')														No print receipt
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#auto ticket details
   	\	Run Keyword If						('${object['itinerary']['autoPaymentCreationDate']}'<>'None' and '${STATUS}' == 'BOOKED')		Auto tiket
    \	...		ELSE IF						('${object['itinerary']['autoPaymentCreationDate']}'=='None' and '${STATUS}' == 'BOOKED')		No auto tiket
    \	...		ELSE IF						('${object['itinerary']['autoPaymentCreationDate']}'<>'None' and ('${STATUS}' == 'CANCELED' or '${STATUS}' == 'TICKETED'))		No button auto tiket
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	\	Data PNR
	#Sleep 1 detik
    \	Sleep								1s
    
Edit_bagasi
	${id}=					set variable		5301
	:FOR    ${INDEX}    	IN RANGE    		0				4
	\	${NAME}=			Evaluate			${INDEX}+1	
	#menjadikan variable INDEX dan NAME dapat dipakai selama masih dalam 1 suite case
	\	Set Suite Variable	${INDEX}
	\	Set Suite Variable	${NAME}
	#pnr input
	\	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ceditbaggage%5Ccase0${NAME}
	#common input
    \	Go To								${RESPONSE_URL}C%3A%5CUsers%5CUser%5Cworkspace%5Cvan-web4%5CWebContent%5Ctest%5Ccommoninput
    #menuju url pnr
    \	Go To								${PNR_URL}?id=${id}&transportationType=airline
    \	Title Should Be						Passenger Name Record - Voltras Agent Network
    \	Location Should Be					${PNR_URL}?id=${id}&transportationType=airline
	\	${id}=			Evaluate			${id}+1
    #elemen dialog edit bagasi tidak boleh ada sebelum tombol Edit Baggage ditekan
	\	Element Should Not Be Visible		sizzle=div#addBaggage.modal.fade.slide-up.hidden-xs.in
    #elemen tombol edit baggage
	\	Click Button						css=button#add-baggage-button.btn.btn-default.pull-right.btn-sm.m-l-5
    #elemen dialog edit bagasi harus ada setelah tombol Edit Baggage ditekan
	\	Element Should Be Visible			sizzle=div#addBaggage.modal.fade.slide-up.hidden-xs.in
	\	Element Should Be Visible			xpath=//div[@class='modal-content']/div/h3/span
	\	Element Should Be Visible			xpath=//div[@class='modal-content']/div/p
	\	Page Should Contain Element			xpath=//div[@class='modal-content']/div[2]/ul/li/a
	#label Flight Segment
	\	Page Should Contain Element			xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div/div/div/table/thead/tr/th
	#label Current
	\	Page Should Contain Element			xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div/div/div/table/thead/tr/th[2]
	#label Add
	\	Page Should Contain Element			xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div/div/div/table/thead/tr/th[3]
	#label Cost
	\	Page Should Contain Element			xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div/div/div/table/thead/tr/th[4]
	#elemen segmen penerbangan
	\	Page Should Contain Element			xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div/div/div/table/tbody/tr/td
	#elemen jumlah bagasi per segmen saat ini
	\	Page Should Contain Element			xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div/div/div/table/tbody/tr/td[2]
	#elemen tambah bagasi
	\	Page Should Contain Element			xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div/div/div/table/tbody/tr/td[3]
	#elemen biaya tambah bagasi
	\	Page Should Contain Element			xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div/div/div/table/tbody/tr/td[4]
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#mengambil data dari file TransportationRetrieveByIdResponse.txt
    \	${json}= 							Get file 			C:/Users/User/workspace/van-web4/WebContent/test/editbaggage/case0${NAME}/input/TransportationRetrieveByIdResponse.txt
    \	${object}= 							Evaluate 			json.loads('''${json}''') 			json
    \	Set Suite Variable	${json}
    \	Set Suite Variable	${object}    	
	\	${rute}=			Get Length		${object['itinerary']['itemGo']['listTransporter']}
	\	Set Suite Variable	${rute}
	\	${length}=							Get Length			${object['itinerary']['listPassenger']}
	\	Set Suite Variable					${length}
	\	Run Keyword If						${length}>1			bagasi flight
	\	Run Keyword If						${rute}==1			direct bagasi 1 pax
	\	...		ELSE IF						${rute}>1			connect bagasi 1 pax
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#tombol Process
	\	Element Should Be Visible			xpath=//button[contains(@class,'btn btn-success btn-cons semi-bold tutorial_T_pnr_flight_addbaggage_process_html')]
	#tombol Cancel
	\	Element Should Be Visible			xpath=//button[contains(@class,'btn btn-danger btn-cons semi-bold tutorial_T_pnr_flight_addbaggage_cancel_html')]	
	\	Data bagasi
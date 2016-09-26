*** Settings ***
Documentation    	resource detail pnr
...					Menggunakan keyword dan variable dari resource.robot
...					Pengaturan awal test suite agar browser terbuka menggunakan Suite Setup
...					Untuk menjalankan test case satu persatu gunakan line robot -t (nama test case) (direktori test suite)

*** Keywords ***
#Pengaturan frequent flyer GA dan 1B
detail penumpang
	:FOR    ${IDX}    		IN RANGE    	0				${listpax}
	\	${LIST}=			Evaluate		${IDX}+1	
	\	Set Suite Variable	${IDX}
	\	Set Suite Variable	${LIST}	
    #elemen passenger   
    \	Page Should Contain Element			xpath=//a[@class='collapsed']
    #elemen view detail di passenger	
    \	Page Should Contain Element			xpath=//div[@class='panel-heading']/h4/a/span 
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#pemeriksaan nama penumpang
    \	${first}=							Convert To Uppercase				${object['itinerary']['listPassenger'][${IDX}]["firstName"]}
    \	${last}=							Convert To Uppercase				${object['itinerary']['listPassenger'][${IDX}]["lastName"]}   
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	\	Pause Execution						message=View detail (manual). Press OK to continue.	
    #gelar dan nama lengkap penumpang
    \	Element Should Contain				xpath=//div[contains(@class,'panel panel-default col-lg-12')][${LIST}]/div/h4/a				${object['itinerary']['listPassenger'][${IDX}]["title"]}. ${first} ${last}	
	#elemen dob penumpang
	\	Page Should Contain Element			xpath=//div[@id='pas${LIST}']/div/div/div
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#dob penumpang
    \	${dob}=									Convert To String			${object['itinerary']['listPassenger'][${IDX}]['dateOfBirth']}
    \	${repdob}=								Replace String				${dob}		None		${EMPTY}  
    \	Run Keyword If							'${dob}'<>'None'			spasi
    \	...		ELSE IF							'${dob}'=='None'			no spasi
	\	Element Should Contain				xpath=//div[@id='pas${LIST}']/div/div/div										Date of Birth :${SPASI}${repdob}
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#elemen frequent flyer berdasarkan maskapai GA dan 1B 
    \	Run Keyword If						('${obyek['mapTransportation']['${namaairline}']['supportFrequentFlyer']}'=='Y' and '${object['itinerary']['listPassenger'][${IDX}]['type']}'=='ADULT' and '${object['itinerary']['listPassenger'][${IDX}]['type']}'=='CHILD')		frequent flyer
    \	...		ELSE IF						('${obyek['mapTransportation']['${namaairline}']['supportFrequentFlyer']}'<>'Y' or '${object['itinerary']['listPassenger'][${IDX}]['type']}'=='INFANT')		No frequent flyer
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    #nationality penumpang
    \	${nation}=								Convert To String			${object['itinerary']['listPassenger'][${IDX}]['nationality']}
    \	${repnation}=							Replace String				${nation}		None		${EMPTY}  
    \	Run Keyword If							'${nation}'<>'None'			spasi
    \	...		ELSE IF							'${nation}'=='None'			no spasi
    \	Element Should Contain					xpath=//div[@id='pas${LIST}']/div/div/div										Nationality :${SPASI}${repnation}
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    #ID penumpang
    \	${passport}=							Convert To String			${object['itinerary']['listPassenger'][${IDX}]['passportNo']}
    \	${reppassport}=							Replace String				${passport}		None		${EMPTY}   
    \	Run Keyword If							'${passport}'<>'None'		spasi
    \	...		ELSE IF							'${passport}'=='None'		no spasi
    \	Element Should Contain					xpath=//div[@id='pas${LIST}']/div/div/div[2]									Identity/Passport Number :${SPASI}${reppassport}
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    #passport issuing country
    \	${issuing}=								Convert To String			${object['itinerary']['listPassenger'][${IDX}]['passportIssuingCountry']}
    \	${repissuing}=							Replace String				${issuing}		None		${EMPTY}
    \	Run Keyword If							'${issuing}'<>'None'		spasi
    \	...		ELSE IF							'${issuing}'=='None'		no spasi
    \	Element Should Contain					xpath=//div[@id='pas${LIST}']/div/div/div[2]									Passport Issuing Country :${SPASI}${repissuing}
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    #passport expiry date
    \	${expdate}=								Convert To String			${object['itinerary']['listPassenger'][${IDX}]['passportExpiryDate']}
    \	${repexpdate}=							Replace String				${expdate}		None		${EMPTY}
    \	Run Keyword If							'${expdate}'<>'None'		spasi
    \	...		ELSE IF							'${expdate}'=='None'		no spasi
    \	Element Should Contain					xpath=//div[@id='pas${LIST}']/div/div/div[2]									Passport Expiry Date :${SPASI}${repexpdate}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    #label SEAT NUMBER
    \	Page Should Contain Element				xpath=//div[@id='pas${LIST}']/div/div[2]/table/thead/tr/th[2]
 	#nomor tempat duduk
    \	Page Should Contain Element				xpath=//div[@id='pas${LIST}']/div/div[2]/table/tbody/tr/td[2]
    \	${seat}=								Convert To String			${object['itinerary']['listPassenger'][${IDX}]['seat']}
    \	${repseat}=								Replace String				${seat}		None		${EMPTY}  
    \	Element Text Should Be					xpath=//div[@id='pas${LIST}']/div/div[2]/table/tbody/tr/td[2]					${repseat}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    #label BAGGAGE
    \	Page Should Contain Element				xpath=//div[@id='pas${LIST}']/div/div[2]/table/thead/tr/th[3]
    #bagasi
    \	${itung}=	Get Length					${object['itinerary']['listPassenger'][${IDX}]['listPassengerBaggage']}
    \	Run Keyword If							${itung}<>0		Baggage
    \	...		ELSE IF							${itung}==0		No baggage
#=============================================================================================================================================================================
frequent flyer
    ${ffn}=								Get Length					${object['itinerary']['listPassenger'][${IDX}]['listTransportationSsr']}
    Run Keyword If						${ffn}<>0					ff
    ...		ELSE IF						${ffn}==0					no ff
    #frequent flyer penumpang
    Element Should Contain				xpath=//div[@id='pas${LIST}']/div/div/div											Frequent Flyer Number :${SPASI}${repffn} 
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    #tombol edit frequent flyer
    Run Keyword If						'${STATUS}'=='BOOKED'																Edit flyer
    ...		ELSE IF						('${STATUS}'=='CANCELED' or '${STATUS}'=='TICKETED')								No edit flyer
#=============================================================================================================================================================================
No frequent flyer
	Element Should Not Contain			xpath=//div[@id='pas${LIST}']/div/div/div											Frequent Flyer Number :${SPASI}${repffn}
#=============================================================================================================================================================================
ff
	${repffn}=							Convert To String			${object['itinerary']['listPassenger'][${IDX}]['listTransportationSsr']['value']}
	Set Suite Variable					${repffn}
    Run Keyword If						'${repffn}'<>'None'			spasi
    ...		ELSE IF						'${repffn}'=='None'			no spasi
#=============================================================================================================================================================================
no ff
    ${repffn}=							set variable				${EMPTY}  
    Set Suite Variable					${repffn}
	no spasi

#Pengaturan tombol edit flyer
Edit flyer
	Page Should Contain Button			xpath=//button[contains(@class,'btn btn-xs btn-default inline')]
#=============================================================================================================================================================================
No edit flyer
	Page Should Not Contain Button		xpath=//button[contains(@class,'btn btn-xs btn-default inline')]

#Pengaturan spasi jika data null
spasi
	${SPASI}=	set variable			${SPACE}
	Set Suite Variable	${SPASI}
#=============================================================================================================================================================================
no spasi
	${SPASI}=	set variable			${EMPTY}
	Set Suite Variable	${SPASI}

#Pengaturan bagasi
Baggage
    Page Should Contain Element				xpath=//div[@id='pas${LIST}']/div/div[2]/table/tbody/tr/td[3]
    ${bgg}=									Convert To String			${object['itinerary']['listPassenger'][${IDX}]['listPassengerBaggage']['baggageKilos']}
    #log to console	bagasi ${bgg}
    ${repbgg}=								Replace String				${bgg}		None		${EMPTY} 
    Set Suite Variable		${repbgg}
    Element Text Should Be					xpath=//div[@id='pas${LIST}']/div/div[2]/table/tbody/tr/td[3]					${repbgg}
#=============================================================================================================================================================================
No baggage
    Page Should Not Contain Element			xpath=//div[@id='pas${LIST}']/div/div[2]/table/tbody/tr/td[3]
    ${repbgg}=								set variable				0  
    Set Suite Variable		${repbgg}	

#Pengaturan class seat selection
listClass
	#list class GA yang mendukung seat selection
    ${listclass1}=				set variable	${obyek['mapTransportation']['${namaairline}']['listAvailableBlockSeatClass'][0]}
    Set Global Variable	${listclass1}
    ${listclass2}=				set variable	${obyek['mapTransportation']['${namaairline}']['listAvailableBlockSeatClass'][1]}
    Set Global Variable	${listclass2}
    ${listclass3}=				set variable	${obyek['mapTransportation']['${namaairline}']['listAvailableBlockSeatClass'][2]}
    Set Global Variable	${listclass3}
    ${listclass4}=				set variable	${obyek['mapTransportation']['${namaairline}']['listAvailableBlockSeatClass'][3]}
    Set Global Variable	${listclass4}
    ${listclass5}=				set variable	${obyek['mapTransportation']['${namaairline}']['listAvailableBlockSeatClass'][4]}
    Set Global Variable	${listclass5}
    ${listclass6}=				set variable	${obyek['mapTransportation']['${namaairline}']['listAvailableBlockSeatClass'][5]}
    Set Global Variable	${listclass6}
    ${listclass7}=				set variable	${obyek['mapTransportation']['${namaairline}']['listAvailableBlockSeatClass'][6]}
    Set Global Variable	${listclass7}
    ${listclass8}=				set variable	${obyek['mapTransportation']['${namaairline}']['listAvailableBlockSeatClass'][7]}
    Set Global Variable	${listclass8}
    ${listclass9}=				set variable	${obyek['mapTransportation']['${namaairline}']['listAvailableBlockSeatClass'][8]}
    Set Global Variable	${listclass9}
#=============================================================================================================================================================================
no listClass
    ${listclass1}=				set variable	${EMPTY}
    Set Global Variable	${listclass1}
    ${listclass2}=				set variable	${EMPTY}
    Set Global Variable	${listclass2}
    ${listclass3}=				set variable	${EMPTY}
    Set Global Variable	${listclass3}
    ${listclass4}=				set variable	${EMPTY}
    Set Global Variable	${listclass4}
    ${listclass5}=				set variable	${EMPTY}
    Set Global Variable	${listclass5}
    ${listclass6}=				set variable	${EMPTY}
    Set Global Variable	${listclass6}
    ${listclass7}=				set variable	${EMPTY}
    Set Global Variable	${listclass7}
    ${listclass8}=				set variable	${EMPTY}
    Set Global Variable	${listclass8}
    ${listclass9}=				set variable	${EMPTY}
    Set Global Variable	${listclass9}

#Pengaturan rute (direct/connecting)
connecting
	:FOR    ${ID}    		IN RANGE    	0						${connect}-1
	\	${IDCON}=			Evaluate		${ID}+1		
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	#label FLIGHT SEGMENT
    \	Page Should Contain Element			xpath=//div[@id='pas${LIST}']/div/div[2]/table/thead/tr/th
    #segmen penerbangan
    \	Page Should Contain Element			xpath=//div[@id='pas${LIST}']/div/div[2]/table/tbody/tr/td
    \	Element Text Should Be				xpath=//div[@id='pas${LIST}']/div/div[2]/table/tbody/tr/td						${object['itinerary']['itemGo']['listTransporter'][${ID}]['departureCity']}-${object['itinerary']['itemGo']['listTransporter'][${ID}]['arrivalCity']}  
    #elemen icon pesawat			
    \	Page Should Contain Element			xpath=//div[@class='panel-body']/div/div/div/div/h4/li
    #elemen flight number 
    \	Page Should Contain Element			xpath=//div[@class='panel-body']/div/div/div/div/h4/span
    #elemen bandara keberangkatan contoh CGK
    \	Page Should Contain Element			xpath=//div[@class='panel-body']/div/div/div/div[2]/h4/span
    #elemen keterangan bandara dan waktu berangkat contoh Soekarno Hatta, Jakarta  01-Dec-2016, 22:00 LT	     
    \	Page Should Contain Element			xpath=//div[@class='panel-body']/div/div/div/div[2]/span    
    #elemen bandara tujuan contoh DPS 
    \	Page Should Contain Element			xpath=//div[@class='panel-body']/div/div/div/div[3]/h4/span
    #elemen keterangan bandara dan waktu sampai contoh Ngurah Rai, Denpasar  02-Dec-2016, 01:00 LT   
    \	Page Should Contain Element			xpath=//div[@class='panel-body']/div/div/div/div[3]/span 
    #elemen class    
    \	Page Should Contain Element			xpath=//div[@class='panel-body']/div/div/div/div[4]/h4/span
    #elemen keterangan class contoh ECONOMY	     
    \	Page Should Contain Element			xpath=//div[@class='panel-body']/div/div/div/div[4]/span	
    \	Element Text Should Be				xpath=//div[@class='panel-body']/div/div/div[${LIST}]/div/h4/span							${object['itinerary']['itemGo']['listTransporter'][${ID}]['transporterNo']}
    \	def 
    \	Element Text Should Be				xpath=//div[@class='panel-body']/div/div/div[${LIST}]/div[2]/h4/span						${object['itinerary']['itemGo']['listTransporter'][${ID}]['departureCity']}  
    \	${departlabel}=						Fetch From Left			${object['itinerary']['itemGo']['listTransporter'][${ID}]["departureCityLabel"]}		${SPACE}
    \	Element Should Contain				xpath=//div[@class='panel-body']/div/div/div[${LIST}]/div[2]/span							${object['itinerary']['itemGo']['listTransporter'][${ID}]["departureAirportName"]}, ${departlabel}  ${object['itinerary']['itemGo']['listTransporter'][${ID}]["departureDate"]}, ${object['itinerary']['itemGo']['listTransporter'][${ID}]["departureTime"]} LT
    \	Element Text Should Be				xpath=//div[@class='panel-body']/div/div/div[${LIST}]/div[3]/h4/span						${object['itinerary']['itemGo']['listTransporter'][${ID}]["arrivalCity"]} 
    \	${arrivelabel}=						Fetch From Left			${object['itinerary']['itemGo']['listTransporter'][${ID}]["arrivalCityLabel"]}			${SPACE}
    \	Element Should Contain				xpath=//div[@class='panel-body']/div/div/div[${LIST}]/div[3]/span							${object['itinerary']['itemGo']['listTransporter'][${ID}]["arrivalAirportName"]}, ${arrivelabel}  ${object['itinerary']['itemGo']['listTransporter'][${ID}]["arrivalDate"]}, ${object['itinerary']['itemGo']['listTransporter'][${ID}]["arrivalTime"]} LT
    \	Element Text Should Be				xpath=//div[@class='panel-body']/div/div/div[${LIST}]/div[4]/h4/span						${object['itinerary']['itemGo']['listTransporter'][${ID}]["chosenClass"]}
    \	abc 
    \	${tipeClass}=						Set Variable 			${object['itinerary']['itemGo']['listTransporter'][${ID}]["chosenClassType"]}
    \	Set Suite Variable					${tipeClass}
    \	Run Keyword If						('${tipeClass}'=='ECONOMY' or '${tipeClass}'=='BUSSINESS' or '${tipeClass}'=='PROMO')		Tipe class
    \	...		ELSE IF						('${tipeClass}'=='ECONOMY' or '${tipeClass}'=='BUSSINESS' or '${tipeClass}'=='PROMO')		No tipe class

#Pengaturan tipe class flight
Tipe class
    Element Text Should Be				xpath=//div[@class='panel-body']/div/div/div/div[4]/span									${tipeClass}
#============================================================================================================================================================================   	
No tipe class
    Element Text Should Be				xpath=//div[@class='panel-body']/div/div/div[2]/div[4]/span									${EMPTY}
#============================================================================================================================================================================    
rute
    ${connect}=							Get Length						${object['itinerary']['itemGo']['listTransporter']}
    Set Suite Variable					${connect}
	:FOR    ${CLASSID}    		IN RANGE    	0						${connect}-1
	\	${LISTCL}=			Evaluate		${CLASSID}+1
	\	Set Suite Variable	${CLASSID}
	\	Set Suite Variable	${LISTCL}
	\	${classairline}=					set variable	${object['itinerary']['itemGo']['listTransporter'][${connect}]["chosenClass"]}
	\	Set Suite Variable	${classairline}
	\	Run Keyword If 						('${STATUS}'=='BOOKED' and '${obyek['mapTransportation']['${namaairline}']['supportBlockSeat']}'=='true' and ('${classairline}'=='${listclass1}' or '${classairline}'=='${listclass2}' or '${classairline}'=='${listclass3}' or '${classairline}'=='${listclass4}' or '${classairline}'=='${listclass5}' or '${classairline}'=='${listclass6}' or '${classairline}'=='${listclass7}' or '${classairline}'=='${listclass8}' or '${classairline}'=='${listclass9}'))				Seat selection
	\	...		ELSE IF 					('${STATUS}'=='BOOKED' and '${obyek['mapTransportation']['${namaairline}']['supportBlockSeat']}'=='false')				No seat selection	

Select seat
	${indeksclass}=			Get Length		${object['itinerary']['itemGo']['listTransporter']}
	:FOR    ${CLID}    		IN RANGE    	0						${indeksclass}
	\	${LISTLI}=			Evaluate		${CLID}+1	
	\	Set Suite Variable	${CLID}
	\	Set Suite Variable	${LISTLI}
	#Seat Selection (pilih kursi berdasarkan maskapai QZ, QG, 1B dan GA (daftar class seat selection N,K,M,B,Y,I,D,C,J))
	\	rute

#Pengaturan elemen remark
Remark
    Page Should Contain Element			xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[3]/div/div/div/div/div/h5	
    ${strremark}=						Convert To String					${object['itinerary']['listRemark']}
    ${repstrremark}=					Replace String		${strremark}		[u'		${EMPTY}
    ${repstrremark2}=					Replace String		${repstrremark}		']		${EMPTY}
    #log to console	${repstrremark2}
    Element Text Should Be				xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[3]/div/div/div/div/div/h5		${repstrremark2}					
#=============================================================================================================================================================================
No Remark
    Page Should Not Contain Element		xpath=//div[@class='content']/div[2]/div/div/div/div/div/div[2]/div[3]/div/div[3]/div/div/div/div/div/h5				
#=============================================================================================================================================================================
bagasi flight
	:FOR    ${CLID}    					IN RANGE    	1						${length}
	\	${LISTLI}=						Evaluate		${CLID}+1	
	\	Set Suite Variable				${CLID}
	\	Set Suite Variable				${LISTLI}
	\	Run Keyword If					('${object['itinerary']['listPassenger'][${CLID}]['type']}'=='ADULT' or '${object['itinerary']['listPassenger'][${CLID}]['type']}'=='CHILD')		pax baggage
	\	...		ELSE IF					'${object['itinerary']['listPassenger'][${CLID}]['type']}'=='INFANT'																				no pax baggage 		
#=============================================================================================================================================================================
pax baggage
	Page Should Contain Element			xpath=//div[@class='modal-content']/div[2]/ul/li[${LISTLI}]/a
	Page Should Contain Element			xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div[${LISTLI}]/table/thead/tr/th
	Page Should Contain Element			xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div[${LISTLI}]/table/thead/tr/th[2]
	Page Should Contain Element			xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div[${LISTLI}]/table/thead/tr/th[3]
	Page Should Contain Element			xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div[${LISTLI}]/table/thead/tr/th[4]
	Page Should Contain Element			xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div[${LISTLI}]/table/tbody/tr/td
	Page Should Contain Element			xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div[${LISTLI}]/table/tbody/tr/td[2]
	Page Should Contain Element			xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div[${LISTLI}]/table/tbody/tr/td[3]
	Page Should Contain Element			xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div[${LISTLI}]/table/tbody/tr/td[4]	
	${connect}=			Get Length		${object['itinerary']['itemGo']['listTransporter']}
	Set Suite Variable	${connect}
	Run Keyword If						${connect}==1		direct bagasi
	...		ELSE IF						${connect}>1		connect bagasi
#=============================================================================================================================================================================
no pax baggage
	Page Should Not Contain Element		xpath=//div[@class='modal-content']/div[2]/ul/li[${LISTLI}]/a
#=============================================================================================================================================================================
direct bagasi 1 pax
	Page Should Contain Element			xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div/div/div/table/tbody/tr[2]/td
	Page Should Contain Element			xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div/div/div/table/tbody/tr[2]/td[2]
	Page Should Contain Element			xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div/div/div/table/tbody/tr[3]/td
	Page Should Contain Element			xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div/div/div/table/tbody/tr[3]/td[2]
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${NewPaxPaid}=		set variable	${object['itinerary']['totalFare']}
	${textPaid}=		Get Text		xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div/div/div/table/tbody/tr[3]/td[2]
	${repPaid}=			Replace String	${textPaid}		.		${EMPTY}
	Should Be Equal						${NewPaxPaid}			${repPaid}
#=============================================================================================================================================================================
direct bagasi
	Page Should Contain Element			xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div/div/div/table/tbody/tr[2]/td
	Page Should Contain Element			xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div/div/div/table/tbody/tr[2]/td[2]
	Page Should Contain Element			xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div/div/div/table/tbody/tr[3]/td
	Page Should Contain Element			xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div/div/div/table/tbody/tr[3]/td[2]
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${NewPaxPaid}=		set variable	${object['itinerary']['totalFare']}
	${textPaid}=		Get Text		xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div/div/div/table/tbody/tr[3]/td[2]
	#log to console	${textPaid}
	${repPaid}=			Replace String	${textPaid}		.		${EMPTY}
	Should Be Equal						${NewPaxPaid}			${repPaid}
#=============================================================================================================================================================================
connect bagasi 1 pax
	Page Should Contain Element			xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div/div/div/table/tbody/tr[2]/td
	Page Should Contain Element			xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div/div/div/table/tbody/tr[2]/td[2]
	Page Should Contain Element			xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div/div/div/table/tbody/tr[2]/td[3]
	Page Should Contain Element			xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div/div/div/table/tbody/tr[2]/td[4]
	Page Should Contain Element			xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div/div/div/table/tbody/tr[3]/td
	Page Should Contain Element			xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div/div/div/table/tbody/tr[3]/td[2]
	Page Should Contain Element			xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div/div/div/table/tbody/tr[4]/td
	Page Should Contain Element			xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div/div/div/table/tbody/tr[4]/td[2]
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${NewPaxPaid}=		set variable	${object['itinerary']['totalFare']}
	${textPaid}=		Get Text		xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div/div/div/table/tbody/tr[4]/td[2]
	${repPaid}=			Replace String	${textPaid}		.		${EMPTY}
	Should Be Equal						${NewPaxPaid}			${repPaid}
#=============================================================================================================================================================================
connect bagasi
	Page Should Contain Element			xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div[${LISTLI}]/table/tbody/tr[2]/td
	Page Should Contain Element			xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div[${LISTLI}]/table/tbody/tr[2]/td[2]
	Page Should Contain Element			xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div[${LISTLI}]/table/tbody/tr[2]/td[3]
	Page Should Contain Element			xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div[${LISTLI}]/table/tbody/tr[2]/td[4]
	Page Should Contain Element			xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div[${LISTLI}]/table/tbody/tr[3]/td
	Page Should Contain Element			xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div[${LISTLI}]/table/tbody/tr[3]/td[2]
	Page Should Contain Element			xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div[${LISTLI}]/table/tbody/tr[4]/td
	Page Should Contain Element			xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div[${LISTLI}]/table/tbody/tr[4]/td[2]
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	${NewPaxPaid}=		set variable	${object['itinerary']['totalFare']}
	${textPaid}=		Get Text		xpath=//div[contains(@class,'tab-content bg-white p-t-0')]/div[${CLID}]/div/div/table/tbody/tr[4]/td[2]
	${repPaid}=			Replace String	${textPaid}		.		${EMPTY}
	Should Be Equal						${NewPaxPaid}			${repPaid}
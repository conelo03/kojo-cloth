<?php

$content      = array(
	"en" => "Apakah ada transaksi yang di lakukan pada hari sebelumnya dan transaksi tersebut tidak diketahui oleh bagian keuangan ? Mohon untuk melakukan input data dengan memilih menu pengajuan karena sangat berpengaruh terhadap arus kas"
);
$heading =array(
	"en" => "Notifikasi Keuangan"
);

$fields = array(
	'app_id' => "bebe38a0-12a2-434c-b4e5-8b54ffeb6b28",
	'included_segments' => array(
			'All'
	),
	'contents' => $content,
	'headings' => $heading,
	'url' => "https://kojo-cloth.elearningpolsub.com/pengajuan"
);

$fields = json_encode($fields);

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, "https://onesignal.com/api/v1/notifications");
curl_setopt($ch, CURLOPT_HTTPHEADER, array(
	"Content-Type: application/json; charset=utf-8",
	"Authorization: Basic YWFiNjE0MTMtNjQwNS00M2IyLWI2NWQtYjM0YzRmZThhZTlk"
));
curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
curl_setopt($ch, CURLOPT_HEADER, FALSE);
curl_setopt($ch, CURLOPT_POST, TRUE);
curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
curl_setopt($ch, CURLOPT_VERBOSE, TRUE);
curl_setopt($ch, CURLOPT_STDERR, fopen('php://stderr', 'w'));

$response = curl_exec($ch);
curl_close($ch);

$curl = curl_init();

curl_setopt_array($curl, array(
	CURLOPT_URL => "https://api.ultramsg.com/instance13688/messages/chat",
	CURLOPT_RETURNTRANSFER => true,
	CURLOPT_ENCODING => "",
	CURLOPT_MAXREDIRS => 10,
	CURLOPT_TIMEOUT => 30,
	CURLOPT_SSL_VERIFYHOST => 0,
	CURLOPT_SSL_VERIFYPEER => 0,
	CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
	CURLOPT_CUSTOMREQUEST => "POST",
	CURLOPT_POSTFIELDS => "token=q4s6bv4r3q9s9mbg&to=+6285936570953&body=Apakah ada transaksi yang di lakukan pada tiga hari sebelumnya dan transaksi tersebut tidak diketahui oleh bagian keuangan ? Mohon untuk melakukan input data dengan memilih menu pengajuan. jika ada transaksi yang tidak di laporkan kepada bagian keuangan karena sangat berpengaruh terhadap arus kas jika kejadian tersebut terjadi.
https://kojo-cloth.elearningpolsub.com/pengajuan&priority=1&referenceId=",
	CURLOPT_HTTPHEADER => array(
		"content-type: application/x-www-form-urlencoded"
	),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

?>

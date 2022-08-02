<?php

$content      = array(
	"en" => "Apakah ada transaksi yang di lakukan pada tiga hari sebelumnya dan transaksi tersebut tidak diketahui oleh bagian keuangan ? Mohon untuk melakukan input data dengan memilih menu pengajuan. jika ada transaksi yang tidak di laporkan kepada bagian keuangan karena sangat berpengaruh terhadap arus kas jika kejadian tersebut terjadi"
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

?>

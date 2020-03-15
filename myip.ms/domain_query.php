#!/usr/bin/php
<?php

	# Set your API KEY to Environment Variables
	$api_id  = getenv('MYIPMS_API_ID');
	$api_key = getenv('MYIPMS_API_KEY');
	$domain  = $argv[1];

	/* Initial Check */
	if ($argc != 2) {
		fputs(STDERR, "Usage: ./domain_query.sh <domain>\n");
		exit(1);
	}
	if ( empty($api_id) || empty($api_key) ) {
		fputs(STDERR, "Set your API ID and API KEY to Environment Variables.\n" .
			"  export MYIPMS_API_ID=api_id\n" .
			"  export MYIPMS_API_KEY=api_key\n");
		exit(2);
	}


	$api_url = "https://api.myip.ms";
	
	/*  Whois Result  */
	/******************/
   	$url  = create_api_url($domain, $api_id, $api_key, $api_url);
	$ch = curl_init( $url );
	curl_setopt( $ch, CURLOPT_SSL_VERIFYPEER, FALSE);
	curl_setopt( $ch, CURLOPT_HEADER, 0);
	curl_setopt( $ch, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt( $ch, CURLOPT_TIMEOUT, 90);
	curl_setopt( $ch, CURLOPT_CONNECTTIMEOUT, 90);
	$data = curl_exec($ch);
	curl_close($ch);
   	$arr  = json_decode($data, true);

	/*  Examples  */
	/******************/
	//  Example1 - Display IP Address Owner/s
	if (isset($arr["status"]) && $arr["status"] == "error")
	{
		echo "Error! ".(isset($arr["error_desc"])?$arr["error_desc"]:"");
	}
	else
	{
		if (isset($arr["owners"]["owner"]["ownerName"])) echo "Owner: ".$arr["owners"]["owner"]["ownerName"]."\nAddress: ".$arr["owners"]["owner"]["address"]."\nCountry: ".$arr["owners"]["owner"]["countryName"]."\nOwner Range: ".$arr["owners"]["owner"]["range"]."\n";
		if (isset($arr["owners"]["parent_owner"]["ownerName"])) echo "Parent Owner: ".$arr["owners"]["parent_owner"]["ownerName"]."\nAddress: ".$arr["owners"]["parent_owner"]["address"]."\nCountry: ".$arr["owners"]["parent_owner"]["countryName"]."\nOwner Range: ".$arr["owners"]["parent_owner"]["range"]."\n";
		if (isset($arr["owners"]["top_parent_owner"]["ownerName"])) echo "Top Parent Owner: ".$arr["owners"]["top_parent_owner"]["ownerName"]."\nAddress: ".$arr["owners"]["top_parent_owner"]["address"]."\nCountry: ".$arr["owners"]["top_parent_owner"]["countryName"]."\nOwner Range: ".$arr["owners"]["top_parent_owner"]["range"]."\n";
	}

	//  Example2 - All Whois Data
	echo "-----\n"; print_r($arr);
	
	
function create_api_url($domain, $api_id, $api_key, $api_url, $timestamp = '')
{
	$url = "";
	if (!$timestamp) $timestamp = gmdate("Y-m-d_H:i:s");
	if (trim($domain) != '') {
		$url = $api_url."/".$domain.'/api_id/'.$api_id.'/api_key/'.$api_key;  
		$signature = md5($url.'/timestamp/'.$timestamp);
		$url .= '/signature/'.$signature.'/timestamp/'.$timestamp;
	}
	return $url;
}

?>

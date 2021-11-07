<?php
$file = $_GET['file'];  
header('Content-type: image/png');
header('Content-Disposition: attachment; filename="'.$file.'"');
header( 'Expires: 0' );
header( 'Cache-Control: must-revalidate, post-check=0, pre-check=0' );
header( "Content-Transfer-Encoding: binary" );
header( 'Pragma: public' );
header( "Content-Length: ".filesize( $file ) );
readfile( $file );
exit;
?>
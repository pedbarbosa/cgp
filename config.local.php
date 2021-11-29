<?php

foreach ($_ENV as $key=>$val )
{
  if (substr( $key, 0, 4 ) === "cgp_") {
    $k = str_replace("cgp_", "", $key);
    $CONFIG[$k] = $val;
  }
}

# Override configuration settings
$CONFIG['width'] = 500;
$CONFIG['height'] = 200;
$CONFIG['detail-width'] = 1000;
$CONFIG['detail-height'] = 600;

?>

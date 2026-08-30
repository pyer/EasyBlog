<?php

echo '<h2>Server</h2>';
echo "SERVER_NAME : ", $_SERVER['SERVER_NAME'], "<br>";
echo "SERVER_ADDR : ", $_SERVER['SERVER_ADDR'], "<br>";
echo "SERVER_PORT : ", $_SERVER['SERVER_PORT'], "<br>";
echo "SERVER_PROTOCOL : ", $_SERVER['SERVER_PROTOCOL'], "<br>";
echo "SERVER_SOFTWARE : ", $_SERVER['SERVER_SOFTWARE'], "<br>";
echo "GATEWAY_INTERFACE : ", $_SERVER['GATEWAY_INTERFACE'], "<br>";

echo "REMOTE_HOST : ", $_SERVER['REMOTE_HOST'], "<br>";
echo "REMOTE_ADDR : ", $_SERVER['REMOTE_ADDR'], "<br>";
echo "REMOTE_PORT : ", $_SERVER['REMOTE_PORT'], "<br>";
echo "REMOTE_USER : ", $_SERVER['REMOTE_USER'], "<br>";

echo '<h2>Request</h2>';
echo "HTTPS : ", $_SERVER['HTTPS'], "<br>";
echo "HTTP_HOST : ", $_SERVER['HTTP_HOST'], "<br>";
//echo "HTTP_REFERER : ", $_SERVER['HTTP_REFERER'], "<br>";
echo "REQUEST_URI : ", $_SERVER['REQUEST_URI'], "<br>";
echo "QUERY_STRING : ", $_SERVER['QUERY_STRING'], "<br>";
//echo "REQUEST_TIME : ", $_SERVER['REQUEST_TIME'], "<br>";
echo "HTTP_USER_AGENT : ", $_SERVER['HTTP_USER_AGENT'], "<br>";
//echo "PATH_INFO : ", $_SERVER['PATH_INFO'], "<br>";
//echo "ORIG_PATH_INFO : ", $_SERVER['ORIG_PATH_INFO'], "<br>";

echo '<h2>Script</h2>';
echo "DOCUMENT_ROOT : ", $_SERVER['DOCUMENT_ROOT'], "<br>";
echo "SCRIPT_NAME : ", $_SERVER['SCRIPT_NAME'], "<br>";
echo "SCRIPT_FILENAME : ", $_SERVER['SCRIPT_FILENAME'], "<br>";
//echo "PATH_TRANSLATED : ", $_SERVER['PATH_TRANSLATED'], "<br>";


echo '<h2>Navigator</h2>';
echo 'Platform : <span id="platform"></span>', '<br>';
echo 'Vendor   : <span id="vendor"></span>',   '<br>';
echo 'Product  : <span id="product"></span>',  '<br>';
echo 'Language : <span id="language"></span>', '<br>';

echo '<h2>Window</h2>';
echo 'Location href : <span id="href"></span>',           '<br>';
echo 'Color depth   : <span id="colors"></span> bits',    '<br>';
echo 'Screen width  : <span id="screenW"></span> pixels', '<br>';
echo 'Screen height : <span id="screenH"></span> pixels', '<br>';
echo 'Window width  : <span id="windowW"></span> pixels', '<br>';
echo 'Window height : <span id="windowH"></span> pixels', '<br>';

?>
<script>
        document.getElementById("platform").innerHTML = navigator.platform;
        document.getElementById("vendor").innerHTML   = navigator.vendor;
        document.getElementById("product").innerHTML  = navigator.product;
        document.getElementById("language").innerHTML = navigator.language;
        document.getElementById("href").innerHTML     = window.location.href;
        document.getElementById("colors").innerHTML   = window.screen.colorDepth;
        document.getElementById("screenW").innerHTML  = window.screen.width;
        document.getElementById("screenH").innerHTML  = window.screen.height;
        document.getElementById("windowW").innerHTML  = window.innerWidth;
        document.getElementById("windowH").innerHTML  = window.innerHeight;
</script>


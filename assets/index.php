<?php
  $request = $_SERVER['REQUEST_URI'];
//  print($request);
//  header("Location: blog.html");
//  exit;

  switch($request) {
    case '/debug' :
      require 'www/debug.php';
      break;
    case '/info' :
      require 'www/info.php';
      break;
    default:
      header("Location: blog.html");
      exit;
  }
?>

<?php
require_once '../../config_path.inc.php';
$allowedUsersAr = array(AMA_TYPE_STUDENT, AMA_TYPE_TUTOR); //, AMA_TYPE_AUTHOR, AMA_TYPE_ADMIN, AMA_TYPE_SWITCHER);
/**
 * Get needed objects
 */
$neededObjAr = array(
    // AMA_TYPE_VISITOR => array('node', 'layout', 'course'),
    AMA_TYPE_STUDENT => array('node', 'layout', 'tutor', 'course', 'course_instance', 'videoroom'),
    AMA_TYPE_TUTOR => array('node', 'layout', 'course', 'course_instance', 'videoroom'),
    // AMA_TYPE_AUTHOR => array('node', 'layout', 'course'),
	// AMA_TYPE_SWITCHER => array('node', 'layout', 'course')
);
$trackPageToNavigationHistory = false;

require_once ROOT_DIR . '/include/module_init.inc.php';

if (!isset($_SESSION['ada-zoom-bridge'])) {
  // the ada-zoom.js will be served only if the session var is found
  $_SESSION['ada-zoom-bridge'] = true;
}
?>
<!DOCTYPE html>
<html lang="">
<head>
    <title>ADA-Zoom WebSDK Bridge</title>
    <meta charset="utf-8" />

    <!-- import #zmmtg-root css -->
    <link type="text/css" rel="stylesheet" href="https://source.zoom.us/1.8.6/css/bootstrap.css" />
    <link type="text/css" rel="stylesheet" href="https://source.zoom.us/1.8.6/css/react-select.css" />

    <meta name="format-detection" content="telephone=no">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
</head>
  <body>
    <header></header>
    <main></main>
    <footer></footer>
    <!-- import ZoomMtg dependencies -->
    <script src="https://source.zoom.us/1.8.6/lib/vendor/react.min.js"></script>
    <script src="https://source.zoom.us/1.8.6/lib/vendor/react-dom.min.js"></script>
    <script src="https://source.zoom.us/1.8.6/lib/vendor/redux.min.js"></script>
    <script src="https://source.zoom.us/1.8.6/lib/vendor/redux-thunk.min.js"></script>
    <script src="https://source.zoom.us/1.8.6/lib/vendor/lodash.min.js"></script>

    <!-- import ZoomMtg -->
    <script src="https://source.zoom.us/zoom-meeting-1.8.6.min.js"></script>

    <!-- import local .js file -->
    <script src="ada-zoom.js.php"></script>
  </body>
</html>

<?php
/**
 * CLASSAGENDA MODULE.
 *
 * @package			classagenda module
 * @author			Giorgio Consorti <g.consorti@lynxlab.com>
 * @copyright		Copyright (c) 2014, Lynx s.r.l.
 * @license			http://www.gnu.org/licenses/gpl-2.0.html GNU Public License v.2
 * @link			classroom
 * @version			0.1
 */

ini_set('display_errors', '0'); error_reporting(E_ALL);
/**
 * Base config file
*/
require_once (realpath(dirname(__FILE__)) . '/../../../config_path.inc.php');

/**
 * Clear node and layout variable in $_SESSION
*/
$variableToClearAR = array();
/**
 * Users (types) allowed to access this module.
*/
$allowedUsersAr = array(AMA_TYPE_SWITCHER, AMA_TYPE_TUTOR, AMA_TYPE_STUDENT);

/**
 * Get needed objects
*/
$neededObjAr = array(
		AMA_TYPE_SWITCHER => array('layout'),
		AMA_TYPE_TUTOR => array('layout'),
		AMA_TYPE_STUDENT => array('layout')
);

/**
 * Performs basic controls before entering this module
*/
$trackPageToNavigationHistory = false;
require_once(ROOT_DIR.'/include/module_init.inc.php');

$retVal = translateFN('Nessun tutor trovato');

if (isset($_SERVER['REQUEST_METHOD']) && $_SERVER['REQUEST_METHOD'] == 'GET') {
	
	$selTester = null;
	if (isset($_SESSION['sess_selected_tester'])) {
		$selTester = $_SESSION['sess_selected_tester'];
	} else {
		switch ($_SESSION['sess_userObj']->getType()) {
			case AMA_TYPE_STUDENT:
				if (isset($courseID) && intval($courseID)>0) {
					$selTesterArr = $GLOBALS['common_dh']->get_tester_info_from_id_course($courseID);
					if (!AMA_DB::isError($selTesterArr) && is_array($selTesterArr) && isset($selTesterArr['puntatore'])) {
						$selTester = $selTesterArr['puntatore'];
					}
				}
				break;
			default:
				$selTester = $_SESSION['sess_userObj']->getDefaultTester();
				break;
		}
	}
	
	$GLOBALS['dh'] = AMAClassagendaDataHandler::instance(MultiPort::getDSN($selTester));
	
	if (isset($instanceID) && intval($instanceID)>0) {
		$result = $GLOBALS['dh']->course_instance_tutor_get(intval($instanceID),'ALL');
		
		if(!AMA_DB::isError($result) && is_array($result) && count($result)>0) {
			/**
			 * get tutors first and last name
			 */
			$tutorlist = $GLOBALS['dh']->find_tutors_list(array('nome','cognome'),'id_utente_tutor IN('.implode(',',$result).')');
			if (!AMA_DB::isError($tutorlist)) {
				$htmlElement = CDOMElement::create('div');
				$select = CDOMElement::create('select','name:tutorSelect,id:tutorSelect');
				foreach ($tutorlist as $aTutor) {
					$option = CDOMElement::create('option','value:'.$aTutor[0]);
					$option->addChild(new CText($aTutor[1].' '.$aTutor[2]));
					$select->addChild($option);
				}
				$htmlElement->addChild(CDOMElement::create('div','class:clearfix'));
				$htmlElement->addChild($select);
				$retVal = $htmlElement->getHtml();
			}
		}
	}
}
die ($retVal);
<txp:php>
if (isset($_POST['submit'])) {
$url = $_POST['site'].$_POST['terms'];
if ($_POST['section'] && ($_POST['section'] != 'null')) $url = $url.'&s='.$_POST['section'];
header('Location: '.$url);
} else {
header('content-type: text/html; charset=utf-8');
}
</txp:php>

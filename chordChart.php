<?php
// Start the buffering //
ob_start();

function str_replace_first($from, $to, $subject)
{
    $from = '/'.preg_quote($from, '/').'/';
    return preg_replace($from, $to, $subject, 1);
}

function getCCval($in) 
{ 
$rrr =  str_replace_first('[', ' ', $in);
$var = substr_replace(trim($rrr), "", -1);
$str = explode(' ', $var);
$str = array_slice($str, 1);
$str = implode(' ', $str);
return $str;
}

$timestamp_actuel = time();

shell_exec('mkdir '.$timestamp_actuel.'-cc');
shell_exec("sed 's/|$/|\\\\n/g' ___.chordChart > ".$timestamp_actuel."-cc/___.chordChart; rm ___.chordChart; echo >> ".$timestamp_actuel."-cc/___.chordChart");
shell_exec('touch busy');

$myFile = $timestamp_actuel.'-cc/___.chordChart';
$lines = file($myFile); //file in to an array


$title = getCCval($lines[0]); 
if(empty($title)) $title = "untitled";
if($title != "untitled") $nnn = $title;
$subtitle = getCCval($lines[1]);
$composer = getCCval($lines[2]);
$comment = getCCval($lines[3]);
$boxwidth = getCCval($lines[4]);
$boxheight = getCCval($lines[5]);
$diagram = getCCval($lines[6]);
$chordsize = getCCval($lines[7]);

$line_to_strip = 9;
$new_file = new SplFileObject("$timestamp_actuel", 'w');

foreach (new LimitIterator(new SplFileObject($myFile), $line_to_strip) as $line)
    $new_file->fwrite($line);    
?>
	<html>
	<head> 
	<?php echo '<title>'.$title.'</title>'; ?> 
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <style type="text/css">
table, th, td { border-collapse: collapse; padding: 0px; font-family:'Chord4tab',Sans-Serif;}
h1 { text-align: center; font-size:20px; font-family:monospace; font-weight: normal;}
h2 { text-align: center; font-size:16px; font-family:monospace; font-weight: normal;}
h3 { text-align: center; font-size:14px; font-family:monospace; font-weight: normal;}
p, footer { text-align: center; font-size:11px; font-family:monospace; font-weight: normal;}
footer {margin-top:50px;}
figure {margin:0px;display:inline-block;}
figcaption {text-align:center;font-family:'Chord4tab';display:block}
caption {display: table-caption; font-family:arial;}
.left {text-align:left;}
.downloadbutton { text-align: center; margin-bottom:8px; }
@font-face {
	font-family: 'Chord4tab';
	src: url('fonts/hinted-chord4tab.eot');
	src: url('fonts/hinted-chord4tab.eot?#iefix') format('embedded-opentype'),
		url('fonts/hinted-chord4tab.woff2') format('woff2'),
		url('fonts/hinted-chord4tab.woff') format('woff'),
		url('fonts/hinted-chord4tab.ttf') format('truetype'),
		url('fonts/hinted-chord4tab.svg#chord4tab') format('svg');
	font-weight: normal;
	font-style: normal;
}
@font-face {
  font-family: 'Annot4tab';
  src: url('./fonts/annot4tab.eot'); /* IE9 Compat Modes */
  src: url('./fonts/annot4tab.eot?#iefix') format('embedded-opentype'), /* IE6-IE8 */
    url('./fonts/annot4tab.woff2') format('woff2'), /* Modern Browsers */
    url('./fonts/annot4tab.woff') format('woff'), /* Modern Browsers */
    url('./fonts/annot4tab.ttf') format('truetype'), /* Safari, Android, iOS */
    url('./fonts/annot4tab.svg') format('svg'); /* Legacy iOS */  font-weight: normal;
  font-style: normal;
}
.chordfont
	{
		font-family:'Chord4tab';
	}
.annotfont
	{
		font-family:'Annot4tab';
	}
	
td.annotfont 
	{
  		padding-top: 3px;  
	}

caption {display: table-caption; font-size:12px; font-family:monospace;}
img.cap {vertical-align:text-bottom;}
        </style> 
	</head> 
 
<body>

<!-- stitle -->
<?php echo '<h1>'.$nnn.'</h1>'; ?>
<?php echo '<h2>'.$subtitle.'</h2>'; ?>
<?php echo '<h3>'.$composer.'</h3>'; ?>
<br/>
<?php echo '<p>'.$comment.'</p>'; ?>
<br/><br/>
<!-- etitle -->

<?php echo '<table class="chordfont" border=0 align="center" style="font-size:'.$chordsize.'px;">' ?>
<?php
$output=shell_exec('./tab.sh '.$timestamp_actuel.' '.$boxwidth.' '.$boxheight.' '.$chordsize.' '.$timestamp_actuel.'-cc'.' '.$diagram);
echo $output;
?>
</table><br/>

<!-- sfooter -->
<?php
$dt=date('d/m/y', $timestamp_actuel);
echo '<footer>ChordChart['.$boxwidth.':'.$boxheight.':'.$diagram.':'.$chordsize.']['.$dt.']</footer>'
?>
<br/>

<br/>
<?php
function convertCentToAlpha($num)
{
	$alphas = range('A', 'Z');
	$na=floor($num/100);
	$nb=$num-$na*100;
	
	if ($na == 0) 
		{
			return sprintf("%02d", $nb);
		} 
		else 
		{
			return $alphas[$na-1].sprintf("%02d", $nb);
		}
}
$meta = convertCentToAlpha($boxwidth).convertCentToAlpha($boxheight).convertCentToAlpha($diagram).convertCentToAlpha($chordsize);
$rename = $timestamp_actuel.$meta;
echo '<div class="downloadbutton"><a href="download.php?file='.$rename.'.png"><button style="cursor:pointer;">Download png</button></a>
<form style=" text-align: center;">
<br/>
  <input type="button" style= "cursor:pointer" value="Edit" title="" class="button" onclick="history.back()">
</form>
</div>';
?>
<br/>

<!-- efooter -->

</body>
</html>
<?php
// Get the content that is in the buffer and put it in your file //
file_put_contents($rename.'.html', ob_get_contents());
shell_exec('./topng.sh '.$rename.'.html'); 
shell_exec('./limit.sh 50 50'); 
shell_exec('rm '.$timestamp_actuel);
shell_exec('rm busy');
?>

<?php
  header('Location:'.$rename.'.html');
  exit();
?>
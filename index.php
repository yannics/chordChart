<!doctype html>
<head>
<title>Chord chart</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" media="screen" type="text/css" href="style.css" />
<link href="favicon.ico" rel="shortcut icon" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="jquery.tabSlideOut.v1.3.js"></script>
<style>
#loadingSpinnerBackground {
    position: fixed;
    top: 0;
    left: 0;
    height:100%;
    width:100%;
    cursor: not-allowed;
    opacity: 0.5;
    background: #000000 url('img/transparent-loader-gif-13.gif') center no-repeat;
    z-index: 99;
}
</style>
</head>
<body>
<div>
	<p style="font-family:monospace;font-size:26px;font-weight:bold;text-align: center;">CHORD CHART</p>
	<p style="font-family:monospace;font-size:13px;font-weight:normal;text-align: center;">Online application<br/>by <a href="mailto:by.cmsc@gmail.com"><b>Yann Ics</b></a><br/><br/>2015 &ndash; 2022</p>
</div>

<br/>

<?php
$actual_link = 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['PHP_SELF'];
?>
<div id="formtext">
        <form method="post" action="" enctype="multipart/form-data">
        <p style="text-align: left;">fill in the needed fields in the following form :</p>
    		<p>
    		<label for="title">Title : </label>
       			<input type="text" value="<?php if (isset($_POST['title'])) { echo $_POST['title']; } else { echo "Somewhere over the rainbow"; } ?>" name="title" id="title" style="background-color:transparent;width:190px;font-family:monospace;font-size:12px;color:#505050" >
 				<br />
 			</p>
 			<p>
       		<label for="subtitle">Subtitle : </label>
       			<input type="text" value="<?php if (isset($_POST['subtitle'])) { echo $_POST['subtitle']; } ?>" name="subtitle" id="subtitle" style="background-color:transparent;width:190px;font-family:monospace;font-size:12px;color:#505050" >
 				<br />
  			</p>
  			<p>
       		<label for="composer">Composer : </label>
       			<input type="text" value="<?php if (isset($_POST['composer'])) { echo $_POST['composer']; } else { echo ""; } ?>" name="composer" id="composer" style="background-color:transparent;width:190px;font-family:monospace;font-size:12px;color:#505050" >
 				<br />
  			</p>
  			<p>
       		<label for="comment">Comment : </label>
       			<input type="text" value="<?php if (isset($_POST['comment'])) { echo $_POST['comment']; } else { echo "[ grille manouche ]"; } ?>" name="comment" id="comment" style="background-color:transparent;width:190px;font-family:monospace;font-size:12px;color:#505050" >
 				<br /><img src="img/point.png" alt="" style="height:1px;">
  			</p>
  			<p>
       		<label for="width">Width : </label>
       			<input type="text" value="<?php if (isset($_POST['boxwidth'])) { echo $_POST['boxwidth']; } else { echo "100"; } ?>" name="boxwidth" id="boxwidth" style="background-color:transparent;font-family:monospace;font-size:12px;color:#505050" required/>
 				<br />
  			</p>
  			<p>
       		<label for="height">Height : </label>
       			<input type="text" value="<?php if (isset($_POST['boxheight'])) { echo $_POST['boxheight']; } else { echo "50"; } ?>" name="boxheight" id="boxheight" style="background-color:transparent;font-family:monospace;font-size:12px;color:#505050" required/>
 				<br />
  			</p>
  			<p>
    		<label for="diagram">Diagram : </label>
       			<input type="text" value="<?php if (isset($_POST['diagram'])) { echo $_POST['diagram']; } else { echo "48"; } ?>" name="diagram" id="diagram" style="background-color:transparent;font-family:monospace;font-size:12px;color:#505050" required/>
       			<br />
 			</p>
  			<p>
    		<label for="chordsize">Chordsize : </label>
       			<input type="text" value="<?php if (isset($_POST['chordsize'])) { echo $_POST['chordsize']; } else { echo "22"; } ?>" name="chordsize" id="chordsize" style="background-color:transparent;font-family:monospace;font-size:12px;color:#505050" required/>
 			<br/>
 			</p><br/>
			<label for="message">
			</label>
			<p style="text-align: left; margin-left:10px;">Add your code according the appropriate syntax :</p>
       			<textarea name="message" id="message" rows="20" cols="64" style="background-color:transparent; font-family:monospace;font-size:12px;color:#505050" required>
<?php
if (isset($_POST['message']))
{ echo $_POST['message']; }
else
{
echo '|? 1> __<b>A</b> !|
|\la C6||\a Em7||\a F6||\b __C6 C7__|
|\b __F6 Fm6__||\b __C6 A7__||\b __D7 G7__||\a C6|
|! 1> _ !|
|? 1> __<b>B</b> !|
|\a C6||\a Dm7||\a C6||\a Dm7|
|\a C6||\a B7||\a Em7||\rb __G7 G7#5__|
|! 1> _ !|
|? 1> _(<b>AABA</b>)x5 !|';
}
?>
</textarea>
    		</p>
    		<p style="text-align: center;"><input type="submit" name="envoi" value="Display" onmouseover="document.getElementById('display-infobulle1').style.display = 'inline'" onmouseout="document.getElementById('display-infobulle1').style.display = 'none'"></p>
    		 <span id="display-infobulle1" class="infobulle">Mind that the result could take some time ... so be patient.</span>
    		<br/><br/>
    		      <p style="text-align: center;"><input type="submit" name="ccw" value="Save as chordChart"> </p>
			
    		<input type="hidden" name="MAX_FILE_SIZE" value="100000">
      <p style="text-align: left; margin-left:10px;">Or upload a <em>chordChart</em> file (max size 100 ko) :</p>
      <p style="text-align: center;"><input type="file" name="score" > </p>
          		<p style="text-align: center;"><input type="submit" name="ccfile" value="Submit" onmouseover="document.getElementById('display-infobulle2').style.display = 'inline'" onmouseout="document.getElementById('display-infobulle2').style.display = 'none'"></p>
          	<span id="display-infobulle2" class="infobulle">Mind that the result could take some time ... so be patient.</span>
<br/>
		</form>
		
		<br/><br/>
		
		<div style="text-align: left; font-size:11px;">
		<b>Tutorial</b>: <a href="tuto.html">./chordChart/tuto.html</a><br/>
		<b>Reference</b>: <a href="https://yannics.github.io">https://yannics.github.io</a><br/>
		<b>Contact</b>: <a href="mailto:by.cmsc@gmail.com">by.cmsc@gmail.com</a><br/><br/><br/>
		</div>
	
<?php
$filename = 'busy';

if (file_exists($filename)) {
       echo '<script language="javascript">';
       echo 'alert("Server busy : please try later.")';
       echo '</script>';
} else {
   
if(isset($_POST['ccfile']))
{
    $upload_cc = TRUE;
        if (!empty($_FILES['score']['name'])) {

	// never assume the upload succeeded
	if ($_FILES['score']['error'] !== UPLOAD_ERR_OK) {
		echo '<script language="javascript">';
        	echo 'alert("Upload failed with error code '.$_FILES['score']['error'].'")';
        	echo '</script>';
   	$upload_cc = FALSE;
	}
	else
	{
	   $nname = $_FILES['score']['name'];
       $ext = end((explode(".", $nname)));
	   if ($ext != "chordChart")
	   {
	        echo '<script language="javascript">';
       		echo 'alert("Upload failed : wrong file type.\nAccept only chordChart extension.")';
       		echo '</script>';
	   $upload_cc = FALSE;
	   }
	}

	if($upload_cc == TRUE)
	{
      $tmp = '___.chordChart';
      //déplacement du fichier du répertoire temporaire (stocké par défaut) dans le répertoire de destination
      move_uploaded_file($_FILES['score']['tmp_name'], $tmp);
      
      		$testcc=shell_exec('./testCC.sh '.$tmp);
      		
      		if ($testcc == 1)
		{
			echo '<div id="loadingSpinnerBackground" ></div>';
			echo '<script>
	  		<!--
	  		location.replace("chordChart.php");
	  		-->
	  		</script>';
		}
		else
		{
			 echo '<script language="javascript">';
      			 echo 'alert("Upload failed : invalid format.\nCheck file contents.")';
      			 echo '</script>';
		}
	}
    }
    else
    {
	echo '<script language="javascript">';
      	echo 'alert("Please select a file.")';
      	echo '</script>';
    }
}
elseif(isset($_POST['envoi']) || isset($_POST['ccw']))
{
$rrr1 = 'rrr1';
$title = $_POST['title'];
$subtitle = $_POST['subtitle'];
$composer = $_POST['composer'];
$comment = $_POST['comment'];
$diagram = $_POST['diagram'];
$chordsize = $_POST['chordsize'];
$boxwidth = $_POST['boxwidth'];
$boxheight = $_POST['boxheight'];
$target_file = $rrr1;
$handle = fopen($target_file, "w");
fwrite($handle, $_POST['message'] . PHP_EOL);
fclose($handle);

$rrr2 = 'rrr2';
$dt = strftime("%d/%m/%y");
$fp = fopen($rrr2, 'w');
fwrite($fp, 'title[');
fwrite($fp, $title);
fwrite($fp, ']'.PHP_EOL);
fwrite($fp, 'subtitle[');
fwrite($fp, $subtitle);
fwrite($fp, ']'.PHP_EOL);
fwrite($fp, 'composer[');
fwrite($fp, $composer);
fwrite($fp, ']'.PHP_EOL);
fwrite($fp, 'comment[');
fwrite($fp, $comment);
fwrite($fp, ']'.PHP_EOL);
fwrite($fp, 'boxwidth[');
fwrite($fp, $boxwidth);
fwrite($fp, ']'.PHP_EOL);
fwrite($fp, 'boxheight[');
fwrite($fp, $boxheight);
fwrite($fp, ']'.PHP_EOL);
fwrite($fp, 'diagram[');
fwrite($fp, $diagram);
fwrite($fp, ']'.PHP_EOL);
fwrite($fp, 'chordsize[');
fwrite($fp, $chordsize);
fwrite($fp, ']'.PHP_EOL);
fwrite($fp, 'date[');
fwrite($fp, $dt);
fwrite($fp, "]\r\n");
fclose($fp);
shell_exec('cat rrr2 rrr1 > ___.chordChart; rm rrr1 rrr2');
if(isset($_POST['ccw']))
{
echo '<script>
<!--
location.replace("___.chordChart");
-->
</script>';
}
else
{
echo '<div id="loadingSpinnerBackground" ></div>';
echo '<script>
<!--
location.replace("chordChart.php");
-->
</script>';
}
}
}
?>
<br/>
</div>
	
<div class="slide-out-div">
<a class="handle" href="http://link-for-non-js-users.html"></a>
<TABLE id="memo">
  <TR><TD> \a </TD><TD><img src="img/a.png" alt="" height=25 width=50></img></TD><TD> \la </TD><TD><img src="img/la.png" alt="" height=25 width=50></img></TD><TD style="text-align:right;font-size:16px;">w</TD><TD style="font-family:'Chord4tab';font-size:26px;">w</TD></TR>
  <TR><TD> \b </TD><TD><img src="img/b.png" alt="" height=25 width=50></img></TD><TD> \lb </TD><TD><img src="img/lb.png" alt="" height=25 width=50></img></TD><TD style="text-align:right;font-size:16px;">W</TD><TD style="font-family:'Chord4tab';font-size:26px;">W</TD></TR>
  <TR><TD> \c </TD><TD><img src="img/c.png" alt="" height=25 width=50></img></TD><TD> \lc </TD><TD><img src="img/lc.png" alt="" height=25 width=50></img></TD><TD style="text-align:right;font-size:16px;">#</TD><TD style="font-family:'Chord4tab';font-size:26px;">#</TD></TR>
  <TR><TD> \d </TD><TD><img src="img/d.png" alt="" height=25 width=50></img></TD><TD> \ld </TD><TD><img src="img/ld.png" alt="" height=25 width=50></img></TD><TD style="text-align:right;font-size:16px;">X</TD><TD style="font-family:'Chord4tab';font-size:26px;">X</TD></TR>
  <TR><TD> \e </TD><TD><img src="img/e.png" alt="" height=25 width=50></img></TD><TD> \le </TD><TD><img src="img/le.png" alt="" height=25 width=50></img></TD><TD style="text-align:right;font-size:16px;">n</TD><TD style="font-family:'Chord4tab';font-size:26px;">n</TD></TR>
  <TR><TD> \f </TD><TD><img src="img/f.png" alt="" height=25 width=50></img></TD><TD> \lf </TD><TD><img src="img/lf.png" alt="" height=25 width=50></img></TD><TD style="text-align:right;font-size:16px;">v</TD><TD style="font-family:'Chord4tab';font-size:26px;">v</TD></TR>
  <TR><TD> \g </TD><TD><img src="img/g.png" alt="" height=25 width=50></img></TD><TD> \lg </TD><TD><img src="img/lg.png" alt="" height=25 width=50></img></TD><TD style="text-align:right;font-size:16px;">%</TD><TD style="font-family:'Chord4tab';font-size:26px;">%</TD></TR>
  <TR><TD> \fa </TD><TD><img src="img/fa.png" alt="" height=25 width=50></img></TD><TD> \ra </TD><TD><img src="img/ra.png" alt="" height=25 width=50></img></TD><TD style="text-align:right;font-size:16px;">Y</TD><TD style="font-family:'Chord4tab';font-size:26px;">Y</TD></TR>
  <TR><TD> \fb </TD><TD><img src="img/fb.png" alt="" height=25 width=50></img></TD><TD> \rb </TD><TD><img src="img/rb.png" alt="" height=25 width=50></img></TD><TD style="text-align:right;font-size:16px;">t</TD><TD style="font-family:'Chord4tab';font-size:26px;">t</TD></TR>
  <TR><TD> \fc </TD><TD><img src="img/fc.png" alt="" height=25 width=50></img></TD><TD> \rc </TD><TD><img src="img/rc.png" alt="" height=25 width=50></img></TD><TD style="text-align:right;font-size:16px;">s</TD><TD style="font-family:'Chord4tab';font-size:26px;">s</TD></TR>
  <TR><TD> \fd </TD><TD><img src="img/fd.png" alt="" height=25 width=50></img></TD><TD> \rd </TD><TD><img src="img/rd.png" alt="" height=25 width=50></img></TD><TD style="text-align:right;font-size:16px;">h</TD><TD style="font-family:'Chord4tab';font-size:26px;">h</TD></TR>
  <TR><TD> \fe </TD><TD><img src="img/fe.png" alt="" height=25 width=50></img></TD><TD> \re </TD><TD><img src="img/re.png" alt="" height=25 width=50></img></TD><TD style="text-align:right;font-size:16px;">i</TD><TD style="font-family:'Chord4tab';font-size:26px;">i</TD></TR>
  <TR><TD> \ff </TD><TD><img src="img/ff.png" alt="" height=25 width=50></img></TD><TD> \rf </TD><TD><img src="img/rf.png" alt="" height=25 width=50></img></TD><TD style="text-align:right;font-size:16px;">j</TD><TD style="font-family:'Chord4tab';font-size:26px;">j</TD></TR>
  <TR><TD> \fg </TD><TD><img src="img/fg.png" alt="" height=25 width=50></img></TD><TD> \rg </TD><TD><img src="img/rg.png" alt="" height=25 width=50></img></TD><TD style="text-align:right;font-size:16px;">k</TD><TD style="font-family:'Chord4tab';font-size:26px;">k</TD></TR>
</TABLE>
</div>
</body>
</html>
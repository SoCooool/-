<?
include "_config.php";

$temp=array();


?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Submit URL <?=$title_suffix;?></TITLE>
<LINK REL="stylesheet" type="text/css" href="<?php echo $style_sheet_href;?>">

<SCRIPT LANGUAGE="JavaScript">
<!-- 
function processForm(theform)
{	
	<?php if($enable_form_validate) 
	{?>


//well, not perfect. But...what if the user is so keen to fool us? Let them do that.

var url_pat = /^(http:\/\/)([a-z0-9]+([-|.]{1}[a-z0-9]+)*\.(com|edu|biz|org|gov|int|info|mil|net|arpa|name|museum|coop|aero|[a-z][a-z])|(\[\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\]))\b/;


var email_pat = /^[a-z0-9]+([-|_|.][a-z0-9]+)*\@([a-z0-9]+([-|.]{1}[a-z0-9]+)*\.(com|edu|biz|org|gov|int|info|mil|net|arpa|name|museum|coop|aero|[a-z][a-z])|(\[\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\]))$/;

if(!url_pat.test(theform.url.value.toLowerCase()))
	{
		alert("Please enter a valid URL starting with http://");
		return false;
	}

	if(!email_pat.test(theform.email.value.toLowerCase()))
	{
		alert("Please enter a valid e-mail address");
		return false;
	}


	<?php
	} ?>
	
		var engine_selected = false; // assume no engines selected
		var submit_button;			 
		for (i = 0; i < theform.length; i++)
		{
			
			var tempobj = theform.elements[i];
			switch(tempobj.type.toLowerCase())
			{
				case "submit" :
				{	
					submit_button = tempobj;
					tempobj.disabled = true
					break;
				}
				case "checkbox" :
				{					
					if(tempobj.checked==true)
					{
						engine_selected = true; // at least one engine is selected			
					}
					break;
				}
			}   
		}

			<?php if($enable_form_validate) 
			{?>

				if(engine_selected != true)
					{
						alert("Please select Search engines you want to submit the URL.");
						submit_button.disabled = false; // form has to be resubmitted
						return false;
					}
				else<?php } ?> return true;
	
}// end function processForm
//  End JavaScript-->
</script>
</HEAD><BODY bgcolor="#D3DDDD">
<!-----enginelist-------->
<?php
if(is_readable($engine_file))
{
	$engines_temp = @file($engine_file);
	$temp_engine = array();
	$engines     = array();


$index=0; //index of filtered array
while(list($key,$val)=each($engines_temp))
	{
	 $temp_engine = explode('#',$val);
	 $temp_engine[0] = trim($temp_engine[0]);
	 if(!empty($temp_engine[0])) $engines[$index++]=$temp_engine[0];	 
	}


	?>
	<p>&nbsp;</p><TABLE cellspacing=5 cellpadding=2>
	<FORM METHOD=POST ACTION="submit.php" onSubmit="return processForm(this);">
		<TR>
		<TD width=30% valign=top>
			<DIV align=right>
	URL : <INPUT TYPE="text" NAME="url" class=text value="http://" size=42><br>EMAIL : 
	<INPUT TYPE="text" NAME="email" class=text value="" size=42>
		<INPUT TYPE="submit" value="ADD URL" class=button></div><br>
<div class=time>Make sure that your site is online. Some engines may require your email conformation for submission. Enter an alternate email and check your inbox after submission. Submission may take several minutes. Be patient.</div>
			</TD>
		<TD width=6>


			</TD>
		<TD valign=top>


	<!------start engine list------->
	<TABLE>
	<TR>
	<td colspan=<?=$num_of_cols?> bgcolor="#ffffff"><b><font size="2">&nbsp;Submit URL</font></b></td>
	</tr>
	<tr>
	<?
	for($i=0,$j=1;$i<sizeof($engines);$i++,$j++)
	{
		$temp=explode(',',$engines[$i]);
		echo "\n<TD>\n\t<input type=\"checkbox\" name=\"selected_engines[$i]\" value=\"".trim($temp[0])."\" class=check checked>".ucwords(trim($temp[0]))."\n</TD>";
		if($j==$num_of_cols) 
			{
				$j=0;
				echo "</tr>\n<tr>";
			}
	}

	?>
	</tr>
	</TABLE>
	<!----end engine list----->

</TD>
	</TR>	</FORM>
	</TABLE>
	<?php
}
else 
{
	echo "<span class=\"fatal\"><i>Cound not load $engine_file file</i></span>";
}
	?>

<hr size=1 noshade>
<TABLE width=200><TR>
	<TD width=200>
		<A HREF="http://senselabs.uni.cc"><IMG SRC="submitforce.gif" WIDTH="200" HEIGHT="40" BORDER=0 ALT="Powered by SubmitForce search engine submitter"></a>
	</TD>
</TR>
</TABLE>
<A HREF="http://senselabs.uni.cc">Senselabs</A>
</BODY>
</HTML>

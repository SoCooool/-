<?php
	/***************************************************************************
					    submit.php
		            ---------------------
		    Author		:	Arun Vijayan. C
			Date        :	Sun Aug 24 2003
		    email		:	ifetchmaster@hotmail.com
		
		   Desc : SubmitForce v.1.0 url submitter file
		
	 ***************************************************************************/
		
	/***************************************************************************
	 *                                         				                                
	 *   This program is free software; you can redistribute it and/or modify  	
	 *   it under the terms of the GNU General Public License as published by  
	 *   the Free Software Foundation, provided that you keep this text intact.
	 *
	 ***************************************************************************/

include "_config.php";

$selected_engines=$_POST['selected_engines'];
$url=$_POST['url'];
$email=$_POST['email'];
include "SubmitForce.class.php";

?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE> submitting URL <?=$title_suffix;?></TITLE>
<LINK REL="stylesheet" type="text/css" href="<?php echo $style_sheet_href;?>">
</HEAD>
<BODY bgcolor="#D3DDDD">
<?

$addit = new SubmitForce;							// create object
$addit->set_mode($SF_mode);							// operating mode ONLINE or DEBUG
$addit->queue_engines($engine_file);				// Load the engine data file
$addit->init($url,$email,$user,$selected_engines);	// initialize variables
$addit->submit_page();								// submit


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
function fail_alert(field,message)
{ alert(message); field.focus(); return(false); }
function trim(field)
{
while(field.value.substring(0,1)==' ') field.value=field.value.substring(1,field.value.length);
while(field.value.substring(field.value.length-1,field.value.length)==' ') field.value=field.value.substring(0,field.value.length-1);
}
var valid = new Object();
valid.Username = /^[a-zA-Z0-9]{2,}$/; // username

valid.Password = valid.OldPassword = valid.password = /.{4,}/;
valid.ConfirmPassword = /.{1,}/;
valid.admin_username = valid.Username;
valid.home_dir = /^\/[^:*?\"'<>|\\]{5,}\/$/;
valid.site_ID = /^\d{1,}$/;
valid.color_theme = /^.{2,}$/;

valid.brand = /^.{2,}$/;
valid.mail_support = valid.Email;
valid.mail_links = valid.Email;
valid.mail_info = valid.Email;
valid.mail_ads = valid.Email;
valid.admin_mail = valid.Email;

// add link
valid.link_email = /^.+\@(\[?)[a-zA-Z0-9\-\.]+\.([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/; // email
valid.link_description = /^.{2,}/;
valid.link_title = /^.{2,}$/;
valid.link_url = /^http:\/\/[a-zA-Z0-9\-\.]+\.([a-zA-Z]{2,4}|[0-9]{1,3})(\/)*[a-zA-Z0-9\-\._]*/;

// edit link
valid.Link = valid.link_url;
valid.Title = valid.link_title;
valid.Description = valid.link_description;
valid.Email = valid.link_email;

// add category 
valid.title = /^(.+,?)+$/;
valid.dir = /^([\w,\-]+,?)+$/;
//valid.IP = /^((25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\.){3}(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])$/; // IP Address

//return( field.value.match('/'+pattern+'/i') ? true: fail_alert(field,message) ); }
function check_pattern( field )
{
	trim( field );
	var thePat = valid[field.name]; // [field.title] replaced with [field.name]
	if( !thePat.exec( field.value ) )
	return fail_alert( field, field.title );
	return true;
}

function AddLinkFormValidation( that )
{
	if ( check_pattern( that.link_url ) == false )
	return false; 
	if ( check_pattern( that.link_title ) == false )
	return false; 
	if ( check_pattern( that.link_description ) == false )
	return false; 
	if ( check_pattern( that.link_email ) == false )
	return false;

	return true; 
}

function EditLinkFormValidation( that )
{
	if ( check_pattern( that.Link ) == false )
	return false; 
	if ( check_pattern( that.Title ) == false )
	return false; 
	if ( check_pattern( that.Description ) == false )
	return false; 
	if ( check_pattern( that.Email ) == false )
	return false; 
	
}

function AddCatFormValidation( that )
{
	if ( check_pattern( that.title ) == false )
	return false; 
	if ( check_pattern( that.dir ) == false )
	return false; 
}

function EditCatFormValidation( that )
{
	if ( check_pattern( that.title ) == false )
	return false; 
	if ( check_pattern( that.dir ) == false )
	return false; 
}
function SetModRewrite()
{
if ( document.getElementById('mod_rewrite').value == 0 )
{	
	for( i = 1; i < 4; i++ )
	{
		document.getElementById('url_set'+i).className = 'dis_set_input';
		document.getElementById('url_set'+i).disabled = true;
	}
}
else
{
	for( i = 1; i < 4; i++ )
	{
		document.getElementById('url_set'+i).className = 'set_input';
		document.getElementById('url_set'+i).disabled = false;		
	}
}

}

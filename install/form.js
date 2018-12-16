// Validity patterns

var valid = new Object();

valid.url_root			= /^http\:\/\/([a-zA-Z0-9\_\.\-\/]{1,})\/$/;
valid.url_main_site		= /^http\:\/\/([a-zA-Z0-9\_\.\-\/]{1,})\/$/;
valid.dir_root			= /^\/([a-zA-Z0-9\_\.\-\/]{1,})\/$/;
valid.page_title		= /^.+$/;
valid.site_full 		= /^.+$/;
valid.site_brand 		= /^.+$/;
valid.mysql_username		= /^\w{2,}$/;
valid.mysql_host		= /^.+$/;
valid.mysql_dbname		= /^.+$/;


function trim(field)
{
	while( field.value.substring( 0, 1) == ' ' )
		field.value = field.value.substring( 1, field.value.length );
	while( field.value.substring( field.value.length-1, field.value.length ) == ' ' )
		field.value = field.value.substring( 0, field.value.length - 1 );
}

function fail_alert( field, message )
{
	alert( message );
	field.focus();
	return(false);
}

function check_pattern( field, message )
{
	trim( field );
	var thePat = valid[field.name];
	if( !thePat.exec( field.value ) )
		return fail_alert( field, field.title );
	return true;
}

function FormValidation( F )
{
	for( var i=0; i < F.elements.length; i++ )
	{
		var field = F.elements[i];
		if ( 'VerifyEmail' == field.name )
		{
			if ( field.value != F.elements['Email'].value )
				return fail_alert( field, field.title );
			continue;
		}
		if ( 'VerifyPassword' == field.name )
		{
			if ( field.value != F.elements['Password'].value )
				return fail_alert( field, field.title );
			continue;
		}
		if ( 'VerifyPassword_edit' == field.name )
		{
			if ( field.value != F.elements['Password_edit'].value )
				return fail_alert( field, field.title );
			continue;
		}
		if( !field.title.length )
			continue;
		if ( !check_pattern( field, field.title ) )
			return( false );
	}
	return( true );
}

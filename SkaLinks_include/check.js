function setCheckboxes(the_form, do_check )
{
	for ( var i = 0; i < document.forms[the_form].elements.length; i++ )
		document.forms[the_form].elements[i].checked = do_check;
	return true;
}

function sure( question )
{
	return confirm( question );
}
function InsertTemplate( ID, Template )
{
window.opener.document.add_url.letter_id.value=ID;
window.opener.document.add_url.template_text.value=unescape(Template);
window.focus();
window.close();
}

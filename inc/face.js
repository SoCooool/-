function ChangePic(i)//select a face
    {
        document.getElementById('FacePic').src = "images/face/" + i + ".gif";
        document.getElementById('userface').value = i;
    }
    function yagu()
    {
        if(document.getElementById('Face').style.display =='none')
        {
            document.getElementById('Face').style.display = 'block';
        }
        else
        {
            document.getElementById('Face').style.display = 'none';
        }
    }
document.onmouseup = function() {document.getElementById('Face').style.display = 'none';}
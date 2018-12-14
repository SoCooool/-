
(function () {
    var xPos = 300;
    var yPos = 200;
    var step = 1;
    var delay = 30;
   
    var Hoffset = 0;
    var Woffset = 0;
    var yon = 0;
    var xon = 0;
    var pause = true;
    var interval;
    var img=document.getElementById('paopaoimg');
    img.style.top = yPos;
    var width = document.body.clientWidth;
     var  height = document.body.clientHeight;
    var changePos=function() {
       
        Hoffset = img.offsetHeight;
        Woffset = img.offsetWidth;
        img.style.left = (xPos + document.body.scrollLeft)+"px";
        img.style.top = (yPos + document.body.scrollTop)+"px";
        if (yon) {
            yPos = yPos + step;
        }
        else {
            yPos = yPos - step;
        }
        if (yPos < 0) {
            yon = 1;
            yPos = 0;
        }
        if (yPos >= (height - Hoffset)) {
            yon = 0;
            yPos = (height - Hoffset);
        }
        if (xon) {
            xPos = xPos + step;
        }
        else {
            xPos = xPos - step;
        }
        if (xPos < 0) {
            xon = 1;
            xPos = 0;
        }
        if (xPos >= (width - Woffset)) {
            xon = 0;
            xPos = (width - Woffset);
        }
    }

    function start() {
        img.visibility = "visible";
        interval = setInterval(changePos, delay);
    }
    start();
})();
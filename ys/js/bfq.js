/*
*
*	×÷Õß£ºÐ¡ÕÕ & »ÃÏñ
*
*/
var bg_audio_val = true;
var bg_audio = new Audio();
function audio_init(){
        var options_audio = {
                loop: true,
                preload: "auto",
                src: $('.u-audio').attr('data-src')
        }
        for (var key in options_audio) {
                bg_audio[key] = options_audio[key];
        }
        bg_audio.load();
        audio_addEvent();
        bg_audio.play();
}
function audio_addEvent(){
        $("#btnAudio").on('click', audio_control);
        $(bg_audio).on('play',function(){
                bg_audio_val = false;
                $('#btnAudio').addClass('rotate1circle');
        })
        $(bg_audio).on('pause',function(){
                $('#btnAudio').removeClass('rotate1circle');
        })
}
function audio_control(){
        if(!bg_audio_val){
                bg_audio.pause();
                bg_audio_val = true;
        }else{
                bg_audio.play();
        }
}
audio_init(); 
var addLoadGif = function(){
	$(this).closest('p.loadmoreimage').removeClass('loadmoregif');
	$('.loadmorepracticaldiv').fadeOut();
	console.log("addLoadGif");
}
var removeLoadGif = function(){
	$(this).closest('p.loadmoreimage').addClass('loadmoregif');
	$('.loadmorepracticaldiv').fadeIn();
	console.log("removeLoadGif");
}

var ajaxBefore = function(){
	$('.loadmorepracticaldiv a[data-remote]').on('ajax:send',addLoadGif);
}
var ajaxCompletion = function(){
	$('.loadmorepracticaldiv a[data-remote]').on('ajax:complete',removeLoadGif);
	console.log("Ajax:complete");
}

var ajax = function(){
	ajaxBefore();
	ajaxCompletion();
}

$(document).ready(function(){
	ajax();
});
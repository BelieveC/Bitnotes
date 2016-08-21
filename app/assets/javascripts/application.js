// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require bootstrap-sprockets
//= require jquery_ujs
//= require cocoon
//= require nprogress
//= require nprogress-turbolinks
//= require turbolinks
//= require_tree .


NProgress.configure({
  showSpinner: false,
  ease: 'ease',
  speed: 500
});

//Coookie.js For hiding the Google translator top Bar
(function(factory){if(typeof define==='function'&&define.amd){define(['jquery'],factory);}else{factory(jQuery);}}(function($){var pluses=/\+/g;function encode(s){return config.raw?s:encodeURIComponent(s);}
function decode(s){return config.raw?s:decodeURIComponent(s);}
function stringifyCookieValue(value){return encode(config.json?JSON.stringify(value):String(value));}
function parseCookieValue(s){if(s.indexOf('"')===0){s=s.slice(1,-1).replace(/\\"/g,'"').replace(/\\\\/g,'\\');}
try{s=decodeURIComponent(s.replace(pluses,' '));return config.json?JSON.parse(s):s;}catch(e){}}
function read(s,converter){var value=config.raw?s:parseCookieValue(s);return $.isFunction(converter)?converter(value):value;}
var config=$.cookie=function(key,value,options){if(value!==undefined&&!$.isFunction(value)){options=$.extend({},config.defaults,options);if(typeof options.expires==='number'){var days=options.expires,t=options.expires=new Date();t.setTime(+t+ days*864e+5);}
return(document.cookie=[encode(key),'=',stringifyCookieValue(value),options.expires?'; expires='+ options.expires.toUTCString():'',options.path?'; path='+ options.path:'',options.domain?'; domain='+ options.domain:'',options.secure?'; secure':''].join(''));}
var result=key?undefined:{};var cookies=document.cookie?document.cookie.split('; '):[];for(var i=0,l=cookies.length;i<l;i++){var parts=cookies[i].split('=');var name=decode(parts.shift());var cookie=parts.join('=');if(key&&key===name){result=read(cookie,value);break;}
if(!key&&(cookie=read(cookie))!==undefined){result[name]=cookie;}}
return result;};config.defaults={};$.removeCookie=function(key,options){if($.cookie(key)===undefined){return false;}
$.cookie(key,'',$.extend({},options,{expires:-1}));return!$.cookie(key);};}));


//Description Slider
	$(document).ready(function () {
		$("#showLess").hide();
		size_li = $("#myList li").size();
		x=1;
		$('#myList li:lt('+x+')').show();
		$('#loadMore').click(function () {
			x= (x+1 <= size_li) ? x+1 : size_li;
			$('#myList li:lt('+x+')').fadeIn();
			$("#loadMore").hide();
			$("#showLess").fadeIn();
		});
		$('#showLess').click(function () {
			x=(x-1<0) ? 1 : x-1;
			$('#myList li').not(':lt('+x+')').fadeOut();
			$("#showLess").hide();
			$("#loadMore").fadeIn();
		});
		$(".footer-bottom-nav").on("click","#moreLang",function(event){
			event.preventDefault();
			if($(this).hasClass("moreLang")){
				$(this).text("-Less Languages");
				$(this).removeClass("moreLang");
			}else{
				$(this).text("+More Languages");
				$(this).addClass("moreLang");
			}
			$("#moreLangDiv").fadeToggle();
		});
	});	



// form image add feature

// function addImage(event) {
// 	var deleteSvg = '<svg fill="#E91E63" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">\
//     <path d="M15 16h4v2h-4zm0-8h7v2h-7zm0 4h6v2h-6zM3 18c0 1.1.9 2 2 2h6c1.1 0 2-.9 2-2V8H3v10zM14 5h-3l-1-1H6L5 5H2v2h12z"/>\
//     <path d="M0 0h24v24H0z" fill="none"/>\
// </svg>';
// 	console.log(event.target);
// 	var el = document.createElement('div');
// 	el.setAttribute('class', 'image-preview');
// 	el.setAttribute('id', '123');
// 	var targetLocation = document.getElementById('image-preview-box');
// 	targetLocation.appendChild(el);
// 	el.innerHTML = "<span class='delete-image'>"+deleteSvg+"</span><input type='file' accept='image/*'>";

// 	// el.getElementsByTagName('input')[0].click();

// 	function change
// }


function addImage(event) {
	var deleteSvg = '<svg fill="#0288d1" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">\
					    <path d="M15 16h4v2h-4zm0-8h7v2h-7zm0 4h6v2h-6zM3 18c0 1.1.9 2 2 2h6c1.1 0 2-.9 2-2V8H3v10zM14 5h-3l-1-1H6L5 5H2v2h12z"/>\
					    <path d="M0 0h24v24H0z" fill="none"/>\
					</svg>';
	var imgPreviewBox = document.getElementById('image-preview-box');
	var milliseconds = (new Date).getTime();

	var imgbox = document.createElement('div');
	imgbox.setAttribute('class', 'image-preview');

	var hiddenInput = document.createElement('input');
	hiddenInput.setAttribute('type', 'file');
	hiddenInput.setAttribute('name', 'practical[pimages_attributes]['+ milliseconds+'][image]');
	hiddenInput.style.display = "none";

	var deleteBtn = document.createElement('span');
	deleteBtn.setAttribute('class', 'delete-image');
	deleteBtn.setAttribute('title', 'Remove this image');

	deleteBtn.innerHTML = deleteSvg;

	hiddenInput.click();

	imgPreviewBox.appendChild(imgbox);
	imgbox.appendChild(deleteBtn);
	imgbox.appendChild(hiddenInput);

	deleteBtn.onclick = function() {
		imgPreviewBox.removeChild(imgbox);
	}

	function handleFileSelect(evt) {
	    var files = evt.target.files;

	    var f = files[0];
	      // Only process image files.
	      if (!f.type.match('image.*')) {
	      	console.log('not an image');
	        return;
	      }

	      var reader = new FileReader();
	      reader.onload = (function(theFile) {
	        return function(e) {
	          imgbox.style.background = "url("+e.target.result+")";
	          imgbox.style.backgroundSize = "150px 200px";
	          imgbox.style.backgroundRepeat = "no-repeat";
	        };
	      })(f);
	      reader.readAsDataURL(f);
	}


	hiddenInput.addEventListener('change', handleFileSelect, false);
}

$(document).ready(function(){
	$(".delete-image").on("click",function(){
		$(this).closest(".image-preview").remove();
		
	});
});

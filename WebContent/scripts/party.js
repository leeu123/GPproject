$(document).ready(function(){ 
	$("article").mouseover(function(){
		$("article").css("background-image","url('img/party1.jpg')");
		$("article").css("transition-duration","1s");
	});
}); 
$(document).ready(function(){ 
	$("article").mouseout(function(){ 
		$("article").css("background-image","url('img/party.jpg')");
		$(this).css("transition-duration","1s");
	});
});
$(document).ready(function(){
	$(".partypic[name$='kor']").mouseover(function(){
		//$(".partypic[name$='sam']").css("background","black");
		$("#korea").css("visibility","visible");
		});
	$(".partypic[name$='kor']").mouseout(function(){
		$("#korea").css("visibility","hidden");
		});
	
	$(".partypic[name$='chn']").mouseover(function(){
		$("#china").css("visibility","visible");
		});
	$(".partypic[name$='chn']").mouseout(function(){
		$("#china").css("visibility","hidden");
		});
	
	$(".partypic[name$='jpn']").mouseover(function(){
		$("#japan").css("visibility","visible");
		});
	$(".partypic[name$='jpn']").mouseout(function(){
		$("#japan").css("visibility","hidden");
		});
	
	$(".partypic[name$='wes']").mouseover(function(){
		$("#western").css("visibility","visible");
		});
	$(".partypic[name$='wes']").mouseout(function(){
		$("#western").css("visibility","hidden");
		});
	
	$(".partypic[name$='wor']").mouseover(function(){
		$("#world").css("visibility","visible");
		});
	$(".partypic[name$='wor']").mouseout(function(){
		$("#world").css("visibility","hidden");
		});
	
	$(".partypic[name$='what']").mouseover(function(){
		$("#whatever").css("visibility","visible");
		});
	$(".partypic[name$='what']").mouseout(function(){
		$("#whatever").css("visibility","hidden");
		});
	});
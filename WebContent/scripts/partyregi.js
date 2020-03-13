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
	$(".partypic[name$='sam']").mouseover(function(){
		//$(".partypic[name$='sam']").css("background","black");
		$("#samsin").css("visibility","visible");
		});
	$(".partypic[name$='sam']").mouseout(function(){
		$("#samsin").css("visibility","hidden");
		});
	
	$(".partypic[name$='jock']").mouseover(function(){
		$("#jocksin").css("visibility","visible");
		});
	$(".partypic[name$='jock']").mouseout(function(){
		$("#jocksin").css("visibility","hidden");
		});
	
	$(".partypic[name$='bos']").mouseover(function(){
		$("#bossin").css("visibility","visible");
		});
	$(".partypic[name$='bos']").mouseout(function(){
		$("#bossin").css("visibility","hidden");
		});
	
	$(".partypic[name$='chi']").mouseover(function(){
		$("#chisin").css("visibility","visible");
		});
	$(".partypic[name$='chi']").mouseout(function(){
		$("#chisin").css("visibility","hidden");
		});
	
	$(".partypic[name$='bang']").mouseover(function(){
		$("#bangsin").css("visibility","visible");
		});
	$(".partypic[name$='bang']").mouseout(function(){
		$("#bangsin").css("visibility","hidden");
		});
	
	$(".partypic[name$='gob']").mouseover(function(){
		$("#gobsin").css("visibility","visible");
		});
	$(".partypic[name$='gob']").mouseout(function(){
		$("#gobsin").css("visibility","hidden");
		});
	});
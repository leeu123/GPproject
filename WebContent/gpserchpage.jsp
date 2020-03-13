<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html lang="en">
 <head>
 <link rel ="stylesheet" type = "text/css" href = "css/gpstyle2.css">

  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="shortcut icon" href="http://simbyone.com/wp-content/uploads/2014/04/3455e6f65c33232a060c28829a49b1cb.png">
<title>Animated Header with scroll</title>

<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900,200italic,300italic,400italic,600italic,700italic,900italic' rel='stylesheet' type='text/css'>

<link href="css/Icomoon/style.css" rel="stylesheet" type="text/css" />
<link href="css/animated-header.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="_scripts/jquery-2.0.2.min.js"></script>
<script type="text/javascript" src="_scripts/jquery-ui-1.10.4.min.js"></script>
<script type="text/javascript" src="_scripts/jquery.isotope.min.js"></script>
<script type="text/javascript" src="_scripts/animated-header.js"></script>

<link rel="stylesheet" type="text/css" href="css/loginstyle.css"/>
<script type="text/javascript" src="_scripts/login.js"></script>
 </head>
 <body>

  <%@include file = "header.jsp"%>
  <nav>
  
  <div id = "location">
  <div id="location-bar"><h2 id = "ul-margin">지역선택</h2></div>
  <div id="location-li"> 
 <div id = "dd">
  <div class="boxes">
  <ul>
 <li>
  <input type="checkbox" id="box-1">
  <label for="box-1">서울</label>
  </li>
  <li>
  <input type="checkbox" id="box-2" >
  <label for="box-2">경기</label>
  </li>
  <li>
  <input type="checkbox" id="box-3">
  <label for="box-3">인천</label>
  </li>
  <li>
  <input type="checkbox" id="box-4">
  <label for="box-4">강원</label>
  </li>
  <li>
  <input type="checkbox" id="box-5">
  <label for="box-5">대전</label>
  </li>
  <li>
  <input type="checkbox" id="box-6">
  <label for="box-6">세종</label>
  </li>
   <li>
  <input type="checkbox" id="box-7">
  <label for="box-7">충남</label>
  </li>
   <li>
  <input type="checkbox" id="box-8">
  <label for="box-8">충북</label>
  </li>
   <li>
  <input type="checkbox" id="box-9">
  <label for="box-9">부산</label>
  </li>
   <li>
  <input type="checkbox" id="box-10">
  <label for="box-10">울산</label>
  </li>
   <li>
  <input type="checkbox" id="box-11">
  <label for="box-11">경남</label>
  </li>
   <li>
  <input type="checkbox" id="box-12">
  <label for="box-12">경북</label>
  </li>
   <li>
  <input type="checkbox" id="box-13">
  <label for="box-13">대구</label>
  </li>
   <li>
  <input type="checkbox" id="box-14">
  <label for="box-14">광주</label>
  </li>
   <li>
  <input type="checkbox" id="box-15">
  <label for="box-15">전남</label>
  </li>
   <li>
  <input type="checkbox" id="box-16">
  <label for="box-16">전북</label>
  </li>
   <li>
  <input type="checkbox" id="box-17">
  <label for="box-17">제주</label>
  </li>
  </ul>
</div>
</div>  
  </div>
  </div>
  <div id = "menu">
  <div id="location-bar"><h2 id = "ul-margin">메뉴선택</h2></div>
  <div id = "menu-bar">
  <div id = "dd">
  <div class="boxes">
  <ul id ="menu-ul">
 <li>
  <input type="checkbox" id="menu-1">
  <label for="menu-1"><img src = "img\han-yes.jpg" ></label>
  </li>
  <li>
  <input type="checkbox" id="menu-2" >
  <label for="menu-2"><img src = "img\ch-yes.jpg"></label>
  </li>
  <li>
  <input type="checkbox" id="menu-3">
  <label for="menu-3"><img src = "img\j-yes.jpg" ></label>
  </li>
  <li>
  <input type="checkbox" id="menu-4">
  <label for="menu-4"><img src = "img\yang-yes.jpg" ></label>
  </li>
 </ul>
 </div>
 </div>
  </div>
  <div id = "menu-bar">
  <div id = "dd">
  <div class="boxes">
  <ul id ="menu-ul">
 <li>
  <input type="checkbox" id="menu-5">
  <label for="menu-5"><img src = "img\world-yes.jpg" ></label>
  </li>
  <li>
  <input type="checkbox" id="menu-6" >
  <label for="menu-6"><img src = "img\v-yes.jpg"></label>
  </li>
  <li>
  <input type="checkbox" id="menu-7">
  <label for="menu-7"><img src = "img\c-yes.jpg" ></label>
  </li>
  <li>
  <input type="checkbox" id="menu-8">
  <label for="menu-8"><img src = "img\ju-yes.jpg" ></label>
  </li>
 </ul>
 </div>
 </div>
  </div>
  </div>
 <div id = "price-recommend">
 <div id="location-bar"><h2 id = "ul-margin">가격&추천,인기</h2></div>
 <div id ="price-bar">
  <div id = "dd">
  <div class="boxes">
  <ul id ="menu-ul">
 <li>
  <input type="checkbox" id="price-1">
  <label for="price-1"><img src = "img\1-yes.jpg"></label>
  </li>
  <li>
  <input type="checkbox" id="price-2" >
  <label for="price-2"><img src = "img\2-yes.jpg"></label>
  </li>
  <li>
  <input type="checkbox" id="price-3">
  <label for="price-3"><img src = "img\3-yes.jpg" ></label>
  </li>
  <li>
  <input type="checkbox" id="price-4">
  <label for="price-4"><img src = "img\4-yes.jpg"></label>
  </li>
 </ul>
 </div>
 </div>
 </div>
 <div id ="price-bar"> 
 <div id = "dd">
  <div class="boxes">
  <ul id ="menu-ul">
  <li>
  <input type="checkbox" id="chu-1">
  <label for="chu-1"><div id = "recommend-img"><img src = "img\chu-yes.jpg"  ></div></label>
  </li>
  <li>
  <input type="checkbox" id="p-2" >
  <label for="p-2"><div id = "recommend-img"><img src = "img\p-yes.png" ></div></label>
  </li>
  </ul>
  </div>
 </div>
 </div> 
<input type = "button" id ="button-box" value="검색">

  </nav>
  <section>
  <div style = "width : 1920px;">
 
  <div id = "restaurant">
  <div id = "restaurant-margin">

  <ul id = "restaurant_margin_ul">
  <li><div id = "restaurant-1"><a href = "restaurant.jsp"><img src = "img/K-001.jpg"><ul id = "restaurant_img_ul"><li><p>정돈</p></li></a><li><span>4.5</span></li></ul></div></li>
  <li><div id = "restaurant-2"><img src = "img/K-002.jpg"><ul id = "restaurant_img_ul"><li><p>오스틴(강남점)</p></li><li><span>5.0</span></li></ul></div></li>
  <li ><div id = "restaurant-3"><img src = "img/K-003.jpg"><ul id = "restaurant_img_ul"><li><p>쿠차라(삼성서초사옥점)</p></li><li><span>4.0</span></li></ul></div></li>
  </ul>
  </div>
   
  <div id = "restaurant-margin">
  <ul id= "restaurant_margin_ul">
  <li><div id = "restaurant-1"><img src = "img/K-004.jpg"><ul id = "restaurant_img_ul"><li><p>꽃을피우고</p></li><li><span>3.5</span></li></ul></div></li>
  <li><div id = "restaurant-2"><img src = "img/K-005.jpg"><ul id = "restaurant_img_ul"><li><p>들름집</p></li><li><span>4.0</span></li></ul></div></li>
  <li><div id = "restaurant-3"><img src = "img/K-006.jpg"><ul id = "restaurant_img_ul"><li><p>꽃을피우고</p></li><li><span>3.5</span></li></ul></div></li>
  </ul>
  </div>

   <div id = "restaurant-margin">
   <ul id= "restaurant_margin_ul">
  <li><div id = "restaurant-1"><img src = "img/K-007.jpg"><ul id = "restaurant_img_ul"><li><p>하늬돈까스</p></li><li><span>5.0</span></li></ul></div></li>
 <li><div id = "restaurant-2"><img src = "img/K-008.jpg"><ul id = "restaurant_img_ul"><li><p>투뿔등심</p></li><li><span>5.0</span></li></ul></div></li>
  <li><div id = "restaurant-3"><img src = "img/K-009.jpg"><ul id = "restaurant_img_ul"><li><p>강남진해장</p></li><li><span>4.0</span></li></ul></div></li>
  </ul>
  </div>
  </div>
  <div id = "section-right">
 <span>
<div id="daumRoughmapContainer1576047049962" class="root_daum_roughmap root_daum_roughmap_landing"></div>


<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

<script charset="UTF-8">
	new daum.roughmap.Lander({
		"timestamp" : "1576047049962",
		"key" : "w7hx",
		"mapWidth" : "350",
		"mapHeight" : "450"
	}).render();
</script></span>
<div id = "con"><img src = "img/con-1.jpg"></div>
<div id = "con"><img src = "img/con-2.jpg"></div>
<div id = "con"><img src = "img/con-3.jpg"></div>

</div>
  </div>
  </section>


  <%@include file = "footer.jsp"%>


	</div>
	
 </body>
</html>

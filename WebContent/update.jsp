<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/membershipStyle.css">
<script type="text/javascript" src="scripts/membership_script.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
<%
request.setCharacterEncoding("UTF-8");
String id = (String) session.getAttribute("id");
String nic = (String) session.getAttribute("nic");
String pw = (String) session.getAttribute("pw");
session.setAttribute("pworiginal",pw);
String name = (String) session.getAttribute("name");
String pwa = (String) session.getAttribute("pwa");
String age = (String) session.getAttribute("age");
String email = (String) session.getAttribute("email");
String home = (String) session.getAttribute("home");
String dethome = (String) session.getAttribute("dethome");
String cell = (String) session.getAttribute("cell");
String postnum = (String) session.getAttribute("postnum");
%>
<script>



function pwequals()
{

var pw = naver.pw.value
var pw2 = naver.pw2.value

if (pw == pw2)
{   
	alert("비밀번호가 일치합니다.");
	naver.pw2.focus()

}else{
	
	alert("비밀번호가 일치하지 않습니다.");
	naver.pw2.focus()
}

}
	

function total_check(){
var reg = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
var password = naver.pw.value
  var niclength = naver.nic.value.length
	var nicname = naver.nic.value
	var nameimport = naver.name.value
	if (nicname == "")
	{

		alert("닉네임을 입력해주세요.")
		naver.nic.focus()
	}
	else if ( nameimport== "")
	{

		alert("이름을 입력해주세요.")
		naver.name.focus()
	}
	else if (niclength < 8)
	{
		alert("8자 이상 쓰셔야 합니다.")
	    naver.nic.focus()
	    naver.nic.select()
	}   
     else if(false === reg.test(password)) {
    alert('비밀번호는 8자 이상이어야 하며, 숫자/소문자/특수문자를 모두 포함해야 합니다.');
	naver.pw.focus()
	naver.pw.select()
}else{
document.naver.submit();
}
}


</script>

 
</head>
<body class = "b">
<div id ="membership_totalbar">
 <center>
 
 <table>

 <FORM name = "naver" action ="update_process.jsp" method = post >
 <tr>
 <td align = "center">
<a href = "gpindex.jsp"><img src ="img\\gplogo1.png" style = "width : 400px; height : 90px" ></a>
  </td>
  </tr>
 
  
  <tr>

   <td class="l">닉네임 </td>
   </tr>
   <tr>
   <td>
   <div><input type = "text" class="f"name = "nic"value='${nic}' placeholder="닉네임을 입력하세요" onfocus="this.placeholder = ''" onblur="this.placeholder = '닉네임을 입력하세요'">  </div> 
   </td>
  </tr>


<tr>

   <td class="l">비밀번호</td>
   </tr>
   <tr>
   <td>
   <div><input type = "text"class="f" name="pw"value='${pw}'placeholder="비밀번호를 입력하세요" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호를 입력하세요'"></div> 
   </td>
  </tr>

   <tr>
   <td class="l"> 비밀번호 찾기 힌트</td>
   </tr>
   <tr>
   <td>
    <div><select class= "o"name = "pwhint">
	 <option> 본인의 보물1호 </option>
     <option> 가장 기억어 남는 장소 </option>
     <option> 본인의 별명 </option>
	  <option> 부모님의 성함은 </option>
     <option> 태어난 곳 </option>
     </select></div>
   </td>
  </tr>
  <tr>
   <td>
   <div><input type = "text"name = "pwa" class="f"placeholder="힌트 정답을 입력하세요" value='${pwa}'onfocus="this.placeholder = ''" onblur="this.placeholder = '힌트 정답을 입력하세요'"></div> 
   </td>
  </tr>

 <tr>

   <td class="l">성명 </td>
   </tr>
   <tr>
   <td>
   <div><input  type = "text"name = "name"class="f"value='${name}'placeholder="이름을 입력하세요" onfocus="this.placeholder = ''" onblur="this.placeholder = '이름을 입력하세요'"></div> 
   </td>
  </tr>

  <tr>

   <td class="l">생년월일 </td>
   </tr>
   <tr>
   <td>
  <div><input  type = "text"name = "age"class="f"value='${age}'placeholder="이름을 입력하세요" onfocus="this.placeholder = ''" onblur="this.placeholder = '이름을 입력하세요'"></div> 
  
   </td>
  </tr>


  <tr>
   <td class="l"> 성별 </td>
   </tr>
   <tr>
   <td>
    <div><select class= "o"name = "age">
	 <option> 성별 </option>
     <option> 남자 </option>
     <option> 여자 </option>
     
	</select></div>
   </td>
  </tr>




  <tr>
   <td class "l"> 본인확인 이메일 </td>
   </tr>
   <tr>
   <td>
   <div><input  type = "text" name = "email"class="f" value='${email}' placeholder="이메일을 입력하세요" onfocus="this.placeholder = ''" onblur="this.placeholder = '이메일을 입력하세요'"></div>
   
   </td>
  </tr>
<tr>
   <td class="l"> 우편번호 </td>
   </tr>
   <tr>
   <td>
    <div><input type="text" id="sample6_postcode" placeholder="우편번호"value='${postnum}'name = "postnum"style = "border : none"><input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"class="btn btn-success"style="margin-left: 69px;"></div> 
   </td>
  </tr>



  <tr>
   <td class="l"> 주소 </td>
   </tr>
   <tr>
   <td>
    <div><input type="text" id="sample6_address"value='${home}' placeholder="주소"name = "home"class="f"></div> 
   </td>
  </tr>
  <tr>
   <td class ="l"> 상세주소 </td>
   </tr>
   <tr>
   <td>
     <div><input type="text" id="sample6_detailAddress"value='${dethome}' placeholder="상세주소"name = "dethome"class="f"></div> 
   </td>
  </tr> 
  <tr>
   <td>
     <div><input type="text" id="sample6_extraAddress" placeholder="참고항목"><script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script></div> 
   </td>
  </tr>
  


  <tr>
   <td> 휴대전화 </td>
   </tr>
   
   <tr>
   <td> <div><input  type = "text"name = "cell" value='${cell}' class = "f"placeholder="-없이 입력해주세요" onfocus="this.placeholder = ''" onblur="this.placeholder = '-없이 입력해주세요'"></div>
   </td>
   </tr>
  <tr>
  <td>
<button onClick = "total_check()" type="button" class="btn btn-success"style="width : 400px; height : 40px;margin-left: 9px;">수정하기</button></td>
</tr>

 </FORM>
</table>

<br/>





</center>
</div>
</body>
</html>




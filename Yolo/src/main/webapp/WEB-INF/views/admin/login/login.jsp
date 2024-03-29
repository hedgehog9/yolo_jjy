<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<% String ctxPath = request.getContextPath(); %>

<style type="text/css">

	* {font-family: 'Pretendard', sans-serif; !important}
    
.inner {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%,-50%);
  text-align: center;
}

.gradtext {
       background: #55ffaa;
       background: -webkit-linear-gradient(to left ,#88eb1e, #5bd3ff);
       background:    -moz-linear-gradient(right, #88eb1e, #5bd3ff);
       background:      -o-linear-gradient(right, #5b#88eb1e, #5bd3ff);
       background:         linear-gradient(to right, #88eb1e, #5bd3ff);
       -webkit-background-clip: text;
               background-clip: text;
       color: transparent;
       font-size: 32pt;
       font-weight: 800;
   }

.title {
	
   font-size: 32pt;
   font-weight: bold;
   color: gray;
}  

 input:focus {
	outline : none;
} 

input.search {
		border-radius: 0.5rem;
		border: none;
		width: 350px;
		height: 50px;
/* 		font-weight: bold; */
		font-size: 13pt;
		float: right;
		display: flex;
		margin-left : 20px;
		margin-top: 9px;
		font-weight: bold;
	}

div#text {
		border-radius: 0.5rem;
		border: 1px solid #b3b3b3;
		width: 410px;
		height: 70px;
		font-weight: bold;
		font-size: 13pt;
		padding-left: 15px;
		margin-top: 10px;
		text-align: left;
		display: flex;
}	


div#borderID {
		border-radius: 0.5rem;
		border: 2px solid #66cc66;
		width: 410px;
		height: 70px;
		font-weight: bold;
		font-size: 13pt;
		padding-left: 15px;
		margin-top: 10px;
		text-align: left;
		display: flex;
}	

	

input::placeholder {
  color: #b3b3b3;
  font-size: 13pt;
}

.icon {

	color: #666666; 
	font-size: 17pt; 
	padding-top: 18px; 
	font-weight: bold;

}
/* div#search:active{

	border : 2px solid #66cc66;
} */

button.headerBtn {
		border-radius: 0.5rem;
		border: 1px solid gray;
		background: linear-gradient( to left ,#5bd3ff, #88eb1e );
		width: 410px;
		height: 70px;
		border: none;
		color: white;
		font-weight: bold;
		font-size : 13pt;
	}

div#findPW:hover {

	background-color: #efefef;
	cursor: pointer;
	border-radius: 0.5rem;

}	

#findPW {
	margin-top: 25px;
	font-size: 13pt;
	color : #00b300;
	font-weight: bold;
	padding-top: 10px;
	padding-bottom: 10px;
}	

.continue {

	width: 70px;
	height: 50px;
	margin: 0px;
	border: 1px solid green;
	background: #00b300;
	color: white;
	border-radius: 0.5rem;
	font-size: 11pt;
	font-weight: white;
}
#continue {

	width: 60px;
	height: 45px;
	margin: 7px 10px 2px 10px;
	border: 1px solid green;
	background: #00b300;
	color: white;
	border-radius: 0.5rem;
	font-size: 11pt;
	font-weight: white;
}

</style>

<script type="text/javascript">

 	$(document).ready (function(){
	
 		/* $("input.email").focus();	 */
 		/* $("button#continue").hide(); */
 	
 		//input 클릭시 색 바꾸기
 	 	$("div.borderID").click(function(){
	          $(this).css("border", "2px solid #66cc66"); 
        }); 

 	 	//아이디 입력시  다음창들 나타남
 	    $("input.email").bind("keyup", function(e) {
 	    	goContents();
	    });
 	 	
 		// 이메일 입력후 엔터 입력시
 		$("input#email").keydown(function(e){
 			if (e.keyCode == 13) {
 				$("input#pwd").focus();
 			  }
 		});
 		
 		// 비밀번호 입력 후 엔터 입력시 로그인
 		$(document).on("keydown","input#pwd",function(e){
 			if (e.keyCode == 13) {
 				func_login();
 			}
 		});
 	 	
 	 	// 로그인 버튼 클릭시 
 	 	$(document).on("click","button#btn_login",function(){
 	 		
 	 		console.log("로그인 버튼 클릭됨");
 	 		
 	 		func_login();
 	 		
 	 		<%-- 
 	 		const frm = document.loginFrm;
 			frm.method="POST";
 			frm.action="<%= ctxPath%>/findPW.yolo";
 			frm.submit();
 			--%>
 	 		
 	 	});// end of $(document).on("click","btn_login",function(){}--------------------------
 	 	
	}); // end of $(document).ready (function(){}---------------------------------------
	
 	// 비밀번호 찾기
	function goFindPW() {
		const frm = document.loginFrm;
		frm.method="POST";
		frm.action="<%= ctxPath%>/findPW.yolo";
		frm.submit();
	}
	
 	// 로그인버튼 클릭시 호출하는 함수(로그인시 공지사항으로 이동)
	function goNotice() {
		
		location.href="<%= request.getContextPath()%>/notice/noticeList.yolo";
	}
	
 	function func_login(){
 		
		const email = $("input#email").val(); // 입력받은 아이디 
 		const pwd = $("input#pwd").val(); // 입력받은 비밀번호
 		
 		if(email.trim() == ""){
 			toastr.error('아이디를 입력하세요.');
 			$("input#email").focus();
 			return false;
 		}
 		
 		if(pwd.trim() == ""){
 			toastr.error('비밀번호를 입력하세요.');
 			$("input#pwd").focus();
 			return false;
 		}
 		
 		$.ajax({
			  url : "<%= request.getContextPath()%>/loginContinue.yolo",
			  data : {"email":email.trim() ,"pwd":pwd},
			  type : "POST",
			  dataType : "JSON",
			  success : function(json){
				  if(json.result){ // 아이디 비밀번호가 일치하는 경우 true
					  location.href="<%= request.getContextPath()%>/notice/noticeList.yolo";
				  }
				  else{ // 아이디 비밀번호가 일치하지 않는 경우 
					  toastr.error('아이디 또는 비밀번호가 틀립니다.');
					  $("input#pwd").val("");
					  $("input#email").focus();
				  }// end of if(result){}----------------------------------
			  },
			  error: function(request, status, error){
				  alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			  }
		  });
 		
 	}
 	
	// 아이디치면 나머지 contents 보이기
	function goContents() {
		  
		  $.ajax({
			  url:"<%= request.getContextPath()%>/loginpw.yolo",
			  data:{},
			  type:"POST",
			  dataType:"JSON",
			  success:function(json){

				  let html = "";

					  html += 
						"<div class='borderPW' id='text'>"+
							"<span class='icon'><i class='bi bi-key'></i></span>"+
						 	"<input placeholder='비밀번호' type='password' id='pwd' name='pwd' class='search'/>"+
						"</div>"+
						"<div style='margin-top: 20px;'>"+
							"<button id='btn_login' type='button' class='headerBtn'>"+
							"로그인하기"+
							"</button>"+
						"</div>"+
						"<div id='findPW' onclick='goFindPW();'>"+
							"비밀번호를 잊으셨나요?"+
						"</div>";	
					
				  $("div#userpw").html(html);
				  
				  $("div.borderID").click(function(){
			          $(this).css("border", "2px solid #66cc66");
			          $("div.borderPW").css("border", "1px solid #b3b3b3");  
			        }); 
		 	 	
		 	 	
		 	 	$("div.borderPW").click(function(){
		 	 		 $(this).css("border", "2px solid #66cc66");
			         $("div.borderID").css("border", "1px solid #b3b3b3"); 
			        });
			  },
			  error: function(request, status, error){
				  alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			  }
		  });
		  
	  }// end of function goContents()--------------------------- 
	
	
	
</script>

<div class="inner">
	<form name="loginFrm">	
		<div style="margin-bottom: 25px;">
			<span class="gradtext">새로운 HR의 시작 </span>
			<span class="title">yolo</span>
		</div>
		<div class="borderID" id="borderID">
			<span class="icon"><i class="bi bi-envelope"></i></span>
		 	<input placeholder="이메일 주소 " id="email" name="email" class="email search" autocomplete='off'/>
		</div>
		<div id="userpw">
		</div>		
	</form>
</div>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
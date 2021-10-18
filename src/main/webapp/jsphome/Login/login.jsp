<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인</title>
</head>
<body>

	<div style="margin:20px;">
		<form name="LoginForm" method="POST">
			<input type="text" name="member_id" value="" style="margin-bottom:5px;" placeholder="아이디"><br>
			<input type="password" name="member_pwd" value="" style="margin-bottom:5px;" placeholder="비밀번호"><br>
			<button type="button" OnClick="send_login();" style="margin-bottom:5px;">로그인</button>
			<button type="button" OnClick="reset();" style="margin-bottom:5px;">취소</button><br>
			
			<a href="web_project2/Member/member_write.jsp">회원 가입</a>|
			아이디 찾기|
			비밀번호 찾기
			
		</form>
	</div>
</body>
</html>
<script language="javascript">

	//로그인 보내기
	function send_login(){
		var obj = document.LoginForm;
		
		if(obj.member_id.value==""){
			alert("아이디를 입력해 주세요.");
			obj.member_id.focus();
			return false;
		}
		
		if(obj.member_pwd.value==""){
			alert("비밀번호를 입력해 주세요.");
			obj.member_pwd.focus();
			return false;
		}
		
		obj.action="/web_project2/LoginOkServlet";
		obj.submit();

	}
	
</script>

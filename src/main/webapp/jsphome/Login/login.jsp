<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α���</title>
</head>
<body>

	<div style="margin:20px;">
		<form name="LoginForm" method="POST">
			<input type="text" name="member_id" value="" style="margin-bottom:5px;" placeholder="���̵�"><br>
			<input type="password" name="member_pwd" value="" style="margin-bottom:5px;" placeholder="��й�ȣ"><br>
			<button type="button" OnClick="send_login();" style="margin-bottom:5px;">�α���</button>
			<button type="button" OnClick="reset();" style="margin-bottom:5px;">���</button><br>
			
			<a href="web_project2/Member/member_write.jsp">ȸ�� ����</a>|
			���̵� ã��|
			��й�ȣ ã��
			
		</form>
	</div>
</body>
</html>
<script language="javascript">

	//�α��� ������
	function send_login(){
		var obj = document.LoginForm;
		
		if(obj.member_id.value==""){
			alert("���̵� �Է��� �ּ���.");
			obj.member_id.focus();
			return false;
		}
		
		if(obj.member_pwd.value==""){
			alert("��й�ȣ�� �Է��� �ּ���.");
			obj.member_pwd.focus();
			return false;
		}
		
		obj.action="/web_project2/LoginOkServlet";
		obj.submit();

	}
	
</script>

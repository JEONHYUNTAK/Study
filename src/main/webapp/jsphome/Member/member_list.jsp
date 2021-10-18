<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="kr.co.megait.dao.*"%>

<%
	
	MemberDAO memberDAO = new MemberDAO();
	LinkedHashMap member_list = new LinkedHashMap();
	LinkedHashMap member_info = new LinkedHashMap();
	
	member_list = memberDAO.MemberList();
	
	int member_idx;
	String member_id = null;
	String member_pwd = null;
	String member_name = null;
	String member_birth = null;
	String member_phone = null;
	String member_gender = null;
	String zipcode = null;
	String raddress = null;
	String jaddress = null;
	String address = null;
	String reg_dt = null;
	String mod_dt = null;
	
	int total_count;
	total_count = memberDAO.MemberTotal();

%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Small Business - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/jsphome/Scripts/css/styles.css" rel="stylesheet" />
<!-- 
        <style>
        	td{
        		border:1px solid red;
        	}
        </style>
         -->

</head>
<body>


	<jsp:include page="/jsphome/top.jsp" />



	<!-- Page Content-->
	<div class="container px-4 px-lg-5">
		<div style="margin-top: 20px;">
			<h3>회원 리스트 테이블</h3>
		</div>

		<div style="text-align: left; margin: 10px;">
			전체 회원수 :
			<%=total_count %>
			명
		</div>

		<table class="table table-striped table-hover">
			<thead>
				<tr>
					No.
					<th></th>
					<th>아이디</th>
					<th>이름</th>
					<th>생년월일</th>
					<th>연락처</th>
					<th>성별</th>
					<th>우편번호</th>
					<th>도로명주소</th>
					<th>지번주소</th>
					<th>상세주소</th>
					<th>등록일</th>
					<th>수정일</th>
				</tr>
			</thead>

			<%
				Iterator iter = member_list.keySet().iterator();
				String str_idx = null;
			%>

			<%
				int cursor = 0;
				while(iter.hasNext()){
					str_idx = (String)iter.next();
					member_info = (LinkedHashMap)member_list.get(str_idx);
					
					member_idx = (Integer)member_info.get("member_idx");
					member_id = (String)member_info.get("member_id");
					member_pwd = (String)member_info.get("member_pwd");
					member_name = (String)member_info.get("member_name");
					member_birth = (String)member_info.get("member_birth");
					member_phone = (String)member_info.get("member_phone");
					member_gender = (String)member_info.get("member_gender");
					zipcode = (String)member_info.get("zipcode");
					raddress = (String)member_info.get("raddress");
					jaddress = (String)member_info.get("jaddress");
					address = (String)member_info.get("address");
					reg_dt = (String)member_info.get("reg_dt");
					mod_dt = (String)member_info.get("mod_dt");
			%>
			<tr>
				<td><%=(total_count-cursor) %></td>
				<td><%=member_id %></td>
				<td><a
					href="/web_project2/Member/member_view.jsp?member_idx=<%=member_idx%>"><%=member_name %></a>
				</td>
				<td><%=member_birth %></td>
				<td><%=member_phone %></td>
				<td>
					<% if(member_gender.equals("M")){ %> 남성 <%}else{ %> 여성 <%} %>
				</td>
				<td><%=zipcode %></td>
				<td><%=raddress %></td>
				<td><%=jaddress %></td>
				<td><%=address %></td>
				<td><%=reg_dt.substring(0, 10) %></td>
				<td><%=mod_dt.substring(0,10) %></td>
			</tr>
			<%
				cursor++;
				}
			%>

		</table>
		<div style="margin-bottom: 30px;">
			<button type="button" class="btn btn-primary btn-sm"
				OnClick="send_write();">등록하기</button>
		</div>

	</div>

	<jsp:include page="/jsphome/footer.jsp" />

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="/jsphome/Scripts/js/scripts.js"></script>
</body>
</html>

<script language="javascript">	

	function send_write(){
		location.href="/jsphome/Member/member_write.jsp";
	}

</script>

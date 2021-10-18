<%@page import="java.util.LinkedHashMap"%>
<%@page import="kr.co.megait.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	int member_idx = Integer.parseInt(request.getParameter("member_idx"));

	MemberDAO memberDAO = new MemberDAO();
	LinkedHashMap member_info = new LinkedHashMap();
	member_info = memberDAO.MemberInfo(member_idx);
//	out.println(member_info);


	String member_id = (String)member_info.get("member_id");
	String member_pwd = (String)member_info.get("member_pwd");
	String member_name = (String)member_info.get("member_name");
	String member_birth = (String)member_info.get("member_birth");
	String member_phone = (String)member_info.get("member_phone");
	String member_gender = (String)member_info.get("member_gender");
	String zipcode = (String)member_info.get("zipcode");
	String raddress = (String)member_info.get("raddress");
	String jaddress = (String)member_info.get("jaddress");
	String address = (String)member_info.get("address");
	String member_del_yn = (String)member_info.get("member_del_yn");
	String reg_dt = (String)member_info.get("reg_dt");
	String mod_dt = (String)member_info.get("mod_dt");


%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 보기</title>

    <style>
        table{
            border: 1px solid gray;
            border-collapse: collapse;
        }
        td{
            border:1px solid gray;
            padding: 5px;
        }
        button{
            margin:5px;
        }
    </style>

</head>
<body>

	<jsp:include page="/jsphome/top.jsp"/>	

    <h3>회원 정보 보기</h3>
    <table style="width: 700px;">
        <tr>
            <td style="width: 20%;">회원 아이디</td>
            <td style="width:80%">
            	<%=member_id %>
            </td>
        </tr>

        <tr>
            <td style="width: 20%;">비밀번호</td>
            <td style="width:80%">
            	<%=member_pwd %>
            </td>
        </tr>

        <tr>
            <td style="width: 20%;">이름</td>
            <td style="width:80%">
            	<%=member_name %>
            </td>
        </tr>

        <tr>
            <td style="width: 20%;">생년월일</td>
            <td style="width:80%">
            	<%=member_birth %>
            </td>
        </tr>

        <tr>
            <td style="width: 20%;">연락처</td>
            <td style="width:80%">
            	<%=member_phone %>
            </td>
        </tr>

        <tr>
            <td style="width: 20%;">성별</td>
            <td style="width:80%">
            	<%if(member_gender.equals("M")){ %>
            		남성
            	<%}else{ %>
            		여성
            	<%} %>
            </td>
        </tr>

        <tr>
            <td style="width: 20%;">우편번호</td>
            <td style="width:80%">
            	<%=zipcode %>
            </td>
        </tr>

        <tr>
            <td style="width: 20%;" rowspan="3">주소</td>
            <td style="width:80%">
            	<%=jaddress %>
            </td>
        </tr>

        <tr>
            <td style="width:80%">
            	<%=raddress %>
            </td>
        </tr>

        <tr>
            <td style="width:80%">
            	<%=address %>
            </td>
        </tr>

        <tr>
            <td style="width: 20%;">회원탈퇴여부</td>
            <td style="width:80%">
            	<%if(member_del_yn.equals("Y")){ %>
            		탈퇴
            	<%}else{ %>
            		회원
            	<%} %>
            </td>
        </tr>

    </table>
    <button type="button" onclick="send_modify('<%=member_idx%>');">수정하기</button>
    <button type="button" onclick="send_delete('<%=member_idx%>');">삭제하기</button>
    <button type="button" onclick="send_list();">리스트</button>

	<jsp:include page="/jsphome/footer.jsp"/>	

</body>
</html>

<script>

    //회원수정하기
    function send_modify(member_idx){
    	location.href="/web_project2/Member/member_modify.jsp?member_idx="+member_idx;
    }
    
    //회원 삭제하기
    function send_delete(member_idx){
    	var ans = confirm("정말 삭제하시겠습니까?");
    	if(ans){
        	location.href="/web_project2/MemberDeleteServlet?member_idx="+member_idx;
    	}else{
    		return false;
    	}
    }
    
    function send_list(){
    	location.href="/web_project2/Member/member_list.jsp";
    }

</script>


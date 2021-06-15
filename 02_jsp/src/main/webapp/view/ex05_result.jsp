<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 파라미터 값에 대한 한글 처리
 	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");
	String[] hobby = request.getParameterValues("hobby");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>결과 표시</h2>
	<h3>
		<ul>
			<il>이름 : <%=name %></il>	
			<il>나이 : <%=age %></il>	
			<il>성별 : <%=gender %></il>
			<il>취미 : 
					<% for(String k : hobby){
						out.println(k+"&nbsp;&nbsp;");
					}%>
			</il>
			<hr>
			<il>취미 : 
					<% for(String k : hobby){%>
						<%=k %>&nbsp;&nbsp;
					<%}%>
			</il>
		</ul>
	</h3>
</body>
</html>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더 정보 보기</title>
</head>
<body>
	<h2>헤더 정보 보기</h2>
	<h3><%
			Enumeration e_num = request.getHeaderNames();
			while(e_num.hasMoreElements()){					// java, db = res.next > 다음게 있으면 진행
				String headname = (String)e_num.nextElement();
				String headavlue = request.getHeader(headname);
				out.println(headname + " : " + headavlue + "<br>");
			}
	%>
	</h3>
</body>
</html>
<%@page import="com.ict.db.VO2"%>
<%@page import="com.ict.db.DAO2"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<%
   // 테이블 전체 정보 가져오기
	List<VO2> list = DAO2.getInstance().getSelectAll();

   // 아래에서 jstl를 사용하기 위해서 저장
    pageContext.setAttribute("list", list);
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>
<style type="text/css">
   div{text-align: center; margin: 100px; auto;}
   table, th,td{
	    padding : 10px 5px;
	    border: 1px solid black;
	    border-collapse: collapse;
	    width: 800px;
	    margin: auto;
   }	
   input{
      padding : 10px;
   }
   a{
   text-decoration: none;
   }
   a:link, a:visited {
	color: black;
}
	a:hover {
	font-size: 18px;
	font-weight: bold;
}
</style>
</head>
<body>
	<div>
	    <h2>방명록쓰기</h2>
		<form  method="post">
			<table>
				<thead>
					<tr>  
						<th>번호</th><th>작성자</th><th>제목</th><th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="k" items="${list}">
					<tr>
						<td>${k.num}</td> 
						<%-- 상세 페이지로 가기 --%>
						<td><a href="detail.jsp?idx=${k.num}">${k.name}</a></td> 
						<td>${k.title }</td>
						<td>${k.reg }</td>
					</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						
					</tr>
				</tfoot>				
			</table>
		</form>
	</div>
</body>
</html>

































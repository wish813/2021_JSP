<%@page import="com.ict.db.DAO"%>
<%@page import="com.ict.db.VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
    	request.setCharacterEncoding("utf-8");
    	String idx = request.getParameter("idx");
    	
    	VO vo =DAO.getInstance().getDetail(idx);
    	pageContext.setAttribute("vo", vo);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 개인정보보기 </title>
<style type="text/css">

div{text-align: center; margin:100px; auto;}
table, th, td{
	padding: 10px; 5px;
	border: 1px solid black;
	border-collapse: collapse;
	width: 500px;
	margin: auto;
}
input{
	padding: 10px;
}
</style>
<script type="text/javascript">
	function list_go(f) {
		f.action = "list_jsp";
		fu.submit();
	}
	
	function list_ok(f) {
		if("${param.pw}" == f.pw.value){
		f.action = "update_ok.jsp";
		fu.submit();
		}else{
			alert("비밀번호틀림");
			f.pw.value="";
			f.pw.focus();
			return;
		}
	}
	
</script>
</head>
<body>
<div>
		<h2>개인 정보 수정</h2>
		<form method="post">
				<table>
					<tbody>
					<tr>
					<th style="width: 40%">IDX</th>
					<td><input type="text" name="idx" value="${vo2.idx }" readonly>
					</tr>
					<tr>
						<th>ID</th><td>${vo2.id } </td>
						<td><input type="text" name="id" value="${vo2.id }" readonly>
					</tr>
					<tr>
						<th>PW</th><td>${vo2.pw }</td>
						<td><input type="password" name="pw" value="${vo2.pw }" readonly>
					</tr>
					<tr>
						<th>NAME</th><td>${vo2.name }</td>
						<td><input type="text" name="name" value="${vo2.name }" >
					</tr>
					<tr>
						<th>AGE</th><td>${vo2.age }</td>
						<td><input type="number" name="age" value="${vo2.age }" >
					</tr>
					<tr>
						<th>ADDR</th><td>${vo2.addr }</td>
						<td><input type="text" name="addr" value="${vo2.addr }" >
					</tr>
					<tr>
						<th>REG</th>
						<td><input type="text" name="reg" value="${vo2.reg }"  ></td>
					</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2">
								<input type="button" value="전체보기" onclick="list_go(this.form)">
								<input type="button" value="수정" onclick="update_ok(this.form)">
								<%-- 정보가 session 저장되어 있으므로 별도로 저장할 필요는 없다.
									 수정, 삭제를 위해서 idx와 pw가 반드시 필요하다.
								 --%>
							</td>
						</tr>
					</tfoot>
				</table>
		</form>
	</div>
</body>
</html>



















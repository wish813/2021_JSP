<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	a{text-decoration: none;}
	table{width: 600px; border-collapse: collapse;; text-align: center;}
	table, th, td{border: 1px solid black; padding: 5px; margin: auto;}
	div{width: 600px; margin: 100px auto; text-align: center;}
	
	.bg{background-color: #99ccff}
	input {padding: 5px;}
</style>
<script type="text/javascript">
	function update_go(f) {
		f.action="${pageContext.request.contextPath}/MyController?cmd=update";
		f.submit();
	}
	function delete_go(f) {
		f.action="${pageContext.request.contextPath}/MyController?cmd=delete";
		f.submit();
	}
</script>
</head>
<body>
<div>
		<h2>방명록 : 내용화면</h2>
		<hr>
		<p>[ <a href="${pageContext.request.contextPath}/MyController?cmd=list">목록으로</a> ]</p>
		<form method="post" >
			<table>
				<tbody>
					<tr><th class="bg">작성자</th> <td>${vo.name}</td></tr>
					<tr><th class="bg">제목</th> <td>${vo.subject}</td></tr>
					<tr><th class="bg">email</th> <td>${vo.email}</td></tr>
					<tr style="text-align: left;">
						<td colspan="2" style="padding: 0px 50px;"><pre>${vo.content}</pre></td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">
							<input type="button" value="수정" onclick="update_go(this.form)">
							<input type="button" value="삭제" onclick="delete_go(this.form)">
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>

<%--
<%@page import="com.ict.edu.DAO"%>
<%@page import="com.ict.edu.VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");
  String idx = request.getParameter("idx");
  VO vo = DAO.getInstance().getSelectOne(idx);
  
  // 방법1) 수정과 삭제를 위해서 vo를 session에 담는다.
  // 방법2) 수정과 삭제시 idx와 pwd를 필요할 때 마다 파라미터로 넘긴다.
   
  // 방법2)
   pageContext.setAttribute("vo", vo);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	a{text-decoration: none;}
	table{width: 600px; border-collapse: collapse;; text-align: center;}
	table, th, td{border: 1px solid black; padding: 5px; margin: auto;}
	div{ width: 600px; margin: 100px auto; text-align: center;}
	
	.bg{background-color: #99ccff}
	input{ padding : 5px;  }
</style>
<script type="text/javascript">
	function update_go(f) {
		f.action="update.jsp";
		f.submit();
	}
	function delete_go(f) {
		f.action="del.jsp";
		f.submit();
	}
</script>
</head>
<body>
	<div>
		<h2>방명록 : 내용화면</h2>
		<hr>
		<p>[ <a href="list.jsp">목록으로</a> ]</p>
		<form method="post">
			<table>
				<tbody>
					<tr><th class="bg">작성자</th> <td>${vo.name}</td></tr>
					<tr><th class="bg">제목</th> <td>${vo.subject}</td></tr>
					<tr><th class="bg">email</th> <td>${vo.email }</td></tr>
					<tr style="text-align: left;">
					   <td colspan="2" style="padding: 0px 50px;"><pre>${vo.content}</pre></td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">
							<input type="button" value="수정" onclick="update_go(this.form)">
							<input type="button"  value="삭제" onclick="delete_go(this.form)"> 
							<input type="hidden" name="idx" value="${vo.idx}">
							<input type="hidden" name="pwd" value="${vo.pwd}">
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>
--%>
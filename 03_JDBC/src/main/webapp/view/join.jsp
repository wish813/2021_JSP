<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입창</title>
<style type="text/css">
	fieldset {
	width: 300px;
	margin: auto;
}
div{text-align: center; margin:100px; auto;}
table, th, td{
	padding: 10px; 5px;
}
input{
	padding: 5px;
}
</style>
</head>
<body>
	<div>
		<form action="join_ok.jsp" method="post">
			<fieldset>
				<legend>회원가입</legend>
				<table>
				<tbody>
					<tr>
						<th>**ID</th><td><input type="text" name="id" placeholder="id 입력" required></td>
					</tr>
					<tr>
						<th>**PW</th><td><input type="password" name="pw" placeholder="pw 입력" required></td>
					</tr>
					<tr>
						<th>**NAME</th><td><input type="text" name="name" placeholder="name 입력" required></td>
					</tr>
					<tr>
						<th>AGE</th><td><input type="number" name="age"></td>
					</tr>
					<tr>
						<th>ADDR</th><td><input type="text" name="addr"></td>
					</tr>
					</tbody>
					<tfoot>
						<tr><td colspan="2"> <input type="submit" value="회원가입"></td></tr>
					</tfoot>
				</table>
			</fieldset>
		</form>
	</div>
</body>
</html>
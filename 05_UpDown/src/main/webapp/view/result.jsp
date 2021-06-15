<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// <form action="result.jsp" method="post" enctype="multipart/form-data">을 사용하면
	// request를 사용할 수 없다. 파라미터값이 null 이다.
	// cos.jar 안에 존재하는 MultipartRequest 클래스를 사용해야 된다.
	// String name = request.getParameter("name");
	// System.out.println("name : "+ name);
	
	// cos.jar안에 있는 MultipartRequest 클래스의 주요 메소드
	// -getParameter(String) : String
	// -getParameterValues(String) : String[]
	
	// String 인자는 input type="file" name = "name"
	// -getOriginalFileName(String) : 업로드 당시의 파일이름
	// -getFilesystemName(String) : 저장 당시의 파일이름
	// -getContextType(String) : 해당 문서의 종류
	// -getFile(String) : 업로드된 파일을 FileClass 객체로 변경해서 처리하자
	//  	- .getName() : 파일 이름
	//		- .lenth() : 파일크기를 byte처리
	//      - .lastModifile : 마지막수정날짜
	
	// 1. 실제 파일이 저장될 위치를 구하자 (톰캣 - 프로젝트안에 위치)
	String path = getServletContext().getRealPath("/upload");
	
	// 2. MUltipartRequest 객체 생성
	MultipartRequest mr =
		new MultipartRequest(
				request,         // 요청정보
				path,            // 저장위치
				100*1024*1024,   // 업로드 용량(100MB)
				"utf-8",         // 인코딩
				new DefaultFileRenamePolicy()); // 파일이름 중복 처리
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>업로드 된 정보 보기</h1>
	<h2>
	<li>올린사람 : <%=mr.getParameter("name") %></li>
	<li>올린사람 : ${param.name }</li>
	<li>파일 원본 이름 : <%=mr.getParameter("f_name") %></li>
	<li>파일 저장 이름 : <%=mr.getFilesystemName("f_name") %></li>
	<li>파일 타입 : <%=mr.getContentType("f_name")%></li>
	<hr>
	
	<%File file = mr.getFile("f_name"); %>
	<li>파일 이름 : <%= file.getName()%></li> 	    
    <li>파일 크기 : <%= file.length()/1024%>KB</li> 	    
    <li>수정 날짜 : <%= file.lastModified()%></li>
    <%-- 위 숫자는 1970.01.01.0.0.0 부터 현재_현재시간까지 날짜를 수치화 것 --%> 
    
  
    <%
    	SimpleDateFormat format = 
    		new SimpleDateFormat("yyyy-mm-dd hh:mm:ss E");
    %>
    <li>수정 날짜 : <%= format.format(file.lastModified())%></li>
          <img alt="" src="../upload/<%=file.getName()%>" style="width: 100px"> 
          <hr> 
          
          <li>다운로드 : <a href="download.jsp?path=upload&f_name=<%=file.getName()%>"><%=file.getName() %></a></li>
	</h2>

</body>
</html>





































<%@page import="com.ict.db.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");
	String idx = request.getParameter("idx");
	String pw = request.getParameter("pw");
	
	int result = DAO.getInstance().getDelete(idx);
	response.sendRedirect("list.jsp");
	
%>
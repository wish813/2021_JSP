package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.DB.DAO;
import com.ict.DB.VO;

public class UpdateCommnad implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
    	String idx = request.getParameter("idx");
    	VO vo = DAO.getInstance().getSelectOne(idx);
    	
    	request.setAttribute("vo", vo);
    	
		return "view/update.jsp";
	}

}

package com.ict.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.DB.DAO;
import com.ict.DB.VO;

public class ListCommand implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
	  	List<VO> list = DAO.getInstance().getSelectAll();
	  	request.setAttribute("list", list);
	  		return"view/list.jsp";
	}
}

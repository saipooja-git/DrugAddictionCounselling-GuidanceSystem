package com.voidmain.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.voidmain.dao.HibernateDAO;
import com.voidmain.dao.HibernateTemplate;
import com.voidmain.pojo.Login;

@WebServlet("/VoidmainServlet")
public class VoidmainServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	HttpServletRequest request;
	HttpServletResponse response;

	Object obj=null;
	String redirect=null;
	String type;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		this.request=request;
		this.response=response;

		try {

			type=request.getParameter("type");
			redirect=request.getParameter("redirect");

			if(type!=null && redirect!=null)
			{
				obj=Class.forName(type).newInstance();
				Object object=HttpRequestParser.parseRequest(request, obj);
				
				if(type.equals("com.voidmain.pojo.Counselor"))
				{
					Login login=new Login();
					login.setUsername(request.getParameter("username"));
					login.setPassword(request.getParameter("password"));
					login.setRole("2");
					
					if(!HibernateDAO.isUserRegistred(request.getParameter("username")))
					{
						if(HibernateTemplate.addObject(object)==1 && HibernateTemplate.addObject(login)==1)
						{
							response.sendRedirect(redirect+"?status=success");
						}
						else
						{
							response.sendRedirect(redirect+"?status=failed");
						}
					}
					else
					{
						response.sendRedirect(redirect+"?status=User All ready Registred");
					}
					
				}
				else if(type.equals("com.voidmain.pojo.Client"))
				{
					Login login=new Login();
					login.setUsername(request.getParameter("username"));
					login.setPassword(request.getParameter("password"));
					login.setRole("3");
					
					if(!HibernateDAO.isUserRegistred(request.getParameter("username")))
					{
						if(HibernateTemplate.addObject(object)==1 && HibernateTemplate.addObject(login)==1)
						{
							response.sendRedirect(redirect+"?status=success");
						}
						else
						{
							response.sendRedirect(redirect+"?status=failed");
						}
					}
					else
					{
						response.sendRedirect(redirect+"?status=User All ready Registred");
					}
				}
				else
				{
					if(HibernateTemplate.addObject(object)==1)
					{
						response.sendRedirect(redirect+"?status=success");
					}
					else
					{
						response.sendRedirect(redirect+"?status=failed");
					}
				}
			}

		} catch (Exception e) {

			e.printStackTrace();
		}
	}
}

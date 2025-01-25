package com.voidmain.servlets;

import java.lang.reflect.Method;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

public class HttpRequestParser {

	public static Object parseRequest(HttpServletRequest request,Object obj)
	{
		Enumeration<String> enumeration=request.getParameterNames();

		while(enumeration.hasMoreElements())
		{
			String parameterName=enumeration.nextElement();

			Method[] methods=obj.getClass().getDeclaredMethods();

			for(Method method : methods)
			{
				String methodName=method.getName();

				if(methodName.equalsIgnoreCase("set"+parameterName))
				{
					try {

						method.setAccessible(true);

						String type=method.getParameterTypes()[0].getName();

						if(type.equals("java.lang.String"))
						{
							method.invoke(obj,request.getParameter(parameterName));
						}else if(type.equals("int"))
						{
							method.invoke(obj,Integer.parseInt(request.getParameter(parameterName)));
						}else if(type.equals("float"))
						{
							method.invoke(obj,Float.parseFloat(request.getParameter(parameterName)));
						}else if(type.equals("long"))
						{
							method.invoke(obj,Long.parseLong(request.getParameter(parameterName)));
						}else if(type.equals("dobule"))
						{
							method.invoke(obj,Double.parseDouble(request.getParameter(parameterName)));
						}else if(type.equals("boolean"))
						{
							method.invoke(obj,Boolean.parseBoolean(request.getParameter(parameterName)));
						}

					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}

		return obj;
	}
}

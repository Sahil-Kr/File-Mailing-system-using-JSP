<%@ page import="java.sql.*" %>
<%  
	response.setHeader("Cache-Control","no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Cache-Control", "must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires","0"); 
	response.setDateHeader("Expires",-1);
	String name=(String)session.getAttribute("user");
	//out.println(name);
	if(name == null) {
      response.sendRedirect("index.htm");
   }
	session.setAttribute("user", name);
	String sno=request.getParameter("sno");
	String sub_type=request.getParameter("sub-type");
	
	String gpname="",ghid="";
	
	if(sub_type.equals("rep"))
	{	//out.println("Hello");
		try{
			Connection con;
			PreparedStatement ps;
			Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
			con = DriverManager.getConnection("jdbc:ucanaccess://G:\\Ecilipse\\DAK Management\\WebContent\\database.accdb");

			ps = con.prepareStatement("update smain set sr = '1' where sno = '"+sno+"' ");
			ps.executeUpdate();
			ps.close();
			con.close();
			
		}
		catch(Exception e)
		{
			out.println(e);
		}
		response.sendRedirect("emp-response.jsp");
	}
	
	else if(sub_type.equals("ack"))
	{
		response.sendRedirect("emp-main.jsp");
	}
	
	
%>
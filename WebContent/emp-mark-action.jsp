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
	String lno=request.getParameter("lno");
	String sub=request.getParameter("sub");
	String date1=request.getParameter("date1");
	//String frm=request.getParameter("frm");
	String msg=request.getParameter("msg");
	String file=request.getParameter("file");
	String gpname="",adid="";
	String sr="";
	try{
		Connection con;
		Statement st;
		ResultSet rs;
		Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
		con = DriverManager.getConnection("jdbc:ucanaccess://G:\\Ecilipse\\DAK Management\\WebContent\\database.accdb");
		st = con.createStatement();
		rs = st.executeQuery("select sr from smain where gresp='"+name+"'");
		if(rs.next()) sr=rs.getString(1);
		//out.println("Hello"+sr);
		con.close();

	}
	catch(Exception e){
				out.println(e);
		}
	
	if(sub_type.equals("create"))
	{	if(sr.equals("1")){
		try{
			Connection con;
			PreparedStatement ps;
			Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
			con = DriverManager.getConnection("jdbc:ucanaccess://G:\\Ecilipse\\DAK Management\\WebContent\\database.accdb");

			ps = con.prepareStatement("update smain set rmsg='', rfile='', rdate='' where sno='"+sno+"' ");
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
	else{
		try{
			Connection con;
			PreparedStatement ps;
			Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
			con = DriverManager.getConnection("jdbc:ucanaccess://G:\\Ecilipse\\DAK Management\\WebContent\\database.accdb");

			ps = con.prepareStatement("delete from smain where sno='"+sno+"' ");
			ps.executeUpdate();
			ps.close();
			con.close();
			
		}
		catch(Exception e)
		{
			out.println(e);
		}
			response.sendRedirect("emp-create.jsp");
	}
		
	
	}
	
	else if(sub_type.equals("del"))
	{
		//response.sendRedirect("gh-modifiy.jsp");
		try{
			Connection con;
			PreparedStatement ps;
			Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
			con = DriverManager.getConnection("jdbc:ucanaccess://G:\\Ecilipse\\DAK Management\\WebContent\\database.accdb");

			ps = con.prepareStatement("delete from smain where sno='"+sno+"' ");
			ps.executeUpdate();
			ps.close();
			con.close();
			
		}
		catch(Exception e)
		{
			out.println(e);
		}
		response.sendRedirect("emp-main.jsp");
	}
%>
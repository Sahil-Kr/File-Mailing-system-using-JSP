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
	String empid=request.getParameter("empid");
	String sr="";
	try{
		Connection con;
		Statement st;
		ResultSet rs;
		Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
		con = DriverManager.getConnection("jdbc:ucanaccess://G:\\Ecilipse\\DAK Management\\WebContent\\database.accdb");
		st = con.createStatement();
		rs = st.executeQuery("select sr from smain where rresp='"+name+"'");
		if(rs.next()) sr=rs.getString(1);
		//out.println("Hello"+sr);
		con.close();

	}
	catch(Exception e){
				out.println(e);
		}
	//out.println(name+sno+empid);
	
	if(sr.equals("1")){
		try{
			Connection con;
			PreparedStatement ps;
			Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
			con = DriverManager.getConnection("jdbc:ucanaccess://G:\\Ecilipse\\DAK Management\\WebContent\\database.accdb");

			ps = con.prepareStatement("update smain set rresp = '"+empid+"' where sno = '"+sno+"' ");
			ps.executeUpdate();
			ps.close();
			con.close();
			
		}
		catch(Exception e)
		{
			out.println(e);
		}
	}
	
	else{
		try{
			Connection con;
			PreparedStatement ps;
			Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
			con = DriverManager.getConnection("jdbc:ucanaccess://G:\\Ecilipse\\DAK Management\\WebContent\\database.accdb");

			ps = con.prepareStatement("update smain set rto = '"+empid+"' where sno = '"+sno+"' ");
			ps.executeUpdate();
			ps.close();
			con.close();
			
		}
		catch(Exception e)
		{
			out.println(e);
		}
	}
	
		
		
	
	
	
	response.sendRedirect("gh-main.jsp");
%>
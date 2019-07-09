<%@ page import="java.sql.*" %>
<%  
	response.setHeader("Cache-Control","no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Cache-Control", "must-revalidate");
	response.setHeader("Pragma", "no-cache");

	String name=(String)session.getAttribute("user");
	//out.println(name);
	if(name == null) {
      response.sendRedirect("index.htm");
   }
	session.setAttribute("user", name);
	String sno=request.getParameter("sno");
	String sub_type=request.getParameter("sub-type");
	
	String adid="", sto="",empid="",gpname="";
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
	//out.println("hello: "+name);
	//out.println("hello: "+sno);
	
	 
	if(sub_type.equals("approve"))
	{	//out.println("Hello"+sto);
		
		
		if(sr.equals("1")){
			try{
				Connection con;
				Statement st;
				ResultSet rs;
				Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
				con = DriverManager.getConnection("jdbc:ucanaccess://G:\\Ecilipse\\DAK Management\\WebContent\\database.accdb");
				st = con.createStatement();
				rs = st.executeQuery("select frm from smain where sno='"+sno+"'");
				if(rs.next()) sto=rs.getString(1);
				//out.println("Hello"+sto);
				con.close();

			}
			catch(Exception e){
						out.println(e);
						//response.sendRedirect("ad-main.jsp");
				}
			
			try{
				Connection con;
				Statement st;
				ResultSet rs;
				Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
				con = DriverManager.getConnection("jdbc:ucanaccess://G:\\Ecilipse\\DAK Management\\WebContent\\database.accdb");
				st = con.createStatement();
				rs = st.executeQuery("select userid from register where desig='AD' and gpname='"+sto+"'");
				if(rs.next()) adid=rs.getString(1);
				//out.println("Hello"+adid);
				con.close();

			}
			catch(Exception e){
						out.println("Receiver Group's AD has not Register yet!!!"+e);
						//response.sendRedirect("ad-main.jsp");
				}
			
			
			try{
				
				Connection con;
				PreparedStatement ps;
				Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
				con = DriverManager.getConnection("jdbc:ucanaccess://G:\\Ecilipse\\DAK Management\\WebContent\\database.accdb");

				ps = con.prepareStatement("update smain set rresp = '"+adid+"', gresp='' where sno = '"+sno+"' ");
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
				Statement st;
				ResultSet rs;
				Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
				con = DriverManager.getConnection("jdbc:ucanaccess://G:\\Ecilipse\\DAK Management\\WebContent\\database.accdb");
				st = con.createStatement();
				rs = st.executeQuery("select sto from smain where sno='"+sno+"'");
				if(rs.next()) sto=rs.getString(1);
				//out.println("Hello"+sto);
				con.close();

			}
			catch(Exception e){
						out.println(e);
						//response.sendRedirect("ad-main.jsp");
				}
			
			try{
				Connection con;
				Statement st;
				ResultSet rs;
				Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
				con = DriverManager.getConnection("jdbc:ucanaccess://G:\\Ecilipse\\DAK Management\\WebContent\\database.accdb");
				st = con.createStatement();
				rs = st.executeQuery("select userid from register where desig='AD' and gpname='"+sto+"'");
				if(rs.next()) adid=rs.getString(1);
				//out.println("Hello"+adid);
				con.close();

			}
			catch(Exception e){
						out.println("Receiver Group's AD has not Register yet!!!"+e);
						//response.sendRedirect("ad-main.jsp");
				}
			
			try{
				Connection con;
				PreparedStatement ps;
				Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
				con = DriverManager.getConnection("jdbc:ucanaccess://G:\\Ecilipse\\DAK Management\\WebContent\\database.accdb");

				ps = con.prepareStatement("update smain set rto = '"+adid+"', flag='0', gto='' where sno = '"+sno+"' ");
				ps.executeUpdate();
				ps.close();
				con.close();
				
			}
			catch(Exception e)
			{
				out.println(e);
			}
		}
	}
	
	else if(sub_type.equals("modif"))
	{
		//response.sendRedirect("gh-modifiy.jsp");
		String temp="";
		try{
			Connection con;
			Statement st;
			ResultSet rs;
			Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
			con = DriverManager.getConnection("jdbc:ucanaccess://G:\\Ecilipse\\DAK Management\\WebContent\\database.accdb");
			st = con.createStatement();
			rs = st.executeQuery("select userid from smain where sno='"+sno+"'");
			if(rs.next()) temp=rs.getString(1);
			//out.println("Hello"+adid+lno);
			con.close();
				
		}
		catch(Exception e){
			out.println(e);

			}
		
		try{
			Connection con;
			Statement st;
			ResultSet rs;
			Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
			con = DriverManager.getConnection("jdbc:ucanaccess://G:\\Ecilipse\\DAK Management\\WebContent\\database.accdb");
			st = con.createStatement();
			rs = st.executeQuery("select gpname from register where userid='"+name+"'");
			if(rs.next()) gpname=rs.getString(1);
			//out.println("Hello"+gpname);
			con.close();

		}
		catch(Exception e){
					out.println(e);
			}
		
		try{
			Connection con;
			Statement st;
			ResultSet rs;
			Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
			con = DriverManager.getConnection("jdbc:ucanaccess://G:\\Ecilipse\\DAK Management\\WebContent\\database.accdb");
			st = con.createStatement();
			rs = st.executeQuery("select userid from register where gpname='"+gpname+"' and desig ='Oth'");
			if(rs.next()) empid=rs.getString(1);
			//out.println("Hello"+adid+lno);
			con.close();
				
		}
		catch(Exception e){
			out.println("Employee has not registered!!!!");

			}
		
		if(sr.equals("1")){
			
			try{
				Connection con;
				PreparedStatement ps;
				Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
				con = DriverManager.getConnection("jdbc:ucanaccess://G:\\Ecilipse\\DAK Management\\WebContent\\database.accdb");

				ps = con.prepareStatement("update smain set gresp = '"+empid+"' where sno = '"+sno+"' ");
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

				ps = con.prepareStatement("update smain set gto = '"+temp+"' where sno = '"+sno+"' ");
				ps.executeUpdate();
				ps.close();
				con.close();
				
			}
			catch(Exception e)
			{
				out.println(e);
			}
			
		}
		
	}
	
	else if(sub_type.equals("rej"))
	{

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
	}
	
	response.sendRedirect("ad-main.jsp");
%>
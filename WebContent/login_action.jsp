<head>
	<title>Login Process</title>
	<link rel="stylesheet" type="text/css" href="login-style.css">
	<style>
		h1 {
			color: maroon;
			} 
</style>
</head>
<%@ page import="java.sql.*"
%>

<%! String username,password,ad,gh,oth;
%>

<%  username = request.getParameter("userid");
	password = request.getParameter("psw");
	ad="AD";
	gh="GH";
	oth="Oth";
	

	try{
			Connection con;
			Statement st;
			ResultSet rs;
			Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
			con = DriverManager.getConnection("jdbc:ucanaccess://G:\\Ecilipse\\DAK Management\\WebContent\\database.accdb");
			st = con.createStatement();
			rs = st.executeQuery("select name,userid,pass,desig from register where userid='"+username+"' and pass ='"+password+"'");

				if(rs.next()){
					if(ad.equals(rs.getString(4)))
					{	session.setAttribute("user",rs.getString(2));
						response.sendRedirect("ad-main.jsp");
					}
					if(gh.equals(rs.getString(4)))
					{	session.setAttribute("user",rs.getString(2));
						response.sendRedirect("gh-main.jsp");
					}
					if(oth.equals(rs.getString(4)))
					{	session.setAttribute("user",rs.getString(2));
						response.sendRedirect("emp-main.jsp");
					}
				
				}
				else{
						out.println("<br><center><h1>Username or password incorrect !</h1><br><br>");
						out.println("<input type=button value='GO to Login page' onclick=location.replace('index.htm') class='button-primary'></center>");
				}
	}
	catch(Exception e){
						out.println(e);

			}

%>	
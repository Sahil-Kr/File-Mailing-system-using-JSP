<html>
<head>
	<title>Back to Login</title>
	<link rel="stylesheet" type="text/css" href="login-style.css">
</head>
<%@ page import="java.sql.*" %>

<%! 
	String name,userid,psw,dob,gpname,mobile,desig;
%>
<body bgcolor="#4EAFCD">
<form>
<% 	name = request.getParameter("name");
	userid = request.getParameter("userid");
	psw = request.getParameter("pwd");
	dob = request.getParameter("dob");
	gpname = request.getParameter("dept");
	desig = request.getParameter("dsg");
	mobile = request.getParameter("no");

	try{
		Connection con;
		PreparedStatement ps;
		Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
		con = DriverManager.getConnection("jdbc:ucanaccess://G:\\Ecilipse\\DAK Management\\WebContent\\database.accdb");

		ps = con.prepareStatement("insert into register(name,userid,pass,dob,desig,gpname,mob) values('"+name+"','"+userid+"','"+psw+"','"+dob+"','"+desig+"','"+gpname+"','"+mobile+"')");
		ps.executeUpdate();
		ps.close();
		con.close();%>
		<center><%out.println("<br><br><h1>Account Created Successfully !</h1><br><br>");						
		out.println("<input type=button value='GO to Login page' onclick=location.replace('index.htm') class='button-primary'>");%></center><%
	}
		

	catch(Exception e){
	out.println(e);
	}
	

%>


</form>
</body>
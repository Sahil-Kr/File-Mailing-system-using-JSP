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
	int i=1;
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
%>
<head>
	<title>AD Approve Letter</title>
	<link rel="stylesheet" type="text/css" href="login-style.css">
	<style>
		h1 {
			font-size:40;
			} 
		td{
			color: white;
			font-size:15;			
		}
		th{
				
			font-size:18;	
		}
		th, td, table {
  			padding: 15px;
 			text-align: center;
 			border: 1px solid black;
		}
		input[type=submit]:hover {
    		background-color: #AEB6BF;
    	}
    	input[type=button]:hover {
    		background-color: #AEB6BF;
    	}
    	input[type=button]:hover {
    		background-color: #AEB6BF;
		}
		table{	width: 100%;
				background:#2471A3;
		}
		tr:nth-child(even) {
   			 background-color: #ABB2B9  ;
  		}
  		tr:nth-child(odd) {
   			 background-color: #5D6D7E;
  		} 
  		th{
			background:#fff;	
			font-size:18;	
		}
    	.header {
			color: white;
			font-size:35;
			font-family:sans-serif;
			position: fixed;
			right: 37%;
			bottom:92%;
			
		}
		.user {
			color:white;
			background:#566573 ;
			font-family:sans-serif;
			font-size:20;
			position: fixed;
			right: 10;	
		}
		.home {
				position: fixed;
				right: 250;	
		}
		.nodata{
				color:#fff;
				font-size:30px;
				font-family:sans-serif;
				position: fixed;
				right: 39%;
				bottom:50%;
		}
</style>
</head>
<%@ page import="java.sql.*"
%>

<%  try{%> <div class="header">Letter Requests Approval</div><br><br>
			<div class=home><a href="ad-main.jsp" style="color:#fff;font-size:20px;fontfamily:san-serif;">HOME</a></div>
			<div class="user">Hello! <%=name%>&emsp;<input type="button" value="Log Out" onClick="window.location.replace('logout-action.jsp')"></div><br><br><br><br><br>
			<form action="ad-app-action.jsp" method="post">
			<table style="float:right">
			<tr>
			<th></th>
			<th>Serial No</th>
			<th>Letter No</th>
			<th>Subject</th>
			<th>Date of Letter</th>
			<th>To</th>
			<th>Attached Message</th>
			<th>File Name</th>
			<th>Response Message</th>
			<th>Response File</th>
			<th>Response Date</th>
			<th>Send/Response</th>
			<th>Action</th>
			</tr>
			
			<%
			Connection con;
			Statement st;
			ResultSet rs;
			Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
			con = DriverManager.getConnection("jdbc:ucanaccess://G:\\Ecilipse\\DAK Management\\WebContent\\database.accdb");
			st = con.createStatement();
			rs = st.executeQuery("select sno,lno,sub,date1,sto,msg,file from smain where gto='"+name+"' and flag='1' ");
			
			while(rs.next()){%>
			
					<tr>
					<td><%=i++ %>.</td>
					<td><%=rs.getString(1)%><br><input type="text" value="<%=rs.getString(1)%>" name="sno" hidden></td>
					<td><%=rs.getString(2)%><br>
					<td><%=rs.getString(3)%><br>
					<td><%=rs.getString(4)%><br>
					<%	session.setAttribute("filename", rs.getString(7)); %>
					<td>Group-<%=rs.getString(5)%><br>
					<td><%=rs.getString(6)%><br>
					<td><a href="DownloadServlet"><%=rs.getString(7)%></a></td>
					<td>NA</td>
					<td>NA</td>
					<td>NA</td>
					<td>Sending</td>
					<td><input type="radio" value="approve" name="sub-type">Approve<br><input type="radio" value="modif" name="sub-type"><br>Mark<br><input type="radio" value="rej" name="sub-type">Reject<br>
					<input type="submit" value="Confirm"></td>
					</tr>
			
			<%}
		}
		catch(Exception e){
					out.println("Something Went Wrong!!\n Please Try logging again!!!"+e);

		}
		if(sr.equals("1")){
			try{	//out.println("hello"+sr);

				Connection con;
				Statement st;
				ResultSet rs;
				Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
				con = DriverManager.getConnection("jdbc:ucanaccess://G:\\Ecilipse\\DAK Management\\WebContent\\database.accdb");
				st = con.createStatement();

				rs = st.executeQuery("select sno,lno,sub,date1,frm,msg,file, rmsg, rfile, rdate from smain where gresp='"+name+"'");

				while(rs.next()){%>

				<tr>
				<td><%=i++ %>.</td>
				<td><%=rs.getString(1)%><br><input type="text" value="<%=rs.getString(1)%>" name="sno" hidden></td>
				<td><%=rs.getString(2)%><br>
				<td><%=rs.getString(3)%><br>
				<td><%=rs.getString(4)%><br>
				<%	session.setAttribute("filename", rs.getString(7)); %>
				<%	session.setAttribute("filename1", rs.getString(9)); %>
				<td>Group-<%=rs.getString(5)%><br>
				<td><%=rs.getString(6)%><br>
				<td><a href="DownloadServlet"><%=rs.getString(7)%></a></td>
				<td><%=rs.getString(8)%></td>
				<td><a href="DownloadServlet1"><%=rs.getString(9)%></a></td>
				<td><%=rs.getString(10)%></td>
				<td>Response</td>
				<td><input type="radio" value="approve" name="sub-type" required>Approve<br><input type="radio" value="modif" name="sub-type" required><br>Mark<br><input type="radio" value="rej" name="sub-type" required>Reject<br>
				<input type="submit" value="Confirm"></td>

			</tr>
			<%

			}
			}
			catch(Exception e){
			out.println("Something Went Wrong!!\n Please Try logging again!!!"+e);

			}%>
			</table>
			</form>
			<%
		}
		if(i==1){%>
		<div class=nodata>! NO DATA AVAILABLE !</div>
	<%}


%>	
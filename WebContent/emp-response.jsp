<%@ page import="java.sql.*" %>
<html>

<%  
	response.setHeader("Cache-Control","no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Cache-Control", "must-revalidate");
	response.setHeader("Pragma", "no-cache");
	String name=(String)session.getAttribute("user");
	
	if(name=="") {
      response.sendRedirect("index.htm");
   }
	session.setAttribute("name",name);
	session.setAttribute("resp", "1");
	
	
%>
<title>Response Letter</title>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
body {font-family: Arial, Helvetica, sans-serif;}

input[type=text], select, textarea {
    width: 70%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    
    resize: vertical;
}

input[type=date] {
    width: 70%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    
    resize: vertical;
}

input[type=submit] {
    background-color: #4CAF50;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
input[type=file] {
    background-color: #4CAF50;
    color: white;
    padding: 5px 5px;
    border: none;
    border-radius: 2px;
    cursor: pointer;
    width: 70%;
}

input[type=button]:hover {
    		background-color: #AEB6BF;}

input[type=file]:hover {
    background-color: #45a049;
}
input[type=submit]:hover {
    background-color: #45a049;
}

.container {
    border-radius: 5px;
    background-color: #f2f2f2;
}
.header {
	color: white;
	font-size:30;
	font-family:sans-serif;
}
.user {
	color:white;
	background:#566573 ;
	font-family:sans-serif;
	font-size:20;
	position: fixed;
	right: 8;	
}

td {
  padding: 5px;
  text-align: left;
}
.home {
				position: fixed;
				right: 250;	}
</style>
</head>
<body bgcolor="#4EAFCD">
<%
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

try{
	Connection con;
	Statement st;
	ResultSet rs;
	Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
	con = DriverManager.getConnection("jdbc:ucanaccess://G:\\Ecilipse\\DAK Management\\WebContent\\database.accdb");
	st = con.createStatement();
	if(sr.equals("1")){
		rs = st.executeQuery("select sno,lno, sub, frm, date1, msg, file from smain where gresp='"+name+"'");
	}
	else{
		rs = st.executeQuery("select sno,lno, sub, frm, date1, msg, file from smain where rto='"+name+"'");
	}
	if(rs.next()){%>


<div class="header">Create new Letter</div><br>
<div class=home><a href="emp-main.jsp" style="color:#fff;font-size:20px;fontfamily:san-serif;">HOME</a></div>
<div class="user">Hello! <%=name%>&emsp;<input type="button" value="Log Out" onClick="window.location.replace('logout-action.jsp')"></div><br><br>


<div class="container">
  <form action="uploadFile" method="post" enctype="multipart/form-data" >
  <table>
  <tr>
    <td><label for="fname">Serial No.</label></td>
    <td><input type="text"  value="<%=rs.getString(1) %>"  name="sno" disabled></td>
    <td><input type="text"  value="<%=rs.getString(1) %>"  name="sno" hidden></td>
  </tr>
  <tr>
    <td><label for="cname">Letter No.</label></td>
    <td><input type="text" value="<%=rs.getString(2) %>" disabled></td>
  </tr>
  <tr> 
    <td><label for="phone">Subject</label></td>
    <td><input type="text" value="<%=rs.getString(3) %>" disabled></td>
  </tr>
  <tr>
    <td><label for="receiver">Receiver of Letter</label></td>
    <td><input type="text" value="Group-<%=rs.getString(4) %>" disabled></td>
  </tr>
  <tr>    
  	<td><label for="date">Receiving Date</label></td>
    <td><input type="date" value="<%=rs.getString(5) %>" disabled></td>
  </tr>
   
    <tr>
    <td><label for="file">Received Filename</label></td>
	<td><input type="text" value="<%=rs.getString(7) %>" disabled></td> 
	</tr>
	
	<tr>    
  	<td><label for="date">Date of Response</label></td>
    <td><input type="date" name="dt" placeholder="(dd/mm/yy)" required></td>
  </tr>
  
  	<tr>    
  	<td><label for="file">Response File</label></td>
    <td><input type="file" name="fname" ></td>
  </tr>
  	 <tr> 
	<td><label for="message">Message</label></td>
    <td><textarea id="message" name="msg" placeholder="Extra Information" style="height:100px" cols="50"></textarea></td>
   </tr>
	<%}
	con.close();

}
catch(Exception e){
			out.println(e);
	}
	%>
	<tr><td></td><td></td></tr>
   <tr>
	<td><input type="submit" value="Submit"></td>
	</tr>
</table>
  </form>
</div>

</body>
</html>


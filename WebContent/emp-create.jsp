<html>

<%  
	response.setHeader("Cache-Control","no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Cache-Control", "must-revalidate");
	response.setHeader("Pragma", "no-cache");
	String name=(String)session.getAttribute("user");
	String filenm=(String)session.getAttribute("filenm");
	if(name=="") {
      response.sendRedirect("index.htm");
   }
	session.setAttribute("user", name);
	
	
%>
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

input[type=file]:hover {
    background-color: #45a049;
}
input[type=submit]:hover {
    background-color: #45a049;
}

input[type=button]:hover {
    background-color: #AEB6BF;
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
.home {
	
	position: fixed;
	right: 250;	
}


td {
  padding: 5px;
  text-align: left;
}
</style>
</head>
<body bgcolor="#4EAFCD">

<div class="header">Create new Letter</div>
<div class=home><a href="emp-main.jsp" style="color:#fff;font-size:20px;fontfamily:san-serif;">HOME</a></div>
<div class="user">Hello! <%=name%>&emsp;<input type="button" value="Log Out" onClick="window.location.replace('logout-action.jsp')"></div><br><br>

<br><br>
<div class="container">
  <form action="uploadFile" method="post" enctype="multipart/form-data" >
  <table>
  <tr>
    <td><label for="fname">Serial No.</label></td>
    <td><input type="text" name="sno" placeholder="Serial No. of Letter" required></td>
  </tr>
  <tr>
    <td><label for="cname">Letter No.</label></td>
    <td><input type="text" name="lno" placeholder="Letter No" required></td>
  </tr>
  <tr> 
    <td><label for="phone">Subject</label></td>
    <td><input type="text" name="sub" placeholder="Subject" required></td>
  </tr>
  <tr>
    <td><label for="receiver">Receiver of Letter</label></td>
    <td><input type="text" name="to" placeholder="Send to" required></td>
  </tr>
  <tr>
    <td><label for="receiver">Date of Letter</label></td>
    <td><input type="date" name="dt" placeholder="dd/mm/yy" required></td>
  </tr>
  
     <tr> 
	<td><label for="message">Message</label></td>
    <td><textarea id="message" name="msg" placeholder="Extra Information" style="height:100px" cols="50"></textarea></td>
   </tr>
   
    <tr>
    <td><label for="Upload">Upload File</label></td>
	<td><input type="file" name="fname"/></td> 
	</tr>
	
	<tr><td></td><td></td></tr>
   <tr>
	<td><input type="submit" value="Submit"></td>
	</tr>
</table>
  </form>
</div>

</body>
</html>






<%  
	response.setHeader("Cache-Control","no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Cache-Control", "must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires","0"); 
	response.setDateHeader("Expires",-1);
	String name=(String)session.getAttribute("user");
	if(name == null) {
      response.sendRedirect("index.htm");
   }
%>
<html>
<head>
<meta http-equiv="refresh" content="1">
<title>Control Panel AD</title>
<link rel="stylesheet" type="text/css" href="gh-main-style.css">
<style>
	a:link {
			color: #4EAFCD;
			background-color: transparent;
			text-decoration: none;
		}
	a:visited {
				color: #4EAFCD;
				background-color: transparent;
				text-decoration: none;
			}
	a:hover {
				color: #4EAFCD;
				background-color: transparent;
				text-decoration: none;
		}
	a:active {
				color: #4EAFCD;
				background-color: transparent;
				text-decoration: none;
		}
	h1 {
		align:center;
		color:#fff;
		font-size:60px;
		font-family:sans-serif;
	}
</style>
</head><br><br><center><h1>AD CONTROL PANEL</h1></center><br><br><br>

<div class="box">
  <div class="settings select fa-cog">Welcome <%=name%></div>
  <div class="write-message select fa-pencil"><a href="ad-app.jsp">Approve Send Request</a></div>
  <div class="inbox select fa-inbox active"><a href="ad-rec.jsp">Received Letters</a></div>
  <div class="security-inbox select fa-lock"><a href="logout-action.jsp">Log Out!</a></div>
  
</div>
</html>
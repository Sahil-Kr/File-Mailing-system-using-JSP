<%
session.removeAttribute("user");
session.invalidate();
%>
<head>
<meta http-equiv="refresh" content="2.5; url=index.htm">
<style type="text/css">

	body {
		background-color: #4EAFCD;
	}
	
	.log{
		color: #fff;
		font-size:p5x;
		font-family:sans-serif;
		
		position:fixed;
		right:34%;
		bottom:25%;
	}
	
	


</style>
</head>
<body>
<div class="log">LOGGED OUT SUCCESSFULLY!!! REDIRECTING TO LOGIN PAGE!!!
</div>
<center><img src="https://media.giphy.com/media/IoP0PvbbSWGAM/giphy.gif"></center>
</body>

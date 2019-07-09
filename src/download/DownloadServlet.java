package download;
import java.io.*;  
import javax.servlet.ServletException;  
import javax.servlet.http.*;
  
public class DownloadServlet extends HttpServlet {  
  

	private static final long serialVersionUID = 1L;

public void doGet(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
response.setContentType("text/html");  
PrintWriter out = response.getWriter(); 
HttpSession session=request.getSession(false);  
String filename=(String)session.getAttribute("filename");
 
String filepath = "G:\\Ecilipse\\DAK Management\\UploadData\\";   
response.setContentType("APPLICATION/OCTET-STREAM");   
response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\"");   
  
FileInputStream fileInputStream = new FileInputStream(filepath + filename);  
            
int i;   
while ((i=fileInputStream.read()) != -1) {  
out.write(i);   
}   
fileInputStream.close();   
out.close();   
}  
  
}  
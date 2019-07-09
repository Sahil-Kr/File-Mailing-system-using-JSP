package upload;
import java.sql.*;
import java.io.IOException;  
import java.io.PrintWriter;  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;  
//import javax.servlet.*;  
import javax.servlet.http.*;  
@SuppressWarnings("serial")  

public class uploadFile extends HttpServlet {  
        
      protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
    	  
    	  response.setContentType("text/html");  
           PrintWriter out=response.getWriter();  
           MultipartRequest m=new MultipartRequest(request, "G:\\Ecilipse\\DAK Management\\UploadData\\");  
           String fname=(String)m.getFilesystemName("fname");   
           String sno=m.getParameter("sno"); 
           String lno=m.getParameter("lno");
           String sub=m.getParameter("sub");
           String to=m.getParameter("to");
           String msg=m.getParameter("msg");
           String dt=m.getParameter("dt");
           String gto="",gpname="",ghid="";
           HttpSession session=request.getSession(false);  
           String name=(String)session.getAttribute("user");
           String resp=(String)session.getAttribute("resp");
           //out.println(resp);
           //out.println("fuck 1"+name+sno+to+fname+sub+msg+gto+gpname);
           //out.println("hello "+name); 
           if(resp=="1") {
        	   try{
             		Connection con;
             		PreparedStatement ps;
             		Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
             		con = DriverManager.getConnection("jdbc:ucanaccess://G:\\Ecilipse\\DAK Management\\WebContent\\database.accdb");
             		
             		ps=con.prepareStatement("update smain set rmsg='"+msg+"',rfile='"+fname+"', rdate='"+dt+"', rto='' where sno='"+sno+"'");
                    
             		ps.executeUpdate();
             		con.close();
             		
             		//response.sendRedirect("emp-main.jsp");
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
         			rs = st.executeQuery("select gpname from register where userid ='"+name+"'");
         			if(rs.next())
         				gpname = rs.getString(1);
      							
         			con.close();
         			rs.close();
         				
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
         			rs = st.executeQuery("select userid from register where gpname ='"+gpname+"' and desig='GH'");
         			if(rs.next())
         				ghid = rs.getString(1);
      							
         			con.close();
         			rs.close();
         				
                 }
                 catch(Exception e){
         						out.println(e);
         			}
        	   
        	   try{
            		Connection con;
            		PreparedStatement ps;
            		Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
            		con = DriverManager.getConnection("jdbc:ucanaccess://G:\\Ecilipse\\DAK Management\\WebContent\\database.accdb");
            		
            		ps=con.prepareStatement("update smain set gresp='"+ghid+"', sr='1' where sno='"+sno+"'");
                   
            		ps.executeUpdate();
            		con.close();
            		
            		response.sendRedirect("emp-main.jsp");
            		}
            		

            		catch(Exception e){
            			out.println(e);
            		}
           
           }
           
           else {
        	   try{
          			Connection con;
          			Statement st;
          			ResultSet rs;
          			Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
          			con = DriverManager.getConnection("jdbc:ucanaccess://G:\\Ecilipse\\DAK Management\\WebContent\\database.accdb");
          			st = con.createStatement();
          			rs = st.executeQuery("select gpname from register where userid ='"+name+"'");
          			if(rs.next())
          				gpname = rs.getString(1);
       							
          			con.close();
          			rs.close();
          				
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
              			rs = st.executeQuery("select userid from register where gpname ='"+gpname+"' and desig='GH'");
             			if(rs.next())
             				gto = rs.getString(1);
             			else
             				out.println("Group Head not registered");
             			con.close();
             			rs.close();
             				
                     }
                     catch(Exception e){
             						out.println(e);
             			}
                  if(gto!="") {
                  try{
              		Connection con;
              		PreparedStatement ps;
              		Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
              		con = DriverManager.getConnection("jdbc:ucanaccess://G:\\Ecilipse\\DAK Management\\WebContent\\database.accdb");
              		
              		ps=con.prepareStatement("insert into smain(userid, sno, lno, sto, file, flag, sub, msg, date1, gto, frm, sts) values('"+name+"','"+sno+"','"+lno+"','"+to+"','"+fname+"','1','"+sub+"','"+msg+"','"+dt+"','"+gto+"','"+gpname+"','1')");
                     
              		ps.executeUpdate();
              		con.close();
              		
              		response.sendRedirect("emp-main.jsp");
              		}
              		

              		catch(Exception e){
              			out.println(e);
              		}}
        	  
           }

           
      }  
 }  


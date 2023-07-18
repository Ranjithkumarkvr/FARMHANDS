<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@page import="java.util.Date,java.text.SimpleDateFormat,java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <%!
Date date=new Date();
  SimpleDateFormat sf= new SimpleDateFormat("yyyy/MM/dd");
  Calendar c=Calendar.getInstance();

%>

<% 
   String username = request.getParameter("username"); 
   String phnumber = request.getParameter("phnumber");
   String location = request.getParameter("location");
   String members =  request.getParameter("members");
   String address = request.getParameter("address");
   String gender= request.getParameter("gender");
        String  id = (String)session.getAttribute("id");
    c.setTime(date);
    String d= sf.format(c.getTime());
                                                               
   Class.forName("com.mysql.cj.jdbc.Driver");
   Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/agriport?user=root&password=12345@Ran"); 
   PreparedStatement ps=null;
  ps=cn.prepareStatement("Update post set username=?,phnumber=?,location=?, members=?,address=?,gender=?,CurrentDate=? where id=?");
  ps.setString(1,username);
  ps.setString(2,phnumber);
  ps.setString(3,location);
  ps.setString(4,members);
  ps.setString(5,address);
  ps.setString(6,gender);
  ps.setString(7,d);
  ps.setString(8,id);
   int rr=ps.executeUpdate();
   if(rr>0){
  %>
    
  <%
  response.sendRedirect("Postpage.jsp");
   } else
   {
   
   %>
   <script>
   alert("Not Updated");
   </script>
   <%} %>
</body>
</html>
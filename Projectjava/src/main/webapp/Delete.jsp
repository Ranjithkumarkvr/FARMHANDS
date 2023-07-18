<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
   int id= Integer.parseInt(request.getParameter("id"));
Class.forName("com.mysql.cj.jdbc.Driver");
Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/agriport?user=root&password=12345@Ran"); 
PreparedStatement ps=null;
ps=cn.prepareStatement("delete from post where id=?");
ps.setInt(1,id);
int rs=ps.executeUpdate();
if(rs>0)
{


response.sendRedirect("Postpage.jsp");
}
%>
</body>
</html>
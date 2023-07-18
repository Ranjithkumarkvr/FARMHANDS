<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>

<% 
String phnumber2= request.getParameter("phnumber");
String password2=request.getParameter("password");
Class.forName("com.mysql.cj.jdbc.Driver");
Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/agriport?user=root&password=12345@Ran");

PreparedStatement ps=cn.prepareStatement("select phnumber from register where phnumber= ? and password= ?");
ps.setString(1,phnumber2);
ps.setString(2,password2);
ResultSet rs= ps.executeQuery();
if(rs.next())
{   session.setAttribute("phn",phnumber2);
	%>
	<script>
	alert("LogIn Success");
	</script>
	<% 
	response.sendRedirect("Postpage.jsp");
}else
{
   %>
  <script>
  alert("Don't have an account or Tryagain");
  </script>
   <% 
}

%>
</body>
</html>
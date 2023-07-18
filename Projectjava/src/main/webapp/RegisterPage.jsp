<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
</head>
<body>
<% 
  String firstname= request.getParameter("firstname");
  String  lastname= request.getParameter("lastname");
  String username= firstname+" "+lastname;
String phnumber= request.getParameter("phnumber");
String password=request.getParameter("password");
String age= request.getParameter("age");
String address= request.getParameter("address");
String occupation= request.getParameter("nature");
String gender= request.getParameter("gender");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/agriport?user=root&password=12345@Ran");
PreparedStatement ps= null;
ps=cn.prepareStatement("select phnumber from Register where phnumber=?");
ps.setString(1,phnumber);
ResultSet r= ps.executeQuery();
if(r.next())
{
	out.println("Already have an account <br> ExistingUser");
}else
{
 ps=cn.prepareStatement("insert into Register values(?,?,?,?,?,?,?)");
ps.setString(1,username);
ps.setString(2,phnumber);
ps.setString(3,password);
ps.setString(4,age);
ps.setString(5,address);
ps.setString(6,occupation);
ps.setString(7,gender);
int rs=ps.executeUpdate();

if(rs>0)
{ 

	%>
	<script>
	 alert("Registered Successfully");
	</script>
<%
 response.sendRedirect("login.html");
}
else{
	%>
	 <script>
	 alert("Not Registered try Again");
	 </script>
	<% 
	response.sendRedirect("register.html");
}
}
%>

</body>
</html>
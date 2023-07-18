<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@page import="java.util.Date,java.text.SimpleDateFormat,java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Filter by location</title>
<style>
    body .job{
            display:grid;
            justify-content: space-around;
            gap: 10px; 

        }
        .job{
            background:linear-gradient(grey,black);
            width: 1000px;
            height: 150px;
            display: flex;
            justify-content: center;
            border-radius: 10px;
            margin:10px;
            margin-left:160px;

        }
        table{
            text-align: center;
            border:2px;
        }
       th{
        color:black;
        font-size:20px;
       } 
       td{
        color: honeydew;
        font-size:20px;
       }
      a:hover{
        color:red;
      }
</style>
<link rel="StyleSheet" href="Style.css">
</head>
<body>
  <div class="header">
    <div class="logo">
       <span>FARM </span>HANDS
    </div>
    <div id="navbar">
        <ul> 
        <li><a href="index.html">HOME</a></li>
        <li><a href="index.html#ab">ABOUT US</a></li>
        <li><a href="login.html">LOGIN</a></li>
        <li><a href="register.html">REGISTER</a></li>
        <li><a href="Postpage.jsp">WORKER DETAILS</a></li>
        </ul>
    </div>

    </div>
<% 

String loc=request.getParameter("location");
Class.forName("com.mysql.cj.jdbc.Driver");
Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/agriport?user=root&password=12345@Ran"); 
PreparedStatement ps=null;

 ps=cn.prepareStatement ("select * from post where location=?");
 ps.setString(1,loc);
 ResultSet rs=ps.executeQuery();

	 %>
	<center>  <a href="filter.html"><h2>Filter by Location</h2></a></center>
	 <% 
	  while(rs.next())
	  {    
		  int id=rs.getInt(1);
		  String us= rs.getString(2);
		  long ph = rs.getLong(3);
		  String loc1= rs.getString(4);
		  int mem= rs.getInt(5);
		  String add= rs.getString(6);
		  String gen= rs.getString(7);
		  Date dt= rs.getDate(8);
		  SimpleDateFormat sf2=new SimpleDateFormat("dd:MM:yyyy");
		  Calendar c=Calendar.getInstance();
		  c.setTime(dt);
		  String dt2=sf2.format(c.getTime());
%>
 <div class="job">
   <table border="1px">
   <tr>
   <th>Name</th>
   <th>ContactNumber</th>
   <th>Location</th>
   <th>TeamMembers</th>
   <th>address</th>
   <th>Gender</th>
   <th>Date</th>
   
   
   </tr>
   <tr>
   <td><%= us %></td>
   <td><%= ph %></td>
   <td><%= loc1 %></td>
   <td><%= mem %></td>
   <td><%= add %></td>
   <td><%= gen %></td>
   <td><%= dt2 %></td>
   
</tr>
</table>
</div>
<% 
	  }
   
	  %>
	  
 <div class="footer">
        <p>@ Copyrights 2023 FARMHANDS. All rights reserved</p>
      <marquee> <h3>Designed by Ranjith Kvr</h3></marquee> 
    </div>
</body>
</html>
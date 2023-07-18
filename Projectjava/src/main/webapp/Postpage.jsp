<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@page import="java.util.Date,java.text.SimpleDateFormat,java.util.Calendar" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body.job{
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
            margin-bottom: 10px;
            margin-left: 160px;
            margin-top: 10px;

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
     th a{
       color:violet;
       text-decoration:none;
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

<%!
Date date=new Date();
  SimpleDateFormat sf= new SimpleDateFormat("yyyy/MM/dd");
  Calendar c=Calendar.getInstance();
  String occ1="Worker";
%>

<% 
   String username = request.getParameter("username"); 
   String phnumber = request.getParameter("phnumber");
   String location = request.getParameter("location");
   String members =  request.getParameter("members");
   String address = request.getParameter("address");
   String gender= request.getParameter("gender");
   String phn = (String)session.getAttribute("phn");
   
    c.setTime(date);
    String d= sf.format(c.getTime());
                                                               
   Class.forName("com.mysql.cj.jdbc.Driver");
   Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/agriport?user=root&password=12345@Ran"); 
  PreparedStatement ps=null;
 
  ps=cn.prepareStatement("select phnumber from register where phnumber=? and occupation=?");
  ps.setString(1,phn);
  ps.setString(2,occ1);
  ResultSet rr= ps.executeQuery(); 
  
  if(rr.next()) 
 {  
	 if(username!=null)
	 {
  ps=cn.prepareStatement("insert into post (username,phnumber,location,members,address,gender,CurrentDate,phn) values(?,?,?,?,?,?,?,?);");
  ps.setString(1,username);
  ps.setString(2,phnumber);
  ps.setString(3,location);
  ps.setString(4,members);
  ps.setString(5,address);
  ps.setString(6,gender);
  ps.setString(7,d);
  ps.setString(8,phn);
  int r= ps.executeUpdate();
    }
  %>
  <center> <a href="post.html"> <h2>Post a details</h2></a> </center>
  
  <% 
	  ps=cn.prepareStatement("select * from post where phn=?");
	  ps.setString(1,phn);
	  ResultSet rs=ps.executeQuery();
	  while(rs.next())
	  {    int id=rs.getInt(1);
		  String us= rs.getString(2);
		  long ph = rs.getLong(3);
		  String loc= rs.getString(4);
		  int mem= rs.getInt(5);
		  String add= rs.getString(6);
		  String gen= rs.getString(7);
		  Date dt= rs.getDate(8);
		  SimpleDateFormat sf2=new SimpleDateFormat("dd:MM:yyyy");
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
   <th rowspan="2"><a href="Edit.jsp?id=<%= id%>">Edit</a></th>
   <th rowspan="2"><a href="Delete.jsp?id=<%=id%>">Delete</a></th>
   </tr>
   <tr>
   <td><%= us %></td>
   <td><%= ph %></td>
   <td><%=loc %></td>
   <td><%= mem%></td>
   <td><%= add %></td>
   <td><%= gen %></td>
   <td><%= dt2 %></td>
   
</tr>
</table>
</div>

<% 
	  
	  
   
	  }
  }else
   {  ps=cn.prepareStatement ("select * from post;");
	  ResultSet rs=ps.executeQuery();
	  
	  %>
	<center>  <a href="filter.html"><h2>Filter by Location</h2></a></center>
	  <% 
	  while(rs.next())
	  {    
		  int id=rs.getInt(1);
		  String us= rs.getString(2);
		  long ph = rs.getLong(3);
		  String loc= rs.getString(4);
		  int mem= rs.getInt(5);
		  String add= rs.getString(6);
		  String gen= rs.getString(7);
		  Date dt= rs.getDate(8);
		  SimpleDateFormat sf2=new SimpleDateFormat("dd:MM:yyyy");
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
   <td><%= loc %></td>
   <td><%= mem %></td>
   <td><%= add %></td>
   <td><%= gen %></td>
   <td><%= dt2 %></td>
   
</tr>
</table>
</div>

<%	
	  
}
} 
%>
 </div>
     <div class="footer">
        <p>@ Copyrights 2023 FARMHANDS. All rights reserved</p>
      <marquee> <h3>Designed by Ranjith Kvr </h3></marquee> 
    </div>
</body>
</html>
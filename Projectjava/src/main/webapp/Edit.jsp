<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Here</title>
 <style>
        .con{
            width: 550px;
            height: 600px;
            background:linear-gradient(grey,black);
            display: grid; 
            justify-content: center;
            border-radius: 50px;
            margin:10px;
            margin-left: 30%;
            
        }
        .con label{
            display: block;
            font-size: 30px;
            color:honeydew;
        }
        .con input{
            font-size: 30px;
        }
        select{
            font-size: 30px;
            width: 375px;
        }
        button{
            margin-top: 30px;
            font-size: 30px;
            margin-left:150px ;

        }
        button:hover{
            color: red;
        }
        h2{
        color:yellow}
        
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
   
   String id = request.getParameter("id");
 session.setAttribute("id", id);
Class.forName("com.mysql.cj.jdbc.Driver");
Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/agriport?user=root&password=12345@Ran"); 
PreparedStatement ps=null;
ps=cn.prepareStatement("select username,phnumber,location,members,address from post where id=?");
ps.setString(1,id);
ResultSet rs=ps.executeQuery();
while(rs.next())
{
	String us=rs.getString(1);
	long ph=rs.getLong(2);
	String loc=rs.getString(3);
	int mem = rs.getInt(4);
	String add =rs.getString(5);
%>
  <div class="con">
        <form action="Update.jsp" method="post">
          <center>  <h2>Edit the details...</h2></center>
         <div>
            <label for="username">Username</label>
            <input type="text" name="username" id="username" value=<%=us %> required>
            <label for="Phnumber">ContactNumber</label>
            <input type="number" name="phnumber" id="phnumber" maxlength="10" value=<%=ph %> required>
         </div>
         <div>
            <label for="location">District</label>
            <input type="text" name="location" id="location" value=<%=loc %> required>
            <label for="members">TotalMembers</label>
            <input type="number" name="members" id="members" value=<%=mem%> required>
         </div>
         <div>
            <label for="address">Address</label>
             <input type="text" name="address" id="address" value=<%=add %>></div><br><div>
            <select name="gender">
                <option value="male">Male</option>
                <option value="female">Female</option>
            </select>
         </div>
         <div>
         <button type="submit">Update</button>
           </div>
        </form>
    </div>

<%
}%>
 <div class="footer">
        <p>@ Copyrights 2023 FARMHANDS. All rights reserved</p>
      <marquee> <h3>Designed by Ranjith Kvr </h3></marquee> 
    </div>
</body>
</html>
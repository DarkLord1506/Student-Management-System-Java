<%-- 
    Document   : MAIN
    Created on : 14 Mar, 2021, 8:25:33 PM
    Author     : Dark Lord
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {box-sizing: border-box}

body, html {
  
  margin: 0;
  font-family: Arial;
  background-image: url(Images/image1.jpg); /*You will specify your image path here.*/
  width: 100%;
-moz-background-size: cover;
-webkit-background-size: cover;
background-size: cover;
background-position: top center !important;
background-repeat: no-repeat !important;
background-attachment: fixed;
overflow: auto;
}


.tablink {
  background-color: #555;
  color: white;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  font-size: 30px;
  width: 20%;
  height: auto;
}

.tablink:hover {
  background-color: #777;
}


.tabcontent {
  color: white;
  font-family: ballet;
  font-size: 40px;
  display: none;
  padding: 100px 20px;
  height: 100%;
  width: 100%;
  padding-left: 200px;
}
input{
    background: transparent;
    outline: none;
    border-style: hidden;
    border-bottom-style: solid;
    border-bottom-color: white;
    color: white;
    font-size: 25px;
}
button{
   
    width: 300px;
    height: 80px;
    background-color:#ff9999;
    
    font-size: 25px;
    color:#660066;
}
#student {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 1500px;
  height:100%;
  text-align: center;
  overflow-x: scroll;
  overflow-y: scroll;
  border-spacing: 50px;
 
  column-width: 100px;
  font-size: 20px;
}

#student td, #student th {
  border-bottom: 1px solid #ddd;
  padding: 20px;
  
}



#student tr:hover {background-color: #ddd;
color: black;}

#student th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  background-color: #4CAF50;
  color: white;
}
a:link {
  color: green;
  background-color: transparent;
  text-decoration: none;
}

a:visited {
  color: white;
  background-color: transparent;
  text-decoration: none;
}

a:hover {
  color: red;
  background-color: transparent;
  text-decoration: underline;
}

a:active {
  color: yellow;
  background-color: transparent;
  text-decoration: underline;
}

#pos{
    position: absolute;
    top:50px;
}
#div3{
    color: red;
    position: absolute;
    left: 850px;
    top: 750px;
}
#welcome{
 
 position: absolute;
 left: 800px;
 top: 120px;
 color: white;
 font-size: 40px;
}
#extra{
   
    top:2000px;
}

</style>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<nav id="nav" style="color: white; font-size: 30px; background-color:#0074FF; font-style: italic; font-family: pacifico; padding-right: 10px; position: fixed; width: 100%;">
      <marquee scrollamount="20" width="95%" ">Student Management System&nbsp;</marquee>
      <a href="index.jsp" style="float:right; ">Logout</a>
</nav>
    <br>
    <br>
    
<button class="tablink" onclick="openPage('Add', this, 'violet')" id="defaultOpen">Add Student</button>
<button class="tablink" onclick="openPage('Delete',this, 'black')" >Delete Student</button>
<button class="tablink" onclick="openPage('Edit', this, 'cyan')">Edit Record</button>
<button class="tablink" onclick="openPage('Show', this, 'orange')">Show Records</button>
<button class="tablink" onclick="openPage('extra', this, 'pink')">More Options</button>
<%    
            String n=(String)session.getAttribute("uname");    %>
             
            <div id="welcome">Welcome <%=n%> </div>

      
            
<div id="Add" class="tabcontent" style="display:table;">
    <title>Add Record</title>
    <div style="display: table-cell; width:800px; height:auto;" >
       <form action="insert" method="post" id="a">  
  
      
        <p>Name &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="name"></p>
        <p>Rollno &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="number" name="rno"></p>
        <p>Father's Name &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="fname"></p>
        <p>Mother's Name &nbsp;&nbsp;<input type="text" name="mname"></p>
        <p>Age&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" name="age"></p>
        <p>Address &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="address"></p>
        <p>D.O.B &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="date" name="dob"></p>
        <p>Password &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="pword"></p>
           
         </form>
    </div>
    <div style="display: table-cell;  margin-bottom:500px;">   <button form="a"> Add Record</button></div>

   </div>    
</div>

<div id="Delete" class="tabcontent">
  <h1>Enter RollNo Here</h1>
    <form action="showdata" method="post">
        <input type="text" name="rno">
         <button  >Search</button>
    </form>         
</div>

<div id="Edit" class="tabcontent">
    <title>Edit Record</title>
    <h1>Enter RollNo Here</h1>
    <form action="edit" method="post">
        <input type="text" name="rno">
         <button  >Search</button>
    </form>         
</div>

<div id="Show" class="tabcontent">
    <title>Show Record</title>
    <br>
    <table id="student">
        <tr>
            <th>Name</th>
            <th>RollNo</th>
            <th>Father's Name</th>
            <th>Mother's Name</th>
            <th>Age</th>
            <th>Address</th>
            <th>D.O.B</th>
        </tr>
       
    <%
               
        Connection con;
        ResultSet rs;
         
         try{          
               Class.forName("org.apache.derby.jdbc.ClientDriver");
               con = DriverManager.getConnection("jdbc:derby://localhost:1527//CSE8", "cse8", "cse8");
             
               
               
                String q="select * from students";
                Statement s=con.createStatement();
                
                rs=s.executeQuery(q);
                
                while(rs.next()){
                
                String name=rs.getString(1);
                int rollno=rs.getInt(2);
                String fname=rs.getString(3);
                String mname=rs.getString(4);
                int age=rs.getInt(5);
                String address=rs.getString(6);
                Date dob=rs.getDate(7);
                %>
                 <tr>
                     <td><%=name%></td>
                     <td><%=rollno%></td>
                     <td><%=fname%></td>
                     <td><%=mname%></td>
                     <td><%=age%></td>
                     <td><%=address%></td>
                     <td><%=dob%></td>
                     
                 </tr>    
                <%
                        
                              }
                con.close();
         }
         catch(Exception e){
             e.printStackTrace();
         }
                
             %>
        
       
       
    </table>
</div>

             <div id="extra" class="tabcontent">
                 <br>
                    <h1>Enter RollNo Here</h1>
                    <form action="extraoptions" method="post">
                        <input type="text" name="rno">
                        <button  >Search</button>
                    </form>         
                    
             </div>
<script>
function openPage(pageName,elmnt,color) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].style.backgroundColor = "";
  }
  document.getElementById(pageName).style.display = "block";
  elmnt.style.backgroundColor = color;
}

// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
</script>

</body>
</html> 


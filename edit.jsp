<%-- 
    Document   : EDIT
    Created on : 14 Mar, 2021, 8:25:33 PM
    Author     : Dark Lord
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Records</title>
        <style>
* {box-sizing: border-box}

body, html {
  height: 100%;
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
  width: 25%;
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
   
    background:azure;
    outline: none;
    border-style: dotted;
    border-style: solid;
    border-color: black;
    color:#0074FF;
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
  width: 1000px;
  height: 50%;
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



#student tr:hover {background: transparent;
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
#Edit{
    background-color:#ddd;
    position: absolute;
    left: 400px;
    top: 50px;
    padding-top: 20px;
   padding-left:  50px;
   padding-right:  50px;
   padding-bottom: 10px;
   font-size: 40px;
     font-family: Arial, Helvetica, sans-serif;
}
hr { 
  display: block;
  margin-top: 0.5em;
  margin-bottom: 0.5em;
  margin-left: auto;
  margin-right: auto;
  border-style: inset;
  border-width: 1px;
} 


</style>
    </head>
    <body>
        <nav id="nav" style="color: white; font-size: 30px; background-color:#0074FF; font-style: italic; font-family: pacifico; padding-right: 10px;">
      <marquee scrollamount="20" width="95%" ">Edit Record&nbsp;</marquee>
      <a href="main.jsp" style="float:right; ">Back</a>
</nav>
        
        <div id="Edit">
       
            <p align='center'> Student Record</p>
            <hr>
       
    <%
               
        Connection con;
        ResultSet rs;
         
         try{          
               Class.forName("org.apache.derby.jdbc.ClientDriver");
               con = DriverManager.getConnection("jdbc:derby://localhost:1527//CSE8", "cse8", "cse8");
             
                int roll = Integer.parseInt(request.getParameter("rno"));
               
                String q="select * from students where rollno="+roll;
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
                <form action="update" method="post">
                <p>     Name <input type="text" value="<%=name%>" size="43" name="name"> <br></p>
                <p>    RollNo <input type="text" value="<%=rollno%>" size="42" name="rno" readonly><br></p>
                  <p>   Father's Name  <input type="text" value="<%=fname%>" size="31" name="fname"><br></p>
                 <p>    Mother's Name <input type="text" value="<%=mname%>" size="30" name="mname"><br></p>
                <p>     Age <input type="text" value="<%=age%>" size="45" name="age"><br></p>
                 <p>    Address <input type="text" value="<%=address%>" size="40" name="address"><br></p>
                 <p>    D.O.B <input type="date" value="<%=dob%>" size="43" name="dob">    <br>  </p> 
                 <button>Change Record</button>
                </form>
                <%
                }
                con.close();
         }
         catch(Exception e){
             e.printStackTrace();
         }
                
             %>
        
       
       

        </div>
    </body>
</html>

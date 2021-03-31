<%-- 
    Document   : SHOWMARKS
    Created on : 14 Mar, 2021, 8:25:33 PM
    Author     : Dark Lord
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MARKS</title>
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
  background-color:#ff9900;
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
      <marquee scrollamount="20" width="95%" ">Student MARKS&nbsp;</marquee>
      <a href="studentdata.jsp" style="float:right; ">Back</a>
</nav>
        
        <div id="Edit">
       
            <p align='center'> Student Marks</p>
            <hr>
       
    <%
               
        Connection con;
        ResultSet rs,rs1;
         
         try{          
               Class.forName("org.apache.derby.jdbc.ClientDriver");
               con = DriverManager.getConnection("jdbc:derby://localhost:1527//CSE8", "cse8", "cse8");
             
                int roll = Integer.parseInt(request.getParameter("rno"));
               
          //      String q="select * from marks where rollno="+roll;
                String q1="select * from subjects s,marks m where m.rollno=s.rollno and s.rollno="+roll;
                Statement s=con.createStatement();
                
            //    rs=s.executeQuery(q);
                rs1 = s.executeQuery(q1);
           
                if(rs1.next()){
                String sub1 = rs1.getString(2);
                String sub2 = rs1.getString(3);
                String sub3 = rs1.getString(4);
                String sub4 = rs1.getString(5);
                String sub5 = rs1.getString(6); 
                 
                String marks1 = rs1.getString(8);
                String marks2 = rs1.getString(9);
                String marks3 = rs1.getString(10);
                String marks4 = rs1.getString(11);
                String marks5 = rs1.getString(12); 

                
                %>
                <table id="student">
                    <tr>
                        <th>S.NO</th>
                        <th>Subject</th>
                        <th>Marks</th>                        
                    </tr>
                    <tr>
                        <td>1</td>
                        <td><%=sub1%></td>
                        <td><%=marks1%></td>
                    </tr>   
                     <tr>
                        <td>2</td>
                        <td><%=sub2%></td>
                        <td><%=marks2%></td>
                    </tr> 
                     <tr>
                        <td>3</td>
                        <td><%=sub3%></td>
                        <td><%=marks3%></td>
                    </tr> 
                     <tr>
                        <td>4</td>
                        <td><%=sub4%></td>
                        <td><%=marks4%></td>
                    </tr> 
                     <tr>
                        <td>5</td>
                        <td><%=sub5%></td>
                        <td><%=marks5%></td>
                    </tr> 
                
                </table>
                <%
                    }
}
         catch(Exception e){
             e.printStackTrace();
         }
                
             %>
       

        </div>
    </body>
</html>

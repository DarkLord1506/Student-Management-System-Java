<%-- 
    Document   : NEWUSER
    Created on : 14 Mar, 2021, 8:25:33 PM
    Author     : Dark Lord
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up Page</title>
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
    top: 150px;
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
      <marquee scrollamount="20" width="95%" ">Student Management System&nbsp;</marquee>
      <a href="index.jsp" style="float:right; ">Back</a>
</nav>
        
        <div id="Edit">
       
            <p align='center'> Enter Details Here</p>
            <hr>
       
  
                <form action="adduser" method="post">
                <p>    Username <input type="text" size="43" name="uname"> <br></p>
                <p>    Password <input type="password"  size="44" name="pword" ><br></p>
               
                 <button>Add User</button>
                </form>
               
        
       
       

        </div>
    </body>
</html>

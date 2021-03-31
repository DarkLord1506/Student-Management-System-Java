<%-- 
    Document   : INDEX

    Created on : 14 Mar, 2021, 8:25:33 PM
    Author     : Dark Lord
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
  <head>
  <meta charset="utf-8">
  <title>ManagementSystem</title>
  
  <link href="css\maincss.css" rel="stylesheet" type="text/css">
  <link href="css\textfield.css" rel="stylesheet" type="text/css">
  <link href="css\bkg.css" rel="stylesheet" type="text/css">
  </head>
  <style>
      body{
    
background-image: url(Images/image1.jpg); /*You will specify your image path here.*/

-moz-background-size: cover;
-webkit-background-size: cover;
background-size: cover;
background-position: top center !important;
background-repeat: no-repeat !important;
background-attachment: fixed;

}
#div1 {
    margin-top: 70px;
    margin-right: 184px;
    margin-left: 600px;
    margin-bottom: 184px;
    color: #FFFFFF;
    background-color: #006CFF;
    left: auto;
    text-align: center;
    font-size: 44px;
    width: 18%;
    height: 680px;
    -webkit-box-sizing: content-box;
    -moz-box-sizing: content-box;
    box-sizing: content-box;
    padding-right: 0px;
    position: static;
    top: auto;
    float: none;
    clear: none;
    font-family: pacifico;
    font-style: italic;
    font-variant: normal;
}
#div2 {
    width: auto;
    padding-top: 0px;
    right: auto;
    font-family: pacifico;
    font-style: italic;
    font-variant: normal;
    font-size: 19px;
    color: #FFFFFF;
    background-color: #00FFBB;
}
input{
    background: transparent;
    outline: none;
    border-style: hidden;
    border-style: solid;
    border-bottom-color: white;
    color: white;
    width: 250px;
    font-size: 25px;
}
#div3{
    color: red;
    position: absolute;
    left: 850px;
    top: 750px;
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
  width: 50%;
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
#div4 {
    margin-top: 100px;
    margin-right: 184px;
    margin-left: 600px;
    margin-bottom: 184px;
    color: #FFFFFF;
    background-color: #006CFF;
    left: auto;
    text-align: center;
    font-size: 44px;
    width: 18%;
    height: 650px;
    -webkit-box-sizing: content-box;
    -moz-box-sizing: content-box;
    box-sizing: content-box;
    padding-right: 0px;
    position: static;
    top: auto;
    float: none;
    clear: none;
    font-family: pacifico;
    font-style: italic;
    font-variant: normal;
}
a:link {
  color: violet;
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
  </style>
  <nav id="nav" style="color: white; font-size: 30px; background-color:#0074FF; font-style: italic; font-family: pacifico;">
      <marquee scrollamount="20">Student Management System&nbsp;</marquee></nav>
    <button class="tablink" onclick="openPage('Admin', this, 'maroon')" id="defaultOpen">Admin</button>
<button class="tablink" onclick="openPage('Student',this, 'green')" >Student</button>

  <body id="body">
      
      <div id="Admin" class="tabcontent"> 
    <div id="div1">
    <img src="Images/220px-User_icon_2.svg.png" width="150" height="150" alt=""/> <br>
    Admin Login<br>
    <p><form action="login" method="post">
        Username <input type="text" name="uname" style="border-radius: 25px;"   >
            Password <input type="password" name="pass" style="border-radius: 25px;"> <br>
	    <input type="submit" id="div2">
            <p><a href="newuser.jsp"> New User? Sign Up Here!!</a></p>
    </form>
	</p>
	  </div>
      </div>
      
       <div id="Student" class="tabcontent"> 
    <div id="div4">
    <img src="Images/220px-User_icon_2.svg.png" width="150" height="150" alt=""/> <br>
     Student Login<br>
    <p><form action="loginstudent" method="post">
        
        Rollno <input type="text" name="rno" style="border-radius: 25px;"   >
        Password <input type="password" name="pass" style="border-radius: 25px;"> <br>
	    <input type="submit" id="div2">
    </form>
	</p>
	  </div>
      </div>
     
     
</body>
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



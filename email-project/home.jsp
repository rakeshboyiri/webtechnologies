<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>InboxMaster</title>
    <link rel="stylesheet" href="style.css" >
    <link href="css/normalize.css" rel="stylesheet" type="css/text">
</head>
<body>
    <div class="header">        
            <h1 class="title">InboxMaster </h1>   
    </div>
    
    
    <div class="main">
          <div class="body"> </div>
         <div class="login">
          <p style="width:100%;height:50px;background-color:rgb(0,151,254);">
               <%
                 String str=request.getParameter("msg");
                 
                if(str!=null){
                 int v= Integer.parseInt(request.getParameter("bool"));
                 
                 if(v==0){
                   out.println("<font size=5 color=red>"+str+"</font>");
                    
                    }else{
                   out.println("<font size=5 color=green>"+str+"</font>");
                  
                    }
                    }
                %>
          </p>
             <h1 class="log">Login</h1>
             <form name="f1" class="form1" action="validateLogin.jsp" method="post">
              <label class="emailabel">Email</label> <br>
              <input type="email" name="email"  id="email"   required> <br/><br/>
               <label class="pwd">Password</label> <br>
            <input type="password" name="pwd" id="pwd" required> <br/><br/>
            <input type="submit" name="submit" value="submit" class="submit">
             </form>
             <p> Not have an account? <a href="signup.jsp">sign up
        here</a></p>
       
        </div>
    </div>



   <table width="100%" height="7px" class="footer">
    <tr>
        <td align="center">
           <font color="white"> &copy;2024 <br>
            Developed by : Rakesh

           </font>
        </td>
    </tr>
</table>

</body>
</html>

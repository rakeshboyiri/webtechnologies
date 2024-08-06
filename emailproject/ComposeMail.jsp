<html>
<head>
    <link rel="stylesheet" href="style.css" type="text/css">
<style>
.myTextBox{
font-size:32px;
}
.myButton{
font-size:32px;
}
body{
    background-color: rgb(133, 115, 115);
}
</style></head>
<body>

<div  class ="inboxHeader" >
        <h1 style="margin-top: 0px;color: white;text-align: center ;line-height: 80px;">Compose Mail</h1>
    </div>
<div class="inboxNav" >
        <ul class="inboxul" >

            <li ><a href="inbox.jsp">Inbox</a></li>
            <li ><a href="sentbox.jsp">Sentbox</a></li>
            <li><a href="ComposeMail.jsp">Compose Mail</a></li>
            <li ><a href="logout.jsp">Logout</a></li>
        </ul>
    </div>

    <%
        String str=request.getParameter("msg");
        String emailid="";
        if(session.getAttribute("emailid")!=null)
        emailid=session.getAttribute("emailid").toString();
        if(str!=null)
        out.println("<p align=center><font size=32 color=red>"+str+"</font></p>");
    %>

    <div class="composemailform">
        <form name="f1" action="InsertMail.jsp" method="get" >
       <table class="composeTable">
           <tr>    <td class="myTextBox">From:</td>
           <td><input type=text class="myTextBox" name=mfrom id=mfrom value="<%=emailid%>" readonly></td>
           </tr>
           <tr>
               <td class="myTextBox">To:</td><td><input type=text class="myTextBox" name=mto id=mto required></td>
           </tr>
           <tr>
               <td class="myTextBox">Subject:</td><td><input type=text class="myTextBox" name=subj id=subj></td>
           </tr>
           <tr>
               <td class="myTextBox">Text:</td><td><textarea name="mtext" id="mtext"  class="myTextBox"></textarea></td>
           </tr>
           <tr>
           <td></td>
           <td><input type=submit value="SendMail" class="myButton">&nbsp;&nbsp;&nbsp;&nbsp;<input type=reset value="Reset" class="myButton">&nbsp;&nbsp;&nbsp;&nbsp;
           <input type=button value="Back" class="myButton"></td>
           </tr>
       </table>
       </form>
    </div>
    </body>
</html>


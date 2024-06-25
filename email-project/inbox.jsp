<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css" type="text/css">
    <title>Inbox</title>
    
   
</head>
<body class="inboxBody">
    <div  class ="inboxHeader" >
        <h1 style="margin-top: 0px;color: white;text-align: center ;line-height: 80px;">Inbox</h1>
    </div>
    <div class="inboxNav" >
        <ul class="inboxul" >

            <li ><a href="inbox.jsp">Inbox</a></li>
            <li ><a href="sentbox.jsp">Sentbox</a></li>
            <li><a href="ComposeMail.jsp">Compose Mail</a></li>
            <li ><a href="logout.jsp">Logout</a></li>
        </ul>
    </div>
    <table class="inboxTable" cellspacing="0px">
        <tr>
            <th>From</th>
            <th>Subject</th>
            <th>Delete All</th>
        </tr>
   
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "emailsoftware";
String userid = "root";
String password = "root";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
String user_id=session.getAttribute("emailid").toString();
String user_pwd=request.getParameter("pwd");
int flag=0;
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from mail where mto='"+user_id+"' and inbox=1";
resultSet = statement.executeQuery(sql);
int mid;
while(resultSet.next()){
mid=Integer.parseInt(resultSet.getString("mid"));
String linkUrl="#?mail="+resultSet.getString("mid")+"&type=1";
%>
<tr>
<td><%=resultSet.getString("mfrom") %></td>
<td class="sub"><a href="#?mid=<%=mid%>"><%=resultSet.getString("subject")%></a></td>
<td class="del" align=center><a href=<%=linkUrl%>>Delete</a></td>

</tr><%
}
%>
</table>
<%
connection.close();
} catch (Exception e) {
out.println(e.getMessage());
}
%>
</body>
</html>
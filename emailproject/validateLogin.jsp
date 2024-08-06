<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
%>
<!DOCTYPE html>
<html>
<head><style>
*{
text-align:center;
}
th,td{
font-size:32px;
}

</style></head>
<body>

<%
try{
int flag=0;
String email=request.getParameter("email");
String pwd=request.getParameter("pwd");
out.println(email);
out.println(pwd);

connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from users where emailid='"+email+"' and pwd='"+pwd+"'";
resultSet= statement.executeQuery(sql);

while(resultSet.next()){
    flag=1;
}
if(flag==1){
session.setAttribute("emailid",email);
    response.sendRedirect("inbox.jsp");
}
else{
    response.sendRedirect("home.jsp?msg='invalid Credentials!'&bool=0");
}
}
catch(Exception e){
    out.println(e.getMessage());
}
%>

</body>
</html>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String uname = request.getParameter("uname");
String pwd = request.getParameter("pwd");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";

String database = "MyProjectDatabase";
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

int flag=0;
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from users where id="+uname+" and name='"+pwd+"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
flag=1;
}
if(flag==1)
response.sendRedirect("home.jsp");
else{
response.sendRedirect("login.jsp?msg='Invalid Credentials!<br>Try Again.'");}
connection.close();
} catch (Exception e) {
out.println(e.getMessage());
}
%>

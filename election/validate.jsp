<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "election";
String userid = "root";
String password = "root";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet1 = null;
ResultSet resultSet2 = null;
ResultSet resultSet3 = null;

%>
<html>
<head>
</head>
<body>
<%
try{
int flag=0;

String uid=request.getParameter("username");
String uname=request.getParameter("pwd");
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql1 ="select * from status where status=1";
resultSet1 = statement.executeQuery(sql1);
if(resultSet1.next()){
	String sql3 ="select * from citizens where cname='"+uid+"' and pwd='"+uname+"' and vote_status=1";
	resultSet3 =  statement.executeQuery(sql3);
	if(resultSet3.next()){
		  response.sendRedirect("login.jsp?msg='voted already!'");
	}
	

String sql ="select * from citizens where cname='"+uid+"' and pwd='"+uname+"' and vote_status=0";
resultSet2 = statement.executeQuery(sql);
	while(resultSet2.next()){
    flag=1;
}
if(flag==1){
	
	statement.executeUpdate("update citizens set vote_status=1 where cname='"+uname+"'");	
    response.sendRedirect("vote.jsp");
}
else{
    response.sendRedirect("login.jsp?msg='invalid Credentials!'");
}
}else{
	 response.sendRedirect("login.jsp?msg='voting not scheduled!'");
}
}
catch(Exception e){
    out.println(e.getMessage());
    
}
%>

</body>
</html>

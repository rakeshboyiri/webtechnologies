<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html><head><style>
th,td{
font-size:32px;
width:32px;
}
.myCheckBox{font-size:32px;
width:48px;
}
.myButton{font-size:32px;

}
</style></head><body>
    <form action="insert.jsp" method="post">
<center><h1>My InBox</h1></center><br>
<table border="1" align="center" width="60%">
<tr>
<th>Faculty</th>
<th>Select</th>
</tr>
<%
String depart= request.getParameter("department");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "university_faculty_db";
String userid = "manu";
String password = "Manu@0809";
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
String sql ="select * from faculty_table where department='"+depart+"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
    String fac=resultSet.getString("faculty_name");
%>
<tr>
<td><%=resultSet.getString("faculty_name") %></td>

<td align=center><input type=checkbox class="myCheckBox" name="deleteIds" value="<%=fac%>"></td>

</tr><%
}
%>
</table>
<br>
<center>
<div>
   <input type="submit" value="Delete Selected" class="myButton">
</div>
</center>
</form>
</body>
<%
connection.close();
} catch (Exception e) {
out.println(e.getMessage());
}
%>
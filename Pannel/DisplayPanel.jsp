<%@include file="DBConn.jsp"%>
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
    
    
    
    <form name="f1" action="SelectFaculty.jsp">

<table border="1" align="center" width="60%">
<tr>
<th>ID</th>
<th>Faculty</th>
<th>Department</th>
</tr>
<%
String dept=request.getParameter("dept");
int flag=0;
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from faculty where sel=1";
resultSet = statement.executeQuery(sql);
int fid;
while(resultSet.next()){
fid=Integer.parseInt(resultSet.getString("fid"));
%>
<tr>
    <td><%=fid%></td>
<td><%=resultSet.getString("fname") %></td>
<td><%=resultSet.getString("dept")%></td>
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
<input type="hidden" name="dept" value="<%=dept%>">
<br><center><input type="submit" class="myButton" value="Back"></center>
</form></body></html>

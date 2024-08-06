<%@include file="DBConn.jsp"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
int bid = Integer.parseInt(request.getParameter("deleteList"));


out.println(bid);

%>

<html>
<head>
<style>
*{
text-align:center;
}
th,td{
font-size:32px;
}

</style>
<script lang="javascript">

</script>

</head>
<body>

<h1>Booking</h1>
<form action="bo.jsp" >
<table border="1" align="center" width="60%">
<tr>
<th>Bus Name</th>
<th>Seats count</th>


</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from sche where bus_id="+bid;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td id="source_bus"><%=resultSet.getString("bus_id") %></td>
<td id="dest_bus"><%=resultSet.getString("seats") %></td>

<td ><input type="text" id="bcount" name="bcount"> </td>
<%
int bids = Integer.parseInt(request.getParameter("deleteList"));
session.setAttribute("bid",bids);
%>
<input type="hidden" id="abc" name="abc" value="<%=bid %>" >

</tr>
<%
}

}catch (Exception e) {
        out.println(e.getMessage());
    }
   %>

</table> 
<input type="submit" value="Book">
</form>
</body>
</html>

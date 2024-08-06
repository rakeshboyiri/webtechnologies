<%@include file="DBConn.jsp"%>
<%@include file="FacultyData.jsp"%>
<html><head><style>
th,td{
font-size:32px;
text-align: center;
width:32px;
}
.myCheckBox{font-size:32px;
width:48px;
}
.myButton{font-size:32px;
}
.myText
{
    font-size:32px;
}
</style>

<script language="javascript">
    var ff=0;
    
    function fff()
    {

        ff=1;
    }
    function func1()
    {
        var cboxes = document.getElementsByName('SelectList');
    var len = cboxes.length;
    for (var i=0; i<len; i++) {


        alert(i + (cboxes[i].checked?' checked ':' unchecked ') + cboxes[i].value);

    }

        document.f1.submit();
    }
    function func2()
    {
        
        document.f1.mnext.value="1";
    }
    function func3()

    {
        

        f1.submit();
    }
</script>

</head><body>
<%
String dept=request.getParameter("dept");
if(dept==null)
dept="";
%>    
<form name="f1" action="SaveFaculty.jsp" onsubmit="func3()">
<center>
    <select name="dept" id="dept" onChange="func3()" class="myText">
    <option value="" <% if(dept.equals("")){out.println("selected");} %>>-----Select-----</option>
    <option value="cse" <% if(dept.equals("cse")){out.println("selected");} %>>CSE</option>
    <option value="ece" <% if(dept.equals("ece")){out.println("selected");} %>>ECE</option>

</select>
</center>
<table border="1" align="center" width="60%">
<tr>
<th>ID</th>
<th>Faculty</th>
<th>Dept</th>
<th>Select</th>
</tr>
<%
int fid=0,fsel;
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from faculty where dept='"+dept+"'";
resultSet = statement.executeQuery(sql);

while(resultSet.next()){
fid=Integer.parseInt(resultSet.getString("fid"));
fsel=Integer.parseInt(resultSet.getString("sel"));
%>
<tr>
    <td><%=fid%></td>
<td><%=resultSet.getString("fname") %></td>
<td><%=resultSet.getString("dept")%></td>
<td align=center><input type=checkbox class="myCheckBox" name="SelectList" id="SelectList" value="<%=fid%>" <% if(fsel==1){out.println("checked");} %>></td>

</tr><%
}
%>
</table>
<input type="hidden" name="mnext" id="mnext" value="0">
<%
connection.close();
} catch (Exception e) {
out.println(e.getMessage());
}
%><br>  
<center><input type="submit" value="Show Panel" class="myButton" onclick="func2()"></center>
</form>
</body></html>

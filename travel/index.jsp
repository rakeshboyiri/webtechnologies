<html>
  <head>
    <title>Travel </title>
  </head>
  <body>
    <div style="width=60%;min-height:400px;margin-auto;background-color:cyan;text-align:center;">
    
    <%
                 String str=request.getParameter("msg");
                 
                if(str!=null){
               
                 
                 
                   out.println("<font size=5 color=red>"+str+"</font>");
                    
                   
                    }
                %>
    <form action="validate.jsp" name="f1">
        <h1>Travel Management System</h1>
        <h3> Choose sourse and destinations</h3>
        <label>Source City</label>
         <select name="src" id="src" >
        <option value="">-----Select-----</option>
        <option value="hyderabad" >hyderabad </option>
        <option value="mancherial"> mancherial</option>
         <option value=" basar"> basar</option>
          <option value=" nizambad"> nizambad</option>
           <option value=" delhi "> delhi </option>
        </select>
        <label>Destination City</label>
         <select name="dest" id="dest" >
            <option value="">-----Select-----</option>
       <option value="hyderabad" >hyderabad </option>
        <option value="mancherial"> mancherial</option>
         <option value=" basar"> basar</option>
          <option value=" nizambad"> nizambad</option>
           <option value="delhi"> delhi </option>
        </select>
        <br/><br/>
        <input type=submit value="Check Buses">
        </form>
    </div>
  </body>
</html>

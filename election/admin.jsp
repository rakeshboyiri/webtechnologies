<!DOCTYPE html>
<html>
  <head>
    <title>Admin</title>
   
    <style>
      body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #ff9a9e 0%, #fad0c4 99%, #fad0c4 100%);
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
      }

      .admin-div {
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        padding: 20px;
        text-align: center;
      }

      .admin-div p {
        font-size: 18px;
        margin-bottom: 20px;
      }

      .start-msg {
        color: green;
      }

      .stop-msg {
        color: red;
      }

      .startbutton, .stopbutton {
        background-color: #008CBA;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        margin: 5px;
        transition: background-color 0.3s;
      }

      .stopbutton {
        background-color: #f44336;
      }

      .startbutton:hover {
        background-color: #005f73;
      }

      .stopbutton:hover {
        background-color: #d32f2f;
      }
    </style>
  </head>
  <body>
    <div class="admin-div">
      <%
        String str = request.getParameter("msg");
        String val = request.getParameter("val");
        if (str != null) {
          String msgClass = (val != null && val.equals("1")) ? "start-msg" : "stop-msg";
          out.println("<p class='" + msgClass + "'>" + str + "</p>");
        }
      %>
      <form action="setup.jsp">
        <button type="submit" value="1" name="val" class="startbutton">Start</button>
        <button type="submit" value="0" name="val" class="stopbutton">Stop</button>
      </form>
    </div>
  </body>
</html>


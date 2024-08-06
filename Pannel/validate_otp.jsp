<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <style>
        .myTextbox {
            font-size: 32px;
            size: 30px;
        }

        .myButton {
            font-size: 32px;
            size: 30px;
        }

        .message {
            font-size: 24px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <%
        String generatedOTP = request.getParameter("generatedOTP");
        String enteredOTP = request.getParameter("enteredOTP");
        String message = "";

        if (enteredOTP != null) {
            if (enteredOTP.equals(generatedOTP)) {
                message = "OTP is valid!";
            } else {
                message = "Invalid OTP. Please try again.";
            }
        }
    %>
    <form action="validate_otp.jsp" method="post">
        <input type="hidden" name="generatedOTP" value="<%= generatedOTP %>">
        <input type="text" name="enteredOTP" placeholder="Enter OTP" class="myTextbox">
        <input type="submit" value="Validate OTP" class="myButton">
    </form>
    <div class="message"><%= message %></div>
</body>
</html>


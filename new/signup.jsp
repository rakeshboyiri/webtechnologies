<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup Form</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea, #764ba2);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            padding: 40px;
            width: 400px;
            text-align: center;
        }

        .container h1 {
            font-size: 24px;
            color: #764ba2;
            margin-bottom: 20px;
        }

        .container p {
            font-size: 16px;
            color: #555;
            margin-bottom: 10px;
        }

        .myTextbox {
            width: calc(100% - 20px);
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 25px;
            font-size: 18px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1) inset;
            transition: border-color 0.3s;
        }

        .myTextbox:focus {
            border-color: #764ba2;
        }

        .container input[type="submit"],
        .container input[type="reset"] {
            background: linear-gradient(135deg, #764ba2, #667eea);
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            font-size: 18px;
            transition: background 0.3s;
            margin-top: 10px;
        }

        .container input[type="submit"]:hover,
        .container input[type="reset"]:hover {
            background: linear-gradient(135deg, #667eea, #764ba2);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Sign Up</h1>
        <form name="f2" action="process.jsp" method="post">
            <p>Name</p>
            <input type="text" name="name" id="name" class="myTextbox" required>
            <p>Email ID</p>
            <input type="email" name="email" id="email" class="myTextbox" required>
            <p>Password</p>
            <input type="password" name="password" id="password" class="myTextbox" required>
            <p>Mobile Number</p>
            <input type="tel" name="mobile" id="mobile" class="myTextbox" required>
            <br><br>
            <input type="submit" value="Sign Up">
            <input type="reset" value="Reset">
        </form>
    </div>
</body>
</html>


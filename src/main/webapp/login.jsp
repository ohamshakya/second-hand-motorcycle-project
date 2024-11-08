<%-- 
    Document   : login
    Created on : Nov 8, 2024, 12:48:16 PM
    Author     : ohams
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <script type="text/javascript">
        function validateForm() {
            var email = document.forms["loginForm"]["email"].value;
            var password = document.forms["loginForm"]["password"].value;
            var isValid = true;

            // Clear previous error messages
            document.getElementById("emailError").innerHTML = "";
            document.getElementById("passwordError").innerHTML = "";

            // Validate email
            if (email == "") {
                document.getElementById("emailError").innerHTML = "Email must be filled out.";
                isValid = false; 
            } else if (!validateEmail(email)) {
                document.getElementById("emailError").innerHTML = "Please enter a valid email address.";
                isValid = false;
            }

            // Validate password
            if (password == "") {
                document.getElementById("passwordError").innerHTML = "Password must be filled out.";
                isValid = false; // Form is not valid
            }

            return isValid; 
        }

        function validateEmail(email) {
            // Basic email validation regex
            var re = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            return re.test(email);
        }
    </script>
    <style>
        .error {
            color: red;
            font-size: 0.9em;
        }
    </style>
</head>
    <title>Login</title>
</head>
<body class="bg:white flex flex-col justify-center items-center h-screen font-mono">
  <div class="wrapper-main">
      <div class="wrapper flex gap-10">
          <div class="left-content flexf flex-col gap-16 items-center">
              <h1 class="text-blue-500 text-1xl font-semi-bold">SecondHand Motorcycle Market</h1>
              <img src="./assets/images/background.png" class="w-56" alt="">
          </div>
          <div class="right-content shadow-2xl w-72 h-72 bg:white flex flex-col justify-center items-center ml-32">
            <h2>Login Here</h2>
              <div class="form-wrapper">
                  <form action="UserLogin" method="post">
                      <div class="email mt-4">
                          <input type="text" name="email" placeholder="Email" class="w-60 p-2 border rounded-md">
                      </div>
                      <div id="emailError" class="error"></div>
                      <div class="password mt-4">
                          <input type="password" name="password" placeholder="password" class="w-60 p-2 border rounded-md">
                      </div>
                      <div class="forgorpassword flex justify-center mt-2">
                        <p><a class="text-sm hover:underline text-center text-[#090963]" href="#">Forgot password?</a></p>
                      </div>
                      <div id="passwordError" class="error"></div>
                      <div class="button mt-4">
                        <button type="submit" class="w-56 p-2 border rounded-md bg-[#090963] text-white">Login</button>
                      </div>

                      <div class="new-here mt-2">
                        <p class="text-loginBtnColor">New here?
                            <a class="text-sm hover:underline" href="register.jsp">Signup</a>
                        </p>
                      </div>
                  </form>
              </div>
          </div>
      </div>
  </div>
    
</body>
</html>
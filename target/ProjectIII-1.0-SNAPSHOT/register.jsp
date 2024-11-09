<%-- 
    Document   : register
    Created on : Nov 8, 2024, 12:48:21 PM
    Author     : ohams
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String successMessage = (String) request.getAttribute("status");
    String errorMessage = (String) request.getAttribute("error");
    if (successMessage != null) {
%>
<div style="color: green;">
    <strong><%= successMessage%></strong>
</div>
<%
    }
    if (errorMessage != null) {
%>
<div style="color: red;">
    <strong><%= errorMessage%></strong>
</div>
<%
    }
%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style.css">
        <script src="https://cdn.tailwindcss.com"></script>

        <title>Register</title>
        <style> 
        .error {
                color: red;
                font-size: 0.875rem;
            }
        </style>
    </head>

    <body class="bg-white flex flex-col justify-center items-center h-screen font-mono">
    <div class="wrapper-main">
        <div class="wrapper flex gap-40">
            <div class="left-content flex flex-col gap-16 items-center">
        <h1 class="text-blue-500 text-1xl font-semi-bold">SecondHand Motorcycle Market</h1>
        <img src="./assets/images/background.png" class="w-56" alt="">
      </div>
                
                <div class="form-wrapper">
                    <h2 class="text-center">Signup</h2>
                    <form id="signupForm" action="UserRegister" method="post" onsubmit="return validateForm()">
                        <div class="first-last flex gap-2 mt-4">
                            <div class="firstname">
                                <input type="text" name="fname" placeholder="Firstname" class="w-40 p-2 border rounded-md">
                                <p class="text-red-500 text-xs" id="fnameError"></p>
                            </div>
                            <div class="lastname">
                                <input type="text" name="lname" placeholder="Lastname" class="w-40 p-2 border rounded-md">
                                <p class="text-red-500 text-xs" id="lnameError"></p>
                            </div>
                        </div>
                        <div class="email mt-4">
                            <input type="text" id="email" name="email" placeholder="Email" class="w-[20.5rem] p-2 border rounded-md">
                            <p class="text-red-500 text-xs" id="emailError"></p>
                        </div>
                        <div class="phone mt-4">
                            <input type="text" name="phone" placeholder="Phone" class="w-[20.5rem] p-2 border rounded-md">
                            <p class="text-red-500 text-xs" id="phoneError"></p>
                        </div>
                        <div class="role mt-4">
                            <select name="role" class="w-[20.5rem] p-2 border rounded-md text-[#9CA3AF]" id="role">
                                <option value="0" class="text-[#9CA3AF]">Select a role</option>
                                <option value="1">Buyer</option>
                                <option value="2">Seller</option>
                            </select>
                            <p class="text-red-500 text-xs" id="roleError"></p>
                        </div>
                        <div class="password mt-4">
                            <input type="password" name="password" placeholder="Password" class="w-[20.5rem] p-2 border rounded-md">
                            <p class="text-red-500 text-xs" id="passwordError"></p>
                        </div>
                        <div class="password mt-4">
                            <input type="password" name="confirmpassword" placeholder="Confirm password" class="w-[20.5rem] p-2 border rounded-md">
                            <p class="text-red-500 text-xs" id="confirmPasswordError"></p>
                        </div>
                        <div class="button mt-4">
                            <button type="submit" class="w-56 p-2 border rounded-md bg-[#090963] text-white">Signup</button>
                        </div>
                        <div class="new-here mt-2">
                            <p class="text-loginBtnColor">New here?
                                <a class="text-sm hover:underline" href="login.jsp">Login</a>
                            </p>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
        
       

    <script>
        
        function validateForm() {
            
            document.getElementById('fnameError').innerText = '';
            document.getElementById('lnameError').innerText = '';
            document.getElementById('emailError').innerText = '';
            document.getElementById('phoneError').innerText = '';
            document.getElementById('roleError').innerText = '';
            document.getElementById('passwordError').innerText = '';
            document.getElementById('confirmPasswordError').innerText = '';

            const fname = document.querySelector('input[name="fname"]').value.trim();
            const lname = document.querySelector('input[name="lname"]').value.trim();
            const email = document.querySelector('input[name="email"]').value.trim();
            const phone = document.querySelector('input[name="phone"]').value.trim();
            const role = document.querySelector('select[name="role"]').value;
            const password = document.querySelector('input[name="password"]').value.trim();
            const confirmPassword = document.querySelector('input[name="confirmpassword"]').value.trim();

            let isValid = true;

            if (!fname) {
                document.getElementById('fnameError').innerText = 'First name is required.';
                isValid = false;
            }
            if (!lname) {
                document.getElementById('lnameError').innerText = 'Last name is required.';
                isValid = false;
            }
            if (!email) {
                document.getElementById('emailError').innerText = 'Email is required.';
                isValid = false;
            } else {
                const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (!emailPattern.test(email)) {
                    document.getElementById('emailError').innerText = 'Invalid email format.';
                    isValid = false;
                }
            }
            if (!phone) {
                document.getElementById('phoneError').innerText = 'Phone number is required.';
                isValid = false;
            } else {
                const phonePattern = /^[0-9]{10}$/;
                if (!phonePattern.test(phone)) {
                    document.getElementById('phoneError').innerText = 'Phone number must be 10 digits.';
                    isValid = false;
                }
            }
            if (role === "0") {
                document.getElementById('roleError').innerText = 'You must select a role.';
                isValid = false;
            }
            if (!password) {
                document.getElementById('passwordError').innerText = 'Password is required.';
                isValid = false;
            }
            if (password !== confirmPassword) {
                document.getElementById('confirmPasswordError').innerText = 'Passwords do not match.';
                isValid = false;
            }

            return isValid;
        }
    </script>
</body>

</html>
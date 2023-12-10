<!DOCTYPE html>
<html>

<head>
  <meta charset="ISO-8859-1">
  <title>Sign Up</title>

  <style>
    html {
      height: 100%;
    }

    body {
      margin: 0;
      padding: 0;
      font-family: sans-serif;
      background: linear-gradient(#141e30, #243b55) fixed;
      height: 100%;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .signup-box {
      position: absolute;
      top: 50%;
      left: 50%;
      width: 400px;
      padding: 40px;
      transform: translate(-50%, -50%);
      background: rgba(0, 0, 0, .5);
      box-sizing: border-box;
      box-shadow: 0 15px 25px rgba(0, 0, 0, .6);
      border-radius: 10px;
    }

    .signup-box h2 {
      margin: 0 0 30px;
      padding: 0;
      color: #fff;
      text-align: center;
    }

    .signup-box .user-box {
      position: relative;
      display: flex;
    }

    .signup-box .user-box input {
      width: 100%;
      padding: 10px 0;
      font-size: 16px;
      color: #fff;
      margin-bottom: 30px;
      border: none;
      border-bottom: 1px solid #fff;
      outline: none;
      background: transparent;
      box-sizing: border-box;
    }

    .signup-box .user-box label {
      position: absolute;
      top: 0;
      left: 0;
      padding: 10px 0;
      font-size: 16px;
      color: #fff;
      pointer-events: none;
      transition: .5s;
    }

    .signup-box .user-box img {
      position: absolute;
      top: 30%;
      right: 10px;
      transform: translateY(-50%);
      cursor: pointer;
      height: 30px;
      width: 30px;
    }

    .signup-box .user-box input:focus~label,
    .signup-box .user-box input:valid~label {
      top: -20px;
      left: 0;
      color: #03e9f4;
      font-size: 12px;
    }

    .signup-box button {
      position: relative;
      display: inline-block;
      padding: 10px 20px;
      color: #03e9f4;
      font-size: 16px;
      text-decoration: none;
      text-transform: uppercase;
      overflow: hidden;
      transition: .5s;
      margin-top: 40px;
      letter-spacing: 4px;
      border: none;
      background: none;
      cursor: pointer;
    }

    .signup-box button:hover {
      background: #03e9f4;
      color: #fff;
      border-radius: 5px;
      box-shadow: 0 0 5px #03e9f4,
        0 0 25px #03e9f4,
        0 0 50px #03e9f4,
        0 0 100px #03e9f4;
    }

    .signup-box button span {
      position: absolute;
      display: block;
    }

    .signup-box button span:nth-child(1) {
      top: 0;
      left: -100%;
      width: 100%;
      height: 2px;
      background: linear-gradient(90deg, transparent, #03e9f4);
      animation: btn-anim1 1s linear infinite;
    }

    @keyframes btn-anim1 {
      0% {
        left: -100%;
      }

      50%,
      100% {
        left: 100%;
      }
    }

    .signup-box button span:nth-child(2) {
      top: -100%;
      right: 0;
      width: 2px;
      height: 100%;
      background: linear-gradient(180deg, transparent, #03e9f4);
      animation: btn-anim2 1s linear infinite;
      animation-delay: .25s;
    }

    @keyframes btn-anim2 {
      0% {
        top: -100%;
      }

      50%,
      100% {
        top: 100%;
      }
    }

    .signup-box button span:nth-child(3) {
      bottom: 0;
      right: -100%;
      width: 100%;
      height: 2px;
      background: linear-gradient(270deg, transparent, #03e9f4);
      animation: btn-anim3 1s linear infinite;
      animation-delay: .5s;
    }

    @keyframes btn-anim3 {
      0% {
        right: -100%;
      }

      50%,
      100% {
        right: 100%;
      }
    }

    .signup-box button span:nth-child(4) {
      bottom: -100%;
      left: 0;
      width: 2px;
      height: 100%;
      background: linear-gradient(360deg, transparent, #03e9f4);
      animation: btn-anim4 1s linear infinite;
      animation-delay: .75s;
    }

    @keyframes btn-anim4 {
      0% {
        bottom: -100%;
      }

      50%,
      100% {
        bottom: 100%;
      }
    }
  </style>

  <script>
    // Function to display error message
    function showError(element, message) {
      const errorElement = element.nextElementSibling; // Assuming error element is the next sibling

      if (errorElement) {
        errorElement.textContent = message;
        errorElement.style.display = 'block';
      }
    }

    // Function to hide error message
    function hideError(element) {
      const errorElement = element.nextElementSibling; // Assuming error element is the next sibling

      if (errorElement) {
        errorElement.textContent = '';
        errorElement.style.display = 'none';
      }
    }

    // Function to validate username length (2-16 characters)
    function validateUsername() {
      const usernameInput = document.getElementsByName("username")[0];
      const usernameValue = usernameInput.value.trim();
      const errorElement = usernameInput.nextElementSibling; // Assuming error element is the next sibling

      if (usernameValue.length < 2 || usernameValue.length > 16) {
        showError(usernameInput, "Username must be 2-16 characters");
        return false;
      } else {
        hideError(usernameInput);
        return true;
      }
    }

    // Function to validate password (8-16 characters, one uppercase, one lowercase, one number, one special char)
    function validatePassword() {
      const passwordInput = document.getElementsByName("password")[0];
      const passwordValue = passwordInput.value.trim();
      const passwordRegex = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*()_+{}|:<>?~])[A-Za-z\d!@#$%^&*()_+{}|:<>?~]{8,16}$/;
      const errorElement = passwordInput.nextElementSibling; // Assuming error element is the next sibling

      if (!passwordRegex.test(passwordValue)) {
        showError(passwordInput, "Password must be of atleast 8 characters");
        return false;
      } else {
        hideError(passwordInput);
        return true;
      }
    }

    // Function to validate re-entered password
    function validateRepassword() {
      const passwordInput = document.getElementsByName("password")[0];
      const repasswordInput = document.getElementsByName("repassword")[0];
      const repasswordValue = repasswordInput.value.trim();
      const errorElement = repasswordInput.nextElementSibling; // Assuming error element is the next sibling

      if (repasswordValue !== passwordInput.value.trim()) {
        showError(repasswordInput, "Passwords do not match");
        return false;
      } else {
        hideError(repasswordInput);
        return true;
      }
    }

    // Function to validate the entire form
    function validateForm() {
      return validateUsername() && validatePassword() && validateRepassword();
    }
    // Function to handle form submission
    function submitForm() {
      if (validateForm()) {
        // If validation passes, you can submit the form
        return true;
      } else {
        // If validation fails, prevent form submission
        return false;
      }
    }
  </script>
</head>

<body>
  <div class="signup-box">
    <h2>Sign Up</h2>
    <form method="post" action="signup" modelAttribute="user" onsubmit="return submitForm()">
      <div class="user-box">
        <input type="email" path="email" name="email" required="">
        <label>Email</label>
      </div>
      <div class="user-box">
        <input type="text" path="name" name="name" required="">
        <label>Name</label>
      </div>
      <div class="user-box">
        <input type="text" path="username" name="username" required="" oninput="validateUsername()">
        <label>Preferred Username</label>
      </div>
      <div class="user-box">
        <input type="password" path="password" name="password" required="" oninput="validatePassword()">
        <label>Password</label>
        <img src="jsp/eye-close-icon.png" alt="eye-icon" id="password-eyeIcon">
      </div>
      <div class="user-box">
        <input type="password" path="password" name="repassword" required="" oninput="validateRepassword()">
        <label>Re-enter Password</label>
        <img src="jsp/eye-close-icon.png" alt="eye-icon" id="repassword-eyeIcon">
      </div>
      <button type="submit">
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        Submit
      </button>
      <!-- Add a button to switch to the sign-up view -->
      <button type="button" id="loginButton">
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        Switch to Login</button>
    </form>
  </div>

  <script>

    // Switch to Login
    document.getElementById('loginButton').addEventListener('click', function () {
      // Replace 'signup.html' with the actual URL of your sign-up page
      window.location.href = '/login';
    });

    // Password Visibility Fucntion
    let password = document.getElementsByName("password")[0];
    let rePassword = document.getElementsByName("repassword")[0];
    let passwordEyeIcon = document.getElementById("password-eyeIcon");
    let repasswordEyeIcon = document.getElementById("repassword-eyeIcon");

    passwordEyeIcon.onclick = function () {
      togglePasswordVisibility(password, passwordEyeIcon);
    };

    repasswordEyeIcon.onclick = function () {
      togglePasswordVisibility(rePassword, repasswordEyeIcon);
    };

    function togglePasswordVisibility(inputField, eyeIcon) {
      if (inputField.type === "password") {
        inputField.type = "text";
        eyeIcon.src = "jsp/eye-open-icon.png";
      } else {
        inputField.type = "password";
        eyeIcon.src = "jsp/eye-close-icon.png";
      }
    }
  </script>
</body>

</html>
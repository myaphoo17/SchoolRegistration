<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="test.css" />
<title>Login</title>
</head>
<body class="login-page-body">
  <div class="login-page">
    <div class="form">
      <div class="login">
        <div class="login-header">
          <h1>Welcome!</h1>
        </div>
      </div>
      <form class="login-form" action="LoginServlet" method="post">
        <input type="text" name="email" placeholder="Email" required /> <input
          type="password" name="password" placeholder="Password" required />
        <button type="submit">Login</button>
        <p class="message">
          Not registered? <a href="ViewUser.jsp">Create an account</a>
        </p>
      </form>

    </div>
  </div>
</body>
</html>



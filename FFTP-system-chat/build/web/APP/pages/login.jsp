<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"      %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="obj_user" scope="session" value="${ sessionScope.user }"/>
<c:choose>
  <c:when test="${ obj_user != null }">
    <c:redirect url = "app-home.jsp" />
  </c:when>
  <c:otherwise>

<!DOCTYPE html>
<html lang="en" >

<head>
  <meta charset="UTF-8">
  <title>Login FFTP</title>


  <link rel='stylesheet prefetch' href='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css'>
  <link rel="stylesheet" href="../_scss/login/style_loginForm.css">


</head>

<body>
  <!-- BUTTON BACK -->
  <div class='back'>
    <a id="back_button" >back</a>
  </div>

  <!-- LOGIN FORM -->
  <div class='login'>
    <div class='login_title'>
      <span>Login to FFTP</span>
    </div>

    <div class='login_fields' >
      <div class='login_fields__user'>
        <div class='icon'>
          <img src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/217233/user_icon_copy.png'>
        </div>
        <input placeholder='Username' type='text' name="username">
          <div class='validation'>
            <img src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/217233/tick.png'>
          </div>
        </input>
      </div>
      <div class='login_fields__password'>
        <div class='icon'>
          <img src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/217233/lock_icon_copy.png'>
        </div>
        <input placeholder='Password' type='password' name="password">
        <div class='validation'>
          <img src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/217233/tick.png'>
        </div>
      </div>
      <div class='login_fields__submit'>
        <input id="login" type='submit' value='Log In'>
        <div class='forgot'>
          <a id="forgot_pass" >Forgotten password?</a>
        </div>
      </div>
    </div>

    <div class='success'>
      <h2>Authentication Success</h2>
      <p>Welcome back</p>
    </div>
    <div class='error'>
      <h2>Authentication Error</h2>
      <a href='login.jsp' >Try again</a>
    </div>

    <div class='disclaimer'>
      <p>"I choose a lazy person to do a hard job because a lazy person is going to find an easy way to do it."</p>
    </div>
  </div>

  <!-- FORGOT PASSWORD FORM - HIDEN -->
  <div class='forgotPassword'>
    <div class='fp_title'>
      <span id="text_title"></span>
    </div>
    <div class='reset_password_box'>
      <div class='reset_password__user'>
        <div class='icon'>
          <img src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/217233/user_icon_copy.png'>
        </div>
        <input placeholder='Username' type='text' name="username" id="username_rsf">
          <div class='validation'>
            <img src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/217233/tick.png'>
          </div>
        </input>
      </div>
      <div class='reset_password__submit'>
        <input id="reset" type='submit' value='Reset'>
      </div>
    </div>
    <div class='disclaimer'>
      <p>Resetting your password is through your boss's knowledge!</p>
      <p>Follow the steps.</p>
    </div>
  </div>

  <div class='authent'>
    <img src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/217233/puff.svg'>
    <p id = "text_authForm" >Authenticating...</p>
  </div>
  <div class='love'>
    <p>Made by <a href='/FFTP-system-chat/' target='_blank'> FFTP </a></p>
  </div>

  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
  <script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script>
  <script src="../assets/js/components/login/script_loginForm.js"></script>

</body>

</html>


</c:otherwise>
</c:choose>

<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-19
  Time: 오전 9:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
</head>
<body>
<div class="container">
<h2>회원가입</h2>
    <div class="">
<form action="/save" method="post">
    <input type="text" onblur="duplicateCheck()" id="memberId" name="memberId" placeholder="아이디입력">
    <span id="dup-check-result"></span><br>
    <input type="text" name="memberPassword" placeholder="비밀번호입력"><br>
    <input type="text" name="memberName" placeholder="이름입력"><br>
    <input type="text" name="memberAge" placeholder="나이입력"><br>
    <input type="text" name="memberPhone" placeholder="전화번호입력"><br>
    <input type="submit" value="전송">
</form>
</div>
</div>
</body>
<script>
    const duplicateCheck = () => {
      const memberId = document.getElementById("memberId").value;
      const checkResult = document.getElementById("dup-check-result");
      $.ajax({
          type: "post", // http request method
          url: "duplicate-check", // 요청주소(컨트롤러 주소값)
          data: {"memberId": memberId}, // 전송하는 파라미터,괄호안 복수 데이터 가능
          dataType: "text", // 리턴받을 데이터 형식
          success: function (result){
              if(result == "ok"){
                  checkResult.innerHTML = "사용가능한 아이디입니다.";
                  checkResult.style.color = "green";
                  // 사용가능한 아이디
              } else {
                  checkResult.innerHTML = "이미 사용중인 아이디입니다.";
                  checkResult.style.color = "red";
                  // 이미 사용중인 아이디
              }
          },
          error: function () {
          }
      })
    }
</script>
</html>

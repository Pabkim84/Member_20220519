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
</head>
<body>
<h2>회원가입</h2>
<form action="/save" method="post">
    <input type="text" name="memberId" placeholder="아이디입력"><br>
    <input type="text" name="memberPassword" placeholder="비밀번호입력"><br>
    <input type="text" name="memberName" placeholder="이름입력"><br>
    <input type="text" name="memberAge" placeholder="나이입력"><br>
    <input type="text" name="memberPhone" placeholder="전화번호입력"><br>
    <input type="submit" value="전송">
</form>
</body>
</html>

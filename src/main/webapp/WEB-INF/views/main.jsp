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
</head>
<body>
    <h2>메인페이지</h2>
    로그인 회원 정보: ${loginMember}<br>
    세션에 담은 memberId: ${sessionScope.loginMemberId}
    <button class="btn btn-primary" onclick="location.href='/update-form'">내 정보수정</button>
    <button class="btn btn-danger" onclick="updateForm()">수정(함수호출)</button>
    <br>
    세션에 담은 id: ${sessionScope.loginId}<br>
    <a href="/">index로 이동</a><br>
</body>
<script>
    // function updateForm() {
    //
    // }
    const updateForm = () => {
        location.href = "/update-form";
    }
</script>
</html>

<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-20
  Time: 오전 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>update.jsp</h2>
<form action="/update" method="post" name="updateForm">
    회원번호: <input type="text" name="id" value="${updateMember.id}" readonly><br>
    회원계정: <input type="text" name="memberId" value="${updateMember.memberId}" readonly><br>
    비밀번호: <input type="text" name="memberPassword" id="pwConfirm" placeholder="비밀번호를 입력하세요"><br>
    회원이름: <input type="text" name="memberName" value="${updateMember.memberName}" readonly><br>
    회원나이: <input type="text" name="memberAge" value="${updateMember.memberAge}" readonly><br>
    전화번호: <input type="text" name="memberPhone" value="${updateMember.memberPhone}"><br>
    <input type="button" onclick="update()" value="정보수정">
</form>
</body>
<script>
    const update = () => {
        console.log("update 함수호출");
        // 사용자가 입력한 비밀번호 값 가져오기
        const pwConfirm = document.getElementById("pwConfirm").value;
        // DB에서 가져온 비밀번호 가져오기
        const pwDB = '${updateMember.memberPassword}';
        console.log("pwConfirm:" + pwConfirm + ", pwDB: "+ pwDB);
        if (pwConfirm == pwDB) {
            updateForm.submit(); // 해당 폼을 submit 하는 js 함수
        } else {
            alert("비밀번호가 틀립니다");
        }
    }
</script>
</html>

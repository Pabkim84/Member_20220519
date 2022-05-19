<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-19
  Time: 오전 9:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:forEach var="memberList" items="${memberDTOList}">
    ${memberList.id}
    ${memberList.memberId}
    ${memberList.memberPassword}
    ${memberList.memberName}
    ${memberList.memberAge}
    ${memberList.memberPhone}<br>
</c:forEach>
</body>
</html>

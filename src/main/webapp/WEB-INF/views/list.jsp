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
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="/resources/js/jquery.js"></script>
</head>
<body>
   <table>
       <tr>
           <th>id</th>
           <th>memberId</th>
           <th>memberName</th>
           <th>memberAge</th>
           <th>memberPhone</th>
           <th>조회</th>
           <th>삭제</th>
           <th>상세조회</th>

       </tr>
       <c:forEach var="memberList" items="${memberDTOList}">
       <tr>

           <td>${memberList.id}</td>
           <td>${memberList.memberId}</td>
           <td>${memberList.memberName}</td>
           <td>${memberList.memberAge}</td>
           <td>${memberList.memberPhone}<br></td>
            <td><a href="/detail?id=${memberList.id}">조회</a></td>
            <td><a href="/delete?id=${memberList.id}">삭제</a></td>
            <td><button onclick="detailByAjax('${memberList.id}')">상세조회</button></td>
       </tr>
           <%-- 클릭한 회원의 정보를 DB에서 가져와서 detail.jsp에 출력 --%>
       </c:forEach>
   </table>
    <div id="detail"></div>
</body>
<script>
    const detailByAjax = (id) => {
        console.log(id);
        const detail = document.getElementById("detail");
        $.ajax({
            type: "get", // http request method
            url: "detail-ajax", // 요청주소(컨트롤러 주소값)
            data: {"id": id}, // 전송하는 파라미터,괄호안 복수 데이터 가능
            dataType: "json", // 리턴받을 데이터 형식 (json js 오브젝트타입)
            success: function (result){
                let output = "<table class='table'>";
                output += "<tr>" +
                    "<th>id</th> " +
                    "<th>memberId</th> " +
                    "<th>memberPassword</th> " +
                    "<th>memberName</th>" +
                    "<th>memberAge</th> " +
                    "<th>memberPhone</th> " +
                    "</tr>";
                output += "<tr>";


                output += "<td>" + result.id                  + "</td>";
                output += "<td>" + result.memberId            + "</td>";
                output += "<td>" + result.memberPassword      + "</td>";
                output += "<td>" + result.memberName          + "</td>";
                output += "<td>" + result.memberAge           + "</td>";
                output += "<td>" + result.memberPhone         + "</td>";
                output += "</tr>";
                output += "</table>";

                detail.innerHTML = output;
            },
            error: function () {
            }
        })
    }
</script>
</html>

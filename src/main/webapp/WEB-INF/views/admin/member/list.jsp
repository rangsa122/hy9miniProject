<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>회원 관리 - makeit.</title>

<link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/main.css">

</head>

<body>

<header class="site-header">

    <div class="header-inner">

        <h1 class="logo">
            <a href="${pageContext.request.contextPath}/">
                makeit.
            </a>
        </h1>

        <nav class="header-nav">

            <a href="${pageContext.request.contextPath}/">
                홈
            </a>

            <a href="${pageContext.request.contextPath}/admin/product/list">
                상품 관리
            </a>

            <a href="${pageContext.request.contextPath}/admin/order/list">
                주문 관리
            </a>

            <a href="${pageContext.request.contextPath}/admin/member/list">
                회원 관리
            </a>

            <c:if test="${not empty sessionScope.loginMember}">

                <span class="login-user">
                    ${sessionScope.loginMember.name}님
                </span>

                <a href="${pageContext.request.contextPath}/member/logout">
                    로그아웃
                </a>

            </c:if>

        </nav>

    </div>

</header>


<main class="admin-page">

    <h2>회원 관리</h2>


    <table class="admin-table admin-member-table">

        <thead>

            <tr>

                <th>회원번호</th>
                <th>아이디</th>
                <th>이름</th>
                <th>이메일</th>
                <th>권한</th>
                <th>가입일</th>

            </tr>

        </thead>


        <tbody>

            <c:choose>

                <c:when test="${not empty memberList}">

                    <c:forEach var="member"
                               items="${memberList}">

                        <tr>

                            <td>
                                ${member.memberId}
                            </td>

                            <td>
                                ${member.userId}
                            </td>

                            <td>
                                ${member.name}
                            </td>

                            <td>
                                ${member.email}
                            </td>

                            <td>

                                <c:choose>

                                    <c:when test="${member.role == 'ADMIN'}">
                                        <span class="member-role admin">
                                            관리자
                                        </span>
                                    </c:when>

                                    <c:otherwise>
                                        <span class="member-role user">
                                            일반회원
                                        </span>
                                    </c:otherwise>

                                </c:choose>

                            </td>

                            <td>
                                ${member.formattedCreatedAt}
                            </td>

                        </tr>

                    </c:forEach>

                </c:when>


                <c:otherwise>

                    <tr>

                        <td colspan="6">
                            가입된 회원이 없습니다.
                        </td>

                    </tr>

                </c:otherwise>

            </c:choose>

        </tbody>

    </table>

</main>

</body>
</html>
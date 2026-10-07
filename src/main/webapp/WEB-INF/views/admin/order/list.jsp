<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>주문 관리 - makeit.</title>

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

            <c:choose>

                <c:when test="${not empty sessionScope.loginMember}">

                    <span class="login-user">
                        ${sessionScope.loginMember.name}님
                    </span>

                    <a href="${pageContext.request.contextPath}/member/logout">
                        로그아웃
                    </a>

                </c:when>

            </c:choose>

        </nav>

    </div>

</header>


<main class="admin-page">

    <h2>주문 관리</h2>

    <c:if test="${not empty message}">
        <script>
            alert("${message}");
        </script>
    </c:if>


    <table class="admin-table">

        <thead>

            <tr>
                <th>주문번호</th>
                <th>주문자</th>
                <th>아이디</th>
                <th>주문금액</th>
                <th>주문상태</th>
                <th>주문일시</th>
                <th>상세</th>
            </tr>

        </thead>

        <tbody>

            <c:choose>

                <c:when test="${not empty orderList}">

                    <c:forEach var="order"
                               items="${orderList}">

                        <tr>

                            <td>
                                ${order.orderId}
                            </td>

                            <td>
                                ${order.name}
                            </td>

                            <td>
                                ${order.userId}
                            </td>

                            <td>
                                ${order.totalPrice}원
                            </td>

                            <td>
                                ${order.orderStatus}
                            </td>

                            <td>
                                ${order.createdAt}
                            </td>

                            <td>

                                <a
                                    href="${pageContext.request.contextPath}/admin/order/detail?orderId=${order.orderId}"
                                    class="admin-detail-button">

                                    상세보기

                                </a>

                            </td>

                        </tr>

                    </c:forEach>

                </c:when>


                <c:otherwise>

                    <tr>

                        <td colspan="7">
                            주문 내역이 없습니다.
                        </td>

                    </tr>

                </c:otherwise>

            </c:choose>

        </tbody>

    </table>

</main>

</body>
</html>
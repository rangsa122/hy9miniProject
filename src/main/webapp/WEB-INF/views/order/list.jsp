<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>주문 내역 - makeit.</title>

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

            <a href="${pageContext.request.contextPath}/product/list">
                KIT 쇼핑
            </a>

            <a href="${pageContext.request.contextPath}/cart">
                장바구니
            </a>


            <c:choose>

                <c:when test="${not empty sessionScope.loginMember}">

                    <a href="${pageContext.request.contextPath}/member/mypage">
					    ${sessionScope.loginMember.name}님
					</a>

                    <a href="${pageContext.request.contextPath}/member/logout">
                        로그아웃
                    </a>

                </c:when>


                <c:otherwise>

                    <a href="${pageContext.request.contextPath}/member/login">
                        로그인
                    </a>

                    <a href="${pageContext.request.contextPath}/member/join">
                        회원가입
                    </a>

                </c:otherwise>

            </c:choose>

        </nav>

    </div>

</header>



<main class="order-page">


    <h2>주문 내역</h2>


    <c:choose>


        <c:when test="${not empty orderList}">


            <table class="user-order-table">


                <thead>

                    <tr>

                        <th>주문번호</th>

                        <th>주문일</th>

                        <th>주문금액</th>

                        <th>주문상태</th>

                        <th>상세</th>

                    </tr>

                </thead>


                <tbody>


                    <c:forEach
                        var="order"
                        items="${orderList}">


                        <tr>


                            <td>
                                ${order.orderId}
                            </td>


                            <td>
                                ${order.createdAt}
                            </td>


                            <td>
                                ${order.totalPrice}원
                            </td>


                            <td>
                                ${order.orderStatus}
                            </td>


                            <td>

                                <a
                                    href="${pageContext.request.contextPath}/order/detail?orderId=${order.orderId}"
                                    class="user-order-detail-button">

                                    상세 보기

                                </a>

                            </td>


                        </tr>


                    </c:forEach>


                </tbody>


            </table>


        </c:when>


        <c:otherwise>


            <div class="order-empty">

                <p>
                    아직 주문한 상품이 없습니다.
                </p>

                <a
                    href="${pageContext.request.contextPath}/product/list"
                    class="order-shopping-button">

                    KIT 쇼핑하기

                </a>

            </div>


        </c:otherwise>


    </c:choose>


</main>


</body>

</html>
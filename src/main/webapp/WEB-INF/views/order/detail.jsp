<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 상세 - makeit.</title>

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


<main class="order-detail-page">

    <h2>주문 상세</h2>


    <!-- 주문 기본 정보 -->
    <section class="user-order-info">

        <div class="user-order-info-row">
            <span>주문번호</span>
            <strong>${order.orderId}</strong>
        </div>

        <div class="user-order-info-row">
            <span>주문금액</span>
            <strong>${order.totalPrice}원</strong>
        </div>

        <div class="user-order-info-row">
            <span>주문상태</span>
            <strong>${order.orderStatus}</strong>
        </div>

        <div class="user-order-info-row">
            <span>주문일시</span>
            <strong>${order.createdAt}</strong>
        </div>

    </section>


    <!-- 주문 상품 -->
    <section class="user-order-product">
	
	    <h3 class="order-section-title">주문 상품</h3>
	
	    <c:choose>
	
	        <c:when test="${not empty orderItemList}">
	
	            <table class="user-order-table">
	
	                <thead>
	                    <tr>
	                        <th>상품</th>
	                        <th>수량</th>
	                        <th>가격</th>
	                        <th>소계</th>
	                    </tr>
	                </thead>
	
	                <tbody>
	
	                    <c:forEach var="item" items="${orderItemList}">
	
	                        <tr>
	
	                            <td>
	                                <div class="order-product-cell">
	                                    <span>${item.productName}</span>
	                                </div>
	                            </td>
	
	                            <td>
	                                ${item.quantity}
	                            </td>
	
	                            <td>
	                                ${item.price}원
	                            </td>
	
	                            <td>
	                                ${item.totalPrice}원
	                            </td>
	
	                        </tr>
	
	                    </c:forEach>
	
	                </tbody>
	
	            </table>
	
	        </c:when>
	
	        <c:otherwise>
	
	            <p class="order-empty">
	                주문 상품이 없습니다.
	            </p>
	
	        </c:otherwise>
	
	    </c:choose>
	
	</section>


    <!-- 버튼 -->
    <div class="order-detail-buttons">

        <a href="${pageContext.request.contextPath}/order/list"
           class="order-shopping-button">
            주문 내역
        </a>

        <a href="${pageContext.request.contextPath}/product/list"
           class="order-shopping-button">
            쇼핑 계속하기
        </a>

    </div>

</main>

</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>주문 완료 - makeit.</title>

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

    <h2>주문이 완료되었습니다.</h2>
    
	<p class="order-message">
	    주문해 주셔서 감사합니다.
	</p>

    <div class="order-complete">

        <p>
            주문번호:
            <strong>${order.orderId}</strong>
        </p>

        <p>
            주문 금액:
            <strong>${order.totalPrice}원</strong>
        </p>

        <p>
            주문 상태:
            <strong>${order.orderStatus}</strong>
        </p>

    </div>

    <div class="order-complete-buttons">

	    <a href="${pageContext.request.contextPath}/order/list">
	        <button type="button">주문 내역 보기</button>
	    </a>
	
	    <a href="${pageContext.request.contextPath}/">
	        <button type="button">쇼핑 계속하기</button>
	    </a>
	
	</div>

</main>

</body>
</html>
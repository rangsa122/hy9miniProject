<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>makeit.</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/main.css">
</head>

<body>

<header class="header">
    <div class="header-inner">

        <a href="${pageContext.request.contextPath}/" class="logo">
            makeit.
        </a>

        <nav class="nav">

            <a href="${pageContext.request.contextPath}/product/list">
                KIT 쇼핑
            </a>

            <a href="${pageContext.request.contextPath}/product/list?difficulty=초급">
                난이도별
            </a>

            <a href="${pageContext.request.contextPath}/product/list">
                재료·도구
            </a>

        </nav>

        <div class="header-right">

            <c:choose>

                <c:when test="${not empty sessionScope.loginMember and sessionScope.loginMember.role eq 'ADMIN'}">

                    <a href="${pageContext.request.contextPath}/admin/product/list">
                        상품관리
                    </a>

                    <a href="${pageContext.request.contextPath}/admin/order/list">
                        주문관리
                    </a>

                    <a href="${pageContext.request.contextPath}/admin/member/list">
                        회원관리
                    </a>

                    <a href="${pageContext.request.contextPath}/member/mypage">
                        ${sessionScope.loginMember.name}님
                    </a>

                    <a href="${pageContext.request.contextPath}/member/logout">
                        로그아웃
                    </a>

                </c:when>

                <c:when test="${not empty sessionScope.loginMember}">

                    <a href="${pageContext.request.contextPath}/member/mypage">
                        ${sessionScope.loginMember.name}님
                    </a>

                    <a href="${pageContext.request.contextPath}/member/logout">
                        로그아웃
                    </a>

                    <a href="${pageContext.request.contextPath}/cart">
                        장바구니
                    </a>

                </c:when>

                <c:otherwise>

                    <a href="${pageContext.request.contextPath}/member/login">
                        로그인
                    </a>

                    <a href="${pageContext.request.contextPath}/member/join">
                        회원가입
                    </a>

                    <a href="${pageContext.request.contextPath}/cart">
                        장바구니
                    </a>

                </c:otherwise>

            </c:choose>

        </div>

    </div>
</header>


<main>

    <section class="hero">

        <div class="hero-content">

            <p class="hero-small">
                DIY KIT SHOP
            </p>

            <h1>
                오늘은<br>
                무엇을 만들까요?
            </h1>

            <p>
                처음이어도 괜찮아요.<br>
                makeit과 함께 나만의 작품을 만들어보세요.
            </p>

            <a href="${pageContext.request.contextPath}/product/list"
               class="primary-button">
                초보자도 쉽게 시작하기
            </a>

        </div>

        <div class="hero-image">

            <div class="hero-card">
                <span>START DIY</span>
            </div>

        </div>

    </section>


    <section class="difficulty-section">

        <div class="section-title">

            <p>CHOOSE YOUR LEVEL</p>

            <h2>
                난이도별로 골라보세요
            </h2>

        </div>

        <div class="difficulty-list">

            <a href="${pageContext.request.contextPath}/product/list?difficulty=초급"
               class="difficulty-card">

                <span>01</span>
                <strong>초급</strong>
                <small>처음 시작하는 분께</small>

            </a>

            <a href="${pageContext.request.contextPath}/product/list?difficulty=중급"
               class="difficulty-card">

                <span>02</span>
                <strong>중급</strong>
                <small>조금 더 재미있게</small>

            </a>

            <a href="${pageContext.request.contextPath}/product/list?difficulty=고급"
               class="difficulty-card">

                <span>03</span>
                <strong>고급</strong>
                <small>나만의 작품에 도전</small>

            </a>

        </div>

    </section>


    <section class="product-section">

        <div class="section-title product-title">

            <div>

                <p>
                    BEST DIY KIT
                </p>

                <h2>
                    요즘 가장 사랑받는 KIT
                </h2>

            </div>

            <a href="${pageContext.request.contextPath}/product/list"
               class="more">
                전체보기 →
            </a>

        </div>


        <div class="product-grid">

            <c:forEach var="product" items="${productList}">

                <article class="product-card">

                    <a href="${pageContext.request.contextPath}/product/detail?productId=${product.productId}">

                        <div class="product-image">

                            <c:if test="${not empty product.image}">

                                <img
                                    src="${pageContext.request.contextPath}${product.image}"
                                    alt="${product.productName}"
                                >

                            </c:if>

                            <c:if test="${empty product.image}">

                                <span>
                                    MAKE IT YOURSELF
                                </span>

                            </c:if>

                        </div>


                        <div class="product-info">

                            <span class="product-category">
                                ${product.category}
                            </span>

                            <h3>
                                ${product.productName}
                            </h3>

                            <p class="product-description">
                                ${product.description}
                            </p>

                            <strong class="product-price">
                                ${product.price}원
                            </strong>

                        </div>

                    </a>

                </article>

            </c:forEach>

        </div>

    </section>

</main>


<footer class="footer">

    <div class="footer-inner">

        <strong>
            makeit.
        </strong>

        <p>
            누구나 쉽게 시작하는 DIY KIT
        </p>

        <p class="copyright">
            © 2026 makeit. All rights reserved.
        </p>

    </div>

</footer>

</body>
</html>
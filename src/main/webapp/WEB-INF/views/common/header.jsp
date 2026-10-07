<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

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


            <c:choose>

                <!-- 관리자 -->
                <c:when test="${sessionScope.loginMember.role eq 'ADMIN'}">

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


                <!-- 일반 회원 -->
                <c:when test="${not empty sessionScope.loginMember}">

                    <a href="${pageContext.request.contextPath}/product/list">
                        KIT 쇼핑
                    </a>

                    <a href="${pageContext.request.contextPath}/cart">
                        장바구니
                    </a>

                    <a href="${pageContext.request.contextPath}/member/mypage">
                        ${sessionScope.loginMember.name}님
                    </a>

                    <a href="${pageContext.request.contextPath}/member/logout">
                        로그아웃
                    </a>

                </c:when>


                <!-- 비로그인 -->
                <c:otherwise>

                    <a href="${pageContext.request.contextPath}/product/list">
                        KIT 쇼핑
                    </a>

                    <a href="${pageContext.request.contextPath}/cart">
                        장바구니
                    </a>

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
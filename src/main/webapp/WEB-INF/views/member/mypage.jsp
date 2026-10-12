<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>마이페이지 - makeit.</title>

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

				                
				<c:when test="${not empty requestScope.loginMember}">
				    <a href="${pageContext.request.contextPath}/member/mypage">
				        ${requestScope.loginMember.name}님
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


<main class="mypage">

    <h2>마이페이지</h2>


    <section class="mypage-member-info">

        <h3>회원 정보</h3>

        <div class="mypage-info-row">

            <span class="mypage-info-label">
                이름
            </span>

            <span class="mypage-info-value">
                ${member.name}
            </span>

        </div>


        <div class="mypage-info-row">

            <span class="mypage-info-label">
                아이디
            </span>

            <span class="mypage-info-value">
                ${member.userId}
            </span>

        </div>


        <div class="mypage-info-row">

            <span class="mypage-info-label">
                이메일
            </span>

            <span class="mypage-info-value">
                ${member.email}
            </span>

        </div>


        <div class="mypage-info-row">

            <span class="mypage-info-label">
                가입일
            </span>

            <span class="mypage-info-value">
                ${member.formattedCreatedAt}
            </span>

        </div>

    </section>


    <section class="mypage-menu">

        <h3>주문 관리</h3>

        <a
            href="${pageContext.request.contextPath}/order/list"
            class="mypage-menu-button">

            주문 내역

        </a>

    </section>

</main>

</body>
</html>
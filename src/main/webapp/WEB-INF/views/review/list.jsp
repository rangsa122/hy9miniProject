<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <title>상품 리뷰 - makeit.</title>

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

                    <span class="login-user">
                        ${sessionScope.loginMember.name}님
                    </span>

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


<main class="review-page">

    <div class="review-container">

        <h2>상품 리뷰</h2>


        <!-- 로그인 사용자 리뷰 작성 영역 -->

        <c:choose>

            <c:when test="${not empty sessionScope.loginMember}">

                <div class="review-write">

                    <h3>리뷰 작성</h3>

                    <form
                        action="${pageContext.request.contextPath}/review/add"
                        method="post">

                        <input
                            type="hidden"
                            name="productId"
                            value="${productId}">

                        <textarea
                            name="content"
                            placeholder="상품을 사용해 본 후기를 작성해주세요."
                            maxlength="1000"
                            required></textarea>

                        <button
                            type="submit">
                            리뷰 등록
                        </button>

                    </form>

                </div>

            </c:when>


            <c:otherwise>

                <div class="review-login-message">

                    <p>
                        리뷰를 작성하려면 로그인이 필요합니다.
                    </p>

                    <a
                        href="${pageContext.request.contextPath}/member/login">
                        로그인하기
                    </a>

                </div>

            </c:otherwise>

        </c:choose>


        <!-- 리뷰 목록 -->

        <div class="review-list">

            <h3>리뷰 목록</h3>


            <c:choose>

                <c:when test="${not empty reviewList}">

                    <c:forEach
                        var="review"
                        items="${reviewList}">

                        <div class="review-item">

                            <div class="review-header">

                                <strong>
                                    ${review.memberName}
                                </strong>

                                <span>
								    ${review.formattedCreatedAt}
								</span>

                            </div>


                            <p class="review-content">${review.content}</p>


                            <!-- 본인이 작성한 리뷰만 삭제 버튼 표시 -->

                            <c:if
                                test="${not empty sessionScope.loginMember
                                       and sessionScope.loginMember.memberId == review.memberId}">

                                <form
                                    action="${pageContext.request.contextPath}/review/delete"
                                    method="post">

                                    <input
                                        type="hidden"
                                        name="reviewId"
                                        value="${review.reviewId}">

                                    <input
                                        type="hidden"
                                        name="productId"
                                        value="${productId}">

                                    <button
                                        type="submit"
                                        class="review-delete-button">

                                        삭제

                                    </button>

                                </form>

                            </c:if>

                        </div>

                    </c:forEach>

                </c:when>


                <c:otherwise>

                    <div class="review-empty">

                        <p>
                            아직 작성된 리뷰가 없습니다.
                        </p>

                        <p>
                            첫 번째 리뷰를 작성해보세요.
                        </p>

                    </div>

                </c:otherwise>

            </c:choose>

        </div>


        <!-- 상품으로 돌아가기 -->

        <div class="review-back">

            <a
                href="${pageContext.request.contextPath}/product/detail?productId=${productId}">

                상품으로 돌아가기

            </a>

        </div>

    </div>

</main>

</body>
</html>
<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>로그인 - makeit.</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/main.css">

    <style>

        .login-container {
            width: 420px;
            margin: 100px auto;
        }

        .login-container h1 {
            margin-bottom: 40px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        .form-group input {
            width: 100%;
            box-sizing: border-box;
            padding: 14px;
            border: 1px solid #ddd;
        }

        .login-button {
            width: 100%;
            padding: 16px;
            margin-top: 20px;
            background: #111;
            color: white;
            border: none;
            cursor: pointer;
        }

        .error-message {
            margin-bottom: 20px;
            color: #d33;
        }

        .join-link {
            display: block;
            margin-top: 20px;
            text-align: center;
        }

    </style>

</head>


<body>


<header class="header">

    <div class="header-inner">

        <a href="/" class="logo">
            makeit.
        </a>

    </div>

</header>


<main>

    <div class="login-container">

        <h1>로그인</h1>


        <c:if test="${not empty error}">
            <p class="error-message">
                ${error}
            </p>
        </c:if>


        <form
            action="${pageContext.request.contextPath}/member/login"
            method="post">


            <div class="form-group">

                <label>
                    아이디
                </label>

                <input
                    type="text"
                    name="userId"
                    required
                >

            </div>


            <div class="form-group">

                <label>
                    비밀번호
                </label>

                <input
                    type="password"
                    name="password"
                    required
                >

            </div>


            <button
                type="submit"
                class="login-button">

                로그인

            </button>

        </form>


        <a
            href="${pageContext.request.contextPath}/member/join"
            class="join-link">

            아직 회원이 아니신가요? 회원가입

        </a>

    </div>

</main>


</body>

</html>
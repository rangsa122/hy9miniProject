<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>회원가입 - makeit.</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/main.css">

    <style>

        .join-container {
            width: 420px;
            margin: 100px auto;
        }

        .join-container h1 {
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

        .join-button {
            width: 100%;
            padding: 16px;
            margin-top: 20px;
            background: #111;
            color: white;
            border: none;
            cursor: pointer;
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

    <div class="join-container">

        <h1>회원가입</h1>


        <form
            action="${pageContext.request.contextPath}/member/join"
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


            <div class="form-group">

                <label>
                    이름
                </label>

                <input
                    type="text"
                    name="name"
                    required
                >

            </div>


            <div class="form-group">

                <label>
                    이메일
                </label>

                <input
                    type="email"
                    name="email"
                >
                
            </div>


            <button
                type="submit"
                class="join-button">

                회원가입
            </button>

        </form>

    </div>

</main>

</body>
</html>
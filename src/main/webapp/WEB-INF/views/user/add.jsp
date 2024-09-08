<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
    .form-container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .form {
        width: 50%;
        padding: 20px;
        margin-left: 250px;
        margin-top: 100px;
    }

    .form-row {
        margin-bottom: 15px; /* 각 입력 필드 사이에 간격 추가 */
    }

    .form-row label {
        display: block;
        margin-bottom: 5px; /* 라벨과 입력 필드 사이 간격 */
    }

    .form-row input {
        width: calc(100% - 120px); /* 입력 필드의 너비를 버튼 크기만큼 줄임 */
        display: inline-block;
    }

    .form-row button {
        width: 100px; /* 버튼 너비 설정 */
        margin-left: 10px; /* 입력 필드와 버튼 사이 간격 */
        display: inline-block;
        vertical-align: middle; /* 입력 필드와 버튼을 동일한 라인에 배치 */
    }

    #idMessage {
        margin-top: 5px;
        display: block;
        color: red;
    }
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/comm/menu.jsp"/>

<div class="py-5 text-center">
    <svg xmlns="http://www.w3.org/2000/svg" width="72" height="57" fill="#0d6efd" class="bi bi-backpack2-fill" viewBox="0 0 16 16">
        <path d="M5 13h6v-3h-1v.5a.5.5 0 0 1-1 0V10H5z"/>
        <path d="M6 2v.341C3.67 3.165 2 5.388 2 8v1.191l-1.17.585A1.5 1.5 0 0 0 0 11.118V13.5A1.5 1.5 0 0 0 1.5 15h1c.456.607 1.182 1 2 1h7c.818 0 1.544-.393 2-1h1a1.5 1.5 0 0 0 1.5-1.5v-2.382a1.5 1.5 0 0 0-.83-1.342L14 9.191V8a6 6 0 0 0-4-5.659V2a2 2 0 1 0-4 0m2-1a1 1 0 0 1 1 1v.083a6 6 0 0 0-2 0V2a1 1 0 0 1 1-1m0 3a4 4 0 0 1 3.96 3.43.5.5 0 1 1-.99.14 3 3 0 0 0-5.94 0 .5.5 0 1 1-.99-.14A4 4 0 0 1 8 4M4.5 9h7a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5h-7a.5.5 0 0 1-.5-.5v-4a.5.5 0 0 1 .5-.5"/>
    </svg>
    <h2>U-Jam Daejeon</h2>
    <p class="lead">회원가입</p>
    <hr class="my-4">
</div> 

<div class="form-container">
    <div class="form">
        <form action='${pageContext.request.contextPath}/user/add.do' method='post' class="needs-validation" novalidate="">
            <div class="col-md-7 col-lg-8">
                <h4 class="mb-3">회원 가입 양식</h4>
                <div class="row g-3">

                    <!-- 아이디 입력 및 중복확인 버튼 -->
                    <div class="form-row">
                        <label for="id" class="form-label">아이디</label>
                        <input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력하시오">
                        <button type="button" class="btn btn-secondary" onclick="checkId()">중복확인</button>
                        <span id="idMessage"></span> 
                    </div>

                    <!-- 비밀번호 입력 -->
                    <div class="form-row">
                        <label for="password" class="form-label">비밀번호</label>
                        <input type="password" class="form-control" name="password" placeholder="비밀번호를 입력하시오">
                    </div>

                    <div class="col-12">
                        <label for="username" class="form-label">사용자 이름</label>
                        <div class="input-group has-validation">
                            <input type="text" class="form-control" name="username" placeholder="예)홍길동" required="">
                        </div>
                    </div>

                    <div class="col-12">
                        <label for="email" class="form-label">이메일</label>
                        <input type="email" class="form-control" name="email" placeholder="you@example.com">
                    </div>

                    <div class="col-12">
                        <label for="address" class="form-label">주소</label>
                        <input type="text" class="form-control"  name="address" placeholder="대전광역시 유성구">
                    </div>

                    <div class="col-12">
                        <label for="phone" class="form-label">휴대전화</label>
                        <input type="text" class="form-control" name="phone" placeholder="010-1234-5678">
                    </div>

                    <div class="col-md-5">
                        <label for="gender" class="form-label">성별</label>
                        <div class="my-3">
                            <div class="form-check">
                                <input id="credit" name="gender" type="radio" value="M" class="form-check-input" checked="" required="">
                                <label class="form-check-label" for="credit">남성</label>
                            </div>
                            <div class="form-check">
                                <input id="cash" name="gender" type="radio" value="F" class="form-check-input" required="">
                                <label class="form-check-label" for="cash">여성</label>
                            </div>
                        </div>
                    </div>

                    <div class="col-12">
                        <label for="birthdate" class="form-label">생년월일</label>
                        <input type="date" class="form-control" name="birthdate">
                        <div class="invalid-feedback">
                            번호를 입력해주세요.
                        </div>
                    </div>

                    <hr class="my-4">
                    
                    <button class="w-100 btn btn-primary btn-lg" type="submit">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-backpack2-fill" viewBox="0 0 16 16">
                            <path d="M5 13h6v-3h-1v.5a.5.5 0 0 1-1 0V10H5z"></path>
                            <path d="M6 2v.341C3.67 3.165 2 5.388 2 8v1.191l-1.17.585A1.5 1.5 0 0 0 0 11.118V13.5A1.5 1.5 0 0 0 1.5 15h1c.456.607 1.182 1 2 1h7c.818 0 1.544-.393 2-1h1a1.5 1.5 0 0 0 1.5-1.5v-2.382a1.5 1.5 0 0 0-.83-1.342L14 9.191V8a6 6 0 0 0-4-5.659V2a2 2 0 1 0-4 0m2-1a1 1 0 0 1 1 1v.083a6 6 0 0 0-2 0V2a1 1 0 0 1 1-1m0 3a4 4 0 0 1 3.96 3.43.5.5 0 1 1-.99.14 3 3 0 0 0-5.94 0 .5.5 0 1 1-.99-.14A4 4 0 0 1 8 4M4.5 9h7a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5h-7a.5.5 0 0 1-.5-.5v-4a.5.5 0 0 1 .5-.5"></path>
                        </svg>
                        회원가입
                    </button>
                </div>
            </div>
        </form>
    </div>
</div> 

<script type="text/javascript">
function checkId() {
    var id = document.getElementById("id").value;
    console.log(id);
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "${pageContext.request.contextPath}/user/checkId.do?id=" + encodeURIComponent(id), true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                try {
                    var jsonResponse = JSON.parse(xhr.responseText);
                    var message = jsonResponse.exists ? "아이디가 이미 존재합니다." : "아이디를 사용할 수 있습니다.";
                    document.getElementById("idMessage").innerText = message;
                } catch (e) {
                    console.error("Invalid JSON: ", e);
                    console.log("Server response: ", xhr.responseText);
                    document.getElementById("idMessage").innerText = "서버 응답이 올바르지 않습니다.";
                }
            } else {
                console.error("Request failed with status: " + xhr.status);
                document.getElementById("idMessage").innerText = "요청 실패: " + xhr.status;
            }
        }
    };
    xhr.send();
}
</script>
</body>
</html>



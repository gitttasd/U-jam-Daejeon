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
        width: 50%; /* 원하는 너비 설정 */
        padding: 20px;
        margin-left: 250px;
        margin-top: 100px;
    }
    
    .col-13 {
        margin-top: 30px;
        display: flex;
        justify-content: flex-start; /* Flexbox를 사용하여 왼쪽에 정렬 */
        gap: 20px; /* 버튼 사이의 간격 */
    }

    .btn-lg {
        flex-grow: 1; /* 버튼을 같은 크기로 확장 */
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
      <h2><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">U-Jam Daejeon</font></font></h2>
      <p class="lead"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">마이페이지</font></font></p>
 <hr class="my-4">
</div> 


<div class="form-container">
    <div class="form">
        <form action='${pageContext.request.contextPath}/user/edit.do' method='post' class="needs-validation">
            <div class="col-md-7 col-lg-8">
                <h4 class="mb-3"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">회원 가입 정보</font></font></h4>
                <div class="row g-3">
                    <div class="col-sm-6">
                        <label for="firstName" class="form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">아이디</font></font></label>
                        <input type="text" class="form-control" name='id' value="${findinfo.id}" readonly="readonly">
                        <div class="invalid-feedback"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                            이름이 필요합니다.
                        </font></font></div>
                    </div>

                    <div class="col-sm-6">
                        <label for="lastName" class="form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">비밀번호</font></font></label>
                        <input type="password" class="form-control" name='password' placeholder="" value="" required="">
                        <div class="invalid-feedback"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                            비밀번호가 필요합니다.
                        </font></font></div>
                    </div>

                    <div class="col-12">
                        <label for="username" class="form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">사용자 이름</font></font></label>
                        <div class="input-group has-validation">
                            <input type="text" class="form-control" name='username' value="${findinfo.username}" required="" readonly="readonly" >
                            <div class="invalid-feedback"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                                귀하의 사용자 이름이 필요합니다.
                            </font></font></div>
                        </div>
                    </div>

                    <div class="col-12">
                        <label for="email" class="form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">이메일 </font></font></label>
                        <input type="email" class="form-control" name='email' value="${findinfo.email}" placeholder="you@example.com">
                        <div class="invalid-feedback"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                            배송 업데이트를 받으려면 유효한 이메일 주소를 입력하세요.
                        </font></font></div>
                    </div>

                    <div class="col-12">
                        <label for="address" class="form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">주소</font></font></label>
                        <input type="text" class="form-control"  name='address' value="${findinfo.address}" required="">
                        <div class="invalid-feedback"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                            주소를 입력해주세요.
                        </font></font></div>
                    </div>

                    <div class="col-12">
                        <label for="address2" class="form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">휴대전화</font></font></label>
                        <input type="text" class="form-control" name='phone' value="${findinfo.phone}">
                        <div class="invalid-feedback"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                            번호를 입력해주세요.
                        </font></font></div>
                    </div>
                    
                     <div class="col-12">
                        <label for="address2" class="form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">성별(남:M / 여:Y)</font></font></label>
                        <input type="text" class="form-control" name='gender' value="${findinfo.gender}">
                        <div class="invalid-feedback"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                            
                        </font></font></div>
                    </div>
                    
                    <div class="col-12">
                        <label for="birthday" class="form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">생년월일</font></font></label>
                        <input type="date" class="form-control" name='birthdate' value="${findinfo.birthdate}">
                        <div class="invalid-feedback"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                        </font></font></div>
                    </div> 

                    <hr class="my-4">
			         <div class="col-13">
                    <button type="submit" class="w-100 btn btn-primary btn-lg">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-backpack2-fill" viewBox="0 0 16 16">
                            <path d="M5 13h6v-3h-1v.5a.5.5 0 0 1-1 0V10H5z"></path>
                            <path d="M6 2v.341C3.67 3.165 2 5.388 2 8v1.191l-1.17.585A1.5 1.5 0 0 0 0 11.118V13.5A1.5 1.5 0 0 0 1.5 15h1c.456.607 1.182 1 2 1h7c.818 0 1.544-.393 2-1h1a1.5 1.5 0 0 0 1.5-1.5v-2.382a1.5 1.5 0 0 0-.83-1.342L14 9.191V8a6 6 0 0 0-4-5.659V2a2 2 0 1 0-4 0m2-1a1 1 0 0 1 1 1v.083a6 6 0 0 0-2 0V2a1 1 0 0 1 1-1m0 3a4 4 0 0 1 3.96 3.43.5.5 0 1 1-.99.14 3 3 0 0 0-5.94 0 .5.5 0 1 1-.99-.14A4 4 0 0 1 8 4M4.5 9h7a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5h-7a.5.5 0 0 1-.5-.5v-4a.5.5 0 0 1 .5-.5"></path>
                        </svg>
                        <font style="vertical-align: inherit;">저장하기</font>
                    </button>
                    
                    <form action="${pageContext.request.contextPath}/user/del.do" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="${findinfo.id}">
                        <button type="submit" class="w-100 btn btn-danger btn-lg" onclick="return confirm('정말 삭제하시겠습니까?');">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-backpack2-fill" viewBox="0 0 16 16">
                                <path d="M5 13h6v-3h-1v.5a.5.5 0 0 1-1 0V10H5z"></path>
                                <path d="M6 2v.341C3.67 3.165 2 5.388 2 8v1.191l-1.17.585A1.5 1.5 0 0 0 0 11.118V13.5A1.5 1.5 0 0 0 1.5 15h1c.456.607 1.182 1 2 1h7c.818 0 1.544-.393 2-1h1a1.5 1.5 0 0 0 1.5-1.5v-2.382a1.5 1.5 0 0 0-.83-1.342L14 9.191V8a6 6 0 0 0-4-5.659V2a2 2 0 1 0-4 0m2-1a1 1 0 0 1 1 1v.083a6 6 0 0 0-2 0V2a1 1 0 0 1 1-1m0 3a4 4 0 0 1 3.96 3.43.5.5 0 1 1-.99.14 3 3 0 0 0-5.94 0 .5.5 0 1 1-.99-.14A4 4 0 0 1 8 4M4.5 9h7a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5h-7a.5.5 0 0 1-.5-.5v-4a.5.5 0 0 1 .5-.5"></path>
                            </svg>
                            <font style="vertical-align: inherit;">탈퇴하기</font>
                        </button>
                    </form>
                </div>

            </div>
        </form>
    </div>
</div>
</body>
</html>

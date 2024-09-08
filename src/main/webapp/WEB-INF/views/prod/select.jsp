<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 리스트</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/adminnav/menu.jsp"/>
		<div>
			<h1>${productInfo.prodId}<h1>
			<div>
				<label>추가로 업로드 할 파일을 드랍하세요.</label>	
					<div></div>
					<ul></ul>
			</div>
			<div>
				<form action="/admin/product/update" method="post">
					<div>
						<label>상품 ID</label> <input name="prodId" value="${productInfo.prodId}" readonly>
					</div>
					<div>
						<label>상품명</label> <input name="prodName" value="${productInfo.productName}" required>
					</div>
					<div>
						<label>상품가격</label> <input name="price" value="${ProductInfo.prodPrice}" required>
					</div>
					<div>
						<label>상품분류</label>
						<div>
							<select class="form-control" id="prodDist">
								<option value="outer">1. 농산품</option>
								<option value="top">2. 축산품</option>
								<option value="bottom">3. 수산물</option>
								<option value="bag">4. 기타 용품</option>
							</select>
							<button>입력</button>
							<input name="prodDist" value="${productInfo.prodDist}" readonly>
						</div>
					</div>
					<div>
						<label>재고</label> <input name="stock" value="${ProductInfo.prodStock}" required>
					</div>
					<div>
						<label>상품정보</label> <input name="productInfo" value="${ProductInfo.prodInfo}" required>
					</div>
					<div>
						<label>상품 등록일</label> <input value="${ProductInfo.prodRegDate}"readonly>
					</div>
					<div>
						<label>최종 수정일</label> <input value="${ProductInfo.prodUpdateDate}"  readonly>
					</div>
					<div class="btns">
						<button class="btn btn-default" id="btn_product_update">상품정보 수정</button>
						<button class="btn btn-default" id="btn_product_back">상품 정보 페이지로 돌아가기</button>
					</div>
				</form>
			</div>
		</div>
</body>
</html>

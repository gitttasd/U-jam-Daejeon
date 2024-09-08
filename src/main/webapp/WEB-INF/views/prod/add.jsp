<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공동 구매 상품 등록</title>
<!-- tiny mce 라이브러리 링크 -->
<script src="https://cdn.tiny.cloud/1/h5yrozkhm4pop1e9p7yazo88cdqxlqtpd30jx7dg4tiiblg1/tinymce/7/tinymce.min.js" referrerpolicy="origin"></script>
<!-- Dropzone.js 라이브러리 링크 -->
 <script src="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.9.3/dropzone.min.js"></script>
 <!-- Dropzone.css 라이브러리 링크 -->
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.9.3/dropzone.min.css">
</head>

<body>
<jsp:include page="/WEB-INF/views/adminnav/menu.jsp"/>
<div>
    <hr><br>
    <h2>상품 등록</h2>
    
    <form id="productForm" action="${pageContext.request.contextPath}/prod/add.do" enctype="multipart/form-data" method="post">
    
        <div>
            <label>상품명</label> 
            <input type="text" name="prodName" required>
        </div>
        <div>
            <label>상품가격</label>
            <input type="text" name="prodPrice" required>
        </div>
        <div>
            <label>상품분류</label>
            <select name="prodDist">
                <option value="outer">1. 농산품</option>
                <option value="top">2. 축산품</option>
                <option value="bottom">3. 수산물</option>
                <option value="bag">4. 기타 용품</option>
            </select>
        </div>
        <div>
            <label>수량</label>
            <div>
                <input type="text" name="prodStock" value="1" readonly>
                <button type="button" onclick="incrementQuantity()">+</button>
                <button type="button" onclick="decrementQuantity()">-</button>
            </div>
        </div>
        <div>
            <label>상품정보</label> 
            <input type="text" name="prodInfo" required>
        </div><br>
        <hr><br>
        <div>
            <label>상세페이지</label> 
            <textarea id="prodCon" name="prodCon"></textarea>
        </div>
        <!-- Dropzone 영역 -->
        <div>
            <label>썸네일 이미지 업로드</label>
            <div class="dropzone" id="thumbnailDropzone"></div>
        </div>
        <div>
            <button type="submit" class="btn">저장하기</button>
        </div>
    </form>
</div>

<!-- Dropzone 스크립트 -->
<script>
Dropzone.autoDiscover = false;

var myDropzone = new Dropzone("#thumbnailDropzone", {
    url: "${pageContext.request.contextPath}/prod/add.do",
    paramName: "file",
    maxFilesize: 2,
    acceptedFiles: ".png,.jpg,.jpeg,.gif",
    autoProcessQueue: false,
    addRemoveLinks: true,
    init: function() {
        var dz = this;

        dz.on("addedfile", function(file) {
            console.log("File added: ", file);
        });

        dz.on("removedfile", function(file) {
            console.log("File removed: ", file);
        });

        var submitButton = document.querySelector(".btn");
        submitButton.addEventListener("click", function(e) {
            e.preventDefault();
            e.stopPropagation();
            if (dz.getQueuedFiles().length > 0) {
                dz.processQueue();
            } else {
                document.getElementById("productForm").submit();
            }
        });

        dz.on("sending", function(file, xhr, formData) {
            var data = new FormData(document.getElementById("productForm"));
            for (var pair of data.entries()) {
                formData.append(pair[0], pair[1]);
            }
        });

        dz.on("success", function(file, response) {
            console.log("Upload successful: ", response);
            document.getElementById("productForm").submit();
        });

        dz.on("error", function(file, errorMessage) {
            console.log("Upload error: ", errorMessage);
        });
    }
});

</script>

<!-- TinyMCE 스크립트 -->
<script>
    var plugins = [
        "advlist", "autolink", "lists", "link", "image", "charmap", "print", "preview", "anchor",
        "searchreplace", "visualblocks", "code", "fullscreen", "insertdatetime", "media", "table",
        "paste", "code", "help", "wordcount", "save", "fontsize", "fontselect"
    ];

    var edit_toolbar = 'formatselect fontselect fontsizeselect |'
                        + ' forecolor backcolor |'
                        + ' bold italic underline strikethrough |'
                        + ' alignjustify alignleft aligncenter alignright |'
                        + ' bullist numlist |'
                        + ' table tabledelete |'
                        + ' link image';

    tinymce.init({
        fontsize_formats: "8pt 10pt 12pt 14pt 18pt 24pt 36pt",
        language: "ko_KR",
        selector: '#prodCon',
        height: 1000,
        menubar: true,
        image_title: true,
        automatic_uploads: true,
        file_picker_types: 'image',
        plugins: plugins,
        toolbar: edit_toolbar,
        content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:14px }'
    });
</script>
</body>
</html>

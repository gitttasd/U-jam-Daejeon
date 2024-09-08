<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="/WEB-INF/views/comm/menu.jsp"/>
    <meta charset="UTF-8">
    <title>게시판 상세페이지</title>
    
    <style>
             .container {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }
    
     
    th, td {
        padding: 10px;
        text-align: left;
        border: 1px solid #dee2e6;
    }
    th {
        background-color: #f1f1f1;
    }
.carousel-container {
    width: 48%; /* 캐러셀 컨테이너의 너비를 설정 */
}

.carousel-inner {
    width: 100%; /* 캐러셀 내부의 너비를 설정 */
    height: 400px; /* 고정된 높이 설정 */
}

.carousel-item img {
    width: 100%; /* 이미지의 너비를 100%로 설정 */
    height: 400px; /* 이미지의 높이를 400px로 설정 */
    object-fit: cover; /* 이미지 비율을 유지하면서 컨테이너를 채우도록 설정 */
}
.form {
    border-style: solid;
    border-color: #0d6efd;
    border-width: 2px; /* 원하는 두께로 조정 */
    padding: 20px; /* 내용과 경계 사이의 간격을 조정 */
    border-radius: 8px; /* 모서리를 둥글게 만들기 (선택 사항) */
    width: 95%;
    
     margin: 0 auto; /* 수평 중앙 정렬 */
}  
  .footer {
        text-align: right;
    }
  
   .reply{
   	  display:flex;
   	  justify-content: center;
   }   
  
  .center-content {
	margin-top: 50px;
	margin-left: 30px;
  }
  .rating-container {
    display: flex;
    flex-direction: column;
    margin-bottom: 20px;
}

.rating {
    font-size: 2rem;
    cursor: pointer;
}

.rating-display {
    display: flex;
}

.star {
    font-size: 2rem;
    color: grey;
    cursor: pointer;
}

.star.active {
    color: gold;
}

#average-rating-value {
    font-size: 2rem;
    color: gold;
}



.rating:hover .star,
.rating .star:hover ~ .star {
    color: gold;
}

#repAddBtn {
    margin-top: 10px;
    margin-bottom: 10px;

    
}

textarea {
    width: 100%;
    max-width: 100%;
    box-sizing: border-box;
 
}
    </style>



    

</head>
<body>
    <br><br><br><br>
        <div class="form">
         <h2>${bbsinfo.bbsTitle}</h2> 
            <div class="container">
                  
        <table>
            <tr>
                <th>글 번호</th>
                <td>${bbsinfo.bbsNo}</td>
            </tr>
            <tr>
                <th>아이디</th>
                <td>${bbsinfo.bbsId}</td>
            </tr>
            <tr>
                <th>작성자</th>
                <td>${bbsinfo.bbsUser}</td>
            </tr>
            <tr>
                <th>소개글</th>
                 <td style="width: 550px; height: 400px; overflow-y: auto;">
                 	<c:out value="${bbsinfo.bbsCon}" escapeXml="false"/>
                 </td>
            </tr>
        </table>
        <div id="carouselExampleIndicators" class="carousel slide carousel-container" data-bs-ride="carousel">
        <h2>${bbsinfo.bbsTitle}의 갤러리</h2>
		    <div class="carousel-indicators">
		        <c:forEach var="attach" items="${attinfo}" varStatus="status">
		            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${status.index}" class="<c:if test='${status.first}'>active</c:if>" aria-current="true" aria-label="Slide ${status.index + 1}"></button>
		        </c:forEach>
		    </div>
		    <div class="carousel-inner">
		        <c:forEach var="attach" items="${attinfo}" varStatus="status">
		            <div class="carousel-item <c:if test='${status.first}'>active</c:if>">
		                <img src="${pageContext.request.contextPath}/bbs/down.do?attNo=${attach.attNo}" class="d-block w-100" alt="...">
		            </div>
		        </c:forEach>
				    </div>
		    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
		        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		        <span class="visually-hidden">Previous</span>
		    </button>
		    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
		        <span class="carousel-control-next-icon" aria-hidden="true"></span>
		        <span class="visually-hidden">Next</span>
		    </button>
			</div>

                 </div>
        <div class="footer">
            <a href="${pageContext.request.contextPath}/bbs/list.do"><button type="button">목록으로</button></a>
            <c:if test="${bbsinfo.bbsId == loginUser.id || loginUser.admin == 'Y'}">
            <a href="${pageContext.request.contextPath}/bbs/edit.do?bbsNo=${bbsinfo.bbsNo}"><button type="button">수정하기</button></a>
            <a href="${pageContext.request.contextPath}/bbs/del.do?bbsNo=${bbsinfo.bbsNo}"><button type="button">삭제하기</button></a>
            </c:if>
        </div>
</div>
		<br><br>
		<hr>
		<h3>위치정보</h3>
		 주소: ${bbsinfo.bbsAddress}
			
		
		<!-- 지도를 표시할 div 입니다 -->
<div id="map" style="width:100%;height:550px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=605ade12a413e9377947b298edf608b4&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

var address = '${fn:escapeXml(bbsinfo.bbsAddress)}';

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch(address, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${bbsinfo.bbsTitle}</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>

<hr>


		
		<hr>
       <div class="center-content">
    <h3>리뷰 남기기</h3>
    <div class="rating-container">
        <div class="rating" data-rating="0">
            <span class="star" data-value="1">&#9733;</span>
            <span class="star" data-value="2">&#9733;</span>
            <span class="star" data-value="3">&#9733;</span>
            <span class="star" data-value="4">&#9733;</span>
            <span class="star" data-value="5">&#9733;</span>
        </div>
        <input type="hidden" id="rating-value" value="0">
    </div>
    <div class="average-rating">
        <h4>평균 평점</h4><div id="average-rating-value">&#9733; 
        <c:choose>
		    <c:when test="${avgRating == null}">
		        0.0
		    </c:when>
		    <c:otherwise>
		        ${avgRating}
		    </c:otherwise>
		</c:choose></div>       
    </div>
    <textarea id="repContent" rows="5" cols="100"></textarea><br>
    <button id="repAddBtn" type="button">저장</button>
    <div id="replyList"> <!-- 댓글 리스트 -->
        <!-- 댓글이 동적으로 추가될 자리 -->
    </div>
</div>
        <br><br><br><br><br>
       
        
        <!-- 탬플릿 -->
		   <template id="reptemp">
		    <div class="writer"></div>
		    <div class="date"></div>
		    <div class="content"></div>
		    <div class="rating-display">
		        <span class="star" data-value="1">&#9733;</span>
		        <span class="star" data-value="2">&#9733;</span>
		        <span class="star" data-value="3">&#9733;</span>
		        <span class="star" data-value="4">&#9733;</span>
		        <span class="star" data-value="5">&#9733;</span>
		    </div>
		    <button type="button" class="edit">수정</button>
		    <button type="button" class="del">삭제</button>
		    <hr>
		</template>
        
        <!-- 스크립트 시작 -->
      <script type="text/javascript">
	    var rcta = document.querySelector('#repContent');
	    var repListDiv = document.querySelector('#replyList');
	    var repTemp = document.querySelector('#reptemp');

	 // 별점 처리
	    const ratingContainer = document.querySelector('.rating');
	    const ratingValue = document.querySelector('#rating-value');
	    let currentRating = 0;

	    // mousemove 이벤트
	    ratingContainer.addEventListener('mousemove', (event) => {
	        if (event.target.classList.contains('star')) {
	            const value = event.target.getAttribute('data-value');
	            updateStars(value);
	        }
	    });

	    // mouseleave 이벤트
	    ratingContainer.addEventListener('mouseleave', () => {
	        updateStars(currentRating);
	    });

	    // click 이벤트
	    ratingContainer.addEventListener('click', (event) => {
	        if (event.target.classList.contains('star')) {
	            currentRating = event.target.getAttribute('data-value');
	            ratingValue.value = currentRating;
	            console.log("Selected rating:", currentRating); // 디버깅 로그 추가
	        }
	    });

	    // 별점 업데이트 함수
	    function updateStars(value) {
	        const stars = ratingContainer.querySelectorAll('.star');
	        stars.forEach(star => {
	            star.classList.toggle('active', star.getAttribute('data-value') <= value);
	        });
	    }

	    // 댓글 저장
	    document.querySelector('#repAddBtn').onclick = function() {
	        const rating = ratingValue.value;
	        const repContent = rcta.value;

	        console.log("Sending rating:", rating); // 디버깅 로그 추가

	        fetch('${pageContext.request.contextPath}/reply/add.do', {
	            method: 'POST',
	            headers: {'Accept': 'application/json'},
	            body: new URLSearchParams({
	                repContent: repContent,
	                repBbsNo: '${bbsinfo.bbsNo}',
	                rating: rating
	            })
	        })
	        .then(resp => {
	            if (!resp.ok) {
	                throw new Error('Network response was not ok ' + resp.statusText);
	            }
	            return resp.json();
	        })
	        .then(function(data) {
	            console.log(data);
	            if (data.count > 0) {
	                refresh();
	                alert('댓글과 별점 저장 성공');
	                rcta.value = '';
	                ratingValue.value = '0';
	                updateStars(0); // 별점 UI 초기화
	            } else {
	                alert('댓글 저장 실패');
	            }
	        })
	        .catch(function(err) {
	            console.log(err);
	            alert('네트워크 오류');
	        });
	    };

	    // 댓글 목록 갱신
	    function refresh() {
	        fetch('${pageContext.request.contextPath}/reply/list.do?repBbsNo=${bbsinfo.bbsNo}', {
	            method: 'GET',
	            headers: {'Accept': 'application/json'},
	        })
	        .then(resp => {
	            if (!resp.ok) {
	                throw new Error('Network response was not ok ' + resp.statusText);
	            }
	            return resp.json();
	        })
	        .then(function(data) {
	            console.log(data);
	            repListDiv.innerHTML = ''; // 댓글 리스트를 초기화
	            
	            for (var i = 0; i < data.length; i++) {
	                var v = data[i];
	                var rt = repTemp.content.cloneNode(true);
	                rt.querySelector('.writer').textContent = v.repWriter;
	                rt.querySelector('.date').textContent = v.repDate;
	                rt.querySelector('.content').textContent = v.repContent;

	                // 별점 표시 추가
	                const ratingDisplay = rt.querySelector('.rating-display');
	                const stars = ratingDisplay.querySelectorAll('.star');
	                stars.forEach(star => {
	                    if (parseInt(star.getAttribute('data-value')) <= v.rating) {
	                        star.classList.add('active');
	                    } else {
	                        star.classList.remove('active');
	                    }
	                });

	                if (v.repWriter == '${loginUser.username}') { 
	                    rt.querySelector('.del').setAttribute('data-no', v.repNo);
	                    rt.querySelector('.del').onclick = delReply;
	                    
	                    rt.querySelector('.edit').setAttribute('data-no', v.repNo);
	                    rt.querySelector('.edit').onclick = editReply;
	                    
	                } else {
	                    rt.querySelector('.del').remove();
	                    rt.querySelector('.edit').remove();
	                }
	                repListDiv.append(rt);
	            }
	        })
	        .catch(function(err) {
	            console.log(err);
	            alert('댓글 목록 조회 실패');
	        });
	    }

	    refresh();

	    // 댓글 삭제
	    function delReply(ev) {
	        var no = ev.target.getAttribute('data-no');
	        var ok = confirm(no + '번 댓글 삭제?');
	        if (!ok) return;

	        fetch('${pageContext.request.contextPath}/reply/del.do?repNo=' + no, {
	            method: 'GET',
	            headers: {'Accept': 'application/json'}
	        })
	        .then(resp => {
	            if (!resp.ok) {
	                throw new Error('Network response was not ok ' + resp.statusText);
	            }
	            return resp.json();
	        })
	        .then(function(data) {
	            console.log(data)
	            if (data.count > 0) {
	                refresh();
	                alert('댓글 삭제 성공');
	            } else {
	                alert('댓글 삭제 실패');
	            }
	        })
	        .catch(function(err) {
	            console.log(err);
	            alert('댓글 삭제 실패');
	        });
	    }

	    // 댓글 수정
	    function editReply(ev) {
	        var no = ev.target.getAttribute('data-no');
	        var newContent = prompt('새로운 댓글 내용을 입력하세요');
	        if (newContent == null) return;
	        
	        fetch('${pageContext.request.contextPath}/reply/edit.do?repNo=' + no + '&repContent=' + encodeURIComponent(newContent), {
	            method: 'GET',
	            headers: {'Accept': 'application/json'}
	        })
	        .then(resp => {
	            if (!resp.ok) {
	                throw new Error('Network response was not ok ' + resp.statusText);
	            }
	            return resp.json();
	        })
	        .then(function(data) {
	            console.log(data);
	            if (data.count > 0) {
	                refresh();
	                alert('댓글 수정 성공');
	            } else {
	                alert('댓글 수정 실패');
	            }
	        })
	        .catch(function(err) {
	            console.log(err);
	            alert('댓글 수정 실패');
	        });
	    }
	    </script>


       <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

</body>
</html>

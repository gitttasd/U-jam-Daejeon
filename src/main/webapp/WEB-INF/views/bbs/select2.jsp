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

    </style>
</head>
<body>
    <br><br><br><br>
    <div class="container">
        <div class="header">
            <h1>${bbsinfo.bbsTitle}</h1>
        </div>
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
                <th>첨부파일</th>
                <td>
                    <c:forEach var="attach" items="${attinfo}">
                        <a href="${pageContext.request.contextPath}/bbs/down.do?attNo=${attach.attNo}">
                            <c:out value="${attach.attName}"/>
                        </a><br>
                    </c:forEach>    
                </td>
            </tr>
            <tr>
                <th>소개글</th>
                <td><textarea rows="20" cols="80">${bbsinfo.bbsCon}</textarea></td>
            </tr>
            <tr>
                <th>작성일</th>
                <td>${bbsinfo.bbsRegdate}</td>
            </tr>
        </table>
        <div class="footer">
            <a href="${pageContext.request.contextPath}/bbs/list.do"><button type="button">목록으로</button></a>
            <a href="${pageContext.request.contextPath}/bbs/edit.do?bbsNo=${bbsinfo.bbsNo}"><button type="button">수정하기</button></a>
            <a href="${pageContext.request.contextPath}/bbs/del.do?bbsNo=${bbsinfo.bbsNo}"><button type="button">삭제하기</button></a>
        </div>
        <hr>
        <h3>댓글</h3>
        <textarea id="repContent" rows="5" cols="100"></textarea><br>
        <button id="repAddBtn" type="button">저장</button>  
        <div id="replyList"> <!-- 댓글 리스트 -->
            <!-- 댓글이 동적으로 추가될 자리 -->
        </div>
        
        <template id="reptemp">
            <div class="writer"></div>
            <div class="date"></div>
            <div class="content"></div>
            <button type="button" class="edit">수정</button>
            <button type="button" class="del">삭제</button>
            <hr>
        </template>
        
        <script type="text/javascript">
            var rcta = document.querySelector('#repContent');
            var repListDiv = document.querySelector('#replyList');
            var repTemp = document.querySelector('#reptemp');
            
            document.querySelector('#repAddBtn').onclick = function() {
                fetch('${pageContext.request.contextPath}/reply/add.do', {
                    method: 'POST', 
                    headers: {'Accept': 'application/json'},
                    body: new URLSearchParams({
                        repContent: rcta.value,
                        repBbsNo: '${bbsinfo.bbsNo}'})
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
                        alert('댓글 저장 성공');
                        rcta.value = '';
                    } else {
                        alert('댓글 저장 실패');
                    }
                })
                .catch(function(err) {
                    console.log(err);
                    alert('네트워크 오류');
                });
            };
            
            function refresh() {
            fetch('${pageContext.request.contextPath}/reply/list.do?repBbsNo=${bbsinfo.bbsNo}', {
                method: 'GET',
                headers: {'Accept': 'application/json'},
            })
            .then(resp => { //resp = httpResponse의 변수명 
            if (!resp.ok) {
                throw new Error('Network response was not ok ' + resp.statusText);
            }
            return resp.json();
            }).then(function(data) {
                console.log(data);
                repListDiv.innerHTML = ''; // 댓글 리스트를 초기화
                
                for (var i = 0; i < data.length; i++) {
                    var v = data[i];
                    var rt = repTemp.content.cloneNode(true);
                    rt.querySelector('.writer').textContent = v.repWriter;
                    rt.querySelector('.date').textContent = v.repDate;
                    rt.querySelector('.content').textContent = v.repContent;
                    if(v.repWriter == '${loginUser.username}'){ 
                    	rt.querySelector('.del').setAttribute('data-no', v.repNo);
                        rt.querySelector('.del').onclick = delReply;
                        
                        rt.querySelector('.edit').setAttribute('data-no', v.repNo);
                        rt.querySelector('.edit').onclick = editReply;
                        
                    }else{
                    	rt.querySelector('.del').remove();
                    	rt.querySelector('.edit').remove();
                    }
                    repListDiv.append(rt);
                }
            }).catch(function(err) {
                console.log(err);
                alert('댓글 목록 조회 실패');
            	});
        	}
            refresh(); 
            
            function delReply(ev){
            	var no = ev.target.getAttribute('data-no'); // 클릭한 버튼의 data-no 속성값 읽기
            	var ok = confirm(no+'번 댓글 삭제?');
            	if(!ok) return;//불럿던 곳으로 다시
            	
            	fetch('${pageContext.request.contextPath}/reply/del.do?repNo='+no,{
            		method: 'GET',
            		headers: {'Accept':'application/json' }
            	}).then(resp=>{
            		if(!resp.ok){
            			throw new Error('Network response was not ok '+resp.statusText);
            			}
            			return resp.json();
            		}).then(function(data){
            			console.log(data)
            			if(data.count>0){
            				refresh();
            				alert('댓글삭제성공');
            			}else{
            				alert('댓글삭제실패');
            			}
            		})
            		.catch(function(err) {
            			console.log(err); // 발생한 오류 정보를 인자로 전달
            	        alert('댓글삭제실패');
            		});
            	
            };
            
            function editReply(ev){
            	var no = ev.target.getAttribute('data-no');
            	var newContent = prompt('새로운 댓글 내용을 입력하세요');
            	if(newContent ==null) 
            		return;
            	
            	fetch('${pageContext.request.contextPath}/reply/edit.do?repNo=' + no + '&repContent=' + encodeURIComponent(newContent), {
            		method:'GET',
            		headers: {'Accept':'application/json' } 
            	})
            	.then(resp=>{
            		if(!resp.ok){
            			throw new Error('Network response was not ok '+resp.statusText);	
            		}
            		return resp.json();
            	})
            	.then(function(data){
            		console.log(data);
            		if(data.count>0){
            			refresh();
            			alert('댓글 수정 성공');
            		} else{
            			alert('댓글 수정 실패');
            		}
            	})
            	.catch(function(err){
            		console.log(err);
            		alter('댓글 수정 실패')
            	});
            	
            }
            
            refresh();
        
	
            
        </script>
    </div>
</body>
</html>

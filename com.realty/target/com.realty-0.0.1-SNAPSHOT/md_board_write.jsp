<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천분양 정보 게시판</title>
<link rel="stylesheet" type="text/css" href="./css/index.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/md_board_view.css?v=6">
<script src="./ckeditor/ckeditor.js"></script>
<style>
.box {
   width: 800px;
   height: 300px;
   border: 1px solid black;
   overflow: auto;
}

</style>
</head>
<body>
<%@include file="./layout/top.jsp" %>
<%@include file="./layout/session_no.jsp" %>
<main>
        <form id=frm method="post" action="${pageContext.request.contextPath}/board" enctype="multipart/form-data"> 
    <section class="sub">
        <p>추천분양 정보 게시판</p>
        <div class="boards">이번주 신규 매물정보를 한눈에 확인하실 수 있습니다.</div>
        <div class="info_board">
          <ul>
            <li>제&nbsp;&nbsp;&nbsp;목</li>
            <li><input type="text" class="board_in2" name="b_title"></li>
            <li>글쓴이</li>
            <li><input type="text" class="board_in1" name="b_writer" value="관리자" readonly></li>
            <li>썸네일 이미지</li>
            <li><input type="file" name="b_image_url" ></li>
            <li class="litext">내&nbsp;&nbsp;&nbsp;용</li>
            <li class="litext">
                <textarea id="board_text" name="b_content">
                    
                </textarea>
            </li>
          </ul>
        </div>
        <div class="board_btn">
            <input type="button" value="등&nbsp;&nbsp;&nbsp;록" onclick = "addBoard()" class="btns">
        </div>
    </section>
    <script>
    window.onload = function(){
       CKEDITOR.replace('board_text',{
            height : 360
        });
    };
    </script>
          </form>
</main>
<%@include file="./layout/copyright.jsp" %>
</body>
<script>
	function addBoard(){
		frm.submit();
	}
</script>
</html>
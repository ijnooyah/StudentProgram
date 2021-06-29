<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/header.jsp" %>
<title>글 목록</title>
<script>
$(document).ready(function() {
	$(".btnModify").click(function() {
		var sno = $(this).attr("data-sno");
		var sendData = {
				"sno" : sno
		}
		var url = "/student/modifyForm"
		$.ajax({
			"url" : url,
			"headers" : {
				"Content-Type" : "application/json"
			},
			"method" : "post",
			"dataType" : "json",
			"data" : JSON.stringify(sendData),// JSON.stringify() : json데이터를 문자열로 변환
			"success" : function(studentVo) {
				$("#sno").val(studentVo.sno);
				$("#sname").val(studentVo.sname);
				$("#syear").val(studentVo.syear);
				var gender = studentVo.gender
				if(gender == "M") {
					$("#rdoMale").attr("checked", true);
				} else {
					$("#rdoFemale").attr("checked", true);
				}
				$("#major").val(studentVo.major);
				$("#score").val(studentVo.score);

			},
			"error" : function() {
				console.log("에러")
			}
			
			
		});
	});
});
</script>
</head>
<body>
<!-- <form id="frmPaging" method="get"> -->
<!-- 	<input type="hidden" id="page" name="page"/> -->
<!-- </form> -->
	<div class="container-fluid">
	<!-- 네비게이션바 -->
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand mb-0 h1" href="/student/listAll"><b>학생 정보 관리 사이트</b></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbar">
				<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
					<li class="nav-item active">
						<a class="nav-link" href="/student/listAll">메인<span class="sr-only">(current)</span></a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/student/registForm">등록</a>
					</li>
				</ul>
			</div>
		</nav>
		<!-- //네비게이션바 -->
		<section class="container" style="margin-top:40px">
			<!-- table -->
			<table class="table table-hover table-sm">
				<thead>
					<tr>
						<th>학번</th>
						<th>이름</th>
						<th>학년</th>
						<th>성별</th>
						<th>전공</th>
						<th>점수</th>
						<th>수정/삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${list }">
							<tr>
								<td>${vo.sno}</td>
								<td>${vo.sname}</td>
								<td>${vo.syear}</td>
								<td>
									${vo.gender == 'M' ? '남' : '여' }
								</td>
								<td>${vo.major}</td>
								<td>${vo.score}</td>
								<td>
								<a class="btn btn-warning btn-sm btnModify" href="#modifyModal" data-toggle="modal" data-sno="${vo.sno}">수정</a>
								<a class="btn btn-danger btn-sm" onclick="return confirm('정말 삭제하시겠습니까?')" href="/student/deleteRun/sno/${vo.sno}">삭제</a>
								</td>
							</tr>
						</c:forEach>
				</tbody>
			</table>
			<!-- //table -->
		</section>
	</div>
	
	<!-- 모달  -->
	<div class="modal fade" id="modifyModal" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="myModalLabel">학생 정보 수정</h5>
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<form role="form" action="/student/modifyRun" method="post">
						<div class="form-group">
							<label for="sno"> 학번 </label>
						    <input type="text" class="form-control input" id="sno" name="sno" readonly />
						</div>
						<div class="form-group">
							<label for="sname"> 이름 </label>
							<br><span id="spanSname" style="color:red;"></span>
							 <input type="text" class="form-control input" id="sname" name="sname" required />
						</div>
						<div class="form-row">
						<div class="form-group col-sm-4">
							<label for="syear"> 학년 </label>
							 <select class="form-control" name="syear" id="syear">
								  <option value="1" id="1" selected>1</option>
								  <option value="2" id="2">2</option>
								  <option value="3" id="3">3</option>
								  <option value="4" id="4">4</option>
							</select>
						</div>
						</div>
						<div class="form-group">
							<label for="gender"> 성별 </label>
							<br>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="gender" id="rdoMale" value="M" checked> 
								<label class="form-check-label" for="rdoMale"> 남 </label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="gender" id="rdoFemale" value="F"> 
								<label class="form-check-label" for="rdoFemale"> 여 </label>
							</div>
						</div>
						<div class="form-group">
							<label for="major"> 전공 </label>
							<br><span id="spanMajor" style="color:red;"></span>
							<input type="text" class="form-control input" id="major" name="major" />
						</div>
						<div class="form-group">
							<label for="score"> 점수 </label>
							<br><span id="spanScore" style="color:red;"></span>
							<input type="number" min="0" max="100"  class="form-control input" id="score" name="score" />
						</div>
				
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary">수정완료</button>
							<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- //모달  -->
</body>
</html>
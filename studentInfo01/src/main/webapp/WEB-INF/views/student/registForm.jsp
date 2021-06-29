<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/header.jsp" %>
<title>학생 등록</title>
<script>
</script>
</head>
<body>
	<div class="container-fluid">
	<!-- 네비게이션바 -->
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="/student/listAll"><b>학생 정보 관리 사이트</b></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbar">
				<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
					<li class="nav-item">
						<a class="nav-link" href="/student/listAll">메인</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="/student/registForm">등록<span class="sr-only">(current)</span></a>
					</li>
				</ul>
			</div>
		</nav>
		<!-- //네비게이션바 -->
		
		
		<section class="container mt-3" style="max-width:1000px;">
			<div class="jumbotron">
				<form role="form" id="frmStudent" action="/student/registRun" method="post">
					<h3 style="text-align: center;">학생 등록</h3>
					<div class="form-group">
						<label for="sno"> 학번 </label>
						<button type="button" class="btn btn-sm btn-info" id="btnCheckSno">학번체크</button>
						<span id="checkSno"></span>
						<br><span id="spanSno" style="color:red;"></span>
					    <input type="text"class="form-control input" id="sno" name="sno" required/>
					</div>
					<div class="form-group">
						<label for="sname"> 이름 </label>
						<br><span id="spanSname" style="color:red;"></span>
						 <input type="text" class="form-control input" id="sname" name="sname" required />
					</div>
					<div class="form-row">
						<div class="form-group col-sm-2">
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
						 <input type="number" min="0" max="100" class="form-control input" id="score" name="score" />
					</div>
<!-- 					<div class="text-center"> -->
						<button type="submit" class="btn btn-primary" id="btnInsert">등록하기</button>
<!-- 					</div> -->
				</form>
			</div>
		</section>
	</div>
</body>
</html>
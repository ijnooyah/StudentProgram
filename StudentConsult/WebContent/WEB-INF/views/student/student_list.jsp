<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/bootstrap_cdn.jsp"%>
<script>
	//한글 커밋 테스트
	//안녕
	$(document).ready(function() {
		var resultDelete = "${resultDelete}"
		if (resultDelete == "true") {
			alert("학생 정보 삭제 완료");
		} else if (resultDelete == "false") {
			alert("학생 정보 삭제 실패");
		}
		
		var resultInsert = "${resultInsert}"
		if (resultInsert == "true") {
			alert("학생 정보 등록 완료");
		} else if (resultInsert == "false") {
			alert("학생 정보 등록 실패");
		}
		
		var resultUpdate = "${resultUpdate}"
			if (resultUpdate == "true") {
				alert("학생 정보 수정 완료");
			} else if (resultUpdate == "false") {
				alert("학생 정보 수정 실패");
			}
		
		$(".btn-consult").click(function() {
			$("#consultTable > tbody").empty();
			var sno = $(this).attr("data-sno");
			console.log(sno);
			var url = "/ConsultList.kh"
			var sData = {"sno" : sno };
				$.getJSON(url, sData, function(rData) {
					console.log(rData);
					var tr = "";
					$.each(rData, function() {
						tr += "<tr>";
						tr += "<td>" + this.c_no + "</td>";
						tr += "<td>" + this.sno + "</td>";
						tr += "<td>" + this.c_content + "</td>";
						tr += "<td>" + this.c_date + "</td>";
						tr += "</tr>";
						$("#consultTable > tbody").append(tr);
						tr="";
					});
					$("#consultTable").show();
				});
			
			
		});
	})
</script>
<title>StudentList.jsp</title>
</head>
<body>
	<%
		session.removeAttribute("resultDelete");
		session.removeAttribute("resultInsert");
		session.removeAttribute("resultUpdate");
	%>
	<!-- <h2>학생 목록</h2> -->
	<!-- <button type="button" id="btnRegist">등록하기</button> -->
	<!-- <button type="button" id="btnModify">수정하기</button> -->
	<!-- <button type="button" id="btnDelete">삭제하기</button> -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="jumbotron">
					<h2>학생 목록</h2>
					<p>학생 등록하려면 아래버튼을 눌러주세요</p>
					<p>
						<a class="btn btn-primary btn-large" href="StudentRegistForm.kh">학생
							등록</a>
					</p>
				</div>
				<table class="table table-bordered">
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
								<td>${vo.gender}</td>
								<td>${vo.major}</td>
								<td>${vo.score}</td>
								<td>
								<button class="btn btn-info btn-consult" type="button" data-sno="${vo.sno }">상담내역</button>
								<a class="btn btn-warning" id="btnModify" href="StudentModifyForm.kh?sno=${vo.sno }">수정</a>
								<a class="btn btn-danger" id="btnDelete" href="StudentDeleteRun.kh?sno=${vo.sno }">삭제</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table class="table" id="consultTable" style="display:none">
					<thead>
						<tr>
							<th>상담번호</th>
							<th>상담학생</th>
							<th>상담내역</th>
							<th>상담일</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
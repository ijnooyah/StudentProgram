<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/bootstrap_cdn.jsp"%>
<script>
function getTextByte(str) {
	var len = 0;
	for (var i = 0; i < str.length; i++) {
		if (escape(str.charAt(i)).length == 6) { // 한글일때
			len += 3;
		} else {
			len++;
		}
	}
	return len;
}

$(document).ready(function() {
	var inputs = $(".input");
	inputs.each(function() {
		$(this).keydown(function(i) {
			$(this).prev().text("");
		})
	})
	
	
	$("#frmStudent").submit(function() {
		var sname = $("#sname").val().trim();
		var score = $("#score").val().trim();
	
		if (sname == "") {
			$("#spanSname").text("이름을 입력해주세요.");
			$("#sname").focus();
			return false;
		}
		if (!isNaN(sname)) {
			$("#spanSname").text("이름에 숫자 입력할 수 없습니다.");
			$("#sname").focus();
			return false;
		}
		if(getTextByte(sname) > 10) {
			$("#spanSname").text("최소글자수를 넘으셨습니다.");
			$("#sname").focus();
			return false;
		}
		
		if (score == "") {
			$("#spanScore").text("점수를 입력해주세요.");
			$("#score").focus();
			return false;
		}
		var iScore = parseInt(score);
		if (iScore < 0 || iScore > 100) {
			$("#spanScore").text("0~100사이의 숫자를 입력해주세요.");
			$("#score").focus();
			return false;
		}
		
		$(this).submit();
	});
	
});
</script>
<title>student_modify_form.jsp</title>
</head>
<body>
<!-- <h2>학생 정보 수정양식</h2> -->
<!-- <form action="/StudentModifyRun.kh" method="post"> -->
<!-- 	<button type="submit">수정완료</button> -->
<!-- </form> -->
<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="jumbotron">
					<h2>학생 수정 하기</h2>
					<p>수정사항을 입력해주세요</p>
				</div>
				<form role="form" id="frmStudent" action="/StudentModifyRun.kh" method="post">
					<div class="form-group">
						<label for="sno"> 학번 </label>
						<br><span id="spanSno" style="color:red;"></span>
					    <input type="number"
							class="form-control input" id="sno" name="sno" value="${studentVo.sno }" readonly/>
					</div>
					<div class="form-group">
						<label for="sname"> 이름 </label>
						<br><span id="spanSname" style="color:red;"></span>
						 <input type="text"
							class="form-control input" id="sname" name="sname" value="${studentVo.sname }" />
					</div>
					<div class="form-group">
						<label for="syear"> 학년 </label>
						<br><span id="spanSyear" style="color:red;"></span>
						 <select class="form-control" name="syear" id="syear">
						 <c:forEach var="v" begin="1" end="4">
							 <option value="${v }" id="${v }" 
							 <c:if test="${v == studentVo.syear }">
							   selected
							 </c:if>
							 >${v }</option>
						 </c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label for="gender"> 성별 </label>
						<span id="spanGender" style="color:red;"></span>
						<br>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="gender"
								id="rdoMale" value="남" 
								<c:choose>
									<c:when test="${studentVo.gender == '남' }">
										checked
									</c:when>
								</c:choose>
								> <label
								class="form-check-label" for="rdoMale"> 남 </label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="gender"
								id="rdoFemale" value="여"
								<c:choose>
									<c:when test="${studentVo.gender == '여' }">
										checked
									</c:when>
								</c:choose>
								> <label
								class="form-check-label" for="rdoFemale"> 여 </label>
						</div>
					</div>
					<div class="form-group">
						<label for="major"> 전공 </label>
						<br><span id="spanMajor" style="color:red;"></span>
						 <select class="form-control" name="major" id="major">
							  <option value="컴공" id="com" 
							  	<c:choose>
									<c:when test="${studentVo.major == '컴공' }">
										selected
									</c:when>
								</c:choose>
							  >컴공</option>
							  <option value="물리" id="phy"
							  	<c:choose>
									<c:when test="${studentVo.major == '물리' }">
										selected
									</c:when>
								</c:choose>
							  >물리</option>
							  <option value="화학" id="che"
							  	<c:choose>
									<c:when test="${studentVo.major == '화학' }">
										selected
									</c:when>
								</c:choose>
							  >화학</option>
							  <option value="생물" id="ls"
							  	<c:choose>
									<c:when test="${studentVo.major == '생물' }">
										selected
									</c:when>
								</c:choose>
							  >생물</option>
						</select>
					</div>
					<div class="form-group">
						<label for="score"> 점수 </label>
						<br><span id="spanScore" style="color:red;"></span>
						 <input type="number"
							class="form-control input" id="score" name="score" value="${studentVo.score }"/>
					</div>
					<button type="submit" class="btn btn-primary" id="btnInsert">수정하기</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
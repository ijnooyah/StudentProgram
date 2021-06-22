<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/bootstrap_cdn.jsp" %>
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
	
	var isOper = false; 
	
	$("#frmStudent").submit(function() {
		if(isOper == false) {
			$("#spanSno").text("학번 중복 확인부터 해주세요");
			$("#sno").focus();
			return false;
		} 
		
		var sno = $("#sno").val().trim();
		var sname = $("#sname").val().trim();
		var score = $("#score").val().trim();
	
		if (sno == "" ) {
			$("#spanSno").text("학번을 입력해주세요.");
			$("#sno").focus();
			return false;
		}
		var iSno = parseInt(sno);
		if(iSno<1) {
			$("#spanSno").text("1이상의 숫자를 입력해주세요.");
			$("#sno").focus();
			return false;
		}
		if(getTextByte(sno) > 8) {
			$("#spanSno").text("학번은 8자리까지만 가능합니다.");
			$("#sno").focus();
			return false;
		}
		
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
	
	$("#btnCheckSno").click(function() {
		isOper = true;
		$("#spanSno").text("");
		var sno = $("#sno").val().trim();
		if (sno == "" ) {
			$("#spanSno").text("학번을 입력해주세요.");
			$("#sno").focus();
			return false;
		}
		
		var iSno = parseInt(sno);
		if(iSno<1) {
			$("#spanSno").text("1이상의 숫자를 입력해주세요.");
			$("#sno").focus();
			return false;
		}
		
		var sno = $("#sno").val();
		var url = "/CheckDupSno.kh";
		var sendData = {
				"sno" : sno
		};
		$.get(url, sendData, function(receivedData) {
			console.log("rData", receivedData);
			var message = "등록된 학번입니다."
			$("#sno").focus();
			if (receivedData == "false") {
				message = "등록 가능한 학번입니다.";
				$("#sno").blur();
			} 
			$("#checkSno").text(message);
		});
	});

})
</script>
<title>student_regist_form.jsp</title>
</head>
<body>
<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="jumbotron">
					<h2>학생 등록 하기</h2>
					<p>학번은 수정이 불가능하니 신중하게 입력해주세요.</p>
				</div>
				<form role="form" id="frmStudent" action="/StudentRegistRun.kh" method="post">
					<div class="form-group">
						<label for="sno"> 학번 </label>
						<button type="button" class="btn btn-info" id="btnCheckSno">학번체크</button>
						<span id="checkSno"></span>
						<br><span id="spanSno" style="color:red;"></span>
					    <input type="number"
							class="form-control input" id="sno" name="sno" />
					</div>
					<div class="form-group">
						<label for="sname"> 이름 </label>
						<br><span id="spanSname" style="color:red;"></span>
						 <input type="text"
							class="form-control input" id="sname" name="sname" />
					</div>
					<div class="form-group">
						<label for="syear"> 학년 </label>
						<br><span id="spanSyear" style="color:red;"></span>
						 <select class="form-control" name="syear" id="syear">
							  <option value="1" id="1" selected>1</option>
							  <option value="2" id="2">2</option>
							  <option value="3" id="3">3</option>
							  <option value="4" id="4">4</option>
						</select>
					</div>
					<div class="form-group">
						<label for="gender"> 성별 </label>
						<br>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="gender"
								id="rdoMale" value="남" checked> <label
								class="form-check-label" for="rdoMale"> 남 </label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="gender"
								id="rdoFemale" value="여"> <label
								class="form-check-label" for="rdoFemale"> 여 </label>
						</div>
					</div>
					<div class="form-group">
						<label for="major"> 전공 </label>
						<br><span id="spanMajor" style="color:red;"></span>
						 <select class="form-control" name="major" id="major">
							  <option value="컴공" id="com" selected>컴공</option>
							  <option value="물리" id="phy">물리</option>
							  <option value="화학" id="che">화학</option>
							  <option value="생물" id="ls">생물</option>
						</select>
					</div>
					<div class="form-group">
						<label for="score"> 점수 </label>
						<br><span id="spanScore" style="color:red;"></span>
						 <input type="number"
							class="form-control input" id="score" name="score" />
					</div>
					<button type="submit" class="btn btn-primary" id="btnInsert">등록하기</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
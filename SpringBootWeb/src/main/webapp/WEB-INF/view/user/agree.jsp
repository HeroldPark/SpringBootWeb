<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<main>
	<h2 class="main title">가입동의</h2>
	
	<div class="breadcrumb" style="margin-top:-20px;">
		<h3 class="hidden">경로</h3>
		<img src="../images/user/step1.png" alt="회원가입 1단계" />
	</div>
	
	<div class="margin-top first">
	
		<div class="bg-light-gray border-gray padding" style="">
        <div class="padding font-size-13 text-strong">
            	뉴렉쳐의 <span class="text-orange">개인정보 수집 및 이용</span>에 대한 안내입니다. 불편하신 사항이 없으시도록 꼭 읽어주시기 바랍니다.
        </div>
        <div class="agree-content">
            <textarea style="width:100%;height: 300px">
[ 이용약관 제1장 - 총칙 ]


상기약관은 2014년 07월 01일부터 효력이 발생됩니다.
            </textarea>
        </div>
    </div>
		<form action="join" method="post" class="margin-top">
			<div>
				<input type="checkbox" name="agree" value="true" /> 약관에 동의합니다.
			</div>
			<div class="margin-top text-align-center">
				<input type="hidden" name="" value="" />
				<input id="submit-button" class="btn-text btn-default" style="height: 40px; width: 100px; font-size: 13px;" type="submit" value="다음" />
			</div>
		</form>
	</div>
	
</main>
<script>
	window.addEventListener("load", function() {
		
		var agreeButton = document.querySelector("form input[type='checkbox']");
		var submitButton = document.querySelector("#submit-button");
		
		submitButton.onclick = function(e){
			if(!agreeButton.checked){
				alert("약관에 동의하셔야만 합니다.");			
				e.preventDefault();		
			}
		}
		
	});
</script>
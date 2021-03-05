<%
	/**
* @ Project : 이거모약?
* @ FileName : admin_goodsint.jsp
* @ Date : 2020.08.10
* @ Author : 이 민 희(lmnhofficial@gmail.com)
* @ Description 
* 		1) 쇼핑몰에 상품을 등록하기위한 페이지
	*/
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../_inc/header.jsp"%>
<%@ include file="../_inc/adminnavi.jsp"%>

<style type="text/css">
.header-navi {
	display: none;
}

.table>tbody>tr>th {
	border-top: 1px solid #e6e6e6;
	border-bottom: 1px solid #e6e6e6;
	background: #f6f6f6;
	padding: 10px;
	width: 200px;
	text-align: center;
}

.identify{
	font-size: 20px;
	color: #f00;
}
</style>

<!-- ========== 컨텐츠 영역 시작 ========== -->

<div class="container">
	<!-- 타이틀 -->
	<div class="col-md-12">
		<h2>상품등록</h2>
		<hr />
	</div>
	<!-- 상품등록 분류 테이블 -->
	<div class="col-md-12">
		<table class="table" style="margin:0">
			<tbody>
				<tr>
					<th class="text-center" style="width: 30%">분류<span class="identify">  *</span></th>
					<td><select name="전체분류">
							<option value="vitamin">멀티비타민/미네랄</option>
							<option value="locto">유산균</option>
							<option value="omega">오메가3</option>
							<option value="protein">헬스보충식품</option>
					</select></td>
				</tr>
				<tr>
					<th class="text-center" style="width: 30%">상품코드<span class="identify">  *</span></th>
					<td><input type="text" class="form-control" id="procode" /></td>
				</tr>
				<tr>
					<th class="text-center" style="width: 30%">상품명<span class="identify">  *</span></th>
					<td><input type="text" class="form-control" id="proname" /></td>
				</tr>
				<tr>
					<th class="text-center" style="width: 30%">이미지<span class="identify">  *</span></th>
					<td><input type="file" id="proimg_file" /></td>
				</tr>
				<tr>
					<th class="text-center" style="width: 30%">판매가격<span class="identify">  *</span></th>
					<td><input type="text" class="form-control" id="proprice" /></td>
				</tr>
				<tr>
					<th class="text-center" style="width: 30%">상세설명<span class="identify">  *</span></th>
					<td><textarea style="width: 621px; height: 300px;" id="prodetail"></textarea></td>
				</tr>
				<tr>
					<th class="text-center" style="width: 30%">상품스펙<span class="identify">  *</span></th>
					<td><textarea style="width: 621px; height: 300px;" id="prospect"></textarea></td>
				</tr>
				<tr>
					<th class="text-center" style="width: 30%">배송상세<span class="identify">  *</span></th>
					<td><textarea style="width: 621px; height: 300px;" id="prodelivery"></textarea></td>
				</tr>
			</tbody>
		</table>
		<div style="float: right;">
			<button type="submit" class="btn btn-md btn-default submitbtnback">취소</button>
			<button type="submit" class="btn btn-md btn-info submitbtnok">확인</button>
		</div>
		<div style="padding:25px"> </div>
	</div>
</div>

<!-- ========== 컨텐츠 영역 끝 ========== -->

<%@ include file="../_inc/footer.jsp"%>

<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		/** 취소버튼 **/
		$(".submitbtnback").click(function(){
			window.history.back();
		});		
		
		/** 확인버튼 **/
		$(".submitbtnok").click(function(e){
			e.preventDefault();
			
			// 입력여부 검사 
			// 빈 항목이 있을 때 
			var msg = "필수 항목을 입력하세요."
			
			var procode = $("#procode").val();
			var proname = $("#proname").val();
			var proimg_file = $("#proimg_file").val();
			var proprice = $("#proprice").val();
			var prodetail = $("#prodetail").val();
			var prospect = $("#prospect").val();
			var prodelivery = $("#prodelivery").val();
			
			if(!procode){
				swal(msg, "", "error");
				$("#procode").focus();
				return false;
			}else if(!proname){
				swal(msg, "", "error");
				$("#proname").focus();
				return false;
			}else if(!proimg_file){
				swal(msg, "", "error");
				$("#proimg_file").focus();
				return false;
			}else if(!proprice){
				swal(msg, "", "error");
				$("#proprice").focus();
				return false;
			}else if(!prodetail){
				swal(msg, "", "error");
				$("#prodetail").focus();
				return false;
			}else if(!prospect){
				swal(msg, "", "error");
				$("#prospect").focus();
				return false;
			}else if(!prodelivery){
				swal(msg, "", "error");
				$("#prodelivery").focus();
				return false;
			}
			
			// 빈 항목이 없을 때
			swal('성공', '상품이 등록되었습니다.', 'success').then(function(result){
				if(result.value){
					window.location.href = "admin_goods.jsp";	
				}
			});
		});
	});
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<link rel="stylesheet" type="text/css" href="${cp }/resources/css/restaurant.css">
<style type="text/css">
  .star-rating {
  display: flex;
  flex-direction: row-reverse;
  font-size: 2.25rem;
  line-height: 2.5rem;
  justify-content: space-around;
  padding: 0 0.2em;
  text-align: center;
  width: 5em;
}
 
.star-rating input {
  display: none;
}
 
.star-rating label {
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 2.3px;
  -webkit-text-stroke-color: #2b2a29;
  cursor: pointer;
}
 
.star-rating :checked ~ label {
  -webkit-text-fill-color: gold;
}
 
.star-rating label:hover,
.star-rating label:hover ~ label {
  -webkit-text-fill-color: #fff58c;
}
</style>
<script>
ratingToPercent() {
    const score = +this.restaurant.averageScore * 20;
    return score + 1.5;
}
</script>
<script type="text/javascript">
function review() {
	let re_content = document.getElementById("re_content");
	if (re_content.value == '') {
		re_content.focus();
		alert("리뷰를 입력해 주세요.");
		return;	
	}
	document.getElementById("reviewForm").submit();
}
	function imageView(e) {
		var reader = new FileReader();
		reader.onload = function(e) {
			let re_photo = document.getElementById("re_photo");
			re_photo.src = e.target.result;
			re_photo.style.display = 'block';
		}
		reader.readAsDataURL(e.target.files[0]);
	}
</script>
<div class="menuadd_wrap">
	<div class="menuadd_title">
		<h3>리뷰작성하기</h3>
	</div>
	<form:form method="post" id="reviewForm" action="${cp }/review/write" enctype="multipart/form-data" acceptCharset="utf-8">
		<table class="menuadd_table">
			<tr style="border-top: 3px solid #49505796;">
				<td class="menuadd_td1">별점평가</td>
				<td class="menuadd_td2">
			<div class="star-rating space-x-4 mx-auto" id="re_hit">
				<input type="radio" id="5-stars" name="re_hit" value="5" v-model="ratings"/>
				<label for="5-stars" class="star pr-4">★</label>
				<input type="radio" id="4-stars" name="re_hit" value="4" v-model="ratings"/>
				<label for="4-stars" class="star">★</label>
				<input type="radio" id="3-stars" name="re_hit" value="3" v-model="ratings"/>
				<label for="3-stars" class="star">★</label>
				<input type="radio" id="2-stars" name="re_hit" value="2" v-model="ratings"/>
				<label for="2-stars" class="star">★</label>
				<input type="radio" id="1-star" name="re_hit" value="1" v-model="ratings" />
				<label for="1-star" class="star">★</label>
			</div> 
				</td>
			</tr>
			<tr style="border-bottom: 3px solid #49505796;">
				<td class="menuadd_td1">리뷰작성</td>
				<td class="menuadd_td2">
					<textarea cols="30" rows="5" style="resize: none" name="re_content" id="re_content" placeholder="솔직한 리뷰를 작성해주세요!"></textarea>
				</td>
			</tr>
			<tr>
				<td class="menuadd_td1">사진리뷰 등록</td>
				<td class="menuadd_td2">
					<input type="file" id="file1" name="file1" onchange="imageView(event)">
					<br>
					<img style="width: 200px; height: 200px; margin-top: 5px; display: none;" id="re_photo" src="">
				</td>
			</tr>
		</table>
		<input type="hidden" id="ui_id" name="ui_id" value="${requestScope.ui_id }">
		<input type="hidden" id="or_num" name="or_num" value="${or_num}" >
		<div class="menuadd_btn_div">
			<input type="submit" class="btn3" value="리뷰등록" onclick="review()">
		</div>
	</form:form>
</div>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../common/cdn.jsp"%>
<title>Insert title here</title>

<!-- bootstrap CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
	integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
	integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
	crossorigin="anonymous"></script>
<script type="text/javascript">
	$(function() {

	});//ready
</script>
</head>
<body>
<!-- 전체 페이지 묶기 -->
	<div id="wrap">
		<div class="header"><!-- header div -->
			<div class="header1">
            <a href="http://localhost/project_kmong/templates/home/index_member.jsp"><div class="logo-div"></div></a>
            
                <div style="flex-grow: 1;"></div>
                
                    <!-- ////////////////////// -->
               <div style="width: 250px;" class="buttons"> 
                    <input type="button" value="로그아웃"class="login-btn" >
                    <div style="width: 270px; margin-right: 20px;">
                        <input type="button" value="마이계약" class="my-contract-btn" style="margin-left: 10px;" >
                    </div>
                        
                    <div class="dropdown" style="width: 40px; border-radius: 50px;" >
                        <div style="height: 40px; width:40px; margin-left:0px;border-radius: 50px;">
                        
                        <img src="http://localhost/project_kmong/static/images/profile.JPG" class="profile" style="width: 40px; height: 40px; object-fit: cover; border-radius: 50px; transition: border 0.2s ease 0s;"/>
                        </div>
                        
                        <div class="dropdown-content" style="width: 150px;  line-height: 22px;">
                        
                        <span style="font-size: 11px; padding-left: 10px; ">계정 설정</span>
                       <!-- 카테고리 메뉴 DB에서 불러오기 -->
                        <a href="my_info_edit.jsp">나의 정보</a>
                        <a href="pw_edit.jsp" style="font-size: 13px;">비밀번호 변경</a>
                        <a href="withdrawing.jsp" style="font-size: 13px;">회원 탈퇴</a>
                        </div>
                    </div>
                </div>
               </div>
        </div>
		<hr>
			<!-- main div -->
			<div id="aside-div">
				<aside class="aside">
					<div>
						<strong>계정설정</strong>
					</div>
					<hr orientation="horizontal" style="height: 2px;">
					<a href="my_info_edit.jsp" class="aside-a">나의 정보</a> 
					<a href="pw_edit.jsp" class="aside-a">비밀번호 변경</a> 
					<a href="withdrawing.jsp" class="aside-a">회원탈퇴</a>
				</aside>
				<main style="margin-left: 24px;">
					<div>
						<h1 style="font-size: 18px; font-weight: bold;">회원탈퇴</h1>
						<div id="main-section1">
						<section>
							<div>크몽을 떠나는 이유를 알려주세요.</div>
							<ul>
							<li data-testid="이용하고 싶은 서비스가 없어요">
							<label class="li_label">
							<span class="css-1qtribh e1eiaq4s3">
							<input type="radio" name="reasons" class="css-r5ggoa e1eiaq4s2" value="이용하고 싶은 서비스가 없어요">
							<span color="#ffd400" class="css-pk2q56 e1eiaq4s4">
							</span>
							<span class="css-1wreaqz e1eiaq4s1">이용하고 싶은 서비스가 없어요
							</span>
							</span>
							</label>
							</li>
							<li data-testid="서비스 퀄리티가 낮아요">
							<label class="li_label">
							<span class="css-1qtribh e1eiaq4s3">
							<input type="radio" name="reasons" class="css-r5ggoa e1eiaq4s2" value="서비스 퀄리티가 낮아요">
							<span color="#ffd400" class="css-pk2q56 e1eiaq4s4">
							</span>
							<span class="css-1wreaqz e1eiaq4s1">서비스 퀄리티가 낮아요
							</span>
							</span>
							</label>
							</li>
							<li data-testid="비매너 회원을 만났어요">
							<label class="li_label">
							<span class="css-1qtribh e1eiaq4s3">
							<input type="radio" name="reasons" class="css-r5ggoa e1eiaq4s2" value="비매너 회원을 만났어요">
							<span color="#ffd400" class="css-pk2q56 e1eiaq4s4">
							</span>
							<span class="css-1wreaqz e1eiaq4s1">비매너 회원을 만났어요
							</span>
							</span>
							</label>
							</li>
							<li data-testid="잦은 오류가 발생해요">
							<label class="li_label">
							<span class="css-1qtribh e1eiaq4s3">
							<input type="radio" name="reasons" class="css-r5ggoa e1eiaq4s2" value="잦은 오류가 발생해요">
							<span color="#ffd400" class="css-pk2q56 e1eiaq4s4">
							</span>
							<span class="css-1wreaqz e1eiaq4s1">잦은 오류가 발생해요
							</span>
							</span>
							</label>
							</li>
							<li data-testid="대체할 만한 서비스를 찾았어요">
							<label class="li_label">
							<span class="css-1qtribh e1eiaq4s3">
							<input type="radio" name="reasons" class="css-r5ggoa e1eiaq4s2" value="대체할 만한 서비스를 찾았어요">
							<span color="#ffd400" class="css-pk2q56 e1eiaq4s4">
							</span>
							<span class="css-1wreaqz e1eiaq4s1">대체할 만한 서비스를 찾았어요
							</span>
							</span>
							</label>
							</li>
							<li data-testid="쿠폰 · 적립금 등 혜택이 적어요">
							<label class="li_label">
							<span class="css-1qtribh e1eiaq4s3">
							<input type="radio" name="reasons" class="css-r5ggoa e1eiaq4s2" value="쿠폰 · 적립금 등 혜택이 적어요">
							<span color="#ffd400" class="css-pk2q56 e1eiaq4s4">
							</span><span class="css-1wreaqz e1eiaq4s1">쿠폰 · 적립금 등 혜택이 적어요
							</span>
							</span>
							</label
							></li>
							<li data-testid="기타">
							<label class="li_label">
							<span class="css-1qtribh e1eiaq4s3">
							<input type="radio" name="reasons" class="css-r5ggoa e1eiaq4s2" value="기타">
							<span color="#ffd400" class="css-pk2q56 e1eiaq4s4">
							</span><span class="css-1wreaqz e1eiaq4s1">기타
							</span>
							</span>
							</label>
							</li>
							</ul>
							<section style="margin-top: 32px;">
							<div style="color: #303441;">이메일 확인</div>
							<div class="input-textDiv">
								<input type="text" placeholder="크몽에 가입하신 이메일을 적어주세요" value="" class="input-text">
							</div>
							</section>
							<ul id="agree-ui">
								<li class="agree-li">• 현재 사용중인 계정 정보는 회원 탈퇴 후 복구가 불가합니다.</li>
								<li class="agree-li">• 진행 중인 거래건이 있거나 페널티 조치 중인 경우 탈퇴 신청이 불가합니다.</li>
								<li class="agree-li">• 탈퇴 후 회원님의 정보는 전자상거래 소비자보호법에 의거한 크몽 개인정보처리방침에 따라 관리됩니다.</li>
								<li class="agree-li">• 현재 보유 중인 쿠폰 및 무상지급된 크몽 캐시와 마일리지는 모두 자동 소멸되며, 탈퇴 후 재가입하더라도 이미 소멸되었기 때문에 양도되지 않습니다.</li>
								<li class="agree-li">• 구매후기 및 답글은 탈퇴 시 자동 삭제되지 않습니다. 탈퇴 후에는 계정 정보가 삭제되어 본인 확인이 불가하므로, 탈퇴 신청 전에 게시글 삭제를 요청해 주시기 바랍니다.</li>
								<li class="agree-li">• 충전 캐시 또는 수익금이 있을 경우, 캐시 환불 및 수익금 출금을 통해 정산이 완료된 이후 탈퇴를 신청하셔야 합니다.<br>* 무상으로 지급된 크몽캐시는 탈퇴와 함께 자동 소멸됩니다.</li>
							</ul>
							<div>
							<input type="checkbox" style="width: 16px; height: 16px;">
							<span>주의사항을 모두 확인하였습니다.</span>
							<div style="margin-top: 20px; display: flex;">
								<div style="flex-grow:1;"></div>
								<button role="button"  data-testid="leave-button" class="submit-btn" data-bs-toggle="modal" data-bs-target="#withdrawalChk" style="background-color: #E4E5ED; border-color: #E4E5ED">
								<span>회원 탈퇴</span>
								</button>
							</div>
							
							<!-- Modal -->
						<div class="modal fade" id="withdrawalChk" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body" style="text-align: center;">
						       탈퇴가 성공적으로 완료되었습니다.
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="width: 100%">확인</button>
						      </div>
						    </div>
						  </div>
						</div>
						
							</div>
							</section>
						</div>
					</div>
				</main>
			</div>
		</div>
<%@include file="../common/footer.jsp"%>
</body>
</html>

<%@page import="java.util.List"%>
<%@page import="com.kmong.dao.home.MainPageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">

</style>
<script type="text/javascript">
<%
if((String)session.getAttribute("loginTry")!=null){
	%>alert("로그인에 실패하였습니다.\n아이디 또는 비밀번호를 확인해주세요.")<%
	session.removeAttribute("loginTry");
}
if(((String)session.getAttribute("logoutDone"))!=null){
	%>alert("로그아웃 하셨습니다.")<%
	session.removeAttribute("logoutDone");
}
if(((String)session.getAttribute("logoutSession"))!=null){
	%>alert("잘못된 경로입니다.")<%
	session.removeAttribute("logoutSession");
}


//if(((String)session.getAttribute("login"))!=null){
	//
//	session.removeAttribute("login");
	//session.invalidate();
//}

%>
$(function(){
	
	$(".login-button").click(function(){
		handleSubmit();
		
	});//click
	
});//ready



function handlePassEnter(evt){
	
	var code = evt.which;

    if(code == 13){
    	handleSubmit();
    }//end if 
}//handelPassEnter



function handleSubmit(){
	if($("#email").val()==""){
		alert("이메일을 입력해주세요.");
		$("#email").focus();
		return;
	}else if($("#pass").val()==""){
		alert("비밀번호를 입력해주세요.");
		$("#pass").focus();
		return;
	}else{
		$("#loginFrm").submit();
	}
}//handleSubmit


</script>
<script type="text/javascript">
 <%
 
 if((String)session.getAttribute("join")!=null){ //회원가입 과정을 거치고 정상적으로 완료됐을 시 세션 삭제
	 session.removeAttribute("join");
} 
 if((String)session.getAttribute("setPass")!=null){
	 %>alert("비밀번호가 성공적으로 변경되었습니다.");<%
	 session.removeAttribute("setPass");
} 
%>
	
	
$(function(){
	$(".login-btn").click(function(){
	$("#modal").css("display","flex")
})

$("#closeBtn").click(function(){
	$("#modal").css("display","none")
})
$("#bg").click(function(){
	$("#modal").css("display","none")
})
});//

</script>


    <div class="header">
        <div class="header1">
            <a href="http://localhost/project_kmong/templates/home/index.jsp"><div class="logo-div"></div></a>
            <div style="flex-grow: 1;"></div>
            <form>
                <div class="search-div">
                    <div class="search-bar-div">
                            <input class="search-input" type="text" placeholder="서비스, 전문가를 검색해보세요" maxlength="15" id="searchBar" onclick="longer()"; onblur="shorter()"/>
                            
                            <div class="search-button">
                                <a href="#void"><img src="http://localhost/project_kmong/static/images/search.png" style="width:20px; padding-bottom:2px; object-fit: cover;" /></a>
                            </div> 
                    </div>
                </div>
            </form>
            
            <div style="width: 260px;" class="buttons"> 
            	<!-- -------로그인 팝업-------- -->
                <input type="button" value="로그인" class="login-btn"/><!-- id="openBtn" -->
                
                <div id="modal">
					  <div id="bg"></div>
						  <div class="modal-box">
									    
								<div>
								    <div class="login-popup">
								        <div>
								        	<img src="http://localhost/project_kmong/static/images/loginImg.PNG" style="border:0px; height: 556px; object-fit:cover;"/>
								        </div>
								
								        <div style="display: flex; flex-direction: column; justify-content: flex-start; background-color: #ffffff; ">
								            
								            <div class="small-close">
								            <input type="button" value="x" class="little-x" id="closeBtn" style="cursor: pointer;"/> 
								            </div>
								            
								            
								            <div class="login-box">
								                <h2 style="margin-bottom: 24px; font-weight: 500;">로그인</h2>
								                <form action="http://localhost/project_kmong/templates/home/login_action.jsp" method="get" id="loginFrm">
								                    <input class="input" type="text" placeholder="이메일을 입력해주세요." name="email" id="email" value="asdf@test.com"/>
								                    <input class="input" type="password" placeholder="비밀번호를 입력해주세요." name="pass" id="pass" value="asdf!!1234"
								                    onkeyup="handlePassEnter(event);"/>
								                    
								                    
								                    <input class="login-button" type="button" value="로그인"  
								                    onmouseover="$('.login-button').css('background-color','rgb(240, 192, 79)')" 
								                    onmouseout="$('.login-button').css('background-color','#f3d75b')" />
								                </form>
								                <div style="font-weight: bold; font-size: 13px; text-align: right;">
								                <a href="http://localhost/project_kmong/templates/account/finding_info.jsp">
								                    아이디·비밀번호 찾기
								                </a>
								                <div>
								                    <input class="regis-button" type="button" value="회원가입" style="font-size: 16px;"
								                    onclick="location.href='http://localhost/project_kmong/templates/account/register_select.jsp'" />
								                </div>
								            </div>
								            </div>
								        </div>
								    </div>
								    
								</div>
						  </div>
					</div>
					                
                
                
                
                
                
                <!-- 메인 회원가입 버튼 -->
                <input type="button" value="무료 회원가입" class="register-btn" onclick="location.href='http://localhost/project_kmong/templates/account/register_select.jsp'"/>
            </div>
        </div>
        <div class="header2">
            <div class="category">
                <div class="dropdown" >
                    <div style="height: 100%; width: 200px; margin-left: 10px;">
                        <img class="categories1" src="http://localhost/project_kmong/static/images/hamburger-menu.png" style="margin-bottom: 3px; width: 25px; height: 28px; object-fit: cover;"/>
                        <input class="categories2" type="button" value="전체 카테고리"/>
                        <img class="categories" src="http://localhost/project_kmong/static/images/drop_down.PNG" style="margin-bottom: 3px; width: 12px; height: 5px; object-fit: cover;"/>
                        </div>
                    
                    <div class="dropdown-content">
                    <div id="menuUnderline" style="width: 180px; height: 5px; background-color: #f0c04f; display: none;"></div>
                    <span style="font-size: 8px; padding-left: 10px; padding-top: 10px;">비즈니스</span>
                   <!-- 카테고리 메뉴 DB에서 불러오기 -->
                   
                   <% 
                   MainPageDAO mpDAO=MainPageDAO.getInstance();
                   List<String> list= mpDAO.selectAllCategoryName();
                   
                   if(list!=null){
                	   
	                   for(int i=0; i<list.size(); i++){
	                	   %><a href="#void" style="font-size: 16px; color:#5D5D5D;">
	                	<%= list.get(i)%></a>
	                	<%
	                   }
                   }else{//select에서 문제생겼을 시 처리 (수정하기)
                  
	                  for(int i=0; i<5; i++){
		              %>
                		<a href="#void" style="font-size: 16px; color:#5D5D5D;">메뉴를 불러올 수 없습니다.</a>
	                   <%
	                   }
                   }
	                   %>
                   
                    </div>

                </div>
            </div>
        </div>
    </div>

<%@page import="java.util.ArrayList"%>
<%@page import="com.kmong.vo.CategoryVO"%>
<%@page import="java.util.List"%>
<%@page import="com.kmong.dao.home.MainPageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
 <%

if(session.getAttribute("login")==null){
	session.setAttribute("logoutSession", "logout");
	response.sendRedirect("http://localhost/project_kmong/templates/home/index.jsp");
}
if(session.getAttribute("loginMsg")!=null){
	%>alert("로그인이 성공적으로 완료되었습니다.")<%
	session.removeAttribute("loginMsg");
}

%> 

$(function(){
	$("#logoutBtn").click(function(){
		location.replace("http://localhost/project_kmong/templates/home/logout_action.jsp");
	})
	
	$("#searchbtn").click(function(){
		$("#frm").submit();
		
	})
});//ready

</script>
<div class="header">
        <div class="header1">
            <a href="http://localhost/project_kmong/templates/home/index_member.jsp"><div class="logo-div"></div></a>
            
                <div style="flex-grow: 1;"></div>
                
                    <form action="http://localhost/project_kmong/templates/service/search_result.jsp" method="get" id="frm" name="frm">
                        <div class="search-div">
                            <div class="search-bar-div">
                                    <input name="search_input1" class="search-input" type="text" placeholder="서비스, 전문가를 검색해보세요" maxlength="15" id="searchBar" onclick="longer()"; onblur="shorter()"/>
                                    
                                    <div class="search-button">
                                        <img  src="http://localhost/project_kmong/static/images/search.png"  id="searchbtn" style="width:20px; padding-bottom:2px;  object-fit: cover; cursor: pointer;" />
                                    </div>    
                            </div>
                        </div>
                    </form>
                    <!-- ////////////////////// -->
               <div style="width: 250px;" class="buttons"> 
                    <input type="button" value="로그아웃" class="login-btn" id="logoutBtn">
                    <div style="width: 270px; margin-right: 20px;">
                        <input type="button" value="마이계약" class="my-contract-btn" style="margin-left: 10px;" onclick="location.href='http://localhost/project_kmong/templates/order_expert/management.jsp'">
                    </div>
                        

                    
                   
                    <div class="dropdown" style="width: 40px; border-radius: 50px;" >
                        <div style="height: 40px; width:40px; margin-left:0px;border-radius: 50px;">
                        
                        <%
                        MainPageDAO mpDAO=MainPageDAO.getInstance();
                        if(session.getAttribute("login")!=null){
                        	String userImg=mpDAO.selectUserImg((int)session.getAttribute("login"));
                        
	                        //pageContext.setAttribute("userImg", userImg);
	                        if(userImg!=null){
	                        	%><img src="http://localhost/project_kmong/static/images/${userImg }" class="profile" style="width: 40px; height: 40px; object-fit: cover; border-radius: 50px; transition: border 0.2s ease 0s;"/><%
	                        }else{
	                        	%><img src="http://localhost/project_kmong/static/images/default_profile.png" class="profile" style="width: 40px; height: 40px; object-fit: cover; border-radius: 50px; transition: border 0.2s ease 0s;"/><% 
	                        }
                        }
                        %>
                        <%-- <c:choose>
                        
                        <c:when test="${empty userImg}">
                        <img src="http://localhost/project_kmong/static/images/${userImg }" class="profile" style="width: 40px; height: 40px; object-fit: cover; border-radius: 50px; transition: border 0.2s ease 0s;"/>
                        </c:when>
                        
                        <c:other>
                        <img src="http://localhost/project_kmong/static/images/logo.JPG" class="profile" style="width: 40px; height: 40px; object-fit: cover; border-radius: 50px; transition: border 0.2s ease 0s;"/>
                        </c:other>
                        </c:choose> --%>
                        
                        </div>
                        
                        <div class="dropdown-content" style="width: 150px;  line-height: 22px; z-index: 100;">
                        
                        <span style="font-size: 11px; padding-left: 10px; ">계정 설정</span>
                       <!-- 카테고리 메뉴 DB에서 불러오기 -->
                        <a href="http://localhost/project_kmong/templates/mypage/my_info_edit.jsp"  style="font-size: 13px;">나의 정보</a>
                        <a href="http://localhost/project_kmong/templates/mypage/pw_edit.jsp" style="font-size: 13px;">비밀번호 변경</a>
                        <a href="http://localhost/project_kmong/templates/mypage/withdrawing.jsp" style="font-size: 13px;">회원 탈퇴</a>
                        </div>
                    </div>
                   

                </div>
        </div>

        <!--/////////////////////  전체 카테고리  ///////////////////////////  -->
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
                   List<CategoryVO> cVO=new ArrayList<CategoryVO>();
                   cVO=mpDAO.selectAllCategory();
                   
                   if(cVO!=null){
	                   for(int i=0; i<cVO.size(); i++){
	                	   %><a href="http://localhost/project_kmong/templates/service/list.jsp?categoryId=<%=cVO.get(i).getCategoryId() %>" style="font-size: 16px; color:#5D5D5D;">
	                	<%=cVO.get(i).getCategoryName()%></a>
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

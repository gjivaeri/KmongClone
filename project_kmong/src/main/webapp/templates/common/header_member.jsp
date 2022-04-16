<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="header">
        <div class="header1">
            <a href="main2_.jsp"><div class="logo-div"></div></a>
            
                <div style="flex-grow: 1;"></div>
                
                    <form>
                        <div class="search-div">
                            <div class="search-bar-div">
                                    <input class="search-input" type="text" placeholder="서비스, 전문가를 검색해보세요" maxlength="15" id="searchBar" onclick="longer()"; onblur="shorter()"/>
                                    
                                    <div class="search-button">
                                        <a href="#void"><img src="http://localhost/project_kmong/static/images/search.png" style="width:20px; padding-bottom:2px;  object-fit: cover;" /></a>
                                    </div> 
                            </div>
                        </div>
                    </form>
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
                        
                        <div class="dropdown-content" style="width: 150px;  line-height: 22px; z-index: 100;">
                        
                        <span style="font-size: 11px; padding-left: 10px; ">계정 설정</span>
                       <!-- 카테고리 메뉴 DB에서 불러오기 -->
                        <a href="#void"  style="font-size: 13px;">나의 정보</a>
                        <a href="#void" style="font-size: 13px;">비밀번호 변경</a>
                        <a href="#void" style="font-size: 13px;">회원 탈퇴</a>
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
                    <a href="#void">IT/Programming</a>
                    <a href="#void">영상/사진</a>
                    <a href="#void">마케팅</a>
                    <a href="#void">디자인</a>
                    <a href="#void">번역 통역</a>
                    </div>

                </div>
            </div>
        </div>

</div>
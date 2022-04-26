<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="com.kmong.dao.register.MakeAccountDAO"%>
<%@page import="com.kmong.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../common/cdn.jsp"%>
<style type="text/css">

#login-btn-after-register{
	color: rgb(74, 74, 74); 
	margin-top: 40px; 
	font-size: 18px;
}

body{
		padding-top:0px; 
		}
</style>


<script type="text/javascript">
$(function(){
   
   $("#login-btn-after-register").click(function(){
      $("#frm").submit();
   });//click
   
})
</script>

</head>

<body>
<%-- <%
        String ip=request.getRemoteAddr();
		String email=request.getParameter("email");
		String password=request.getParameter("pass2");
		String name=request.getParameter("name");
		String nick=request.getParameter("nick");
		String tel=request.getParameter("tel");
		int categoryID=Integer.parseInt(request.getParameter("business"));
		
		String[] interests=request.getParameterValues("interests");
		String[] agreementArr=request.getParameterValues("clause");
		String agreement="";
		
		String expert=(String)session.getAttribute("flag");
		
		if(expert.equals("expert")){
			expert="Y";
		}else{
			expert="N";
		}
		
		/* System.out.println(ip);
		System.out.println(email);
		System.out.println(password);
		System.out.println(name);
		System.out.println(nick);
		System.out.println(tel);
		System.out.println("비즈니스"+categoryID);
		for(String i:interests){
			System.out.println(i);
		} */
		
		
		for(String i:agreementArr){
			if(i.equals("선택1")){
				agreement="Y";
			}else{
				agreement="N";
			}
		}
		
		
        MakeAccountDAO madDAO=MakeAccountDAO.getInstance();
		
        MemberVO mVO
        =new MemberVO(madDAO.selectMemberSeq(),categoryID,email,password,name,nick,tel,"","","",ip,expert,"",agreement,interests);
        
        mVO.setPassword(DataEncrypt.messageDigest("MD5", mVO.getPassword()));
      
        madDAO.insertMemberInfo(mVO);
        madDAO.insertInterests(mVO, interests);
        
        
        %> --%>
    <div class="register-step1">
        <div style="text-align: center;">
            <a href="http://localhost/project_kmong/templates/home/index.jsp">
                <div class="logo-div" style="margin-bottom: 30px;"></div>
            </a>
        </div>

        <div class="regis-result-box">
            <div class="which-service" style="text-align: center;">
                <h1>회원가입이 완료되었습니다.</h1>
                
                <div>

				<form id="frm" action="http://localhost/project_kmong/templates/home/index.jsp">
                    <input   class="login-button" id="login-btn-after-register" type="button" value="로그인 하기" 
                    
                   			onmouseover="$('#login-btn-after-register').css('background-color','rgb(240, 192, 79)')" 
							onmouseout="$('#login-btn-after-register').css('background-color','#f3d75b')" />
					<input type="hidden" name="hid" value="login"/>
				</form>
                </div>
            </div>
        </div>

    </div>
</body>
</html>
<%@page import="com.kmong.vo.CategoryVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@include file="../../common/cdn.jsp"%>
<title>kmong</title>

<style type="text/css">
html {
    line-height: normal;
    -webkit-text-size-adjust: 100%;
}
.css-vxuddk {
    padding: 24px;
}
.css-qq33h6 {
    margin-top: 24px;
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    -webkit-justify-content: center;
    justify-content: center;
    -webkit-align-items: center;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    -webkit-flex-direction: column;
    -ms-flex-direction: column;
    flex-direction: column;
}
* {
    font-family: 'Metro Sans',sans-serif;
    box-sizing: border-box;
}
.css-p4ywka {
    font-size: 88px;
    color: #212224;
    font-weight: 700;
    margin: 12px 0;
}
.css-nlw5bq {
    outline: none;
    border-width: 1px;
    border-style: solid;
    box-sizing: border-box;
    border-radius: 4px;
    line-height: 1;
    font-weight: 500;
    -webkit-transition: background-color 0.3s,border-color 0.3s;
    transition: background-color 0.3s,border-color 0.3s;
    -webkit-text-decoration: none;
    text-decoration: none;
    display: -webkit-inline-box;
    display: -webkit-inline-flex;
    display: -ms-inline-flexbox;
    display: inline-flex;
    -webkit-align-items: center;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    -webkit-justify-content: center;
    justify-content: center;
    cursor: pointer;
    position: relative;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    white-space: nowrap;
    max-width: 100%;
    height: 52px;
    font-size: 16px;
    padding: 0 24px;
    min-width: 80px;
    background-color: #ffd400;
    border-color: #ffd400;
    color: #303441;
}
.css-1nvv8ic {
    font-size: 15px;
    color: #727585;
    margin: 0 0 48px 0;
}
body{    padding-top: 0px;}
</style>




<div id="__next" data-reactroot="">
  <header class="css-vxuddk eru4v6r5">
    <a href="/project_kmong/templates/home/index.jsp"
      ><svg
        width="75"
        height="100%"
        viewBox="0 0 85 26"
        xmlns="http://www.w3.org/2000/svg"
      >
        <path
          d="M77.69 4.86c3.975 0 7.197 3.215 7.197 7.18l-.002.055h.002c.073 3.477.074 5.769.003 6.874-.108 1.659-.724 3.372-1.947 4.693A7.21 7.21 0 0 1 77.593 26c-2.724 0-4.998-.984-6.653-2.921l-.05-.059 3.226-2.684c.837.997 1.938 1.48 3.478 1.48.9 0 1.67-.358 2.259-.992.515-.556.817-1.263.832-1.813v-.443a7.186 7.186 0 0 1-2.995.65c-3.975 0-7.197-3.214-7.197-7.179 0-3.964 3.222-7.178 7.197-7.178zm-32.13-.225c4.131 0 7.48 3.34 7.48 7.46 0 4.121-3.349 7.462-7.48 7.462s-7.48-3.34-7.48-7.461c0-4.12 3.349-7.461 7.48-7.461zM4.533 0v10.354L8.623 5.2h5.309l-5.337 6.726 5.572 7.065h-4.98L4.534 13.42v5.572H0V0h4.533zM29.92 4.86a6.233 6.233 0 0 1 6.233 6.234v7.897H31.96v-7.908a2.04 2.04 0 0 0-4.074-.152l-.006.152v7.908h-4.193v-7.908a2.04 2.04 0 0 0-4.075-.152l-.005.152v7.908h-4.194v-7.897a6.233 6.233 0 0 1 10.371-4.662 6.201 6.201 0 0 1 4.136-1.571zm31.847 0a6.8 6.8 0 0 1 6.8 6.8v7.331h-4.194v-7.34a2.607 2.607 0 0 0-2.441-2.602l-.165-.006a2.607 2.607 0 0 0-2.602 2.442l-.005.165v7.34l-4.193.001v-7.33a6.8 6.8 0 0 1 6.8-6.8zM45.56 8.818a3.282 3.282 0 0 0-3.287 3.279 3.282 3.282 0 0 0 3.287 3.278 3.282 3.282 0 0 0 3.287-3.278 3.282 3.282 0 0 0-3.287-3.279zm32.13.226a3 3 0 0 0-3.003 2.996 3 3 0 0 0 3.003 2.996 3 3 0 0 0 3.003-2.996 3 3 0 0 0-3.003-2.996z"
          fill="#212224"
          fill-rule="evenodd"
        ></path></svg
    ></a>
  </header>
  <div class="css-qq33h6 eru4v6r4">
    <div class="css-9z4ppi eru4v6r3">
      <img
        src="https://d2v80xjmx68n4w.cloudfront.net/assets/images/desktop/kmong-ghost@2x.png"
        alt="404, 요청하신 페이지를 찾을 수 없습니다."
        width="350"
        height="350"
      />
    </div>
    <p class="css-p4ywka eru4v6r2">500</p>
    <h1 class="css-1r3i1b6 eru4v6r1">요청하신 페이지를 찾을 수 없습니다.</h1>
    <p class="css-1nvv8ic eru4v6r0">
      페이지가 삭제되었거나 주소가 변경되었을 수 있습니다.
    </p>
    <a role="link" color="market" href="/project_kmong/templates/home/index.jsp" class="btn btn-warning css-nlw5bq eklkj754"
      ><span class="css-1oteowz eklkj753"><strong>메인페이지로 돌아가기</strong></span></a
    >
    <!-- css-nlw5bq eklkj754 -->
  </div>
  <div id="ad-block" class="css-8ynf6o eojmfk30"></div>
</div>


</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    #topmenu ul
    {
        list-style: none;
        padding: 0;
    }

    #topmenu li
    {
        width: 80px;
        text-align: center;
    }

    #topmenu a
    {
        text-decoration: none;
        color: black;
    }
</style>

<div id="topmenu">
    <ul style="display: flex; flex-direction: row-reverse;">
        <li><a href="/Logout.do">로그아웃</a></li>
        <li><a href="/MemberInfo.do">내 정보</a></li>
    </ul>
</div>
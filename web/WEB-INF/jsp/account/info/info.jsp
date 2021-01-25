<%--
  Created by IntelliJ IDEA.
  User: ZlunYan
  Date: 2021/1/25
  Time: 16:59
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="../../common/IncludeTop.jsp"%>
<input type="hidden" value="${param.need}" id="need">

<nav class="SideNav border" style="max-width: 360px">
    <a class="SideNav-item" href="">Account</a>
    <a class="SideNav-item" href="" aria-current="page">Profile</a>
    <a class="SideNav-item" href="">Address</a>
    <a class="SideNav-item" href="">Orders</a>
</nav>

<script src="static/js/account/info/info.js"></script>
<%@ include file="../../common/IncludeBottom.jsp"%>

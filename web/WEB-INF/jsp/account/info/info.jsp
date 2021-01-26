<%--
  Created by IntelliJ IDEA.
  User: ZlunYan
  Date: 2021/1/25
  Time: 16:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../../common/IncludeTop.jsp"%>
<input type="hidden" value="${param.need}" id="need">

<div class="d-inline-flex width-full">
    <div class="p-5">
        <nav class="SideNav border" style="width: 360px">
            <a class="SideNav-item">Account</a>
            <c:choose>
                <c:when test="${param.need eq 'profile'}">
                    <button class="SideNav-item" id="profile" aria-current="page">Profile</button>
                </c:when>
                <c:otherwise>
                    <button class="SideNav-item" id="profile">Profile</button>
                </c:otherwise>
            </c:choose>
            <c:choose>
                <c:when test="${param.need eq 'address'}">
                    <button class="SideNav-item" id="address" aria-current="page">Address</button>
                </c:when>
                <c:otherwise>
                    <button class="SideNav-item" id="address">Address</button>
                </c:otherwise>
            </c:choose>
            <c:choose>
                <c:when test="${param.need eq 'orders'}">
                    <button class="SideNav-item" id="orders" aria-current="page">Orders</button>
                </c:when>
                <c:otherwise>
                    <button class="SideNav-item" id="orders">Orders</button>
                </c:otherwise>
            </c:choose>
        </nav>
    </div>
    <div class="p-5 width-full" id="info_content" style="max-width: 1095px">
        <c:if test="${param.need eq 'profile'}">
            <%@ include file="profile.jsp"%>
        </c:if>
        <c:if test="${param.need eq 'address'}">
            <%@ include file="address.jsp"%>
        </c:if>
        <c:if test="${param.need eq 'orders'}">
            <%@ include file="orders.jsp"%>
        </c:if>
    </div>
</div>

<script src="static/js/account/info/info.js"></script>
<%@ include file="../../common/IncludeBottom.jsp"%>

<%--
  Created by IntelliJ IDEA.
  User: ZlunYan
  Date: 2021/1/19
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
    session.setAttribute("boxState", "hide");
%>

<%@include file="common/IncludeTop.jsp"%>

<div class="blankslate blankslate-large">
    <img src="https://ghicons.github.com/assets/images/blue/png/Pull%20request.png" alt="" class="mb-3" />
    <h3 class="mb-1">Come and find a partner to take home.</h3>
    <button class="btn btn-primary my-3" type="button" id="zlun-js-main-explore">Explore</button>
</div>

<script src="static/js/common/main.js"></script>
<%@include file="common/IncludeBottom.jsp"%>

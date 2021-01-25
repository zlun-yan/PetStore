<%--
  Created by IntelliJ IDEA.
  User: ZlunYan
  Date: 2021/1/18
  Time: 9:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="org.csu.petstore.domain.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
//    这个里面的内容日后可以放到过滤器里面
    User user = new User();
    user.setId(0);
    session.setAttribute("boxState", "hide");
    session.setAttribute("user", user);
%>

<%@ include file="WEB-INF/jsp/common/IncludeTop.jsp"%>

<link rel="stylesheet" href="static/css/ink.css">
<style type="text/css">
    .wrapper>a:link {
        text-decoration: none;
    }
    .wrapper>a:visited {
        text-decoration: none;
    }
</style>

<div class="wrapper">

        <a href="signUp">
            <div class="button _1">
                <span>sign up</span>
                <div class="back"></div>
            </div>
        </a>

        <a href="signUp">
            <div class="button _2">
                <span>sign up</span>
                <div class="back"></div>
            </div>
        </a>

        <a href="signIn">
            <div class="button _3">
                <span>sign in</span>
                <div class="back"></div>
            </div>
        </a>

        <a href="signIn">
            <div class="button _4">
                <span>sign in</span>
                <div class="back"></div>
            </div>
        </a>
    </div>


<style>
    footer {
        position: fixed  !important;
        bottom: 0;
        width: 100%
    }
</style>
<%@ include file="WEB-INF/jsp/common/IncludeBottom.jsp"%>
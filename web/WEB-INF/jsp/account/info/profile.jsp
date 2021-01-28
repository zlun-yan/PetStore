<%--
  Created by IntelliJ IDEA.
  User: ZlunYan
  Date: 2021/1/24
  Time: 20:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<input type="hidden" id="user_id" value="${sessionScope.user.id}">

<div class="position-fixed bottom-0 left-0 mb-3 ml-3" id="alert" style="z-index: 99">
</div>


<div class="box-shadow-extra-large p-3">
    <strong>Profile</strong>
</div>

<div class="my-3">
    <div class="p-responsive mt-4 mt-md-8">
        <div class="mb-4 mb-md-8 container-md text-center">
            <div class="CircleBadge CircleBadge--large mx-auto" style="max-width: 128px;">
                <img src="https://github.com/fluidicon.png" alt="Travis CI" class="CircleBadge-icon" />
            </div>
        </div>

        <div class="container-sm">
            <div class="mb-3">
                <label name="user[username]" for="user_username">Username</label>
                <input value="${sessionScope.user.username}" name="user[username]" required="required" class="form-control input width-full" style="background-color: white" type="text" id="user_username" />
            </div>

            <div class="mb-3">
                <label name="user[email]" for="user_email">Email</label>
                <input value="${sessionScope.user.email}" name="user[email]" required="required" class="form-control input width-full" style="background-color: white" type="text" id="user_email" />
            </div>

            <div class="my-3">
                <button class="btn btn-primary btn-block" id="saveButton">Save</button>
            </div>
        </div>
    </div>
</div>
<script src="static/js/account/info/profile.js"></script>
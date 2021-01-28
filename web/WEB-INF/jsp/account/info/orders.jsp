<%--
  Created by IntelliJ IDEA.
  User: ZlunYan
  Date: 2021/1/25
  Time: 21:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="box-shadow-extra-large p-3">
    <strong>Orders</strong>
</div>

<div class="my-3">
    <c:forEach items="${sessionScope.user.orderList}" var="order">
        <div class="border d-flex" style="height: 96px">
            <div class="p-3 flex-self-center">
                Avatar stack
            </div>
            <div class="p-5 flex-1">&nbsp;</div>

            <div class="p-3 flex-self-center">
                price
            </div>
            <div class="p-3 flex-self-center">
                num
            </div>
            <div class="p-3 flex-self-center">
                tot
            </div>

            <div class="p-3 flex-self-center">
                <button class="btn btn-sm btn-danger" type="button">Delete</button>
            </div>
            <div class="p-3 flex-self-center">
                <button class="btn btn-sm btn-primary" type="button">Favorite</button>
            </div>
        </div>
    </c:forEach>
</div>



<script src="static/js/account/info/orders.js"></script>
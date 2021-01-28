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
            <div class="pl-3 flex-self-center">
                <div class="AvatarStack AvatarStack--three-plus zlun-avatar-stack">
                    <div class="AvatarStack-body">
                        <c:forEach items="${order.clausesList}" var="clauses" begin="0" end="2">
                            <img class="avatar zlun-avatar-stack" src="${clauses.itemPicURL}"/>
                        </c:forEach>
                        <c:forEach items="${order.clausesList}" var="clauses" begin="3">
                            <div class="avatar avatar-more"></div>
                            <img class="avatar zlun-avatar-stack" src="${clauses.itemPicURL}"/>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="p-5 flex-1">&nbsp;</div>

            <div class="p-3 flex-self-center">
                ${order.startDate}
            </div>
            <div class="p-3 flex-self-center">
                <strong>
                    <c:choose>
                        <c:when test="${order.state eq 0}">
                            <span class="text-red">Unpaid</span>
                        </c:when>
                        <c:when test="${order.state eq 1}">
                            <span class="text-blue">In delivery</span>
                        </c:when>
                        <c:otherwise>
                            <span class="text-green">Delivered</span>
                        </c:otherwise>
                    </c:choose>
                </strong>
            </div>
            <div class="p-3 flex-self-center">
                $${order.totPrice}
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
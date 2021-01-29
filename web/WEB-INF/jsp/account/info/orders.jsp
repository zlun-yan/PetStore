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

<input type="hidden" id="zlun-js-order-empty" value="${sessionScope.user.orderList.size()}">

<div id="zlun-js-order-body">
    <c:choose>
        <c:when test="${sessionScope.user.orderList.size() eq 0}">
            <div class="blankslate">
                <img src="https://ghicons.github.com/assets/images/blue/png/Pull%20request.png" alt="" class="mb-3" />
                <h3 class="mb-1">You don’t seem to have bought any items.</h3>
                <p>Come and find a partner to take home.</p>
                <button class="btn btn-primary my-3" type="button" id="zlun-js-orders-explore">Explore</button>
            </div>
        </c:when>
        <c:otherwise>
            <div class="my-3">
                <div class="d-flex text-center" style="height: 68px">
                    <div class="p-3 flex-self-center">
                        <strong>Product information</strong>
                    </div>
                    <div class="p-5 flex-1">&nbsp;</div>

                    <div class="p-3 flex-self-center" style="width: 105px">
                        <strong>Start date</strong>
                    </div>
                    <div class="p-3 flex-self-center" style="width: 100px">
                        <strong>State</strong>
                    </div>
                    <div class="p-3 flex-self-center" style="width: 105px">
                        <strong>Total price</strong>
                    </div>
                    <div class="p-3 flex-self-center" style="width: 200px">
                        <strong>Operation</strong>
                    </div>
                </div>

                <c:forEach items="${sessionScope.user.orderList}" var="order">
                    <div class="border d-flex" style="height: 96px" id="item_${order.id}">
                        <div class="pl-3 flex-self-center">
                            <a href="orderInfo?orderId=${order.id}">
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
                            </a>
                        </div>
                        <div class="p-5 flex-1">&nbsp;</div>

                        <div class="p-3 flex-self-center" style="width: 105px">
                                ${order.startDate}
                        </div>
                        <div class="p-3 flex-self-center" style="width: 100px">
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
                        <div class="p-3 flex-self-center" style="width: 105px">
                            $${order.totPrice}
                        </div>

                        <div class="p-3 flex-self-center">
                            <button class="btn btn-sm btn-danger zlun-js-order-delete" type="button" id="delete_${order.id}">Delete</button>
                        </div>
                        <div class="p-3 flex-self-center">
                            <button class="btn btn-sm btn-primary" type="button">Favorite</button>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:otherwise>
    </c:choose>
</div>



<script src="static/js/account/info/orders.js"></script>
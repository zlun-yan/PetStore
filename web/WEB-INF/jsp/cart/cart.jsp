<%--
  Created by IntelliJ IDEA.
  User: ZlunYan
  Date: 2021/1/26
  Time: 22:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../common/IncludeTop.jsp"%>
<div class="m-3">
    <div class="box-shadow-medium p-3">
        <strong>Cart</strong>
    </div>

    <div class="my-3">
        <c:forEach items="${sessionScope.user.cartList}" var="cart">
            <div class="border d-flex" style="height: 96px">
                <div class="p-3 flex-self-center">
                    <label><input type="checkbox" />&nbsp;</label>
                </div>
                <div class="p-2" style="width: 96px">
                    <img src="${cart.item.picUrl}" class="zlun-img">
                </div>
                <div class="p-3 flex-self-center">${cart.item.name}</div>
                <div class="p-5 flex-1">&nbsp;</div>
                <div class="p-3 flex-self-center">${cart.item.price}</div>
                <div class="p-3 flex-self-center">
                    <button class="btn btn-sm" type="button">+</button>
                    <input class="form-control input-sm" type="text" value="${cart.num}" style="width: 70px"/>
                    <button class="btn btn-sm" type="button">-</button>
                </div>
                <div class="p-3 flex-self-center">
                    <button class="btn btn-sm btn-danger" type="button" id="delete_${cart.id}">Delete</button>
                </div>
                <div class="p-3 flex-self-center">
                    <button class="btn btn-sm btn-primary" type="button" id="favorite_${cart.itemId}">Favorite</button>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<div style="height: 68px">
    <div id="checkBar">
        <div class="border d-flex mx-3" style="height: 68px;background-color: #E5E5E5">
            <div class="p-3 flex-self-center">
                <label id="select_all">
                    <input type="checkbox"/>
                    <span>&nbsp;Select all</span>
                </label>
            </div>
            <div class="p-5 flex-1">&nbsp;</div>
            <div class="p-3 flex-self-center">
                <strong>
                    Subtotal(XX items):
                    <span class="text-red">$XX</span>
                </strong>
            </div>
            <div class="p-3 flex-self-center">
                <button class="btn btn-sm btn-primary" type="button">Proceed to checkout</button>
            </div>
        </div>
    </div>
</div>

<div id="visible-zlun-box"></div>
<div class="mt-3"></div>


<script src="static/js/cart/cart.js"></script>
<%@ include file="../common/IncludeBottom.jsp"%>

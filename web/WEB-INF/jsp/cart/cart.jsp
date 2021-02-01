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
<input type="hidden" id="zlun-js-cart-empty" value="${sessionScope.user.cartList.size()}">

<div id="zlun-js-cart-body">
    <c:choose>
        <c:when test="${sessionScope.user.cartList.size() eq 0}">
            <div m-3>
                <div class="my-3">
                    <div class="box-shadow-medium p-3">
                        <strong>Cart</strong>
                    </div>

                    <div class="blankslate">
                        <img src="https://ghicons.github.com/assets/images/blue/png/Pull%20request.png" alt="" class="mb-3" />
                        <h3 class="mb-1">Your cart don’t seem to have any items.</h3>
                        <p>Come and find a partner to take home.</p>
                        <button class="btn btn-primary my-3" type="button" id="zlun-js-cart-explore">Explore</button>
                    </div>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <div class="m-3">
                <div class="box-shadow-medium p-3">
                    <strong>Cart</strong>
                </div>

                <div class="my-3">
                    <div class="d-flex text-center" style="height: 68px">
                        <div class="p-3 flex-self-center" style="width: 53px">
                            &nbsp;
                        </div>
                        <div class="p-2 flex-self-center">
                            <strong>Product information</strong>
                        </div>
                        <div class="p-5 flex-1">&nbsp;</div>
                        <div class="p-3 flex-self-center" style="width: 94px">
                            <strong>Unit price</strong>
                        </div>
                        <div class="p-3 flex-self-center" style="width: 175px">
                            <strong>Quantity</strong>
                        </div>
                        <div class="p-3 flex-self-center" style="width: 98px">
                            <strong>Total price</strong>
                        </div>
                        <div class="p-3 flex-self-center" style="width: 200px">
                            <strong>Operation</strong>
                        </div>
                    </div>


                    <c:forEach items="${sessionScope.user.cartList}" var="cart">
                        <div class="border d-flex" style="height: 96px" id="item_${cart.id}">
                            <div class="p-3 flex-self-center" style="width: 53px">
                                <label style="cursor: pointer">
                                    <c:choose>
                                        <c:when test="${cart.checked}">
                                            <input type="checkbox" style="cursor: pointer" id="check_${cart.id}" checked="true"/>
                                        </c:when>
                                        <c:otherwise>
                                            <input type="checkbox" style="cursor: pointer" id="check_${cart.id}"/>
                                        </c:otherwise>
                                    </c:choose>
                                    &nbsp;</label>
                            </div>
                            <div class="p-2 flex-self-center" style="width: 96px">
                                <a href="itemInfo?itemId=${cart.item.id}">
                                    <img src="${cart.item.picUrl}" class="zlun-img">
                                </a>
                            </div>
                            <div class="p-3 flex-self-center">${cart.item.name}</div>
                            <div class="p-5 flex-1">&nbsp;</div>

                            <div class="p-3 flex-self-center" style="width: 94px">$<span id="price_${cart.id}">${cart.item.price}</span></div>
                            <div class="p-3 flex-self-center" style="width: 175px">
                                <div class="d-flex flex-column">
                                    <div class="flex-self-center">
                                        <c:choose>
                                            <c:when test="${cart.num eq cart.item.num}">
                                                <button class="btn btn-sm zlun-js-add-button" type="button" id="add_${cart.id}" disabled="disabled">+</button>
                                            </c:when>
                                            <c:otherwise>
                                                <button class="btn btn-sm zlun-js-add-button" type="button" id="add_${cart.id}">+</button>
                                            </c:otherwise>
                                        </c:choose>
                                        <input class="form-control input-sm" type="text" value="${cart.num}" style="width: 70px" id="num_${cart.id}"/>
                                        <c:choose>
                                            <c:when test="${cart.num eq 1}">
                                                <button class="btn btn-sm zlun-js-sub-button" type="button" id="sub_${cart.id}" disabled="disabled">-</button>
                                            </c:when>
                                            <c:otherwise>
                                                <button class="btn btn-sm zlun-js-sub-button" type="button" id="sub_${cart.id}">-</button>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="flex-self-center">
                                        <span class="text-gray-light">max: &nbsp;<span id="maxNum_${cart.id}">${cart.item.num}</span> </span>
                                    </div>
                                </div>
                            </div>
                            <div class="p-3 flex-self-center" style="width: 98px">
                                <strong class="text-red">
                                    $<span id="tot_${cart.id}">${cart.item.price * cart.num}</span>
                                </strong>
                            </div>

                            <div class="p-3 flex-self-center" style="width: 95px">
                                <button class="btn btn-sm btn-danger zlun-cart-delete" type="button" id="delete_${cart.id}">Delete</button>
                            </div>
                            <div class="p-3 flex-self-center" style="width: 95px;">
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
                            <label style="cursor: pointer">
                                <input style="cursor: pointer" type="checkbox" id="all_select"/>
                                <span>&nbsp;Select all</span>
                            </label>
                        </div>
                        <div class="p-5 flex-1">&nbsp;</div>
                        <div class="p-3 flex-self-center">
                            <strong>
                                Subtotal(<span id="order_num">0 item</span>):
                                <span class="text-red">$<span id="order_price">0</span></span>
                            </strong>
                        </div>
                        <div class="p-3 flex-self-center">
                            <button class="btn btn-sm btn-primary" type="button" id="checkout" disabled="disabled">Proceed to checkout</button>
                        </div>
                    </div>
                </div>
            </div>

            <div id="visible-zlun-box"></div>
            <div class="mt-3"></div>
        </c:otherwise>
    </c:choose>
</div>


<script src="static/js/cart/cart.js"></script>
<%@ include file="../common/IncludeBottom.jsp"%>

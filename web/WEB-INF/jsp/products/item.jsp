<%--
  Created by IntelliJ IDEA.
  User: ZlunYan
  Date: 2021/2/1
  Time: 19:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../common/IncludeTop.jsp"%>
<div class="position-fixed bottom-0 left-0 mb-3 ml-3" id="alert" style="z-index: 99">
</div>

<div class="mx-3 mt-6">
    <div class="pagehead">
        <h3>
            <span class="author" style="text-transform: capitalize">
                <a href="explore?need=${requestScope.type.name}" class="url fn" rel="author">${requestScope.type.name}</a>
            </span>
            <span class="path-divider">/</span>
            <strong>
                <a href="itemInfo?itemId=${requestScope.item.id}">${requestScope.item.name}</a>
            </strong>
        </h3>
    </div>

    <div class="d-flex" style="height: 400px">
        <div class="p-2" style="width: 400px">
            <img src="${requestScope.item.picUrl}" class="zlun-img">
        </div>
        <div class="p-2 flex-1">
            <div class="d-flex flex-column">
                <div class="bg-gray" style="height: 100px">
                    <div class="p-4 flex-self-center">
                        <h1>
                            ${requestScope.item.name}
                            <span class="mr-2 float-right text-red">$${requestScope.item.price}</span>
                        </h1>
                    </div>
                </div>
                <div class="p-4 f4" style="height: 182px">
                    <strong>${requestScope.item.details}</strong>
                </div>
                <div class="p-5" style="height: 100px">
                        <span class="mr-2 float-right">
                            <c:choose>
                                <c:when test="${sessionScope.user.id eq 0}">
                                    <button class="btn btn-primary btn-block" type="button" id="cart_${item.id}" disabled>Add to Cart</button>
                                </c:when>
                                <c:otherwise>
                                    <button class="btn btn-primary btn-block zlun-js-add-to-cart" type="button" id="cart_${item.id}">Add to Cart</button>
                                </c:otherwise>
                            </c:choose>
                        </span>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="static/js/products/item.js"></script>
<%@ include file="../common/IncludeBottom.jsp"%>
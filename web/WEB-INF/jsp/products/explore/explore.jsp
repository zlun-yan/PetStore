<%--
  Created by IntelliJ IDEA.
  User: ZlunYan
  Date: 2021/1/26
  Time: 20:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../../common/IncludeTop.jsp"%>
<input type="hidden" value="${param.need}" id="need">


<div class="position-fixed bottom-0 left-0 mb-3 ml-3" id="alert" style="z-index: 99">
</div>

<div class="d-inline-flex width-full mb-5">
    <div class="p-5">
        <nav class="SideNav border" style="width: 360px">
            <a class="SideNav-item">Type</a>
            <c:choose>
                <c:when test="${param.need eq 'parrot'}">
                    <button class="SideNav-item zlun-js-explore-side" id="parrot" aria-current="page">Parrot</button>
                </c:when>
                <c:otherwise>
                    <button class="SideNav-item zlun-js-explore-side" id="parrot">Parrot</button>
                </c:otherwise>
            </c:choose>
            <c:choose>
                <c:when test="${param.need eq 'dog'}">
                    <button class="SideNav-item zlun-js-explore-side" id="dog" aria-current="page">Dog</button>
                </c:when>
                <c:otherwise>
                    <button class="SideNav-item zlun-js-explore-side" id="dog">Dog</button>
                </c:otherwise>
            </c:choose>
            <c:choose>
                <c:when test="${param.need eq 'cat'}">
                    <button class="SideNav-item zlun-js-explore-side" id="cat" aria-current="page">Cat</button>
                </c:when>
                <c:otherwise>
                    <button class="SideNav-item zlun-js-explore-side" id="cat">Cat</button>
                </c:otherwise>
            </c:choose>
        </nav>
    </div>
    <div class="p-5 width-full" id="info_content" style="max-width: 1095px">

        <div class="box-shadow-extra-large p-3" style="text-transform: capitalize">
            <strong>${param.need}</strong>
        </div>

        <div class="m-3 container-lg">
            <c:forEach var="item" items="${sessionScope.itemList}">
                <div class="col-6 zlun-box mx-2">
                    <div class="d-block box-shadow-medium px-3 pt-4 pb-6 position-relative rounded-1 overflow-hidden no-underline">
                        <a id="info_${item.id}" class="no-underline d-block" style="cursor: pointer">
                            <div class="bg-blue position-absolute top-0 left-0 py-1 width-full"></div>
                            <h3 class="text-gray-dark">${item.name}</h3>
                            <div class="my-2">
                                <img class="zlun-img" src="${item.picUrl}">
                            </div>
                            <h3 class="text-red">$${item.price}</h3>
                            <p class="text-gray">
                                    ${item.sale} SOLD
                            </p>
                        </a>
                        <div>
                            <c:choose>
                                <c:when test="${sessionScope.user.id eq 0}">
                                    <button class="btn btn-primary btn-block" type="button" id="cart_${item.id}" disabled>Add to Cart</button>
                                </c:when>
                                <c:otherwise>
                                    <button class="btn btn-primary btn-block zlun-js-add-to-cart" type="button" id="cart_${item.id}">Add to Cart</button>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<script src="static/js/products/explore/explore.js"></script>
<%@ include file="../../common/IncludeBottom.jsp"%>
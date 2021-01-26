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

<div class="d-inline-flex width-full">
    <div class="p-5">
        <nav class="SideNav border" style="width: 360px">
            <a class="SideNav-item">Type</a>
            <c:choose>
                <c:when test="${param.need eq 'parrot'}">
                    <button class="SideNav-item" id="parrot" aria-current="page">Parrot</button>
                </c:when>
                <c:otherwise>
                    <button class="SideNav-item" id="parrot">Parrot</button>
                </c:otherwise>
            </c:choose>
            <c:choose>
                <c:when test="${param.need eq 'dog'}">
                    <button class="SideNav-item" id="dog" aria-current="page">Dog</button>
                </c:when>
                <c:otherwise>
                    <button class="SideNav-item" id="dog">Dog</button>
                </c:otherwise>
            </c:choose>
            <c:choose>
                <c:when test="${param.need eq 'cat'}">
                    <button class="SideNav-item" id="cat" aria-current="page">Cat</button>
                </c:when>
                <c:otherwise>
                    <button class="SideNav-item" id="cat">Cat</button>
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
                    <a class="d-block box-shadow-medium px-3 pt-4 pb-6 position-relative rounded-1 overflow-hidden no-underline"
                       href="#" id="info_${item.id}">
                        <div class="bg-blue position-absolute top-0 left-0 py-1 width-full"></div>
                        <h3 class="text-gray-dark">${item.name}</h3>
                        <div class="my-2">
                            <img class="zlun-img" src="${item.picUrl}">
                        </div>
                        <h3 class="text-red">$${item.price}</h3>
                        <p class="text-gray">
                            ${item.sale} SOLD
                        </p>
                        <div>
                            <button class="btn btn-primary btn-block" type="button">Add to Cart</button>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<%--<c:if test="${param.need eq 'parrot'}">--%>
<%--    <script src="static/js/products/explore/parrot.js"></script>--%>
<%--</c:if>--%>
<%--<c:if test="${param.need eq 'dog'}">--%>
<%--    <script src="static/js/products/explore/dog.js"></script>--%>
<%--</c:if>--%>
<%--<c:if test="${param.need eq 'cat'}">--%>
<%--    <script src="static/js/products/explore/cat.js"></script>--%>
<%--</c:if>--%>

<script src="static/js/products/explore/explore.js"></script>
<%@ include file="../../common/IncludeBottom.jsp"%>
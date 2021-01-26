<%--
  Created by IntelliJ IDEA.
  User: ZlunYan
  Date: 2021/1/26
  Time: 20:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="box-shadow-extra-large p-3">
    <strong>Parrot</strong>
</div>

<div>
    <c:forEach var="item" items="${sessionScope.itemList}">
        <div class="col-6">
            <a class="d-block box-shadow-medium px-3 pt-4 pb-6 position-relative rounded-1 overflow-hidden no-underline" href="#">
                <div class="bg-blue position-absolute top-0 left-0 py-1 width-full"></div>
                <h3 class="text-gray-dark">${item.name}</h3>
                <p>
                    <img src="${item.picUrl}">
                </p>
                <p class="text-gray">
                    Build powerful, event-driven, serverless architectures with these open-source libraries and frameworks.
                </p>
                    <%--            <ul class="position-absolute bottom-0 pb-3 text-small text-gray list-style-none ">--%>
                    <%--                <li class="d-inline-block mr-1">--%>
                    <%--                    <svg class="octicon octicon-repo mr-1" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9H3V8h1v1zm0-3H3v1h1V6zm0-2H3v1h1V4zm0-2H3v1h1V2zm8-1v12c0 .55-.45 1-1 1H6v2l-1.5-1.5L3 16v-2H1c-.55 0-1-.45-1-1V1c0-.55.45-1 1-1h10c.55 0 1 .45 1 1zm-1 10H1v2h2v-1h3v1h5v-2zm0-10H2v9h9V1z"></path></svg>--%>
                    <%--                    12 Repositories--%>
                    <%--                </li>--%>
                    <%--                <li class="d-inline-block">--%>
                    <%--                    <svg class="octicon octicon-code mr-1" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M9.5 3L8 4.5 11.5 8 8 11.5 9.5 13 14 8 9.5 3zm-5 0L0 8l4.5 5L6 11.5 2.5 8 6 4.5 4.5 3z"></path></svg>--%>
                    <%--                    5 Languages--%>
                    <%--                </li>--%>
                    <%--            </ul>--%>
            </a>
        </div>
    </c:forEach>
</div>

<script src="static/js/account/info/orders.js"></script>

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

${requestScope.item.id}
${requestScope.item.name}
${requestScope.item.details}
${requestScope.item.num}
${requestScope.item.price}
${requestScope.item.picUrl}
${requestScope.item.sale}
${requestScope.item.typeId}

<script src="static/js/products/item.js"></script>
<%@ include file="../common/IncludeBottom.jsp"%>
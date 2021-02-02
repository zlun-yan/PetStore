<%--
  Created by IntelliJ IDEA.
  User: ZlunYan
  Date: 2021/1/28
  Time: 15:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../../common/IncludeTop.jsp"%>
<input type="hidden" id="orderId" value="${requestScope.order.id}">

<div class="m-3">
    <div class="box-shadow-medium p-3">
        <strong>Order Information</strong>
    </div>

    <div class="my-3">

        <div class="flash my-3">
            <svg class="octicon octicon-rocket" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="16" height="16">  <path fill-rule="evenodd" clip-rule="evenodd" d="M14.064 0C11.7434 9.77766e-05 9.51786 0.922034 7.87699 2.563L7.41799 3.021C7.10399 3.335 6.80199 3.662 6.51399 4H3.30999C3.01117 4.00009 2.71736 4.07669 2.45653 4.2225C2.19571 4.36832 1.97657 4.57849 1.81999 4.833L0.10999 7.607C0.0499638 7.7045 0.0130574 7.81445 0.00209983 7.92842C-0.00885773 8.04239 0.00642442 8.15736 0.0467749 8.26451C0.0871255 8.37166 0.151473 8.46815 0.234886 8.54658C0.318298 8.62502 0.418561 8.68331 0.52799 8.717L3.62999 9.671C3.66699 9.722 3.70899 9.771 3.75399 9.816L6.18299 12.244C6.22899 12.29 6.27699 12.332 6.32799 12.369L7.28199 15.471C7.31568 15.5804 7.37397 15.6807 7.45241 15.7641C7.53084 15.8475 7.62733 15.9119 7.73448 15.9522C7.84163 15.9926 7.9566 16.0078 8.07057 15.9969C8.18454 15.9859 8.29449 15.949 8.39199 15.889L11.166 14.182C11.4205 14.0254 11.6307 13.8063 11.7765 13.5455C11.9223 13.2846 11.9989 12.9908 11.999 12.692V9.485C12.337 9.197 12.664 8.895 12.978 8.581L13.436 8.122C15.0771 6.48154 15.9994 4.2564 16 1.936V1.75C16 1.28587 15.8156 0.840752 15.4874 0.512563C15.1592 0.184374 14.7141 0 14.25 0H14.064ZM10.5 10.625C10.412 10.685 10.323 10.743 10.234 10.8L7.88399 12.321L8.43199 14.104L10.381 12.904C10.4174 12.8816 10.4474 12.8503 10.4682 12.813C10.4891 12.7757 10.5 12.7337 10.5 12.691V10.625ZM3.67799 8.116L5.19999 5.766C5.25799 5.676 5.31699 5.588 5.37599 5.5H3.30899C3.26628 5.49999 3.22427 5.51092 3.18699 5.53175C3.1497 5.55258 3.11837 5.58262 3.09599 5.619L1.89599 7.569L3.67799 8.116ZM8.93799 3.623C10.2973 2.26391 12.1408 1.50028 14.063 1.5H14.249C14.3153 1.5 14.3789 1.52634 14.4258 1.57322C14.4727 1.62011 14.499 1.6837 14.499 1.75V1.936C14.4991 2.88813 14.3117 3.83096 13.9474 4.71066C13.5832 5.59035 13.0492 6.38968 12.376 7.063L11.917 7.521C11.157 8.281 10.32 8.958 9.41799 9.541L7.10099 11.041L4.95799 8.898L6.45799 6.581C7.04138 5.67884 7.71847 4.84085 8.47799 4.081L8.93599 3.623H8.93799ZM12 5C12 5.26522 11.8946 5.51957 11.7071 5.70711C11.5196 5.89464 11.2652 6 11 6C10.7348 6 10.4804 5.89464 10.2929 5.70711C10.1053 5.51957 9.99999 5.26522 9.99999 5C9.99999 4.73478 10.1053 4.48043 10.2929 4.29289C10.4804 4.10536 10.7348 4 11 4C11.2652 4 11.5196 4.10536 11.7071 4.29289C11.8946 4.48043 12 4.73478 12 5ZM3.55999 14.56C3.70736 14.4227 3.82557 14.2571 3.90755 14.0731C3.98954 13.8891 4.03362 13.6905 4.03717 13.489C4.04073 13.2876 4.00368 13.0876 3.92824 12.9008C3.85279 12.714 3.7405 12.5444 3.59807 12.4019C3.45563 12.2595 3.28596 12.1472 3.09919 12.0718C2.91241 11.9963 2.71235 11.9593 2.51095 11.9628C2.30954 11.9664 2.11091 12.0105 1.92691 12.0924C1.74292 12.1744 1.57731 12.2926 1.43999 12.44C0.70599 13.17 0.39299 14.772 0.28999 15.443C0.2839 15.4792 0.286547 15.5163 0.29771 15.5512C0.308873 15.5861 0.328229 15.6179 0.354162 15.6438C0.380096 15.6698 0.411855 15.6891 0.44679 15.7003C0.481726 15.7114 0.518824 15.7141 0.55499 15.708C1.22599 15.605 2.82799 15.292 3.55999 14.56Z"></path></svg>
            <span>
                Items information
    </span>
        </div>

        <div class="d-flex text-center" style="height: 68px">
            <div class="p-3 flex-self-center">
                <strong>Product information</strong>
            </div>
            <div class="p-5 flex-1">&nbsp;</div>

            <div class="p-3 flex-self-center" style="width: 70px">
                <strong>Quantity</strong>
            </div>
            <div class="p-3 flex-self-center" style="width: 100px">
                <strong>Unit price</strong>
            </div>
        </div>

        <c:forEach items="${requestScope.order.clausesList}" var="item">
            <div class="border d-flex" style="height: 96px">
                <div class="p-2 flex-self-center" style="width: 96px">
                    <img src="${item.itemPicURL}" class="zlun-img">
                </div>
                <div class="p-3 flex-self-center">${item.itemName}</div>

                <div class="p-5 flex-1">&nbsp;</div>

                <div class="p-3 flex-self-center" style="width: 70px">${item.num}</div>
                <div class="p-3 flex-self-center" style="width: 100px">${item.itemPrice}</div>
            </div>
        </c:forEach>

        <div class="my-3">
            <div class="flash">
                <svg class="octicon octicon-flame" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="16" height="16">  <path fill-rule="evenodd" clip-rule="evenodd" d="M7.99789 14.5001C10.8304 14.5001 12.9971 12.5193 12.9971 10C12.9971 8.53654 12.3174 7.80948 11.1193 6.61667C11.1071 6.60453 11.0949 6.59236 11.0826 6.58014C10.0696 5.57183 8.7824 4.29061 8.24911 2.14559C7.92718 2.40211 7.61813 2.72476 7.38529 3.09924C6.95273 3.79496 6.7637 4.67919 7.33879 5.82934C7.81231 6.77637 8.00841 8.11294 7.06066 9.06069C6.45006 9.67129 5.51641 9.90115 4.65812 9.69385C4.1002 9.55909 3.61121 9.25672 3.22215 8.81981C3.08407 9.16747 3.00001 9.57013 3 10.0001C2.99994 12.5298 5.1636 14.5001 7.99789 14.5001ZM9.5332 0.752514C9.49562 0.340008 9.16001 0.00931669 8.76889 0.145686C7.03463 0.750359 4.34051 3.18696 5.99715 6.50017C6.34142 7.1887 6.28164 7.71839 6 8.00003C5.58104 8.41899 4.45998 8.4869 3.95925 7.16847C3.78678 6.71435 3.30098 6.40593 2.92501 6.71353C2.03625 7.44067 1.50003 8.70216 1.5 10C1.49992 13.5121 4.49789 16.0001 7.99789 16.0001C11.4979 16.0001 14.4971 13.5 14.4971 10C14.4971 7.86282 13.3699 6.74064 12.1862 5.56222C10.9968 4.37809 9.7504 3.13717 9.5332 0.752514Z"></path></svg>
                <span>
            Address
        </span>
            </div>
        </div>

        <div class="border d-flex bg-gray-light" style="height: 96px">
            <div class="p-3 flex-self-center">
                ${requestScope.address.province}&nbsp;
                ${requestScope.address.city}&nbsp;
                ${requestScope.address.district}
            </div>
            <div class="p-3 flex-self-center">${requestScope.address.details}</div>

            <div class="p-5 flex-1">&nbsp;</div>

            <div class="p-3 flex-self-center">${requestScope.address.phone}</div>
            <div class="p-3 flex-self-center">${requestScope.address.name}</div>
        </div>
    </div>
</div>

<div style="height: 68px">
    <div id="checkBar">
        <div class="border d-flex mx-3" style="height: 68px;background-color: #E5E5E5">
            <div class="p-5 flex-1">&nbsp;</div>
            <div class="p-3 flex-self-center">
                <span class="tooltipped tooltipped-sw" aria-label="Pay for it!">
                    <c:choose>
                        <c:when test="${requestScope.order.state eq 0}">
                            <button class="btn btn-danger" type="button" id="orderInfo_pay">Pay</button>
                        </c:when>
                        <c:otherwise>
                            <button class="btn btn-danger" type="button" id="orderInfo_pay" disabled="disabled">Pay</button>
                        </c:otherwise>
                    </c:choose>
                </span>

            </div>
            <div class="p-3 flex-self-center">
                <span class="tooltipped tooltipped-sw" aria-label="Let it deliver successfully.">
                    <c:choose>
                        <c:when test="${requestScope.order.state eq 1}">
                            <button class="btn btn-outline" type="button" id="orderInfo_deliver">Deliver</button>
                        </c:when>
                        <c:otherwise>
                            <button class="btn btn-outline" type="button" id="orderInfo_deliver" disabled="disabled">Deliver</button>
                        </c:otherwise>
                    </c:choose>
                </span>
            </div>
            <div class="p-3 flex-self-center">
                <span class="tooltipped tooltipped-sw" aria-label="Return to the orders page.">
                    <button class="btn btn-primary" type="button" id="orderInfo_return">Return</button>
                </span>
            </div>
        </div>
    </div>
</div>

<div id="visible-zlun-box"></div>
<div class="mt-3"></div>


<script src="static/js/account/info/orderInfo.js"></script>
<%@ include file="../../common/IncludeBottom.jsp"%>
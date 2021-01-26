<%--
  Created by IntelliJ IDEA.
  User: ZlunYan
  Date: 2021/1/18
  Time: 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../common/IncludeTop.jsp"%>
<div class="p-responsive mt-4 mt-md-8">
    <div class="mb-4 mb-md-8 container-md">
        <div class="text-mono text-center text-gray-light text-normal mb-3">Join JPetStore</div>
        <h1 class="d-none d-md-block mt-0 mb-3 text-center h00-mktg lh-condensed-ultra ">Create your account</h1>
    </div>

    <div class="container-sm">
        <div class="mb-3" id="errorBox" style="display: none">
            <div class="flash flash-full flash-error" style="border-width: 1px; border-radius: 6px">
                <div class="container-lg px-2" >
                    <button class="flash-close js-flash-close" type="button" aria-label="Dismiss this message" id="error_button">
                        <svg class="octicon octicon-x" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true">
                            <path fill-rule="evenodd" d="M3.72 3.72a.75.75 0 011.06 0L8 6.94l3.22-3.22a.75.75 0 111.06 1.06L9.06 8l3.22 3.22a.75.75 0 11-1.06 1.06L8 9.06l-3.22 3.22a.75.75 0 01-1.06-1.06L6.94 8 3.72 4.78a.75.75 0 010-1.06z"></path>
                        </svg>
                    </button>
                    <p id="info">Error, please try again.</p>
                </div>
            </div>
        </div>

        <div class="mb-4">
            <form id="signup-form" action="" accept-charset="UTF-8" method="post"
                  class="setup-form js-signup-form js-octocaptcha-parent">
                <dl class="form-group my-3 required">
                    <dt class="input-label">
                        <label name="user[login]" autocapitalize="off" autofocus="autofocus" required="required"
                               for="user_login">
                            Username
                        </label>
                    </dt>
                    <dd>
                        <input name="user[login]" autocapitalize="off" autofocus="autofocus" required="required"
                               class="form-control input width-full" type="text" id="user_login" />
                    </dd>
                </dl>

                <dl class="form-group my-3 required">
                    <dt class="input-label">
                        <label name="user[email]" autocapitalize="off" required="required" for="user_email">Email address</label>
                    </dt>
                    <dd>
                        <input name="user[email]" autocapitalize="off" required="required"
                               class="form-control input width-full" value="" type="text" id="user_email" />
                    </dd>
                </dl>

                <dl class="form-group mt-3 mb-2 required">
                    <dt class="input-label">
                        <label name="user[password]" required="required" autocomplete="new-password" for="user_password">
                            Password
                        </label>
                    </dt>
                    <dd>
                        <input name="user[password]" required="required" class="form-control input width-full"
                               autocomplete="new-password" type="password" id="user_password" />
                    </dd>
                </dl>

                <p class="note mb-3">
                    Make sure it&#39;s
                    <span >at least 15 characters</span>
                    OR
                    <span >at least 8 characters</span>
                    <span >including a number</span>
                    <span >and a lowercase letter</span>.
                    <a href="" class="tooltipped tooltipped-s" aria-label="Learn more about strong passwords">Learn more</a>.
                </p>

<%--                <div class="my-3" >--%>
<%--                    <h2 class="f4 mb-3">Verify your account</h2>--%>
<%--                </div>--%>

                <div class="my-3">
                    <button
                            class="btn-mktg signup-btn  js-octocaptcha-form-submit width-full"
                            type="submit"
                            height="64px"
<%--                            disabled--%>
                            id="signup_button">
                        Create account
                    </button>
                </div>

                <p class="my-3 f6">
                    By creating an account, you agree to the
                    <a href="" target="_blank">Terms of Service</a>.
                    For more information about JPetStore's privacy practices, see the
                    <a href="" target="_blank">JPetStore Privacy Statement</a>.
                    We'll occasionally send you account-related emails.
                </p>
            </form>
        </div>
    </div>
</div>

<script src="static/js/account/signUp.js"></script>
<%@ include file="../common/IncludeBottom.jsp"%>

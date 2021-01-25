<%--
  Created by IntelliJ IDEA.
  User: ZlunYan
  Date: 2021/1/18
  Time: 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link href="https://unpkg.com/@primer/css/dist/primer.css" rel="stylesheet" />
    <style>
        #search_div {
            max-width: 272px;
            width: 100%;

            display: block;
            transition: .2s ease-in-out;
            transition-property: max-width,padding-bottom,padding-top;
        }
        #search_div:focus {
            max-width: 544px;
        }
        #search_input {
            width: 100%;
        }
    </style>

    <script src="static/js/jquery-3.5.1.min.js"></script>
    <script src="static/js/common/top.js"></script>

    <title>PetStore</title>
</head>

<body>
    <div class="Header">
        <div class="Header-item">
            <a href="index" class="Header-link f4 d-flex flex-items-center">
                <svg width="32" height="32" xmlns="http://www.w3.org/2000/svg">
                    <path stroke="#000" id="svg_1" d="m19.309763,30.770451c-0.642383,-0.789247 -1.641317,-0.879249 -1.88152,-2.002639c-0.188271,-0.611033 -1.963143,-1.430549 -0.912688,-0.333829c0.811137,0.660874 1.774817,3.098493 -0.22075,2.328325c-1.517779,-0.500364 -1.582862,-2.045443 -1.989699,-3.202189c-1.323005,-0.824529 0.342053,-2.567936 -1.082447,-3.624376c-1.208997,-1.102797 -0.367006,-3.168172 -2.094563,-3.950116c-0.867118,-0.316139 -1.242447,1.866653 -1.388446,0.269798c-0.475056,-1.615058 -2.15283,0.785094 -3.271616,0.530641c-0.902796,-0.0705 1.510144,-0.634285 0.358676,-0.786005c-0.676975,0.332898 -1.303341,0.908499 -1.410443,-0.044291c-0.814361,-0.434459 -2.522092,-1.128271 -2.47773,-1.81845c0.707189,-0.199559 3.094578,0.377876 2.680853,-0.424455c-0.709927,-0.242016 -0.838889,-0.903581 0.030632,-0.459584c1.713583,0.048287 3.722389,-0.566152 5.148199,0.60903c0.743707,0.411056 1.474946,1.885308 1.873089,0.452611c1.283426,-1.390509 3.873172,-1.50829 4.664345,-3.30865c0.191454,-0.871037 -0.588003,-1.367989 -1.250175,-1.544424c-0.128826,-0.286254 -0.348129,-1.501582 -0.895701,-0.888289c0.024957,-0.536776 0.538608,-1.820398 -0.599147,-1.252138c-0.1154,-1.1433 0.972638,-2.283937 -0.46669,-3.116502c1.348573,0.224723 1.08264,-1.156324 0.788908,-1.375352c0.799422,-0.101968 1.737582,-0.748174 1.296808,-1.548714c0.868151,1.415761 0.898254,-1.71758 1.612998,-0.367016c1.315491,0.193726 -0.408674,-1.055736 0.801254,-0.776852c0.690883,0.021235 0.537441,-0.679998 1.158091,-0.150753c0.82142,-0.402605 -0.6297,-1.619342 0.696571,-0.773939c0.445844,0.34793 1.865287,1.259208 1.610607,0.056695c1.260253,1.207597 2.252006,-1.121652 3.299227,-1.604017c0.415383,-0.446399 1.318668,-0.918829 0.485602,-0.066701c-0.553047,1.0862 -2.429351,2.261239 -1.924567,3.340536c-0.456908,0.373658 0.921881,0.843281 -0.175693,0.701819c-0.650234,0.630499 0.871753,1.810123 0.993215,2.80243c-0.348628,0.679907 -1.676123,1.451781 -2.213127,1.427385c0.19627,-0.87538 -0.229216,-2.01634 -1.471984,-1.521538c0.696174,1.144242 1.637391,2.237354 2.227096,3.481696c0.576395,1.223248 1.51092,2.635852 2.740418,1.061531c0.783647,-1.003406 3.022331,-0.988881 2.407383,0.640655c-0.314363,1.600156 0.527283,3.712041 -1.089921,4.814285c-0.975586,1.68869 -2.057155,-0.627891 -1.290691,-1.504274c-0.195303,-0.250442 -0.34639,-0.427231 0.225115,-0.769569c-0.118007,-0.25679 1.644697,-1.222901 0.756301,-1.815721c-1.010405,1.029202 -2.488861,2.220509 -2.077981,3.750404c0.333474,1.025215 -2.41686,2.782852 -2.196928,1.081413c0.049263,-0.661237 1.100231,-1.942788 0.858312,-2.107891c-0.767302,1.293257 -1.858826,2.535708 -3.50823,2.919677c-1.37198,0.073033 -2.090679,1.065339 -1.439152,2.166312c0.124513,1.560129 -0.792277,2.972122 -1.003344,4.491128c0.392349,1.611105 2.781075,1.936668 3.10531,3.580118c0.557135,1.103742 -0.836479,0.940626 -1.48578,0.631785l0.000003,0.000001zm-3.396971,-4.806445c-0.201104,-0.728268 -0.61496,1.893139 -0.104807,0.501803l0.076371,-0.245811l0.028436,-0.255993l0,0.000001z" stroke-width="0.5" fill="#fff"/>
                </svg>
                <span>PetStore</span>
            </a>
        </div>

        <div class="Header-item Header-item--full flex-column flex-md-row width-full flex-order-2 flex-md-order-none mr-0 mr-md-3 mt-3 mt-md-0 Details-content--hidden-not-important d-md-flex">
            <div class="Header-item">
                <a href="#" class="Header-link">Explore</a>
            </div>
            <div class="Header-item">
                <a href="#" class="Header-link">Market</a>
            </div>
            <div class="Header-item">
                <a href="#" class="Header-link">About</a>
            </div>

            <div class="Header-item position-relative" id="search_div">
                <input type="search" class="form-control input-dark" id="search_input" aria-expanded="true"/>
                <ul class="autocomplete-results" id="search_list" style="display: none">
                </ul>
            </div>
        </div>

        <c:if test="${sessionScope.user.id ne 0}">
            <div class="d-flex flex-justify-end position-relative">
                <details class="details-reset details-overlay">
                    <summary aria-haspopup="true">
                        <img class="avatar avatar-5 mr-2" alt="avatar" src="https://github.com/fluidicon.png" />
                    </summary>
                    <div class="SelectMenu right-0">
                        <div class="SelectMenu-modal">
                            <div class="SelectMenu-list">
                                <button class="SelectMenu-item flex-justify-between" role="menuitem">
                                    Sign in as
                                    <strong class="css-truncate-target">${sessionScope.user.username}</strong>
                                    <svg
                                            width="8"
                                            height="16"
                                            viewBox="0 0 8 16"
                                            class="octicon octicon-primitive-dot color-green-5 ml-2"
                                            aria-hidden="true"
                                    >
                                        <path fill-rule="evenodd" d="M0 8c0-2.2 1.8-4 4-4s4 1.8 4 4-1.8 4-4 4-4-1.8-4-4z" />
                                    </svg>
                                </button>
                                <hr class="SelectMenu-divider">
                                <button class="SelectMenu-item" role="menuitem">Your profile</button>
                                <button class="SelectMenu-item" role="menuitem">Your delivery address</button>
                                <button class="SelectMenu-item" role="menuitem">Your cart</button>
                                <hr class="SelectMenu-divider">
                                <button class="SelectMenu-item" role="menuitem">Sign out</button>
                            </div>
                        </div>
                    </div>
                </details>
            </div>
        </c:if>
    </div>


<%--    下面就是页面的内容--%>
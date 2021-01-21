<%--
  Created by IntelliJ IDEA.
  User: ZlunYan
  Date: 2021/1/18
  Time: 9:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link rel="stylesheet" href="static/css/ink.css">
    <link href="https://unpkg.com/@primer/css/dist/primer.css" rel="stylesheet" />
    <style type="text/css">
        a:link {
            text-decoration: none;
        }
        a:visited {
            text-decoration: none;
        }
    </style>
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

    <div class="Header-item">
        <a href="#" class="Header-link">Explore</a>
    </div>
    <div class="Header-item">
        <a href="#" class="Header-link">Pricing</a>
    </div>
    <div class="Header-item">
        <a href="#" class="Header-link">About</a>
    </div>

    <div class="Header-item" style="float: right;">

        <%--            在选择框这里可以加一个select 这个可以在forms里面找到--%>
        <input type="search" class="form-control input-dark" style="float: right;"/>
    </div>
</div>

<div class="wrapper">

        <a href="signUp">
            <div class="button _1">
                <span>sign up</span>
                <div class="back"></div>
            </div>
        </a>

        <a href="signUp">
            <div class="button _2">
                <span>sign up</span>
                <div class="back"></div>
            </div>
        </a>

        <a href="signIn">
            <div class="button _3">
                <span>sign in</span>
                <div class="back"></div>
            </div>
        </a>

        <a href="signIn">
            <div class="button _4">
                <span>sign in</span>
                <div class="back"></div>
            </div>
        </a>
    </div>

<div class="position-relative js-header-wrapper " style="position: fixed; bottom: 0">
    <footer class="footer mt-6">
        <div style="position: fixed; bottom: 0; width: 100%">
            <div class="bg-gray-light">
                <div class="container-xl p-responsive f6 py-4 d-sm-flex flex-justify-between flex-row-reverse flex-items-center">
                    <ul class="list-style-none d-flex flex-items-center mb-3 mb-sm-0 lh-condensed-ultra">
                        <li class="mr-3">
                            <a href="https://twitter.com"
                               title="JPetStore on Twitter" style="color: #959da5;">
                                <svg xmlns="http://www.w3.org/2000/svg"
                                     viewBox="0 0 273.5 222.3"
                                     class="d-block" height="18">
                                    <path d="M273.5 26.3a109.77 109.77 0 0 1-32.2 8.8 56.07 56.07 0 0 0 24.7-31 113.39 113.39 0 0 1-35.7 13.6 56.1 56.1 0 0 0-97 38.4 54 54 0 0 0 1.5 12.8A159.68 159.68 0 0 1 19.1 10.3a56.12 56.12 0 0 0 17.4 74.9 56.06 56.06 0 0 1-25.4-7v.7a56.11 56.11 0 0 0 45 55 55.65 55.65 0 0 1-14.8 2 62.39 62.39 0 0 1-10.6-1 56.24 56.24 0 0 0 52.4 39 112.87 112.87 0 0 1-69.7 24 119 119 0 0 1-13.4-.8 158.83 158.83 0 0 0 86 25.2c103.2 0 159.6-85.5 159.6-159.6 0-2.4-.1-4.9-.2-7.3a114.25 114.25 0 0 0 28.1-29.1" fill="currentColor"></path>
                                </svg>
                                <span class="sr-only">Twitter</span>
                            </a>
                        </li>

                        <li class="mr-3">
                            <a href="https://www.facebook.com" title="JPetStore on Facebook" style="color: #959da5;">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 15.3 15.4" class="d-block" height="18">
                                    <path d="M14.5 0H.8a.88.88 0 0 0-.8.9v13.6a.88.88 0 0 0 .8.9h7.3v-6h-2V7.1h2V5.4a2.87 2.87 0 0 1 2.5-3.1h.5a10.87 10.87 0 0 1 1.8.1v2.1h-1.3c-1 0-1.1.5-1.1 1.1v1.5h2.3l-.3 2.3h-2v5.9h3.9a.88.88 0 0 0 .9-.8V.8a.86.86 0 0 0-.8-.8z" fill="currentColor"></path>
                                </svg>
                                <span class="sr-only">Facebook</span>
                            </a>
                        </li>
                        <li class="mr-3">
                            <a href="https://www.youtube.com" title="JPetStore on YouTube" style="color: #959da5;">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 19.17 13.6" class="d-block" height="16">
                                    <path d="M18.77 2.13A2.4 2.4 0 0 0 17.09.42C15.59 0 9.58 0 9.58 0a57.55 57.55 0 0 0-7.5.4A2.49 2.49 0 0 0 .39 2.13 26.27 26.27 0 0 0 0 6.8a26.15 26.15 0 0 0 .39 4.67 2.43 2.43 0 0 0 1.69 1.71c1.52.42 7.5.42 7.5.42a57.69 57.69 0 0 0 7.51-.4 2.4 2.4 0 0 0 1.68-1.71 25.63 25.63 0 0 0 .4-4.67 24 24 0 0 0-.4-4.69zM7.67 9.71V3.89l5 2.91z" fill="currentColor"></path>
                                </svg>
                                <span class="sr-only">YouTube</span>
                            </a>
                        </li>
                        <li class="mr-3 flex-self-start">
                            <a href="https://www.linkedin.com" title="JPetStore on Linkedin" style="color: #959da5;">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 19 18" class="d-block" height="18">
                                    <path d="M3.94 2A2 2 0 1 1 2 0a2 2 0 0 1 1.94 2zM4 5.48H0V18h4zm6.32 0H6.34V18h3.94v-6.57c0-3.66 4.77-4 4.77 0V18H19v-7.93c0-6.17-7.06-5.94-8.72-2.91z" fill="currentColor"></path>
                                </svg>
                                <span class="sr-only">LinkedIn</span>
                            </a>
                        </li>
                        <li>
                            <a href="https://github.com/zlun-yan" title="JPetStore's organization" style="color: #959da5;">
                                <svg height="20" class="octicon octicon-mark-github d-block" alt="" viewBox="0 0 16 16" version="1.1" width="20" aria-hidden="true">
                                    <path fill-rule="evenodd" d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0016 8c0-4.42-3.58-8-8-8z"></path>
                                </svg>
                                <span class="sr-only">JPetStore</span>
                            </a>
                        </li>
                    </ul>
                    <ul class="list-style-none d-flex flex-wrap text-gray">
                        <li class="mr-3">&copy; 2021 JPetStore, Inc.</li>
                        <li class="mr-3"><a href="" class="link-gray">Terms</a></li>
                        <li class="mr-3"><a href="" class="link-gray">Privacy</a></li>
                        <li class="mr-3"><a href="" class="link-gray">Site Map</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
</div>
</body>
</html>
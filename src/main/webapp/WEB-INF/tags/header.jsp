<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/include/tags.jspf"%>

<script>
var cookieValue = ${cookie.remember_checked_on.value}

console.log(cookieValue);

</script>
<header>
    <div class="topbar js-topbar">
        <div id="banners" class="js-banners">                               
        </div>
        <div class="global-nav" data-section-term="top_nav">
            <div class="global-nav-inner">
                <div class="container">
                    <ul class="nav js-global-actions" id="global-actions">
                        <li id="global-nav-home" class="home" data-global-action="home">
                            <a class="js-nav" href="/" data-component-term="home_nav" data-nav="home" title="Home">
                                <span class="new-wrapper">
                                    <i class="bird-topbar-etched"></i>
                                    <i class="nav-new"></i>
                                </span>
                                <span class="text">HELLO! FOOTBALL</span>
                            </a>
                        </li>
                        <li id="global-nav-home" class="home" data-global-action="home">
                            <a class="js-nav" href="#" data-component-term="home_nav" data-nav="home" title="Home">
                                <span class="new-wrapper">
                                    <i class="nav-home"></i>
                                    <i class="nav-new"></i>
                                </span>
                                <span class="text">홈</span>
                            </a>
                        </li>
                        <li class="people" data-global-action="connect">
                            <a class="js-nav" href="/news" data-component-term="connect_nav" data-nav="connect" title="Connect">
                                <span class="new-wrapper">
                                    <i class="nav-people"></i>
                                    <i class="nav-new"></i>
                                </span>
                                <span class="text">뉴스</span>
                                <span class="caret"></span>
                            </a>
                        </li>
                        <li class="topics" data-global-action="discover">
                            <a class="js-nav" href="/clubs" data-component-term="discover_nav" data-nav="discover" title="Discover">
                                <span class="new-wrapper">
                                    <i class="nav-topics"></i>
                                    <i class="nav-new"></i>
                                    </span>
                                <span class="text">정보</span>
                                <span class="caret"></span>
                            </a>
                        </li>
                        <li class="profile" data-global-action="profile">
                            <a class="js-nav" href="#" data-component-term="profile_nav" data-nav="profile" title="Me">
                                <span class="new-wrapper">
                                    <i class="nav-me"></i>
                                    <i class="nav-new"></i>
                                </span>
                                <span class="text">포럼</span>
                            </a>
                        </li>
                        <li class="profile" data-global-action="profile">
                            <a class="js-nav" href="/tactics" data-component-term="profile_nav" data-nav="profile" title="Me">
                                <span class="new-wrapper">
                                    <i class="nav-me"></i>
                                    <i class="nav-new"></i>
                                </span>
                                <span class="text">전술</span>
                            </a>
                        </li>
                        <li class="profile" data-global-action="profile">
                            <a class="js-nav" href="/people/form" data-component-term="profile_nav" data-nav="profile" title="Me">
                                <span class="new-wrapper">
                                    <i class="nav-me"></i>
                                    <i class="nav-new"></i>
                                </span>
                                <span class="text">인물</span>
                            </a>
                        </li>
                    </ul>                               
                    <div class="pull-right">                                
                        <c:if test="${empty userSession}">
                        <ul class="nav secondary-nav session-dropdown" id="session">
                            <li class="dropdown js-session">
                            <a class="dropdown-toggle dropdown-signin" id="signin-link" href="#" data-nav="login" data-toggle="dropdown">
                            로그인<span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu dropdown-form" id="signin-dropdown">
                                <li class="dropdown-caret right">
                                    <span class="caret-outer"></span>
                                    <span class="caret-inner"></span>
                                </li>
                                <li>                                          
                                <form:form commandName="loginCommand" modelAttribute="loginCommand" action="/user/login" cssclass="js-signin signin" method="post" >
                                <fieldset class="textbox">
                                    <label class="username js-username">
                                        <span>아이디 또는 이메일</span>
                                        <input type="text" id="username" name="username" class="js-username-field email-input"  autocomplete="off" />                                           
                                    </label>
                                    <label class="password js-password">
                                        <span>비밀번호</span>
                                        <input class="js-password-field" type="password" value="" name="password" autocomplete="off" />
                                    </label>
                                </fieldset>
                                <fieldset class="subchck">
                                    <label class="remember">
                                        <input type="checkbox" id="remember_login" value="0" name="remember_login" />
                                        <span>ID 저장</span>
                                    </label>
                                    <button type="submit" class="btn submit">로그인</button>
                                </fieldset>                                
                                <input type="hidden" name="scribe_log">
                                <input type="hidden" name="redirect_after_login" value="/user/signup">
                                <input type="hidden" value="74930792d14c53bec350dcdc7186c8e596a454ea" name="authenticity_token">
                                <div class="divider">
                                </div>
                                <p class="footer-links">
                                    <a class="forgot" href="#" onclick="javascript:getPassword()">비밀번호 찾기</a><br>
                                    <a class="mobile has-sms" href="/user/signup">가입하기</a>
                                </p>
                                </form:form>                                             
                                </li>
                            </ul>
                            </li>
                        </ul>
                        </c:if>
                        <c:if test="${!empty userSession}">
                        <ul class="nav secondary-nav session-dropdown">
                            <li class="me dropdown session js-session" data-global-action="t1me" id="user-dropdown">
                            <a class="dropdown-toggle js-dropdown-toggle" href="#" id="user-dropdown-toggle" data-toggle="dropdown">
                            ${userSession.name} <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="dropdown-caret">
                                    <span class="caret-outer"></span>
                                    <span class="caret-inner"></span>
                                </li>
                                <li class="current-user" data-name="profile">
                                    <a href="/user/settings/profile" class="account-summary account-summary-small" data-nav="edit_profile">
                                        <div class="content">
                                            <div class="account-group js-mini-current-user" data-user-id="129483340" data-screen-name="mouse208">
                                                <img class="avatar size32" src="https://si0.twimg.com/profile_images/1157074264/38_4_normal.jpg" alt="최중섭" data-user-id="129483340">
                                                <b class="fullname">${userSession.name}</b>
                                                <small class="metadata">프로필 수정하기</small>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="dropdown-divider"></li>
                                <li class="messages" data-name="messages">
                                    <a class="js-dm-dialog" role="button" href="#" data-nav="messages" data-toggle="modal" data-target="#dm_dialog">
                                    <span class="js-direct-message-count count"></span>쪽지</a>
                                </li>
                                <li data-name="lists"><a href="/mouse208/lists" data-nav="all_lists">리스트</a></li>
                                <li class="dropdown-divider"></li>
                                <li><a href="//support.twitter.com" data-nav="help_center">도움말</a></li>
                                <li>
                                <a href="#" class="js-keyboard-shortcut-trigger" data-nav="shortcuts">키보드 단축키</a>
                                </li>
                                <li class="dropdown-divider"></li>
                                <li><a href="/user/settings/account" data-nav="settings" class="js-nav">설정</a></li>
                                <li>
                                    <a class="js-signout-button" id="signout-button" href="/user/logout" data-nav="logout">로그아웃</a>
                                    <form class="dropdown-link-form signout-form" id="signout-form" action="/logout" method="POST">
                                        <input type="hidden" value="aaed537869784c8cbcf7b92999b0f46205ac2bdc" name="authenticity_token" class="authenticity_token">
                                        <input type="hidden" name="reliability_event" class="js-reliability-event">
                                        <input type="hidden" name="scribe_log">
                                    </form>
                                </li>
                            </ul>
                            </li>
                        </ul>
                        </c:if>                                                                     
                        <a id="close-all-button" class="close-all-tweets js-close-all-tweets" title="검색" data-toggle="collapse" data-parent="#page-container" href="#search" style="display: inline;">
                            <i class="nav-breaker"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>

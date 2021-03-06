<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/include/tags.jspf"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/editor/css/editor.css" type="text/css" charset="utf-8"/>
<script src="<%=request.getContextPath()%>/resources/editor/js/editor_loader.js?environment=development" type="text/javascript" charset="utf-8"></script>            
                    <div class="dashboard" style="width: 222px; float:left;">
                        <div class="module mini-profile">
                            <div class="flex-module profile-summary js-profile-summary">
                                <a href="/mouse208" class="account-summary account-summary-small js-nav" data-nav="profile">
                                <div class="content">
                                    <div class="account-group js-mini-current-user" data-user-id="129483340" data-screen-name="mouse208">
                                        <img class="avatar size32" src="https://si0.twimg.com/profile_/resources/editor/images/1157074264/38_4_normal.jpg" alt="최중섭" data-user-id="129483340">
                                        <b class="fullname">최중섭</b>
                                        <small class="metadata">
                                        내 프로필 페이지 보기 </small>
                                    </div>
                                </div>
                                </a>
                            </div>
                        </div>
                        <div class="module">
                            <ul class="js-nav-links">
                                <li class="active"><a class="list-link js-nav" href="/user/settings/account" data-nav="account">계정 <i class="chev-right"></i></a></li>
                                <li class=""><a class="list-link js-nav" href="/user/settings/password" data-nav="password">비밀번호<i class="chev-right"></i></a></li>
                                <li class=""><a class="list-link js-nav" href="/user/settings/devices" data-nav="devices">모바일 <i class="chev-right"></i></a></li>
                                <li class=""><a class="list-link js-nav" href="/user/settings/notifications" data-nav="notifications">이메일 알림 <i class="chev-right"></i></a></li>
                                <li class=""><a class="list-link js-nav" href="/user/settings/profile" data-nav="profile">프로필 <i class="chev-right"></i></a></li>
                                <li class=""><a class="list-link js-nav" href="/user/settings/design" data-nav="design">디자인 <i class="chev-right"></i></a></li>
                                <li class=""><a class="list-link js-nav" href="/user/settings/favourites" data-nav="connections">좋아하는 클럽<i class="chev-right"></i></a></li>
                                <li class=""><a class="list-link" href="/user/settings/widgets" data-nav="widgets">위젯 <i class="chev-right"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="content-main" style="width: 761px;">
                        <div class="content-header">
                            <div class="header-inner">
                                <h2>${getNews.subject}</h2>      
                            </div>
                        </div>
                        <div class="content-inner no-stream-and">                       
							<form name="tx_editor_form" id="tx_editor_form" action="/news/write" method="post" accept-charset="utf-8">						
	                            <div id="write_title" class="line_sub" style="background-color: rgb(255, 255, 255);">                               
	                                <p class="title_inp">
	                                    ${getNews.subject}	                                    
	                                </p>                                
	                                <span class="title_cnt" style="display:none;"><span id="textlimit" class="point">0</span> / 75자</span>
	                            </div>
	                            <div style="height: 5px;"></div> 							
							    <!-- 에디터 컨테이너 시작 -->
							    <div>
							    ${getNews.content}
							    </div>							    
							    <!-- 에디터 컨테이너 끝 -->
							</form>
                        </div>
                        <div class="content-footer">
                            <div class="footer-inner">
                                <span><a class="btn primary-btn tweet-action" type="button" href="/news/${getNews.num}/form">수정</a></span>
                                <span><a class="btn primary-btn tweet-action" type="button" href="/news/form">삭제</a></span>      
                            </div>
                        </div>                        
                    </div>
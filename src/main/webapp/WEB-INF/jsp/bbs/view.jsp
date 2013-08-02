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
                                <h2>${getArticle.subject}</h2>      
                            </div>
                        </div>
                        <div class="content-inner no-stream-and">                       
							<form name="tx_editor_form" id="tx_editor_form" action="/news/write" method="post" accept-charset="utf-8">						
	                            <div id="write_title" class="line_sub" style="background-color: rgb(255, 255, 255);">                               
	                                <p class="title_inp">
	                                    ${getArticle.subject}	                                    
	                                </p>                                
	                                <span class="title_cnt" style="display:none;"><span id="textlimit" class="point">0</span> / 75자</span>
	                            </div>
	                            <div style="height: 5px;"></div> 							
							    <!-- 에디터 컨테이너 시작 -->
							    <div>
							    ${getArticle.content}
							    </div>							    
							    <!-- 에디터 컨테이너 끝 -->
							</form>
                        </div>
						<div class="inline-reply-tweetbox swift">
						    <form class="tweet-form condensed" method="post" target="tweet-post-iframe" action="//upload.twitter.com/i/tweet/create_with_media.iframe" enctype="multipart/form-data">
						        <input type="hidden" name="post_authenticity_token" class="auth-token" value="">
						        <input type="hidden" name="iframe_callback" class="iframe-callback" value="">
						        <input type="hidden" name="in_reply_to_status_id" class="in-reply-to-status-id" value="">
						        <input type="hidden" name="impression_id" class="impression-id" value="">
						        <input type="hidden" name="earned" class="earned" value="">
						        <img class="inline-reply-user-image avatar size32" src="https://si0.twimg.com/profile_images/3479363933/e4d7bf7a02cc55ced4dc776a0adeec35_normal.png" alt="최중섭">
						        <span class="inline-reply-caret">
						        <span class="caret-inner"></span>
						        </span>
						        <div class="tweet-content">
						            <i class="add-photo-icon hidden"></i>
						            <span class="tweet-drag-help tweet-drag-photo-here hidden">여기에 사진을 끌어오세요</span>
						            <span class="tweet-drag-help tweet-or-drag-photo-here hidden">점선 안으로 사진파일을 끌어오셔도 됩니다</span>
						            <label class="visuallyhidden" for="tweet-box-reply-to-363194029590056960" id="tweet-box-template-label">트윗 문구</label>
						            <div aria-labelledby="tweet-box-template-label" id="tweet-box-template" class="tweet-box rich-editor notie" contenteditable="true" spellcheck="true" role="textbox" aria-multiline="true" dir="ltr">
						                <div>
						                    <a class="twitter-atreply pretty-link" href="/computers_bot"><s>@</s>computers_bot</a> &nbsp;님에게 답장
						                </div>
						            </div>
						            <div class="rich-normalizer">
						                <div>
						                    <a class="twitter-atreply pretty-link" href="/computers_bot"><s>@</s>computers_bot</a> &nbsp;님에게 답장
						                </div>
						            </div>
						            <div class="dropdown-menu typeahead" style="display: none;">
						                <div class="dropdown-caret">
						                    <div class="caret-outer">
						                    </div>
						                    <div class="caret-inner">
						                    </div>
						                </div>
						                <div class="dropdown-inner js-typeahead-results">
						                    <ul class="typeahead-items typeahead-accounts js-typeahead-accounts block0 has-results" style="display: block;">
						                        <li data-user-id="620933199" data-user-screenname="computers_bot" data-remote="true" data-score="" class="typeahead-item typeahead-account-item js-selectable">
						                        <a class="js-nav" data-query-source="typeahead_click" data-search-query="620933199" data-ds="account" href="/computers_bot">
						                        <img class="avatar size24" src="//si0.twimg.com/profile_images/3745479030/532c15d5cf909e05b4fec5044bc780b0_mini.jpeg">
						                        <div class="typeahead-user-item-info">
						                            <span class="fullname">컴퓨터 SW 봇</span>
						                            <span class="js-verified hidden"><span class="icon verified"><span class="visuallyhidden">인증된 계정</span></span></span>
						                            <span class="username"><s>@</s><b>computers_bot</b></span>
						                        </div>
						                        </a>
						                        </li>
						                        <li class="js-selectable typeahead-accounts-shortcut js-shortcut" style="display: none;"><a class="js-nav" href="/search/users?q=%40computers_bot" data-search-query="@computers_bot" data-query-source="typeahead_click" data-shortcut="true" data-ds="account_search"><strong>@computers_bot</strong>에 대한 모든 인물 검색</a></li>
						                    </ul>
						                    <ul class="typeahead-items typeahead-topics block1" style="display: none;">
						                    </ul>
						                </div>
						            </div>
						            <textarea class="tweet-box-shadow" name="status" id="tweet-box-reply-to-363194029590056960"></textarea>
						            <div class="thumbnail-container">
						                <div class="preview">
						                    <a class="dismiss js-dismiss" href="#" tabindex="-1"><i class="dismiss-white"></i></a>
						                    <span class="filename"></span>
						                </div>
						                <div class="preview-message">
						                    이미지는 링크로 표시됩니다
						                </div>
						            </div>
						        </div>
						        <div class="toolbar js-toolbar" role="toolbar">
						            <div class="tweet-box-extras">
						                <div class="photo-selector">
						                    <button aria-hidden="true" class="btn" type="button" tabindex="-1">
						                    <i class="tweet-camera"></i>
						                    </button>
						                    <div class="image-selector">
						                        <input type="hidden" name="media_data[]" class="file-data" value="">
						                        <label for="tweet-box-reply-to-363194029590056960">
						                        <span class="visuallyhidden">사진 추가</span>
						                        <input type="file" name="media[]" class="file-input" tabindex="-1">
						                        </label>
						                        <div class="swf-container">
						                        </div>
						                    </div>
						                </div>
						                <div class="geo-picker">
						                    <button class="btn geo-picker-btn" type="button" tabindex="-1" title="위치 서비스를 사용할 수 없습니다">
						                    <i class="tweet-geo"><span class="visuallyhidden">위치 추가</span></i><span class="caret"></span>
						                    </button>
						                    <span class="dropdown-container"></span>
						                    <span class="geo-status">위치 서비스를 사용할 수 없습니다</span>
						                    <input type="hidden" name="place_id" value="">
						                </div>
						            </div>
						            <div class="tweet-button">
						                <span class="spinner"></span>
						                <span class="tweet-counter">118</span>
						                <button class="btn primary-btn tweet-action" type="button">트윗하기</button>
						            </div>
						        </div>
						    </form>
						</div>                        
                        <div class="content-footer">
                            <div class="footer-inner">
								<ol class="expanded-conversation expansion-container js-expansion-container js-navigable-stream" style="height: auto;">
								    <li class="">
								    <div class="simple-tweet tweet js-stream-tweet js-actionable-tweet js-profile-popup-actionable descendant " data-feedback-key="stream_status_362965890880372737" data-tweet-id="362965890880372737" data-item-id="362965890880372737" data-screen-name="Shiroi_FILKB" data-name="FILKB.QS Type. Iznal" data-user-id="620861736" data-has-parent-tweet="true" data-expanded-footer="&lt;div class=&quot;js-tweet-details-fixer tweet-details-fixer&quot;&gt; &lt;div class=&quot;js-tweet-media-container &quot;&gt;&lt;/div&gt; &lt;div class=&quot;entities-media-container &quot; style=&quot;min-height:0px&quot;&gt; &lt;/div&gt; &lt;div class=&quot;js-machine-translated-tweet-container&quot;&gt;&lt;/div&gt; &lt;div class=&quot;js-tweet-stats-container tweet-stats-container &quot;&gt; &lt;/div&gt; &lt;div class=&quot;client-and-actions&quot;&gt; &lt;span class=&quot;metadata&quot;&gt; &lt;span title=&quot;13년 8월 2일 - 12:59 AM&quot;&gt;13년 8월 2일 - 12:59 AM&lt;/span&gt; &amp;middot; &lt;a class=&quot;permalink-link js-permalink js-nav&quot; href=&quot;/Shiroi_FILKB/status/362965890880372737&quot; tabindex=&quot;-1&quot;&gt;자세히&lt;/a&gt; &lt;/span&gt; &lt;/div&gt; &lt;/div&gt; " data-mentions="computers_bot" data-component-context="replies">
								        <i class="dogear"></i>
								        <div class="content">
								            <div class="stream-item-header">
								                <a class="account-group js-account-group js-action-profile js-user-profile-link js-nav" href="/Shiroi_FILKB" data-user-id="620861736">
								                <img class="avatar js-action-profile-avatar" src="https://si0.twimg.com/profile_images/378800000225549664/4a9af72837568e10b67994cc5ef61cf3_normal.jpeg" alt="">
								                <strong class="fullname js-action-profile-name show-popup-with-id">FILKB.QS Type. Iznal</strong>
								                <span>‏</span><span class="username js-action-profile-name"><s>@</s><b>Shiroi_FILKB</b></span>
								                </a>
								                <small class="time">
								                <a href="/Shiroi_FILKB/status/362965890880372737" class="tweet-timestamp js-permalink js-nav" title="13년 8월 2일 - 12:59 AM"><span class="_timestamp js-short-timestamp js-relative-timestamp" data-time="1375372786" data-long-form="true">14시간</span></a>
								                </small>
								            </div>
								            <p class="js-tweet-text tweet-text">
								                <a href="/computers_bot" class="twitter-atreply pretty-link" dir="ltr"><s>@</s><b>computers_bot</b></a> 전형적인 Backtracking문제이군요.. ㅋㅋ 위에서부터 각각 2, 4 ,1, 3번쨰 칸에 놓으면 되지요 ㅎ
								            </p>
								            <div class="stream-item-footer">
								                <a class="details with-icn js-details" href="/Shiroi_FILKB/status/362965890880372737">
								                <span class="details-icon js-icon-container">
								                </span>
								                <b>
								                <span class="simple-details-link">자세히</span>
								                <span class="expand-stream-item js-view-details">
								                <span class="expand-action-wrapper">
								                펼치기 </span>
								                </span>
								                <span class="collapse-stream-item js-hide-details">
								                접기 </span>
								                </b>
								                </a>
								                <ul class="tweet-actions js-actions">
								                    <li class="action-reply-container">
								                    <a role="button" class="with-icn js-action-reply" data-modal="tweet-reply" href="#">
								                    <span class="icon sm-reply"></span>
								                    <b>답글</b>
								                    </a>
								                    </li>
								                    <li class="action-rt-container js-toggle-state js-toggle-rt">
								                    <a role="button" class="with-icn retweet" data-modal="tweet-retweet" href="#">
								                    <span class="icon sm-rt"></span>
								                    <b>리트윗</b>
								                    </li>
								                    <li class="more-tweet-actions">
								                    <div class="action-more-container">
								                        <div class="dropdown">
								                            <button type="button" class="btn-link with-icn dropdown-toggle">
								                            <i class="sm-more"></i>
								                            <b>더 보기</b>
								                            </button>
								                            <ul class="dropdown-menu">
								                                <li class="dropdown-caret">
								                                <span class="caret-outer"></span>
								                                <span class="caret-inner"></span>
								                                </li>
								                                <li class="share-via-email">
								                                <a class="js-share-via-email" href="#" data-nav="share_tweet">이메일로 공유하기</a>
								                                </li>
								                                <li class="embed-link">
								                                <a class="js-embed-tweet" href="#" data-nav="embed_tweet">트윗 담아가기</a>
								                                </li>
								                            </ul>
								                        </div>
								                    </div>
								                    </li>
								                </ul>
								            </div>
								            <div class="expanded-content js-tweet-details-dropdown">
								            </div>
								        </div>
								    </div>
								    </li>
								</ol>      
                            </div>
                        </div>                        
                        <div class="content-footer">
                            <div class="footer-inner">
                                <span><a class="btn primary-btn tweet-action" type="button" href="/news/${getArticle.num}/form">수정</a></span>
                                <span><a class="btn primary-btn tweet-action" type="button" href="/news/form">삭제</a></span>      
                            </div>
                        </div>                        
                    </div>
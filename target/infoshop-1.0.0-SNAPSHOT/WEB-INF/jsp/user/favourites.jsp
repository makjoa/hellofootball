<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/modules/app/tc.js"></script>
                    <div class="dashboard" style="width: 302px; float:left;">
                        <div class="module mini-profile">
                            <div class="flex-module profile-summary js-profile-summary">
                                <a href="/mouse208" class="account-summary account-summary-small js-nav" data-nav="profile">
                                <div class="content">
                                    <div class="account-group js-mini-current-user" data-user-id="129483340" data-screen-name="mouse208">
                                        <img class="avatar size32" src="https://si0.twimg.com/profile_images/1157074264/38_4_normal.jpg" alt="최중섭" data-user-id="129483340">
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
                                <li class=""><a class="list-link js-nav" href="/user/settings/account" data-nav="account">계정 <i class="chev-right"></i></a></li>
                                <li class=""><a class="list-link js-nav" href="/user/settings/password" data-nav="password">비밀번호<i class="chev-right"></i></a></li>
                                <li class=""><a class="list-link js-nav" href="/user/settings/devices" data-nav="devices">모바일 <i class="chev-right"></i></a></li>
                                <li class=""><a class="list-link js-nav" href="/user/settings/notifications" data-nav="notifications">이메일 알림 <i class="chev-right"></i></a></li>
                                <li class=""><a class="list-link js-nav" href="/user/settings/profile" data-nav="profile">프로필 <i class="chev-right"></i></a></li>
                                <li class=""><a class="list-link js-nav" href="/user/settings/design" data-nav="design">디자인 <i class="chev-right"></i></a></li>
                                <li class="active"><a class="list-link js-nav" href="/user/settings/favourites" data-nav="connections">좋아하는 클럽<i class="chev-right"></i></a></li>
                                <li class=""><a class="list-link" href="/settings/widgets" data-nav="widgets">위젯 <i class="chev-right"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="content-main" style="width: 681px;">
                        <div class="content-header">
                            <div class="header-inner">
                                <h2>관심사</h2>
                                <p class="subheader">
                                    ..
                                </p>
                            </div>
                        </div>                        
                        <div class="content-inner no-stream-end widgets">
                            <form class="js-search-form content-searchbar form-horizontal" action="/user/updateFav" method="POST" id="fav_form">                            
                                <div id="settings-alert-box" class="alert hidden">
                                    <i id="settings-alert-close" class="close"></i>
                                </div>                                
                                <fieldset id="profile-image-controls" class="control-group">
									<div class="row clearfix">
									    <h2>선택</h2>
									    <ul class="widgets-source nav-tabs">
									        <li class="active">
									        <a href="">
									        클럽 </a>
									        </li>
									        <li>
									        <a href="">
									        선수 </a>
									        </li>
									    </ul>		                                  							    
									</div>
									<div class="row clearfix">
										<div class="options-column">
                                            <h2>클럽 검색</h2>										    
									        <table class="flex-table">
									        <tbody>
									        <tr>
									            <td class="flex-table-primary">
									                <div class="flex-table-form club">
									                    <input class="flex-table-input search-query dropdown-toggle" data-toggle="dropdown" type="text" id="clubq" name="q" data-target="clubListData" data-url="clubs/q/json" placeholder="이름으로 검색" spellcheck="false" autocomplete="off">
									                    <div class="dropdown-menu typehead" aria-labelledby="clubq">
									                        <div class="dropdown-caret left">
									                            <div class="caret-outer">
									                            </div>
									                            <div class="caret-inner">
									                            </div>
									                        </div>
									                        <div class="dropdown-inner js-typeahead-results">
									                            <div class="typeahead-accounts js-typeahead-accounts has-results" style="display: block;">
									                                <ul class="typeahead-items" id="clubListData">
									                                <li></li>
									                                </ul>
									                            </div>
									                        </div>
									                    </div>
									                </div>
									            </td>
									        </tr>
									        </tbody>
									        </table>										    
										</div>
									    <div class="preview-column">									       
											<div id="preview" class="preview follow-exactly-two" data-url="/settings/widgets/preview">
                                                <div class="stream-item-content clearfix stream-item-activity stream-item-follow stream-item-activity-network" data-activity-type="follow" data-activity-min-position="1362789672000" data-activity-max-position="1362840655000" data-component-context="follow_activity">
													<div class="stream-item-activity-header">
													    <div class="activity-additional-info" style="display: none;">
													        <div class="activity-timestamp">
													            <span class="_timestamp" data-time="1362840655" data-long-form="true">3월 9일</span>
													        </div>
													    </div>
													    <div class="stream-item-activity-line js-actionable-user stream-item-activity-line-network">
													        <span class="js-user-profile-link"><img height="16" width="16" src="/resources/images/premiership/11.png" alt="탁 현 민" title="tak0518" class="avatar size16 user-profile-link" data-user-id="96767296"></span>
													        <a class="pretty-link js-user-profile-link js-action-profile-name" href="" data-user-id="96767296"><strong class="fullname">추가된 클럽</strong></a>
													        <b class="activity-type"><i class="activity-follow"></i></b>
													    </div>
													</div>                                                											 
													<ol class="activity-supplement follow-exactly-two" id="clubPreview">
													
													</ol>
                                                </div>													    									
											</div>									    									    		     
									    </div>
									</div>
                                </fieldset>                                 
                                <hr>
                                <div class="form-actions">
                                    <button id="settings_save" class="btn primary-btn" type="submit">변경사항 저장하기</button>
                                </div>
                                </form>
                                </div>
                            </div>                            
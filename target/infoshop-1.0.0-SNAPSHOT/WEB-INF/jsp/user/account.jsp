<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
			        <div class="dashboard" style="width: 302px; float:left;">
			            <div class="module mini-profile">
			                <div class="flex-module profile-summary js-profile-summary">
			                    <div class="account-summary account-summary-small js-nav" data-nav="profile">
				                    <div class="content">
				                        <div class="account-group js-mini-current-user" data-user-id="129483340" data-screen-name="mouse208">
				                            <img class="avatar size32" src="https://si0.twimg.com/profile_images/1157074264/38_4_normal.jpg" alt="최중섭" data-user-id="129483340">
				                            <a href="/mouse208"><b class="fullname">최중섭</b></a>
				                            <small class="metadata">
				                            내 프로필 페이지 보기 </small>
				                        </div>
				                    </div>
			                    </div>
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
			        <div class="content-main" style="width: 681px;">
			            <div class="content-header">
			                <div class="header-inner">
			                    <h2>계정</h2>
			                    <p class="subheader">
			                        기본 계정, 언어, 트윗 공개여부, 위치 설정을 변경하세요
			                    </p>
			                </div>
			            </div>
			            <div class="content-inner no-stream-end">
			                <form id="account-form" class="form-horizontal requires-password" method="POST" action="https://twitter.com/settings/accounts/update">
			                    <div id="settings-alert-box" class="alert hidden">
			                        <i id="settings-alert-close" class="close"></i>
			                    </div>
			                    <input type="hidden" value="PUT" name="_method">
			                    <input type="hidden" name="authenticity_token" value="">
			                    <fieldset id="username_fieldset" class="control-group">
			                        <label for="user_screen_name" class="control-label">사용자 아이디</label>
			                        <div class="controls">
			                            <p id="username_notification" class="notification">
			                            </p>
			                            <input id="user_screen_name" maxlength="15" name="user[screen_name]" type="text" value="${userInfo.name}">
			                            <p class="notification">
			                                https://twitter.com/<span id="username_path">"${userInfo.name}</span>
			                            </p>
			                        </div>
			                    </fieldset>
			                    <fieldset id="email_fieldset" class="control-group">
			                        <label for="user_email" class="control-label">이메일 주소</label>
			                        <div class="controls">
			                            <p id="email_notification" class="notification">
			                            </p>
			                            <input id="user_email" class="email-input" name="user[email]" type="text" value="${userInfo.email}">
			                            <p>
			                                이메일은 <a href="https://support.twitter.com/articles/15356" target="_blank">공개되지 않습니다.</a>
			                            </p>
			                            <label class="checkbox">
			                            <input id="user_discoverable_by_email" name="user[discoverable_by_email]" type="checkbox" value="1" checked="">
			                            다른 사용자들이 이메일 주소로 나를 찾을 수 있게 합니다 </label>
			                            <input type="hidden" value="0" name="user[discoverable_by_email]">
			                        </div>
			                    </fieldset>
			                    <hr>
			                    <fieldset class="control-group">
			                        <label for="user_lang" class="control-label">언어</label>
			                        <div class="controls">
			                            <select id="user_lang" name="user[lang]">
			                                <option>언어 선택하기...</option>
			                                <option value="nl">네덜란드어 - Nederlands</option>
			                                <option value="no">노르웨이어 - Norsk</option>
			                                <option value="da">덴마크어 - Dansk</option>
			                                <option value="de">독일어 - Deutsch</option>
			                                <option value="ru">러시아어 - Русский</option>
			                                <option value="fr">불어 - français</option>
			                                <option value="sv">스웨덴어 - Svenska</option>
			                                <option value="es">스페인어 - Español</option>
			                                <option value="ar">아랍어 - العربية</option>
			                                <option value="en">영어 - English</option>
			                                <option value="ur">우르두어 - اردو</option>
			                                <option value="it">이탈리아어 - Italiano</option>
			                                <option value="id">인도네시아어 - Bahasa Indonesia</option>
			                                <option value="ja">일본어 - 日本語</option>
			                                <option value="zh-cn">중국어 간체 - 简体中文</option>
			                                <option value="zh-tw">중국어 번체 - 繁體中文</option>
			                                <option value="fil">필리핀어 - Filipino</option>
			                                <option value="ko" selected="">한국어</option>
			                                <option value="hu">헝가리어 - Magyar</option>
			                                <option value="he">히브리어 - עִבְרִית</option>
			                                <option value="hi">힌디어 - हिन्दी</option>
			                            </select>
			                            <p>
			                                트위터 번역에 관심 있으세요? <a href="http://translate.twttr.com">번역 센터</a>를 방문해보세요.
			                            </p>
			                        </div>
			                    </fieldset>
			                    <fieldset class="control-group">
			                        <label for="user_time_zone" class="control-label">시간대</label>
			                        <div class="controls">
			                            <select id="user_time_zone" name="user[time_zone]">
			                                <option data-offset="-36000" value="Hawaii">(GMT-10:00) Hawaii</option>
			                                <option data-offset="-32400" value="Alaska">(GMT-09:00) Alaska</option>
			                                <option data-offset="-18000" value="Indiana (East)">(GMT-05:00) Indiana (East)</option>
			                                <option data-offset="" value="">-------------</option>
			                                <option data-offset="-39600" value="International Date Line West">(GMT-11:00) International Date Line West</option>
			                                <option data-offset="-39600" value="Midway Island">(GMT-11:00) Midway Island</option>
			                                <option data-offset="-39600" value="Samoa">(GMT-11:00) Samoa</option>
			                                <option data-offset="-28800" value="Tijuana">(GMT-08:00) Tijuana</option>
			                                <option data-offset="-25200" value="Chihuahua">(GMT-07:00) Chihuahua</option>
			                            </select>
			                        </div>
			                    </fieldset>
			                    <hr>
			                    <fieldset id="user_protected_fieldset" class="control-group">
			                        <div id="protected_verified_dialog" class="modal-container">
			                            <div class="close-modal-background-target">
			                            </div>
			                            <div class="modal modal-small draggable">
			                                <div class="modal-content">
			                                    <button type="button" class="modal-btn modal-close js-close"><i class="close-medium"><span class="visuallyhidden">닫기</span></i></button>
			                                    <div class="modal-header">
			                                        <h3 class="modal-title">경고!</h3>
			                                    </div>
			                                    <div class="modal-body">
			                                        <p>
			                                            죄송합니다. 트위터는 공개 계정만 인증할 수 있습니다. 비공개 계정으로 변경할 경우, 인증 표시가 없어집니다.
			                                        </p>
			                                    </div>
			                                    <div class="modal-footer">
			                                        <button id="stay_verified_link" class="btn" type="button">인증 유지</button>
			                                        <button id="protect_my_tweets_link" class="btn primary-btn" type="button">내 트윗을 비공개</button>
			                                    </div>
			                                </div>
			                            </div>
			                        </div>
			                        <label for="user_protected" class="control-label">트윗 비공개</label>
			                        <div class="controls">
			                            <label class="checkbox">
			                            <input id="user_protected" name="user[protected]" type="checkbox" value="1"> 내 트윗을 비공개 </label>
			                            <input type="hidden" value="0" name="user[protected]">
			                            <p>
			                                선택한 일부 사람들에 한해 내 트윗을 볼 수 있게 합니다. 다만 이전에 올린 트윗은 일부 플랫폼에서 누구나 볼 수 있습니다. <a href="https://support.twitter.com/articles/14016" target="_blank">더 알아보기</a>
			                            </p>
			                        </div>
			                    </fieldset>
			                    <hr>
			                    <fieldset class="control-group">
			                        <label for="user_country" class="control-label">국가</label>
			                        <div class="controls">
			                            <select id="user_country" name="user[country]">
			                                <option value="xx">전세계</option>
			                                <option value="kr" selected="">대한민국</option>
			                                <option value="dk">덴마크</option>
			                                <option value="de">독일</option>
			                                <option value="ru">러시아</option>
			                                <option value="ar">아르헨티나</option>
			                                <option value="ie">아일랜드</option>
			                                <option value="af">아프가니스탄</option>
			                                <option value="gb">영국</option>
			                                <option value="jp">일본</option>
			                                <option value="cm">카메룬</option>
			                                <option value="ca">캐나다</option>
			                                <option value="ke">케냐</option>
			                            </select>
			                            <p>
			                                국가를 선택하세요. 이 설정은 현재 사용중인 브라우저에 저장됩니다.
			                            </p>
			                        </div>
			                    </fieldset>
			                    <hr>
			                    <div class="form-actions">
			                        <button id="settings_save" class="btn primary-btn" type="submit" disabled="disabled">변경사항 저장하기</button>
			                    </div>
			                    <div id="password_dialog" class="modal-container">
			                        <div class="close-modal-background-target">
			                        </div>
			                        <div class="modal modal-small draggable">
			                            <div class="modal-content">
			                                <button type="button" class="modal-btn modal-close js-close"><i class="close-medium"><span class="visuallyhidden">닫기</span></i></button>
			                                <div class="modal-header">
			                                    <h3 class="modal-title">계정 변경사항 저장하기</h3>
			                                </div>
			                                <div class="modal-body">
			                                    <p>
			                                        계정 변경사항을 저장하려면 비밀번호를 입력하세요.
			                                    </p>
			                                    <div class="input-wrapper password-wrapper">
			                                        <input class="input-block" id="auth_password" name="auth_password" type="password" placeholder="비밀번호">
			                                        <small>
			                                        <a href="/account/resend_password" id="forgot_password">비밀번호를 잊으셨나요?</a>
			                                        <span id="reminder_sent" style="visibility: hidden">메일을 보냈습니다!</span>
			                                        </small>
			                                    </div>
			                                </div>
			                                <div class="modal-footer">
			                                    <button class="btn" id="cancel_password_button">취소하기</button>
			                                    <button type="submit" id="save_password" class="btn primary-btn modal-submit" disabled="disabled">변경사항 저장하기</button>
			                                </div>
			                            </div>
			                        </div>
			                    </div>
			                    <hr>
			                    <fieldset class="control-group">
			                        <div class="controls">
			                            <p>
			                                <a id="account_deactivate_link" href="/settings/accounts/confirm_deactivation">트위터 회원 탈퇴하기</a>
			                            </p>
			                        </div>
			                    </fieldset>
			                </form>
			            </div>
			        </div>
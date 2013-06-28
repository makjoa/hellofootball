<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
			        <div class="dashboard" style="width: 302px; float:left;">
			            <div class="module mini-profile">
			                <div class="flex-module profile-summary js-profile-summary">
			                    <a href="/mouse208" class="account-summary account-summary-small js-nav" data-nav="profile">
			                    <div class="content">
			                        <div class="account-group js-mini-current-user" data-user-id="129483340" data-screen-name="mouse208">
			                            <img class="avatar size32" src="https://si0.twimg.com/profile_images/1157074264/38_4_normal.jpg" alt="최중섭" data-user-id="129483340">
			                            <b class="fullname">관리자</b>
			                        </div>
			                    </div>
			                    </a>
			                </div>
			            </div>
			            <div class="module">
			                <ul class="js-nav-links">
			                    <li class="active"><a class="list-link js-nav" href="/user/settings/account" data-nav="account">유저 <i class="chev-right"></i></a></li>
			                    <li class=""><a class="list-link js-nav" href="/user/settings/password" data-nav="password">클럽<i class="chev-right"></i></a></li>
			                    <li class=""><a class="list-link js-nav" href="/user/settings/devices" data-nav="devices">선수<i class="chev-right"></i></a></li>
			                    <li class=""><a class="list-link" href="/user/settings/widgets" data-nav="widgets">위젯 <i class="chev-right"></i></a></li>
			                </ul>
			            </div>
			        </div>
			        <div class="content-main" style="width: 681px;">
			            <div class="content-header">
			                <div class="header-inner">
			                    <h2>클럽</h2>
			                    <p class="subheader">
			                        
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
                                <h5 class="masthead noborder">Showing "Season 2012/13"</h5>
					            <table class="table table-bordered clubTable">
					              <thead>
					                <tr>
					                  <th></th>
					                  <th>로고</th>
					                  <th>UNIQUE_ID</th>
					                  <th>클럽이름</th>
					                  <th>수정됨</th>
					                  <th>소속리그</th>
					                </tr>
					              </thead>
					              <tbody>
					                <tr>
					                  <td>1</td>
					                  <td>1</td>
					                  <td>1</td>
					                  <td>TB - Monthly</td>
					                  <td>01/04/2012</td>
					                  <td>Approved</td>
					                </tr>
					                <tr>
					                  <td>2</td>
					                  <td>2</td>
					                  <td>2</td>
					                  <td>TB - Monthly</td>
					                  <td>02/04/2012</td>
					                  <td>Declined</td>
					                </tr>
					                <tr>
					                  <td>3</td>
					                  <td>3</td>
					                  <td>3</td>
					                  <td>TB - Monthly</td>
					                  <td>03/04/2012</td>
					                  <td>Pending</td>
					                </tr>
					                <tr>
					                  <td>4</td>
					                  <td>4</td>
					                  <td>4</td>
					                  <td>TB - Monthly</td>
					                  <td>04/04/2012</td>
					                  <td>Call in to confirm</td>
					                </tr>
					              </tbody>
					            </table>        

			                    <hr>
			                    <fieldset class="control-group">
			                        <div class="controls">
			                            <p>
			                                <a id="account_deactivate_link" href="/settings/accounts/confirm_deactivation"></a>
			                            </p>
			                        </div>
			                    </fieldset>
			                </form>
			            </div>
			        </div>
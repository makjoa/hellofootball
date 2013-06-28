<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/modules/app/tc.js"></script>
                    <div class="dashboard" style="width: 332px; float:left;">
                        <div class="module mini-profile">
                            <div class="flex-module profile-summary js-profile-summary">
                                <a href="/mouse208" class="account-summary account-summary-small js-nav" data-nav="profile">
                                <div class="content">
                                    <div class="account-group js-mini-current-user" data-user-id="129483340" data-screen-name="mouse208">
                                        <img class="avatar size32" src="https://si0.twimg.com/profile_images/1157074264/38_4_normal.jpg" alt="최중섭" data-user-id="129483340">
                                        <b class="fullname"></b>
                                        <small class="metadata">
                                        </small>
                                    </div>
                                </div>
                                </a>
                            </div>
                        </div>
                        <div class="module">
                            <div class="flex-module">
	                            <div class="flex-module-header">
	                                <h3>컨텐츠</h3>
	                            </div>
	                            <div class="flex-module-inner">
	                                <form class="js-search-form content-searchbar" action="#" method="POST">
		                                <table class="flex-table">
			                                <tbody>
				                                <tr>
				                                    <td class="flex-table-primary">
				                                        <div class="flex-table-form club">
				                                            <input class="flex-table-input search-query" type="text" id="playername" name="q" data-target="clubListData" data-url="clubs/q/json" placeholder="이름 혹은 @아이디로 입력" spellcheck="false" autocomplete="off">                                                                                                                                    
				                                        </div>
				                                    </td>
				                                    <td class="flex-table-secondary" style="padding-right: 10px;">
				                                        <button class="btn flex-table-btn js-submit" type="button" id="addplayer">추가하기</button>
				                                    </td>	                                                                     
				                                </tr>
			                                </tbody>
		                                </table>
	                                </form>	                                
	                            </div>
	                            <div class="flex-module-inner" id="player_list">
                                    <div id="player_list" class="player_list ui-droppable" style="padding: 12px;">
                                        <table class="flex-table" id="player_table">
                                            <tbody>
                                                <tr height="22">
                                                    <td class="flex-table-primary" style="width: 1%;">
                                                        <strong>Name</strong>
                                                    </td>
                                                    <td class="flex-table-secondary" style="padding-left: 120px;">
                                                        <a href="#" class="delete_players"><strong>모두제거</strong></a>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>	                            
	                            </div>                        
                            </div>
                        </div>
                    </div>
                    <div class="content-main" style="width: 651px;">
                        <div class="content-header">
                            <div class="header-inner">
                                <h2>클럽</h2>
                                <p class="subheader">
                                    .
                                </p>
                            </div>
                            <form class="js-search-form content-searchbar" action="#" method="POST">
                                <table class="flex-table">
                                <tbody>
                                <tr>
                                    <td class="flex-table-primary">
                                        <div class="flex-table-form club">
                                            <input class="flex-table-input search-query dropdown-toggle" data-toggle="dropdown" type="text" id="clubq" name="q" data-target="clubListData" data-url="clubs/q/json" placeholder="이름 혹은 @아이디로 검색" spellcheck="false" autocomplete="off">
                                            <div class="dropdown-menu typehead" aria-labelledby="clubq">
                                                <div class="dropdown-caret left">
                                                    <div class="caret-outer"></div>
                                                    <div class="caret-inner"></div>
                                                </div>
                                                <div class="dropdown-inner js-typeahead-results">                                            
													<div class="typeahead-accounts js-typeahead-accounts has-results" style="display: block;">
													    <ul class="typeahead-items" id="clubListData">
		
													    </ul>
													</div>
												</div>
                                            </div>											                                                                                            
                                        </div>
                                    </td>
                                    <td class="flex-table-secondary">
                                        <button class="btn flex-table-btn js-submit" type="submit">클럽 검색하기</button>
                                    </td>
                                    <td class="flex-table-primary">
                                        <div class="flex-table-form people">
                                            <input class="flex-table-input search-query dropdown-toggle" data-toggle="dropdown" type="text" id="plq" name="q" data-target="peopleListData" data-url="peoples/q/json" placeholder="이름 혹은 @아이디로 검색" spellcheck="false" autocomplete="off">
											<div class="dropdown-menu typehead" aria-labelledby="plq">
											     <div class="dropdown-caret left">
											         <div class="caret-outer"></div>
											         <div class="caret-inner"></div>
											     </div>
											     <div class="dropdown-inner js-typeahead-results">                                            
											         <div class="typeahead-accounts js-typeahead-accounts has-results" style="display: block;">
											             <ul class="typeahead-items" id="peopleListData">
											
											             </ul>
											         </div>
											     </div>
											</div>
                                        </div>
                                    </td>
                                    <td class="flex-table-secondary">
                                        <button class="btn flex-table-btn js-submit" type="submit">선수 검색하기</button>
                                    </td>                                    
                                </tr>
                                </tbody>
                                </table>
                            </form>
                        </div>
                        <div class="content-inner no-stream-end ui-droppable" id="field" style="padding:5px;">                        
                            <img id="field_image" src="<%=request.getContextPath()%>/resources/images/pitch.jpg" alt="">
                        </div>                        
                    </div>
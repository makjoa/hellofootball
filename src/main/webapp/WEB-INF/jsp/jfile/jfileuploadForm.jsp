<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.ibizsoftware.com/tags/jsp" prefix="jwork"%>
<input type="hidden" id="totalFileSize" value="0" />
<div id="swfupload-control" class="swfupload-control">  
	<div id="wrap">
	  <h1>파일 첨부</h1>
	  <div id="attach-header" class="attach-header enable-cloud-menu">
	    <div id="tx_file_attach_layer">
	        <div id="tx_file_attach_button">
                <span id="spanButtonPlaceHolder" class="swfupload"></span>	                
	        </div>
	        <form id="attachment" name="attachment" method="post" action="/attachments" enctype="multipart/form-data">
	            <input type="hidden" id="attachurl" value="${url}" />
	            <input type="hidden" id="filemime" value="${type}" />
	            <input type="hidden" id="filename" value="${filename}" />
	            <input type="hidden" id="filesize" value="${filesize}" />            
	        </form>
	
	    </div>
	    <p>최대 <strong id="max_top_size" class="point nospacing">20M</strong>까지 첨부하실 수 있습니다.</p>
	  </div>
	  <div id="attach-box" class="attach-box box-empty">
	    <div id="delete_all" class="imgbtn"><a title="전체삭제" href="javascript:;" class="btnlink">전체삭제</a></div>
	    <div id="size">파일: <strong id="up_size">0</strong> / <span id="max_size" class="nospacing">20MB</span><span id="group_size"></span></div>
	    <div class="progress" id="progress">
	        <div id="progress-bar" class="progress-bar">
	            <div><img src="http://i1.daumcdn.net/icon/editor/file/ico_warning.gif" alt="음악 파일의 저작권 여부를 판단중"/></div>
	            <p class="percent">0%</p>
	        </div>
	        <p class="copy uploading-copy">파일을 업로드하는 중입니다.</p><p class="copy checking-copy">음악 파일의 저작권 여부를 판단중입니다.</p></div>
	    <div class="list" id="describe">
	      <p id="empty_header">첨부하실 파일을 추가해 주세요!</p>
	      <p id="empty_desc">최대 <span id="max_list_size"></span>까지 첨부할 수 있습니다.</p>
	    </div>
	    <ul class="list" id="list"></ul>
	  </div>
	  <dl id="attach-alert" class="attach-alert">
	    <dt>저작권을 보호해 주세요!</dt>
	    <dd>저작권자의 허락 없이 임의로 저작물<strong class="point">(음악, 동영상, 사진, 글 등)</strong>을<br />
	      인터넷 게시판에 올릴 경우 <strong class="point">관련 법령에 의하여 처벌</strong>을 받을 수 있습니다.</dd>
	    <dd><a href="http://clean.daum.net/copyright/copyright1.html" target="_blank">자세한 내용 보기</a> </dd>
	  </dl>
	   <div id="ss_copyright">
	    <h2>음원 저작권 필터링 안내</h2>
	    <p>음원 필터링 시스템은 저작권 침해로 인한 문제로부터 회원 여러분을 보호하기 위한 조치로 현재 모든 음원의 저작권 침해여부를 파악할 수 없습니다. 이용자여러분의 자발적인 주의와 참여가 필요합니다.</p>
	    <!-- TODO : blog는 위 링크를 http://blog.daum.net/ahahblog/13757174 로 사용한다 -->
	  </div>
	  <ul id="attach-footer" class="attach-footer">
	    <li id="submit" class="imgbtn"><a href="#" onclick="submit();" title="등록" class="btnlink">등록</a></li>
	    <li id="cancel" class="imgbtn"><a href="#" onclick="closeWindow();" title="취소" class="btnlink">취소</a></li>
	    <li id="close" class="imgbtn"><a href="#" onclick="closeWindow();" title="닫기" class="btnlink">닫기</a></li>
	  </ul>
	  <div id="tx_fhr_div"><div id="tx_fhr_target"></div></div> 
	</div>
    <div class="middle">
        <div class="title">
            <div class="title_left">*첨부파일</div>
            <div class="title_right">
                <div class="content">
                <table width="100%" cellpadding="0" cellspacing="0" style="border-collapse: collapse;" class="board_view3">
                    <col width="130px"/><col width="200px"/>
                    <tr>
                        <td>파일총 사이즈 : <span id="totalFileSizeDisplay">0 Byte</span></td>
                        <td><span id="spanButtonAllDown" class="allDown"><button onclick="return false;" /></span></td>
                    </tr>
                </table>
                </div>  
            </div>
        </div>
        <div>
            <div class="content">
                <div class="content_left">
                    <span id="spanButtonPlaceHolder" class="swfupload"></span>
                    <span id="spanThumbnail" class="thumbnail"><img src="${ctx}/resources/swfupload/images/preview_img.gif" /></span>       
                </div>
                <div class="content_right">
                    <div style="width: 100%">
                    <table id="fileAreaTable"  width="100%" cellpadding="0" cellspacing="0" style="border-collapse: collapse;" class="board_view2">
                        <col width="300px"/><col width="100px"/><col width="200px"/><col width="60px"/><col width="50px"/>
                        <tr>
                            <th class="top" style="background-image: url('${ctx}/resources/swfupload/images/text-bg.gif');background-repeat: repeat-x;">파일명</th>
                            <th class="top" style="background-image: url('${ctx}/resources/swfupload/images/text-bg.gif');background-repeat: repeat-x;">사이즈</th>
                            <th class="top" style="background-image: url('${ctx}/resources/swfupload/images/text-bg.gif');background-repeat: repeat-x;">업로드 진행바</th>
                            <th class="top" style="background-image: url('${ctx}/resources/swfupload/images/text-bg.gif');background-repeat: repeat-x;">다운로드</th>
                            <th class="topend" style="background-image: url('${ctx}/resources/swfupload/images/text-bg.gif');background-repeat: repeat-x;">삭제</th>
                        </tr>
                        <tr id="noDataRow">
                            <td class="all_txt" colspan="5">첨부된 파일이 없습니다.</td>
                        </tr>
                    </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
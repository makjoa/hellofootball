<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Daum에디터 - 파일 첨부</title> 
<script type="text/javascript" src="<%=request.getContextPath()%>/common/js/jquery-1.9.0.min.js"></script>
<script src="http://s1.daumcdn.net/editor/releases/6.94/js/editor_cafe.js" type="text/javascript" charset="utf-8"></script>
<script src="../../js/popup.js" type="text/javascript" charset="utf-8"></script>
<style type="text/css">
    html, body { overflow:hidden; }
    body { margin:0; padding:0; background-color:#a0a0a0; }
    dl, dt, dd, ul, ol, li, p { margin:0; padding:0; list-style:none; }
    #wrap {
        width:450px;
        margin:0 auto;
        background-color:#fff;
        font-family:"돋움", dotum, sans-serif;
        font-size:11px;
        letter-spacing:-1px;
    }
    img { border:none; }
    .nospacing { letter-spacing:0; }
    .separator { color:#ddd; margin:0 4px; }
    .point { font-weight:normal; color:#a7b9ec; }
    .imgbtn { background-repeat:no-repeat; }
    .btnlink { text-indent:-5000px; display:block; }
    h1 { margin:0; padding:0 20px; height:34px; line-height:34px; background-image:url(http://i1.daumcdn.net/icon/editor/file/bg_top.gif?rv=1.0.1); font-family:'굴림', gulim, sans-serif; font-size:12px; color:#fff; }
    .attach-header { position:relative; z-index:100; color:#999; padding:0 17px 13px 18px; }
    .attach-header p { background:url(http://i1.daumcdn.net/icon/editor/file/b_info.gif?rv=1.0.1) 0 18px no-repeat; padding:19px 0 0 17px; }
    
    .attach-box { height:165px; background:#fff url(http://i1.daumcdn.net/icon/editor/file/bg_content.gif?rv=1.0.1) no-repeat; margin:0 15px; padding:0 14px 0 13px; clear:both; position:relative; }
    .attach-box #delete_all { width:52px; height:20px; line-height:20px; float:left; margin:11px 0 7px; }
    .attach-box #delete_all a { background-image:url(http://i1.daumcdn.net/icon/editor/file/bt_delete.gif?rv=1.0.2); background-position:0 0; width:52px; height:20px; }
    .box-empty #delete_all a { background-position:52px 0; width:52px; height:20px; cursor: default; }
    .attach-box #size { color:#333; float:right; margin-top:16px; }
    .attach-box #size strong { letter-spacing:0; }
    .attach-box #size #up_size { color:#fb6235; }
    .attach-box .list { clear:both; width:386px; height:106px; background-color:#fff; border:1px solid #ccc; overflow-y:scroll; font-size:12px; letter-spacing:0; color:#333; padding:3px; }
    * html .attach-box .list {clear:none;}
    *+ html .attach-box .list {clear:none;}
    .attach-box .list p { text-align:center; letter-spacing:-1px; }
    .attach-box .list strong { display:none; }
    .attach-box .list .pv strong { display:inline; }
    .attach-box .list #empty_header { font-weight:bold; margin-top:42px; }
    .attach-box .list #empty_desc { color:#999; font-size:11px; margin-top:6px; }
    .attach-box .list li { height:21px; line-height:21px; padding:0 4px; clear:both; }
    .attach-box .list li dl { width:100%; }
    .attach-box .list li dl dt { float:left; width:340px; height:16px; overflow:hidden; }
    .attach-box .list li dl dd { float:right; width:15px; height:16px; }
    .attach-box .list li.over dd a { background-image:url(http://i1.daumcdn.net/icon/editor/file/bt_close2.gif?rv=1.0.1); width:15px; height:15px; margin-top:3px; line-height:15px; }
    .attach-box .list li.pv { color:#999; }
    .attach-box .list li.over { background-color:#f2f2f2; }
    .attach-box .list li.active { background-color:#c8d9f7; }
    .attach-box .list strong { color:#ed1c24; font-size:11px; font-weight:normal; letter-spacing:-1px; }
    
    .progress { position:absolute; z-index:200; top:60px; left:100px; width:200px; height:46px; padding:3px 10px 10px 10px; border:1px #aaa solid; background:#fff;display:none; }
    .progress .progress-bar div { height:11px; text-align:right; visibility:hidden; }
    .progress p.percent { background:url(http://i1.daumcdn.net/icon/editor/progress.gif?rv=1.0.1) repeat-x; padding:3px 0 0; margin:0 0 8px; height:17px; font-size:11px; font-family:'돋움',dotum,verdana; color:#fff; text-align:center; }
    .progress p.copy { font-size:11px; font-family:'돋움',dotum,verdana; color:#666; text-align:center; }
    
    .box-empty #list { display: none; }
    .box-empty #describe { display: block; }
    
    .box-exist #list { display: block;}
    .box-exist #describe { display: none; }
    
    .box-progress #list, .box-progress #describe { opacity: 0.5; filter:alpha(opacity=50); }
    .box-progress #progress { display:block; }
    
    .box-progress .uploading-copy { display:block;}
    .box-progress .checking-copy { display:none;}
    .box-progress .checking .uploading-copy { display:none;}
    .box-progress .checking .checking-copy { display:block;}
    .box-progress .checking .progress-bar div { visibility:visible; }
    
    .attach-alert { background:url(http://i1.daumcdn.net/icon/editor/file/ico_stop.gif?rv=1.0.1) 0 0 no-repeat; margin:14px 36px 21px; color:#999; }
    .attach-alert dt { font-size:12px; font-weight:bold; color:#6486e4; padding:8px 0 9px 37px; }
    .attach-alert dd { line-height:17px; margin:0 0 0 36px; }
    .attach-alert a, a.arrowR { color:#666; text-decoration:none; background:url(http://i1.daumcdn.net/icon/editor/file/b_link.gif?rv=1.0.1) 100% 50% no-repeat; padding:0 7px 0 0; }
    .attach-alert a:hover { text-decoration:underline; }
    .attach-footer { padding:10px 0 10px 172px; height:25px; background-color:#e9e9e9; clear:both; }
    .attach-footer li { float:left; }
    .attach-footer #submit a { background-image:url(http://i1.daumcdn.net/icon/editor/file/bt_reg.gif?rv=1.0.1); background-position:0 0; width:49px; height:25px; line-height:25px; }
    .attach-footer #cancel a { background-image:url(http://i1.daumcdn.net/icon/editor/file/bt_reg.gif?rv=1.0.1); background-position:100% 0; width:49px; height:25px; line-height:25px; margin-left:7px; }
    .attach-footer #close { width:38px; height:13px; float:right; margin:6px 12px 0 0; }
    .attach-footer #close a { background-image:url(http://i1.daumcdn.net/icon/editor/file/bt_close.gif?rv=1.0.1); width:38px; height:13px; }
    #warnicon { background-image:url(http://i1.daumcdn.net/icon/editor/file/ico_warning.gif?rv=1.0.1); position:absolute; left:-10000px; top:20px; }
    
    #ss_copyright { border:1px solid #D8C8BB; padding:10px 11px 7px; margin:0 20px 27px; background-color:#FFFFDB; display:none; }
    
    #ss_copyright h2 { float:left; display:block; font: normal 11px/1.2 'dotum'; color:#ED1C24; margin:0 0 5px; padding-right:27px; background:url(http://i1.daumcdn.net/icon/editor/file/ico_beta.gif?rv=1.0.1) right top no-repeat; letter-spacing:-1px; }
    * html #ss_copyright h2 {line-height:1.4;}
    #ss_copyright p { clear:both; letter-spacing:0.2px; color:#666; line-height:1.4; }
    
    /** black box **/
    .tx-blackbox{
        position:absolute;
        display:none;
        z-index: 500;
    }
    .tx-blackbox .tx-blackbox-panel{
        position:absolute;
        top:0;
        left:0;
        background-color:#000;
        opacity:0.3;
        filter:alpha(opacity=30);
    }
    .tx-blackbox .tx-content{
        background-color:#fff;
        margin:0;
        position:absolute;
    }

    /** daum login box **/
    .tx-noticebox {
        text-indent:10px; 
        font-size:0px;
        width:315px; height:130px; 
    }
    .tx-noticebox dl { 
        background:#f4f2f9; font-family:'돋움',dotum,verdana; font-size:11px;
        border:1px solid #cfd3e5; margin:0 auto;
        padding:10px 5px 5px 5px;
    }
    .tx-noticebox dt { 
        margin:0; padding:0;
        background:#f4f2f9; height:20px;
        font:bold 12px "돋움", dotum;
        color: #7b81dc;
    }
    .tx-noticebox dt span {float:left;}
    .tx-noticebox dt a {
        width:14px; height:13px; float:right; text-indent:-100em;
        background:url(http://i1.daumcdn.net/icon/editor/btn_a_close.gif?rv=1.0.1) no-repeat left top;
    }
    .tx-noticebox dd {
        margin:0; padding:10px 10px 0 10px;
        background: #fff;
        height: 110px;
        font-size: 11px;
        color: #4d4d4d;
    }
    .tx-noticebox dd p {
        text-indent:0;
        margin: 0 10px;
        padding: 10px 0;
    }
    .tx-noticebox dd div {
        border-top: 1px solid #f1f1f1;
        margin: 0px;
        text-align: center;
        padding: 10px 0 0 0;
    }
    .tx-noticebox dd div a {
        text-indent: 0;
    }
    .tx-noticebox .box-back {
        width:100%; height:100%;
    }
</style>
<style type="text/css">
#tx_file_attach_layer{
    position: absolute; right:16px;
    height:37px;
    overflow:hidden;
}
#tx_file_attach_layer_menu {
    display: block;
    position: absolute;
    top:37px;
    left: 0px;
    background-color: #fff;
}
#tx_file_attach_layer_menu li {
    list-style:none;
    line-height:0;
    font-size:0;
}
.enable-cloud-menu #tx_file_attach_button {
    width: 86px;
    height: 26px;
    background-image:url(http://i1.daumcdn.net/icon/editor/file/bt_add.gif);
    margin: 11px 0 0 0;
}
.enable-cloud-menu #tx_handrive { margin-right:5px; }
.enable-cloud-menu #tx_handrive a {text-indent:-1000em; background-image:url(http://i1.daumcdn.net/icon/editor/file/bt_02_off.gif); display:block; height: 25px; width: 86px; overflow:hidden; }
.enable-cloud-menu #tx_handrive a:hover { background-image:url(http://i1.daumcdn.net/icon/editor/file/bt_02_on.gif); display:block; height: 25px; width: 86px;}
.enable-cloud-menu #browse { width:86px; height:25px; background-image:url(http://i1.daumcdn.net/icon/editor/file/bt_02_off.gif);}

.disable-cloud-menu #tx_file_attach_button,
.disable-cloud-menu #tx_handrive {display:none;}
.disable-cloud-menu #tx_file_attach_layer {width:60px;}
.disable-cloud-menu #tx_file_attach_layer_menu {top:11px;}
</style>
<script type="text/javascript">
function submit() { 
	var fileForm = $("#fileForm");
    fileForm.submit();
    done();
}

function done() {
    if (typeof(execAttach) == 'undefined') { //Virtual Function
        return;
    }
    var file = $("#file");
    var fileForm = $("#fileForm");

/*     $.ajax({
        type        : "get",            
        url         : "/attachments",
        data        : file,          
        async       : false,         
        dataType    : "json",
        headers: {'Content-type':'multipart/form-data'},
        beforeSend  : function() {

        },
        success     : function(data){
        	console.log(data);
            
        },
        error       : function (e, state) {                 
                            
        }
    }); */
     
    
    
    console.log(file);
    var _mockdata = {
        'imageurl': "${url}",
        'filename': "${url}",
        'filesize': 640,
        'imagealign': 'C',
        'originalurl': "",
        'thumburl': 'http://cfile284.uf.daum.net/P150x100/116E89154AA4F4E2838948'
    };
    //execAttach(_mockdata);
    //closeWindow();
}

function initUploader(){
    var _opener = PopupUtil.getOpener();
    if (!_opener) {
        alert('잘못된 경로로 접근하셨습니다.');
        return;
    }
    
    var _attacher = getAttacher('image', _opener);
    registerAction(_attacher);
}
</script>
</head>
<body onload="initUploader();">
<div id="wrap">
  <h1>파일 첨부</h1>
  <div id="attach-header" class="attach-header">
    <div id="tx_file_attach_layer">
        <div id="tx_file_attach_button">
        <form:form id="fileForm" name="fileForm" method="post" action="/attachments" enctype="multipart/form-data">
            <input type="file" id="file" name="file" />            
        </form:form>
        </div>
    </div>
    <p>최대 <strong id="max_top_size" class="point nospacing">3M</strong>까지 첨부하실 수 있습니다.</p>
  </div>
  <div id="attach-box" class="attach-box box-empty">
    <div id="delete_all" class="imgbtn"><a title="전체삭제" href="javascript:;" class="btnlink">전체삭제</a></div>
    <div id="size">파일: <strong id="up_size">0</strong> / <span id="max_size" class="nospacing">0MB</span><span id="group_size"></span></div>
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
    <li id="submit" class="imgbtn"><a href="#" onclick="submit();" title="등록" class="btnlink">등록</a> </li>
    <li id="cancel" class="imgbtn"><a href="#" onclick="cancelUpload();" title="취소" class="btnlink">취소</a></li>
    <li id="close" class="imgbtn"><a href="#" onclick="cancelUpload();" title="닫기" class="btnlink">닫기</a></li>
  </ul>
  <div id="tx_fhr_div"><div id="tx_fhr_target"></div></div> 
</div>
</body>
</html>
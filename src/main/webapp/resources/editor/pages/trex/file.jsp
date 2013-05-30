<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Daum에디터 - 파일 첨부</title> 
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
// <![CDATA[
    window.Coca = {};
    window.Cloud = {};
    window.HandriveImport = function(data){
        adaptorHandrive.startUplod(data);
    };

    var AttachBoxListener = {
        beforeFileAdded: function(data){ return data},
        beforeFileRemoved: function(data){},
        beforeAllFileRemoved: function(dataArray){}
    };
    var AttachBox = {
        size: 0,
        files: [],
        initialize: function() {
            var _opener = PopupUtil.getOpener();
            var _attachBox = _opener.Editor.getAttachBox();
            
            var _available = _attachBox.getCapacity('available');
            $tx("max_size").innerHTML = $tx("max_top_size").innerHTML = $tx("max_list_size").innerHTML = _available.toByteUnit();
            
            this.getUsedCapacity = function() {
                return (_opener && !_opener.closed && _opener.Editor)? parseInt(_attachBox.getCapacity('uploaded'), 10) + AttachBox.size : 1000000000;
            };
            
            this.getUploadedFileNum = function() {
                return (_opener && !_opener.closed && _opener.Editor)? _attachBox.getCapacity('uploadedFileNum') + AttachBox.files.length : 1000000000;
            };
            
            this.checkInsertableSize = function(size) {
                if(_opener && !_opener.closed && _opener.Editor) {
                    return(parseInt(_attachBox.getCapacity('uploaded'), 10) + AttachBox.size + size < _available);
                } else {
                    return false;
                }
            };
            
            this.getUploadedSizeByFilter = function(filterName) {
                var _uploadedSize = 0;
                var _extensions = _attachBox.getFilterExtensions(filterName);
                this.files.each(function(file) {
                    if(file.filename) {
                        var _ext = file.filename.split(".").pop().toLowerCase();
                        if(_extensions.indexOf("," + _ext + ",") > -1) {
                            _uploadedSize += file.filesize;
                        }
                    }
                });
                return _uploadedSize;
            };
            this.getFilteredExtension = function(ext, size) {
                if(!(_opener && !_opener.closed &&   _opener.Editor)) {
                    return '';
                }
                var _filterNames = _attachBox.getFiltersNameByExt(ext);
                if(_filterNames.length == 0) {
                    return '';
                }
                
                for(var i=0; i<_filterNames.length; i++) {
                    var _filterName = _filterNames[i];
                    var _uploadedSizeAtPopup = this.getUploadedSizeByFilter(_filterName);
                    var _uploadedSizeAtOpener = _attachBox.getUploadedSizeByFilter(_filterName);
                    if(_uploadedSizeAtPopup + _uploadedSizeAtOpener + size > _attachBox.getFilterMaximum(_filterName)) {
                        return _filterName;
                    }
                }
                return '';
            };
    
            var _deleteall = $tom.children( $tx("delete_all"), "a" )[0];
            $tx.observe( _deleteall, "click", this.removeAll.bind(this) );

            if( enableCloudImport == true ){
                var _elButton = $tx("tx_file_attach_layer");
                var _elMenu = $tx("tx_file_attach_layer_menu");
                $tx.observe( _elButton, "mouseover", function(ev){
                    $tx.setStyle(_elButton, { height: "87px" });
                });
            
                var _hideMenu = function() {
                    $tx.setStyle(_elButton, {height: "37px"});
                };
                ($tx.webkit && !$tx.chrome && navigator.userAgent.indexOf("Windows") != -1) ?
                    $tx.observe($tx("attach-box"), "mouseover", _hideMenu) : $tx.observe(_elButton, "mouseout", _hideMenu);
            }
            
            this.syncCapacity();
        },
        append: function(data) {
            $tx("attach-box").className = "attach-box box-progress box-exist";
            
            var _nameMaxLength = 50;
            var _copyrightInvalid = false;
            if ( data.copyright && ( data.copyright.ccresult == '100' || data.copyright.ccresult == '110' ) ) {
                _copyrightInvalid = true;
                _nameMaxLength = 34;
            }
            
            var _filename = data.filename;
            if(_filename.getRealLength() > _nameMaxLength) {
                var _nameArr = _filename.split(".");
                var _ext = _nameArr.pop();
                var _name = _nameArr.join(".").cutRealLength(_nameMaxLength - 2);
                _filename = _name + "." + _ext;
            }
            var _li = tx.li({'className': (_copyrightInvalid) ? "pv" : ""},
                tx.dl(
                    tx.dt({'title': data.filename},
                        _filename + " (" + data.filesize.toByteUnit() + ") ",
                        tx.strong('[저작권위반의심]')
                    ),
                    tx.dd( { 'className': 'imgbtn' },
                        tx.a( { 'href': 'javascript:;', 'className': 'btnlink' },
                            '삭제'
                        )
                    )
                )
            );
            $tx('list').appendChild( _li );
            var _delete = $tom.collect( _li, "a" );
            $tx.observe( _li, "mouseover", function(){ $tx.addClassName(_li, "over");} );
            $tx.observe( _li, "mouseout", function(){ $tx.removeClassName(_li, "over");} );
            $tx.observe( _delete, "click", this.remove.bind(this, _li, data) );
            data = AttachBoxListener.beforeFileAdded(data);
            this.size += data.filesize;
            this.files.push( data );
        },
        remove: function(li, data) {
            AttachBoxListener.beforeFileRemoved(data);
            this.files = this.files.without( data );
            li.parentNode.removeChild( li );
            
            this.size -= data.filesize;
            if(this.files.length == 0) {
                $tx("attach-box").className = "attach-box box-empty";
            }
            this.syncCapacity();
            window.Coca.remove( data.attachurl );
            data = null;
        },
        removeAll: function() {
            AttachBoxListener.beforeAllFileRemoved(this.files);
            if (this.files.length == 0) {
                return;
            }
            this.files = [];
            $tx('list').innerHTML = "";
            
            this.size = 0;
            $tx("attach-box").className = "attach-box box-empty";
            
            this.syncCapacity();
            window.Coca.removeAll();
        },
        syncCapacity: function() {
            var _opener = PopupUtil.getOpener();
            if (!_opener) {
                return;
            }
            
            var _attachBox = _opener.Editor.getAttachBox();
            $tx("up_size").innerHTML = (_attachBox.getCapacity('uploaded') + this.size).toByteUnit();
        },
        startUpload: function() {
            $tx.addClassName( $tx("attach-box"), "box-progress" );
        },
        showProgressbar: function(percent) {
            percent = Math.min(percent, 100);
            $tx.removeClassName( $tx('progress'), "checking" );
            var _div = $tx("progress-bar");
            _div.style.width = ( 200 * percent/100 ).toPx();
            
            var _p = $tom.children(_div, "p" )[0];
            _p.innerHTML = percent + "%";
        },
        showCheckingMsg: function(){
            $tx.addClassName($tx('progress'), "checking");
        },
        finishUpload: function(){
            $tx.removeClassName($tx("attach-box"), "box-progress");
            $tx.removeClassName($tx('progress'), "checking");
        },
        alertMessage: function(overfiles) {
            if (!overfiles || overfiles.length == 0) {
                return;
            }
                
            var _msg = [];
            _msg.push('[용량초과 안내]');
            _msg.push('\n\n첨부 용량이 초과되어 업로드 하실 수 없습니다.\n첨부하시고자 하는 파일의 전체 용량을 확인해 주세요.');
            
            var _hasFilter = false;
            for (var i=0; i<overfiles.length; i++) {
                _hasFilter = _hasFilter || (!!overfiles[i].filtername);
            }
            if (_hasFilter) {
                _msg.push('\n(※ 음원 파일들의 합계 용량은 3MB를 넘을 수 없습니다.)');
            }
            
            _msg.push('\n');
            
            var _overfile;
            for (var i=0;i< overfiles.length; i++) {
                _overfile = overfiles[i];
                if (_overfile.attachurl) {
                    $txSWF("coca").remove(_overfile.attachurl);
                }
                _msg.push("\n" + _overfile.name);
                if(_overfile.size) {
                    _msg.push(" (" + _overfile.size + ")");
                }
            }
            alertTimeout(_msg.join("")); //prevent dead lock bug on FF+flash.
        }
    };

    var _opener = PopupUtil.getOpener();
    var service = _opener.Editor.getConfig().txService;
    var enableCloudImport = _opener.Editor.getConfig().sidebar.attacher.file.enableCloudImport;

    

    var FileAdaptor = {};
    FileAdaptor.Handrive = Trex.Class.create({
        $const: {
            RETRANSMIT_URL: "http://cloud.daum.net/file/api/0/retransmit.json?attacher=file&extype=fromcloud&service=" + service,
            HANDRIVE_POPUP_URL: "http://cloud.daum.net/disk/popup/export.daum?callFunc=HandriveImport&type=TYPE1&service=" + service
        },
        $mixins: [
            Trex.I.FHRequester
        ],
        initialize: function(config) {
            var elButton = $tx("tx_handrive");
            $tx.observe( elButton, "click", function(){
                window.open(FileAdaptor.Handrive.HANDRIVE_POPUP_URL,"athandrive","width=700,height=450,scrollbar=no,menubar=no,resizable=yes"); 
            });
/*
            (function(context, adaptor) {
                content.useCc = (config.usecc != undefined)? config.usecc : false;
            })(window.Cloud, this);
*/
        },
        startUplod: function(data){
            window.Coca.overfiles = [];
            AttachBox.startUpload();
            AttachBox.syncCapacity();
            AttachBox.showProgressbar(1);

            var filelist = [];
            for( var i = 0; i < data.length; i++ ){
                var ext = data[i].extension || "";  
                filelist.push({
                    folderId: data[i].parentId ,
                    fileId: data[i].id,
                    filesize: parseInt(data[i].bytes),
                    filename: data[i].name + "." + ext,
                    fileext: ext,
                    mimetype: data[i].mimetype || ""
                });
            }

            filelist = this.sizeCheck(this.fileterSizeCheck(filelist));         
            this.fromHandriveToFarm(filelist);  
        },

        fileterSizeCheck: function(filelist){
            var succFileList = [];
            for( var i = 0; i < filelist.length; i++ ){
                var filtername = AttachBox.getFilteredExtension(filelist[i].fileext, filelist[i].filesize);
                if ( filtername ){
                    window.Coca.overfiles.push( {
                        'name': filelist[i].filename,
                        'size': filelist[i].filesize,
                        'filtername': filtername
                    });
                } else {
                    succFileList.push( filelist[i] );
                }
            }
            return succFileList;
        },
        
        sizeCheck: function(filelist){
            var total = 0;
            var succFileList = [];
            for( var i = 0; i < filelist.length; i++ ){
                if ( AttachBox.checkInsertableSize(filelist[i].filesize + total) ){
                    total += filelist[i].filesize;
                    succFileList.push( filelist[i] );
                }else{
                    window.Coca.overfiles.push( {
                        'name': filelist[i].filename,
                        'size': filelist[i].filesize
                    });
                }
            }
            return succFileList;
        },
        finishUpload: function() {
            AttachBox.finishUpload();
            AttachBox.syncCapacity();
            AttachBox.alertMessage(window.Coca.overfiles);
        },
        /*
        waitChecking: function(filelist) {
            if (window.Cloud.useCc) {
                alert("야");
                for( var i = 0; i < filelist.length; i++ ){
                    var ext = filelist[i].extension;
                    if (['MP3','WAV','OGG','WMA','MP4','APE','WMV', 'ASF'].include(ext.toUpperCase())) { 
                        AttachBox.showCheckingMsg();
                    }
                }
            }
        },
        */
        fromHandriveToFarm: function(filelist){
            if ( filelist.length > 0 ){
                var _method = "post";
                var _url = FileAdaptor.Handrive.RETRANSMIT_URL;
                var _param = "FOLDER_FILE_IDS=" + this.getFilelist(filelist);
                var _self = this;
                
                var _successHandler = function(jsonTxt){
                    var data = _self.parse( jsonTxt );
                    if ( data.code == "517" ){
                        _self.completeRestrict( filelist );
                    }else if ( data.code != "200" ){
                        alertTimeout("파일을 업로드 하는데 실패했습니다.");
                    }else{
                        _self.attach( data.info );
                    }
                    isUploading = false;// TODO unused? delete it
                    _self.finishUpload();                   
                };
                var _failHandler = function(data){ alertTimeout('서버 통신중 오류가 발생했습니다. 다시 시도해주세요.')};
                this.sendRequest(_method, _url, _param, true, _successHandler, _failHandler, function(){} );
                this.repeatProgressBar(filelist.length);
            }else{
                this.finishUpload();
            }
        },
        completeRestrict: function(filelist) {
            var _msg = [
                "[첨부 제한 안내]\n\n", 
                "확장자 aac,mmf 파일은 저작권 보호를 위해 첨부가\n", 
                "제한되어 있습니다. 아래 파일을 확인해 주세요.\n\n"
            ];
            for( var i=0, l=filelist.length; i<l; i++ ){
                var file = filelist[i];
                if (['MMF','AAC'].include(file.fileext.toUpperCase())) {
                    _msg.push([file.filename,
                        " (",
                        file.filesize.toByteUnit(),
                        ")\n"].join(""));
                }
            }
            alertTimeout(_msg.join(""));
        },
        repeatProgressBar: function(fileNum){
            if ( fileNum < 1 ) {
                return;
            }
            var count = 1;
            var _showProgress = function(){
                AttachBox.showProgressbar(parseInt(count++*100/fileNum));
                if ( count < fileNum ) {
                    setTimeout( _showProgress, 2000/fileNum);
                }
            };
            _showProgress();
        },
        parse: function(jsonStr){
            return eval( "(" + jsonStr + ")" );
        },
        attach: function(attachments){
            for( var i = 0; i < attachments.length; i++ ){
                AttachBox.append(attachments[i].data);
            }
        },
        getFilelist: function(filelist){
            var result = [];
            for( var i = 0; i < filelist.length; i++){
                result.push ( filelist[i].folderId + "|" + filelist[i].fileId );
            }
            return result.join(",");
        }
    });
    FileAdaptor.Coca = Trex.Class.create({
        initialize: function(config) {
            this.files = [];
            
            this.createMovie(config);
            
            (function(context, adaptor) { //flash callback, Coca
                context.on_session_out = adaptor.goLogin;

                context.on_upload_start = adaptor.startUplod;
                context.on_upload_progress = adaptor.workUploading;
                context.on_upload_wating_complete = adaptor.waitChecking;
                context.on_upload_complete = adaptor.completeUpload;
                context.on_upload_restrict_complete = adaptor.completeRestrict;
                context.on_upload_finish = adaptor.finishUpload;
                context.on_upload_skip = adaptor.skipUpload;
                
                context.on_over_filesize = adaptor.overFilesize;
                context.on_over_filecount = adaptor.overFilecount;
                context.on_over_filequota = adaptor.overFilequota;
            })(window.Coca, this);
            /**
             * file = {
             *      attachurl: "string",
             *      infourl: "string",
             *      filename: "string",
             *      filesize: number,
             *      filemime: "string",
             *      copyright: { //optional
             *          ccresult: "string",
             *          ccdate: "string",
             *          cctrackid: "string",
             *          ccsversion: "string"
             *      }
             *  }
             */
            (function(context, adaptor) { 
                context.overfiles = [];
                context.useCc = (config.usecc != undefined)? config.usecc : false;
                
                context.remove = adaptor.remove;
                context.removeAll = adaptor.removeAll;
                
                context.done = function(){
                    if (typeof(execAttach) == 'undefined') { //Virtual Function
                        return;
                    }
                    adaptor.files = AttachBox.files;
                    var i, len = adaptor.files.length;
                    if (len == 0) {
                        alertTimeout('첨부된 파일이 없습니다.');
                    }
                    else {
                        for (i = 0; i < len; i += 1) {
                            execAttach(adaptor.files[i]);
                        }
                        closeWindow();
                    }
                };
            })(window.Coca, this);
            
            Trex.Logger.checkFlashLoading("coca", "COCA", 2);
        },
        createMovie: function(config) {
            var swf = []; 
            for(var i=0 ; i<config.elements.length; i++){ 
                var el = config.elements[i];
                var flashvars = (function() {
                    var ret = {};
                    var param = config.param;
                    param.split('&').each(function(str) {
                        var pair = str.split('=');
                        ret[pair[0]] = pair[1];
                    });
                    ret["coca_skin"] = el.coca_skin ? el.coca_skin : "http://i1.daumcdn.net/icon/editor/file/bt_03_off.gif";
                    ret["coca_up_skin"] = el.coca_up_skin || "";
                    ret["coca_down_skin"] = el.coca_down_skin ? el.coca_down_skin : "";
                    ret["coca_over_skin"] = el.coca_over_skin ? el.coca_over_skin : "http://i1.daumcdn.net/icon/editor/file/bt_03_on.gif";
                    ret["coca_hit_skin"] = el.coca_hit_skin ? el.coca_hit_skin : "";
                    ret["filesrc"] = config.upsource ? config.upsource : "";
                    ret["use_cc"] = (config.usecc != undefined)? config.usecc : false;
                    return ret;
                })();
                
                Trex.Flash.load(
                    config.url,
                    'embed_target',
                    'coca' + (i == 0 ? '' : i - 1),
                    {
                        'width': el.width ? el.width : "86",
                        'height': el.height? el.height: "25",
                        'flashvarObj': flashvars,
                        'paraObj': {
                            'title': '내 PC에서 파일추가'
                        },
                        'attrObj': {
                            'title': '내 PC에서 파일추가'
                        }
                    }
                );
                swf.push($txSWF("coca"+ (i == 0 ? "" : i - 1))); 
            }
            return swf; 
        },
        goLogin: function() {
            if (!this.login) {
                var _blackBox = new Trex.BlackBox();
                _blackBox.make(document.body);
                this.login = new Trex.DaumLogin({
                    'head': "파일을 첨부할 수 없습니다.",
                    'body': "로그아웃 되어, 파일을 첨부할 수 없습니다.<br>로그인 후 이용해 주시길 바랍니다."
                }, _blackBox).weave(function() {
                    self.location.replace(self.location.href);
                });
                $tx.hide($tx("coca"));
            }
            this.login.show();
        },
        /**
         * Callback function called when upload session is started
         */
        startUplod: function(){
            window.Coca.overfiles = [];
            AttachBox.startUpload();
            AttachBox.syncCapacity();
            $txSWF("coca").disableCoca();
        },
        /**
         * Callback function on progress
         * @param {Object} percent 
         */
        workUploading: function(percent) {
            AttachBox.showProgressbar(percent);
        },
        /**
         * Callback function on progress checking copyright
         */
        waitChecking: function(filename, ext) {
            if (window.Coca.useCc) {
                if (['MP3','WAV','OGG','WMA','MP4','APE','WMV', 'ASF'].include(ext.toUpperCase())) { 
                    AttachBox.showCheckingMsg();
                }
            }
        },  
        /**
         * Callback function called when each file is uploaded complete into temp directory.
         */
        completeUpload: function() {
            var _res = arguments[0].split("||");
            var _filename = _res[0];
            var _attachurl = _res[1];   // key
            var _infourl = _res[2];
            var _filesize = (isNaN(_res[3]) ? 0 : parseInt(_res[3]));
            var _filemime = _res[4]; // del \n
            if (_filename.indexOf("![CDATA[") > -1 && _filename.indexOf("]]") > -1) { //NOTE: Cuz Uploader Bugs
                _filename = _filename.substring(8, _filename.length - 2);
            }
            
            // 용량체크
            if(!AttachBox.checkInsertableSize(_filesize)) {
                window.Coca.overfiles.push({
                    'attachurl': _attachurl,
                    'name': _filename
                });
                return;
            }
            
            // 필터링
            var _ext = _filename.split(".").pop().toLowerCase();
            var _filtername = AttachBox.getFilteredExtension(_ext, _filesize);
            if ( _filtername ){
                window.Coca.overfiles.push( {
                    'name': _filename,
                    'size': _filesize,
                    'filtername': _filtername
                });
                return;
            }
            var _data = {
                attachurl: _attachurl,
                infourl: _infourl,
                filename: _filename,
                filesize: _filesize,
                filemime: _filemime //"image/jpg"
            };
            if ( _res.length > 5 && _res[5] ) { 
                var _copyrightArr = _res[5].split("==");
                if (_copyrightArr.length > 3) {
                    _data['copyright'] = {
                        ccresult: _copyrightArr[0] || "",
                        ccdate: _copyrightArr[1] || "",
                        cctrackid: _copyrightArr[2] || "",
                        ccsversion: _copyrightArr[3] || ""
                    };
                }
            }
            AttachBox.append( _data );
        },
        /**
         * Callback function called when restriction file upload session is finished
         *   ex} realname||filesize||mimetype
         */
        completeRestrict: function() {
            var _res = arguments[0].split("||");
            var _filename = _res[0];
            var _filesize = (isNaN(_res[1]) ? 0 : parseInt(_res[1]));
            var _filemime = _res[2];
            
            var _msg = [
                "[첨부 제한 안내]\n\n", 
                "확장자 aac,mmf 파일은 저작권 보호를 위해 첨부가\n", 
                "제한되어 있습니다. 아래 파일을 확인해 주세요.\n\n",
                _filename,
                " (",
                _filesize.toByteUnit(),
                ")"
            ].join("");
            alertTimeout(_msg);
        },
        /**
         * Callback function called when upload session is finished
         */
        finishUpload: function() {
            AttachBox.finishUpload();
            AttachBox.syncCapacity();
            $txSWF("coca").enableCoca();
            AttachBox.alertMessage(window.Coca.overfiles);
        },
        /**
         * Callback function called if size of each file is bigger than permission
         */
        //callback : 설정해놓은 파일 사이즈보다  큰 파일을 선택했을 경우
        overFilesize: function(filenames, maxsize, ctx){
            //alert('업로드 용량이 초과되었습니다.');
        },
        /**
         * Callback function called if files are selected more than max count.  
         */
        //callback : 설정해놓은 파일 개수보다  많이  파일을 선택했을 경우
        overFilecount: function(overcount, maxcount, ctx){
            //alert('업로드 파일갯수가 초과되었습니다.');
        },
        /**
         * size : allow unlimited if -1
         */
        //callback : 설정해놓은 전체 파일 사이즈 파일를 넘게 선택했을 경우
        overFilequota: function(overquota, maxquota, ctx){
            //alert('업로드 용량이 초과되었습니다.');
        },
        /**
         * Callback function called when capacity and limited number number are over during uploading
         * @param {String} name - filename
         * @param {Number} size - filesize
         * @param {String} type - extention of file
         * @param {String} ctx - uploader context ID
         * @param {String} filtername - filter name
         */
        skipUpload: function(name, size, type, ctx, filtername) {
            window.Coca.overfiles.push({
                'attachurl': null,
                'name': name,
                'size': size.toByteUnit(),
                'filtername': filtername
            });
        },
        remove: function(key){
            return $txSWF("coca").remove(key); //return remain count
        },
        removeAll: function(){
            return $txSWF("coca").removeAll();
        }
    });

    var adaptorHandrive = null;
    function initUploader(){
        var _opener = PopupUtil.getOpener();
        if (!_opener) {
            alertTimeout('잘못된 경로로 접근하셨습니다.');
            return;
        }

        if( enableCloudImport == false ){
            $tx.addClassName( $tx('attach-header'), 'disable-cloud-menu' );
        } else {
            $tx.addClassName( $tx('attach-header'), 'enable-cloud-menu' );
        }
        
        var _attacher = getAttacher('file', _opener);
        registerAction(_attacher);
        
        if (_attacher.config.adaptor == "coca") {
            var config = _opener.Editor.getConfig().adaptor.coca;
            new FileAdaptor.Coca(config);
        }
        adaptorHandrive = new FileAdaptor.Handrive(config);
        
        AttachBox.initialize();
        if ( _attacher.config.useCC && _attacher.config.useCC === true ){
            $tx.show( $tx('ss_copyright') );    
        }
        autoResizeHeight($tx("wrap"));
        setTimeout(function() {
            autoResizeHeight($tx("wrap"));
        }, 100);
    }
    
    function cancelUpload() {
        AttachBox.removeAll();
        closeWindow();
    }
    
    function alertTimeout( msg ){
        setTimeout(function(){
            alert( msg );
        },1);
    }
    
    /* flash */
    function getUsedCapacity() {
        return AttachBox.getUsedCapacity();
    }
    
    function getUploadedFileNum() {
        return AttachBox.getUploadedFileNum();
    }
    
    function getFilteredExtension(ext, size) {
        return AttachBox.getFilteredExtension(ext, size);
    }
</script>
</head>
<body onload="initUploader();">
<div id="wrap">
  <h1>파일 첨부</h1>
  <div id="attach-header" class="attach-header">
    <div id="tx_file_attach_layer">
        <div id="tx_file_attach_button"><input type="file">dd</input></div>
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
    <li id="submit" class="imgbtn"><a href="#" onclick="Coca.done();" title="등록" class="btnlink">등록</a> </li>
    <li id="cancel" class="imgbtn"><a href="#" onclick="cancelUpload();" title="취소" class="btnlink">취소</a></li>
    <li id="close" class="imgbtn"><a href="#" onclick="cancelUpload();" title="닫기" class="btnlink">닫기</a></li>
  </ul>
  <div id="tx_fhr_div"><div id="tx_fhr_target"></div></div> 
</div>
</body>
</html>
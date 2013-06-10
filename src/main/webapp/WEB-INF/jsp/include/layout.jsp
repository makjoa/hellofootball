<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ include file="/WEB-INF/jsp/include/tags.jspf"%>
<!DOCTYPE html>
<html lang="ko-KR"> 
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
        <title>Hello! FootBall</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="<%=request.getContextPath()%>/resources/images/favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/images/favicon.ico" type="image/x-icon">
        <!-- Bootstrap 
       <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css">
        -->
        <!-- Custom UI 
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/is_header.css">
        -->        
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/is_bundle.css">        
        <script src="http://www.google-analytics.com/ga.js" type="text/javascript"></script>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/login.js"></script>         
        <script src="http://cdn.sockjs.org/sockjs-0.3.4.min.js"></script>      
        <script src="<%=request.getContextPath()%>/resources/js/json2.js"></script>  
        <script src="<%=request.getContextPath()%>/resources/js/RealtimeWebClient.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/modules/common/mgene.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/modules/app/tc.js"></script>
        <!-- <script type="text/javascript" src='http://makjoa.iptime.org:8001/socket.io/socket.io.js'></script>
         -->
        <script src="http://www.google.com/uds/api?file=uds.js&amp;v=1.0&amp;key=AIzaSyC_GMIKaDvSJV6-bgdTeFkkudS5LEJSrrE"></script>
        <script>        
/*             var contextPath = '${pageContext.request.contextPath}';            
            $(function() {                
                RealtimeWebClient.init(new SockJS('http://localhost:9090/r'));
            }); */
        </script>         
    </head>
    <body id="page-docs" class="not-front not-logged-in no-sidebars user-style-mouse208" data-twttr-rendered="true">

        <div id="doc">
            <div class="push-loader" id="pushStateSpinner"></div>
            <tiles:insertAttribute name="header" />
            <section>
                <div id="page-outer" class="main_container">                
                    <div id="page-container" class="wrapper wrapper-profile white">
                        <tiles:insertAttribute name="content" />                        
                        <tiles:insertAttribute name="footer" />    
                    </div>
                </div>
            </section>      
        </div>
    </body>
</html>                        
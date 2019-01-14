<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>


<!-- Mirrored from www.zi-han.net/theme/hplus/ by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:16:41 GMT -->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>主页</title>
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link rel="shortcut icon" href="../example/favicon.ico">
    <link href="<%=basePath %>/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=basePath %>/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="<%=basePath %>/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="<%=basePath %>/css/animate.min.css" rel="stylesheet">
    <link href="<%=basePath %>/css/style.min862f.css?v=4.1.0" rel="stylesheet">

    <!-- bootstrap-table -->
    <link href="<%=basePath %>/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">

    <link href="<%=basePath %>/css/z_style.css" rel="stylesheet">
    <link href="<%=basePath %>/css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <!-- Sweet Alert -->
    <link href="<%=basePath %>/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">

    <link href="<%=basePath %>/css/plugins/summernote/summernote.css" rel="stylesheet">
    <link href="<%=basePath %>/css/plugins/summernote/summernote-bs4.css" rel="stylesheet">
    <link href="<%=basePath %>/css/plugins/summernote/summernote-lite.css" rel="stylesheet">

    <link href="<%=basePath %>/css/xzw.css" rel="stylesheet">
    <link href="<%=basePath %>/css/plugins/bootstrap-fileinput/fileinput.min.css" rel="stylesheet">

</head>

<body onload="newMsg()" onload="warn()" class="fixed-sidebar full-height-layout gray-bg">
    <div class="row border-bottom white-bg">
        <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header"><a  href="user-jmpHomePage"><img src="<%=basePath %>/img/logo.png" style="height: 50px;margin: 10px 0px 5px 50px;"> </a></div>
            <ul class="nav navbar-top-links navbar-right">
                <a id="yourName" class="dropdown J_tabClose" data-toggle="dropdown">${sessionScope.user.name}<span class="caret"></span></a>
                <ul  role="menu" class="dropdown-menu dropdown-menu-right">
                    <li  class="J_tabShowActive"><a href="user-jmpMyProfile">个人中心</a>
                    </li>
                    <li class="divider"></li>
                    <li  class="J_tabShowActive"><a href="user-jmpMessageCenter">消息中心</a>
                    </li>
                    <li class="divider"></li>
                    <s:if test='#session.orgManager!="0"'>
                        <li class="J_tabShowActive"><a href="Organization-jmpOrgManager">机构管理</a>
                        </li>
                        <li class="divider"></li>
                    </s:if>
                    <li class="J_tabCloseAll"><a id="exit" class="J_menuItem" >安全退出</a>
                </li>
                </ul>
                <li class="dropdown hidden-xs">
                <a id="exit1" class="right-sidebar-toggle" aria-expanded="false" >
                    <img src="<%=basePath %>/img/exit.png">
                </a>
            </li>
            </ul>
        </nav>
    </div>
    <div>
        <div class="col-md-12 form-group" style="margin-top:6%">
        <div class="col-md-2 col-md-offset-2">
            <a href="user-jmpCurrentProjectList">
                <img src="<%=basePath %>/img/Home2_change.jpg" style="height:160px; width:160px;border-radius:10%"><br/>
            </a>
            <span style="display:block;margin:20px 0 0 0;color:#658387;font-size:18px;font-weight:bold">当前项目</span>
            <span style="color:black">目前有</span>
            <span style="color: #ff0000">
            <s:if test='#session.countnow==null'>
                <s:property value="0"/>
            </s:if>
            <s:else>
                <s:property value="#session.countnow"/>
            </s:else>
        </span>
            <span style="color:black">个项目</span>
        </div>
        <div class="col-md-2">
            <a href="user-jmpCompletedProjectList">
                <img src="<%=basePath %>/img/Home1_change.png" style="height:160px; width:160px;border-radius:10%"><br/>
            </a>
            <span style="display:block;margin:20px 0 0 0;color:#658387;font-size:18px;font-weight:bold">历史项目</span>
            <span style="color:black">完成了</span>
            <span style="color: #ff0000">
            <s:if test='#session.counthistory==null'>
                <s:property value="0"/>
            </s:if>
            <s:else>
                <s:property value="#session.counthistory"/>
            </s:else>
        </span>
            <span style="color:black">个项目</span>
        </div>
        <div class="col-md-2 ">
            <a href="structure-getcommon">
                <img src="<%=basePath %>/img/Home3_change.jpg" style="height:160px; width:160px;border-radius:10%"><br/>
            </a>
            <span style="display:block;margin:20px 0 0 0;color:#658387;font-size:18px;font-weight:bold">文档构件</span>
            <span style="color:black">收藏了</span>
            <a href="structure-Mycollect"><span style="color: #ff0000" class="lzf_a">
                <s:if test='#session.collectNum==null'>
                    <s:property value="0"/>
                </s:if>
                <s:else>
                    <s:property value="#session.collectNum"/>
                </s:else></span></a>
            <span style="color:black">个构件</span>
        </div>
        <div class="col-md-2 ">
            <a href="user-jmpMessageCenter">
                <img src="<%=basePath %>/img/Home4_change.jpg" style="height:160px; width:160px;border-radius:10%"><br/>
            </a>
            <span style="display:block;margin:20px 0 0 0;color:#658387;font-size:18px;font-weight:bold">消息中心</span>
            <span style="color:black">收到了</span>
            <span style="color: #ff0000">
            <s:if test='#session.nowNews==null'>
                <s:property value="0"/>
            </s:if>
            <s:else>
                <s:property value="#session.nowNews"/>
            </s:else>
        </span>
            <span style="color:black">条邀请</span>
        </div>
    </div>
        <div style="position:absolute; left:1150px; top: 400px">
        <a href="user-jmpNewproject"><img src="<%=basePath %>/img/new.png" height="60px" width="60px" title="新建项目" alt="新建项目"></a>
    </div>
    <div style="width: 66px;position: fixed;bottom: 20px;right: 25px;font-size: 0;line-height: 0;z-index: 100;">我在右下角 </div>
    </div>
<script src="<%=basePath %>/js/jquery.min.js?v=2.1.4"></script>
<script src="<%=basePath %>/js/bootstrap.min.js"></script>
<%--bootstrap-table--%>
<script src="<%=basePath %>/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="<%=basePath %>/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>

<script src="<%=basePath %>/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="<%=basePath %>/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="<%=basePath %>/js/plugins/layer/layer.min.js"></script>
<script src="<%=basePath %>/js/hplus.min.js?v=4.1.0"></script>
<script type="text/javascript" src="<%=basePath %>/js/contabs.min.js"></script>
<script src="<%=basePath %>/js/plugins/pace/pace.min.js"></script>
<script src="<%=basePath %>/js/plugins/toastr/toastr.min.js"></script>
<script src="<%=basePath %>/js/plugins/sweetalert/sweetalert.min.js"></script>

<script src="<%=basePath %>/js/plugins/summernote/summernote.min.js"></script>
<script src="<%=basePath %>/js/plugins/summernote/summernote-bs4.min.js"></script>
<script src="<%=basePath %>/js/plugins/summernote/summernote-lite.js"></script>
<script src="<%=basePath %>/js/plugins/summernote/summernote-zh-CN.js"></script>
<script src="<%=basePath %>/js/plugins/bootstrap-fileinput/fileinput.js"></script>
<script src="<%=basePath %>/js/plugins/bootstrap-fileinput/plugins/sortable.min.js"></script>
<script src="<%=basePath %>/js/plugins/bootstrap-fileinput/locales/zh.js"></script>
<script src="<%=basePath %>/js/mjy.js"></script>
</body>
<script>
    $("#exit").click(function () {
        swal(
            {
                title: "您确认退出吗？",
                text: "确认请点击退出",
                type: "",
                showCancelButton: true,
                confirmButtonColor: "#18a689",
                confirmButtonText: "退出",
                cancelButtonText: "取消",
                closeOnConfirm: false
            }, function () {
                location.href = "login-jmpLogin";
            })
    });
    $("#exit1").click(function () {
            swal(
                {
                    title: "您确认退出吗？",
                    text: "确认请点击退出",
                    type: "",
                    showCancelButton: true,
                    confirmButtonColor: "#18a689",
                    confirmButtonText: "退出",
                    cancelButtonText: "取消",
                    closeOnConfirm: false
                }, function () {
                    location.href = "login-jmpLogin";
                })
        });

    function setCookie(name, value) {
        // var exp = new Date();
        // exp.setTime(exp.getTime() + 24 * 60 * 60 * 1000);
        // document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString() + ";path=/";
        var d = new Date();
        d.setTime(d.getTime()+(24*60*60*1000));
        var expires = "expires="+d.toGMTString();
        document.cookie = encodeURI(name) + "=" + encodeURI(value) + ";" + expires+"; path=/";
    }
    //读取cookies
    function getCookie(name) {
        // var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
        //
        // if (arr = document.cookie.match(reg))
        //
        //     return unescape(arr[2]);
        // else
        //     return null;
        var cname = encodeURI(name) + "=";
        var ca = document.cookie.split(';');
        for(var i=0; i<ca.length; i++)
        {
            var c = ca[i].trim();
            if (c.indexOf(cname)==0) return decodeURI(c.substring(cname.length,c.length));
        }
        return "";
    }

    function delCookie(name) {
        var exp = new Date();
        exp.setTime(exp.getTime() - 24 * 60 * 60 * 1000);
        var cval = getCookie(name);
        if (cval != null)
            document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString() + ";path=/";
    }

    function warn() {
        if("${sessionScope.onLine}" === "true"){
            $.ajax({
                url: "user-warn",
                type: "Post",
                async: "false",
                success: function (result) {
                    swal({
                        title: "您的账户存在重复登录",
                        text: "请确认账户安全",
                        type: "warning",
                        confirmButtonColor: "#18a689",
                        confirmButtonText: "OK"
                    })
                }
            })
        }
    }

    function newMsg() {
        if((getCookie("msgNum"+"${sessionScope.user_name}")=="undefined")||(getCookie("msgNum"+"${sessionScope.user_name}")==null)||(getCookie("msgNum"+"${sessionScope.user_name}")=="")){
            setCookie("msgNum"+"${sessionScope.user_name}",${sessionScope.msgNum});
        }
        $.ajax({
            url: "login-msgNum",
            type: "Post",
            async: false,
            success: function(result) {
            if (parseInt(result.msgNum) > parseInt(getCookie("msgNum"+"${sessionScope.user_name}")))
            {
            swal({
                title: "新消息提醒",
                text: "您有新消息！",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "确认",
                cancelButtonText: "取消",
                closeOnConfirm: true
            }, function () {
                document.cookie="msgNum${sessionScope.user_name}"+"=${result.msgNum}";
                location.href = "user-jmpMessageCenter"
            })
            }
            }
        })
    }
</script>

<!-- Mirrored from www.zi-han.net/theme/hplus/ by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:17:11 GMT -->
</html>

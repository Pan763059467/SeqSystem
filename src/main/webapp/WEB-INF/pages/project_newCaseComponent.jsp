<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<!-- Mirrored from www.zi-han.net/theme/hplus/ by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:16:41 GMT -->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>新建用例构件</title>
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link rel="shortcut icon" href="<%=basePath %>/example/favicon.ico">
    <link href="<%=basePath %>/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="<%=basePath %>/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="<%=basePath %>/css/animate.min.css" rel="stylesheet">
    <link href="<%=basePath %>/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="<%=basePath %>/css/lzf.css" rel="stylesheet">
    <link href="<%=basePath %>/css/z_style.css" rel="stylesheet">
    <link href="<%=basePath %>/css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <link href="<%=basePath %>/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=basePath %>/css/plugins/bootstrap-table/bootstrap-table.css" rel="stylesheet">
    <link href="<%=basePath %>/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="<%=basePath %>/css/z_style.css" rel="stylesheet">

    <link href="<%=basePath %>/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="<%=basePath %>/css/button.css" rel="stylesheet">
</head>
<body class="fixed-sidebar  gray-bg" style="overflow:hidden">

<!--<div id="wrapper" style="padding: 0px" class="wrapper wrapper-content animated fadeInDown gray-bg">-->
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


<div id="next1" style="width: 100%;margin: 0 auto;font-weight: 400" class="gray-bg">
    <div class=" row wrapper white-bg" style="padding:5px" >
        <ol class="breadcrumb" style="margin-left: 55px">
            <li style="font-size: 15px">
                <strong>
                    <a href="user-jmpHomepage"><span class="lzf_b" style="color:#658387">首页</span></a> >> <a href="structure-getcommon"><span class="lzf_b" style="color:#658387">构件库</span></a> >> <a href="structure-getpersonal"><span class="lzf_b" style="color:#658387">个人构件库></span></a> >> <a href="structure-newCase">新建用例构件</a>
                </strong>
            </li>
        </ol>
    </div>
    <div>
        <div class="ibox-content form-horizontal content cataloNotNoneContent gray-bg">
    <div id="main" style="margin-top:10px;margin-left: 5%;margin-right: 5%" class="white-bg">
  	    <div class="form-group" style="margin-right: 5px;margin-left: 5px">
        <label class="col-sm-2 control-label" style="text-align: left">功能点名称：</label>
        <div class="col-sm-8" style="margin-top: 3px">
            <input type="email" name="funName" id="funName"  class="form-control dis" >
        </div>
    </div>
        <div class="form-group" style="margin-right: 5px;margin-left: 5px">
            <label class="col-sm-2 control-label" style="text-align: left">优先级</label>

            <div class="col-sm-4">
                <select class="form-control m-b dis"  name="priority" id="priority" >
                    <option value="1">高</option>
                    <option value="2">中</option>
                    <option value="3">低</option>
                </select>
            </div>
        </div>

        <div class="form-group" style="margin-right: 5px;margin-left: 5px">
            <label style="padding-left: 15px">功能点描述</label>
            <div class="click1edit wrapper" name="describe" id="describe">
                暂无功能点描述
            </div>
        </div>

        <div class="form-group" style="margin-right: 5px;margin-left: 5px">

            <label style="padding-left: 15px">用例过程</label>
            <table class="col-sm-12 table funTable table-bordered">
                <thead>
                <tr>
                    <th class="col-xs-2 "></th>
                    <th class="col-sm-2">角色</th>
                    <th class="col-sm-6">描述</th>
                    <th class="col-sm-2">操作</th>
                </tr>
                </thead>
                <tbody>
                <tr class="end">
                    <th colspan="4">
                        <!--没有办法的办法三个button不居中，设置第一个margin-left: 35%，放大缩小会存在问题-->
                        <button  class="btn btn-primary  btn-xs col-lg-push-1 dis" disabled onclick="addFunlLine()" type="button" style="margin-right: 10px;margin-left: 35%">新增用例过程</button>
                        <button  class="btn btn-primary  btn-xs col-lg-push-1 dis" disabled  type="button" data-toggle="modal" data-target="#addUsableModel" onclick="addUsable()"  style="margin-right: 10px">新增全局可用性</button>
                        <button  class="btn btn-primary  btn-xs col-lg-push-1 dis" disabled  type="button" data-toggle="modal" data-target="#addSecurityModel" onclick="addSecurity()"  style="margin-right: 10px">新增全局安全性</button>
                    </th>
                </tr>
                </tbody>
                <tfoot>

                </tfoot>
            </table>

        </div>
        <div class="form-group" style="margin-right: 5px;margin-left: 5px">
            <label style="padding-left: 15px">输入</label>
            <div class="click1edit wrapper" name="in" id="in">
                暂无输入
            </div>
        </div>
        <div class="form-group" style="margin-right: 5px;margin-left: 5px">
            <label style="padding-left: 15px">输出</label>
            <div class="click1edit wrapper" name="out" id="out">
                暂无输出
            </div>
        </div>
        <div class="form-group" style="margin-right: 5px;margin-left: 5px">
            <label style="padding-left: 15px">基本操作流程</label>
            <div class="click1edit wrapper" name="basic" id="basic">
                暂无基本操作流程
            </div>
        </div>
        <div class="form-group" style="margin-right: 5px;margin-left: 5px">
            <label style="padding-left: 15px">备选操作流程</label>
            <div class="click1edit wrapper" name="alternative" id="alternative">
                暂无备选操作流程
            </div>
        </div>

        <div class="modal inmodal" id="addUsableModel" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content animated bounceInRight">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                        </button>
                        <i class="fa fa-plus modal-icon"></i>
                        <h4 class="modal-title">新增可用性</h4>
                    </div>
                    <div class="modal-body">
                        <select id="uaSelect"  multiple="" class="form-control">
                        </select>
                        <form class="form-horizontal">
                            <div id="uadisplay" class="form-group" style="padding-top: 15px">
                                <label  class="col-sm-3 control-label">可用性模式</label>
                                <h5 id="uaname" class="col-sm-9">...</h5>

                                <label  class="col-sm-3 control-label">适用范围</label>
                                <h5 id="uaproblem" class="col-sm-9">...</h5>

                                <label  class="col-sm-3 control-label">解决方案</label>
                                <h5 id="uasolution" class="col-sm-9">...</h5>

                                <label  class="col-sm-3 control-label">举例</label>
                                <h5 id="uaexample" class="col-sm-9">...</h5>
                            </div>

                            <div id="parahint" class="form-group">
                                <div id="showpara1">
                                    <label for="para" class="col-sm-3 control-label">发生条件</label>
                                    <div class="col-sm-9">  <input class="form-control" id="para" placeholder="操作名称" type="text">
                                    </div>
                                </div>
                            </div>

                        </form>


                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" onclick="addUsabelLine()" data-dismiss="modal">新增</button>
                    </div>
                </div>
            </div>
        </div>


        <div class="modal inmodal" id="addSecurityModel" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content animated bounceInRight">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                        </button>
                        <i class="fa fa-plus modal-icon"></i>
                        <h4 class="modal-title">新增安全性</h4>
                    </div>
                    <div class="modal-body">
                        <select id="seSelect"  multiple="" class="form-control">
                        </select>
                        <form class="form-horizontal">
                            <div id="sedisplay" class="form-group" style="padding-top: 15px">
                                <label  class="col-sm-3 control-label">安全性模式</label>
                                <h5 id="sename" class="col-sm-9">...</h5>

                                <label  class="col-sm-3 control-label">适用范围</label>
                                <h5 id="seproblem" class="col-sm-9">...</h5>

                                <label  class="col-sm-3 control-label">解决方案</label>
                                <h5 id="sesolution" class="col-sm-9">...</h5>

                                <label  class="col-sm-3 control-label">举例</label>
                                <h5 id="seexample" class="col-sm-9">...</h5>
                            </div>

                            <div id="parahint" class="form-group">
                                <div id="showpara1">
                                    <label for="para" class="col-sm-3 control-label">发生条件</label>
                                    <div class="col-sm-9">  <input class="form-control" id="para2" placeholder="操作名称" type="text">
                                    </div>
                                </div>
                            </div>

                        </form>


                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" onclick="addSecurityLine()" data-dismiss="modal">新增</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</div>
</div>

</body>
<script src="<%=basePath %>/js/jquery.min.js?v=2.1.4"></script>
<script src="<%=basePath %>/js/bootstrap.min.js?v=3.3.6"></script>
<script src="<%=basePath %>/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
<script src="<%=basePath %>/js/plugins/sweetalert/sweetalert.min.js"></script>
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

</script>
<!-- Mirrored from www.zi-han.net/theme/hplus/ by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:17:11 GMT -->
</html>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: zhiweixu
  Date: 18/12/2017
  Time: 09:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>项目信息</title>
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
    <link href="<%=basePath %>/css/button.css" rel="stylesheet">

</head>

<body class="gray-bg animated fadeInDown">
<div  class="modal inmodal" id="Task" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                </button>
                <h4 class="modal-title">分配任务</h4>
            </div>
            <div class="modal-body">
                <div class="form-group"><label>选择责任人</label>
                    <select id = "choosePer" class="form-control">
                        <option name="" disabled  selected="selected">请选择</option>
                        <s:iterator var = "members" value="list_members">
                            <option name=""><s:property value="#members.name"/> </option>
                        </s:iterator>
                    </select>
                </div>
                <div class="form-group"><label>选择功能点</label>
                    <select id = "chooseFunction" class="form-control">
                        <option name="" disabled  selected="selected">请选择</option>
                        <s:iterator var = "functions" value="list_functions">
                            <option value="<s:property value="#functions.id_catalog"/>"><s:property value="#functions.title"/> </option>
                        </s:iterator>
                    </select>
                </div>
            </div>
            <div class="modal-footer">
                <button id="cancel_task" type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                <button id="task_per" type="submit" class="btn btn-primary">确认</button>
            </div>
        </div>
    </div>
</div>

<div  class="modal inmodal" id="newIteration" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                </button>
                <h4 class="modal-title">创建迭代</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>创建</label>
                    <input id="IterationName" type="text" maxlength="20" placeholder="请输入迭代名" class="form-control" required="true" autocomplete="off">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                <button id="button_newIter" type="button" class="btn btn-primary">创建</button>
            </div>
        </div>
    </div>
</div>

<div  class="modal inmodal" id="chooseVersion" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                </button>
                <h4 class="modal-title">选择需求文档版本</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <select id = "version" class="form-control">
                        <option name="now">${sessionScope.version}</option>
                        <s:iterator var = "document" value="list3">
                            <option name="showVersion"><s:property value="#document.VERSION"/> </option>
                        </s:iterator>
                    </select>
                </div>
            </div>
            <div class="modal-footer">
                <button id="cancel_choose" type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                <button id="choose" type="button" class="btn btn-primary">确认</button>
            </div>
        </div>
    </div>
</div>
<%--promp layer1--%>
<div  class="modal inmodal" id="newUser" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                </button>
                <h4 class="modal-title">邀请成员</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>邀请</label>
                    <input id="UserName" type="text" maxlength="20" placeholder="请输入用户名" class="form-control" required="true" autocomplete="off">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" id="button_cancel" class="btn btn-white" data-dismiss="modal" onclick="javascript:document.getElementById('UserName').value=''">取消</button>
                <button id="button_invite" type="button" class="btn btn-primary">邀请</button>
            </div>
        </div>
    </div>
</div>
<%--promp layer2--%>
<div  class="modal inmodal" id="switchPM" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                </button>
                <h4 class="modal-title">转移组长</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>转移给</label>
                    <input id="MemberName" type="text" placeholder="请输入用户名" class="form-control" required="true" autocomplete="off">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                <button id="button_alter" type="button" class="btn btn-primary">转移</button>
            </div>
        </div>
    </div>
</div>

<div  class="modal inmodal" id="say" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                </button>
                <h4 class="modal-title">发表评论</h4>
            </div>
            <div class="modal-body">
                <div class="ibox-content">
                    <div class="click2edit wrapper discuss">
                    </div>
                </div>
                <div class="file-loading">
                    <!-- The file input field used as target for the file upload widget -->
                    <input id="fileupload" name="MyFile" type="file" class="file" multiple data-msg-placeholder="选择要上传的文件">
                </div>
            </div>
            <div class="modal-footer">
                <div id="alterable" style="visibility: visible">
                    <button id="cancel-say" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button class="btn btn-primary pull-right" onclick="commitDiscuss()" type="submit">发表评论</button>
                    <%--<label class="pull-right">没有附件？直接点这里--></label>--%>
                </div>
            </div>
        </div>
    </div>
</div>
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
<div  class="modal inmodal" id="newDocument" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                </button>
                <h4 class="modal-title">新建文档组</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>文档名</label>
                    <input id="DocName" type="text" placeholder="请输入文档名" class="form-control" required="true" autocomplete="off">
                </div>
                <div class="form-group">
                    <label>选择创建的文档组类型</label>
                    <select class="form-control m-b dis"  name="type" id="type" >
                        <option value="1">远景与范围文档</option>
                        <option value="2">设计文档</option>
                        <option value="3">需求文档</option>
                        <option value="4">测试计划文档</option>
                    </select>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                <button id="newDoc" type="button" class="btn btn-primary">新建</button>
            </div>
        </div>
    </div>
</div>
<div class="animated fadeInDown" style="overflow:hidden">
    <div class=" row wrapper white-bg" style="padding:5px">
        <ol class="breadcrumb" style="margin-left: 40px">
            <li style="font-size: 15px">
                <strong>
                    <a href="user-jmpHomepage"><span class="lzf_b" style="color:#658387">首页</span></a> >>
                    <s:if test='#session.project.state==1'>
                        <a href="user-jmpCurrentProjectList"><span class="lzf_b" style="color:#658387">当前项目</span></a>
                    </s:if>
                    <s:if test='#session.project.state==0'>
                        <a href="user-jmpCompletedProjectList"><span class="lzf_b" style="color:#658387">历史项目</span></a>
                    </s:if>
                     >> <a href="project-jmpProjectInfo"><span class="lzf_b">项目信息</span></a>
                </strong>
            </li>
        </ol>
    </div>

    <div id="page-wrapper" class="dashbard-1">
        <div class="ibox-content modal-body">
            <div class="row">
                <div class="col-sm-6">
                    <div class="m-b-md">
                        <h2>
                            <strong><s:property value="#session.project.name"/></strong>
                            <s:if test='#session.project.state==1'>
                                <span class="label label-info">进行中</span>
                            </s:if>
                            <s:if test='#session.project.state==0'>
                                <span class="label label-default">已完成</span>
                            </s:if>


                        </h2>
                    </div>
                </div>
                <div class="col-sm-6">
                    <s:if test='#session.project.state==1'>
                        <s:if test='#session.rank==3'>
                            <%--<button id="createDoc" class="btn btn-success"><i class="fa fa-file"></i>新建文档</button>--%>
                            <div style="float: right;margin-right: 20px">
                                <button id="endProject"  class="btn btn-danger">结束项目</button>
                            </div>
                        </s:if>
                    </s:if>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-5">
                    <dl class="dl-horizontal">
                        <dt><h3>项目组长：</h3></dt>
                        <dd><h3><s:property value="#session.PM.name"/></h3></dd>

                        <dt><h3>创建时间：</h3></dt>
                        <dd><h3><s:property value="#session.project_date"/></h3></dd>

                        <dt><h3>项目简介：</h3></dt>
                        <dd><p style="font-size: 14px;font-family: Arial"><s:property value="#session.project.intro"/></p></dd>
                    </dl>
                </div>
                <div class="col-sm-7">
                    <dl class="dl-horizontal">



                        <dt><h3>所属机构：</h3></dt>
                        <dd><h3><s:property value="#session.project.orgName"/></h3></dd>
                    <s:if test='#session.project.state==1'>
                        <s:if test='#session.rank==3'>
                        <s:if test='#session.project.id_Organization!=""'>
                            <dt><h3>文档权限：</h3></dt>
                            <dd><h3><span id="open">
                                        开放 <button id="modified1" class="btn btn-success btn-xs">更改</button>
                                    </span>
                                    <span id="close">
                                        封闭 <button id="modified2" class="btn btn-success btn-xs">更改</button>
                                    </span>
                            </h3></dd>
                        </s:if>
                        </s:if>
                    </s:if>
                    </dl>
                </div>
            </div>
            <div class="row m-t-sm">
                <div class="col-sm-12">
                    <div class="panel blank-panel">
                        <div class="panel-heading">
                            <div class="panel-options">
                                <ul class="nav nav-tabs">
                                    <li >
                                        <a href="#tab-1" data-toggle="tab">文档组管理</a>
                                    </li>
                                    <li>
                                        <a href="#tab-2" data-toggle="tab">成员管理</a>
                                    </li>
                                    <%--<li>--%>
                                        <%--<a href="#tab-3" data-toggle="tab">讨论区</a>--%>
                                    <%--</li>--%>
                                    <li>
                                        <a href="#tab-4" data-toggle="tab">项目管理</a>
                                    </li>
                                    <li>
                                        <a href="#tab-5" data-toggle="tab">任务栏</a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="panel-body">

                            <div class="tab-content">
                                <div class="tab-pane" id="tab-5">
                                    <div class="panel-body">
                                        <div class="col-sm-7 ui-sortable">
                                            <div class="ibox float-e-margins">
                                                <div class="ibox-title">
                                                    <h5>任务栏</h5>
                                                    <div class="ibox-tools">
                                                        <s:if test='#session.project.state==1'>
                                                            <s:if test="#session.rank==3">
                                                        <button class="label label-warning"  data-toggle="modal" data-target="#Task" type="submit">分配任务</button>
                                                            </s:if>
                                                        </s:if>
                                                    </div>
                                                </div>
                                                <div class="bootstrap-table">
                                                        <table id="TaskList" data-toggle="table"
                                                               data-classes="table table-no-bordered"
                                                               data-click-to-select="true"
                                                               data-search="true"
                                                               data-show-refresh="true"
                                                               data-show-toggle="true"
                                                               data-show-columns="true"
                                                               data-toolbar="#toolbar"
                                                               data-query-params="quefryParams"
                                                               data-pagination="true"
                                                               data-halign="center"
                                                               data-striped="true"
                                                               data-page-size="5"
                                                               data-height="600"
                                                        >
                                                        </table>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-5 ui-sortable">
                                            <!--自己的留言开始-->
                                            <div class="row" style="height: 42px">
                                                <div class="ibox float-e-margins">
                                                    <div class="ibox-title">
                                                        <div class="col-md-6">
                                                            <h5 style="margin-right: 10px">留言区</h5>
                                                            <p>共 <var id="num" style="color: red"></var> 条留言</p>
                                                        </div>
                                                        <div id="sayComments" style="visibility: visible;float: right" class="col-md-4" >
                                                            <button class="btn btn-success pull-right" data-toggle="modal" data-target="#say" type="submit">发表评论</button>
                                                            <%--<label class="pull-right">没有附件？直接点这里--></label>--%>
                                                        </div>
                                                        <!-- The file upload form used as target for the file upload widget -->
                                                    </div>
                                                </div>
                                            </div>
                                            <!--自己的留言结束-->
                                            <div class="allDiscuss">
                                                <!--一行留言-->
                                                <!--一行留言结束-->
                                            </div>
                                            <div style="text-align:center;">
                                                <a onclick="previous()">上一页</a>&nbsp;&nbsp;
                                                <strong>第 <var id="index"></var> 页</strong>&nbsp;&nbsp;
                                                共 <var id="pages"></var> 页&nbsp;&nbsp;
                                                <a onclick="next()">下一页</a>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tab-4">
                                    <div id="managerProject">
                                        <s:if test='#session.version!=0'>
                                            <button id="now" class="btn btn-success" class="btn btn-success" data-toggle="modal" data-target="#chooseVersion"><i class="fa"></i>当前需求版本：${sessionScope.version}</button> <button id="newIteration2" style="display: block;margin-top: 10px" class="btn btn-success" data-toggle="modal" data-target="#newIteration"><i class="fa"></i>创建迭代</button>
                                        </s:if>
                                        <s:else>
                                            该项目下暂无需求文档
                                        </s:else>
                                    </div>
                                    <div class="bootstrap-table" >
                                        <div class="wrapper wrapper-content" style="margin: 10px 0px 10px 0px">
                                            <div class="ibox float-e-margins">
                                                        <div class="ibox-title">
                                                            <h5>功能点列表</h5>
                                                            <div class="ibox-tools">

                                                            </div>
                                                        </div>
                                                        <div class="ibox-content">
                                                            <div class="row">
                                                                <div class="col-sm-2 m-b-xs">
                                                                    <select id = "chooseIter" class="form-control" onchange="IterChange()">
                                                                        <option name="all">全部功能点</option>
                                                                        <s:iterator var = "iter" value="list2">
                                                                            <option value="<s:property value="#iter.ID_ITER"/>"><s:property value="#iter.ITER_NAME"/> </option>
                                                                        </s:iterator>
                                                                    </select>
                                                                </div>
                                                                <%--<div class="col-md-4">--%>
                                                                    <%--<button id="iter_add" class="btn btn-primary" style="display: none">导入功能点</button>--%>
                                                                    <%--<button id="iter_del" class="btn btn-danger" style="display: none">删除功能点</button>--%>
                                                                <%--</div>--%>
                                                            </div>
                                                            <div class="bootstrap-table">
                                                                <table id="FunctionList" data-toggle="table"
                                                                       data-classes="table table-no-bordered"
                                                                       data-click-to-select="true"
                                                                       data-search="true"
                                                                       data-show-refresh="true"
                                                                       data-show-toggle="true"
                                                                       data-show-columns="true"
                                                                       data-toolbar="#toolbar"
                                                                       data-query-params="quefryParams"
                                                                       data-pagination="true"
                                                                       data-halign="center"
                                                                       data-striped="true"
                                                                       data-page-size="5"
                                                                       data-height="600"
                                                                >
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                        </div>
                                    </div>
                                </div>
                                <%--<div class="tab-pane" id="tab-3">--%>
                                    <%--<!--自己的留言开始-->--%>
                                    <%--<div class="row" style="height: 42px">--%>
                                        <%--<div class="ibox float-e-margins">--%>
                                            <%--<div class="ibox-title">--%>
                                                <%--<div class="col-md-4">--%>
                                                    <%--<p>共 <var id="num"></var> 条留言</p>--%>
                                                <%--</div>--%>
                                                <%--<div id="sayComments" style="visibility: visible;float: right" class="col-md-4" >--%>
                                                    <%--<button class="btn btn-success pull-right" data-toggle="modal" data-target="#say" type="submit">发表评论</button>--%>
                                                    <%--&lt;%&ndash;<label class="pull-right">没有附件？直接点这里--></label>&ndash;%&gt;--%>
                                                <%--</div>--%>
                                                <%--<!-- The file upload form used as target for the file upload widget -->--%>
                                            <%--</div>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                    <%--<!--自己的留言结束-->--%>
                                    <%--<div class="allDiscuss">--%>
                                        <%--<!--一行留言-->--%>
                                        <%--<!--一行留言结束-->--%>
                                    <%--</div>--%>
                                    <%--<div style="text-align:center;">--%>
                                        <%--<a onclick="previous()">上一页</a>&nbsp;&nbsp;--%>
                                        <%--<strong>第 <var id="index"></var> 页</strong>&nbsp;&nbsp;--%>
                                        <%--共 <var id="pages"></var> 页&nbsp;&nbsp;--%>
                                        <%--<a onclick="next()">下一页</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <div class="tab-pane" id="tab-2">
                                    <div id="toolbar1">
                                        <s:if test='#session.project.state==1'>
                                            <s:if test="#session.rank==3">
                                                    <button id="searchUser" class="btn btn-success" data-toggle="modal" data-target="#newUser">
                                                        <i class="glyphicon glyphicon-zoom-in"></i>邀请成员
                                                    </button>&nbsp;
                                                <button id="alterPM" class="btn btn-warning" data-toggle="modal" data-target="#switchPM">
                                                    <i class="glyphicon"></i>转移组长
                                                </button>
                                            </s:if>
                                        </s:if>
                                    </div>
                                    <div class="bootstrap-table" >
                                        <table id="projectMember" data-toggle="table"
                                               data-classes="table table-no-bordered"
                                               data-click-to-select="true"
                                               data-search="true"
                                               data-show-refresh="true"
                                               data-show-toggle="true"
                                               data-show-columns="true"
                                               data-toolbar="#toolbar"
                                               data-query-params="quefryParams"
                                               data-pagination="true"
                                               data-halign="center"
                                               data-striped="true"
                                               data-page-size="5"
                                               data-height="600"
                                        >
                                        </table>
                                    </div>
                                </div>
                                <div class="tab-pane active" id="tab-1">

                                    <div id="toolbar2">


                                        <button id="createDoc" class="btn btn-success" data-toggle="modal" data-target="#newDocument"><i class="fa fa-file"></i>新建文档组</button>


                                    </div>
                                    <div class="bootstrap-table" >
                                        <table id="projectDocs" data-toggle="table"
                                               data-classes="table table-no-bordered"
                                               data-click-to-select="true"
                                               data-search="true"
                                               data-show-refresh="true"
                                               data-show-toggle="true"
                                               data-show-columns="true"
                                               data-toolbar="#toolbar2"
                                               data-query-params="quefryParams"
                                               data-pagination="true"
                                               data-halign="center"
                                               data-striped="true"
                                               data-page-size="5"
                                               data-height="600"
                                        >
                                        </table>
                                    </div>
                                </div>
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
<script src="<%=basePath %>/js/projectInformation.js"></script>
<script src="<%=basePath %>/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>

<script>
    var version3 = <s:property value="#session.version"/>;
    var id_Project = "<s:property value="#session.project.id_Project"/>";
    var version2 = <s:property value="#session.version"/>;
    var id_User = "<s:property value="#session.user.id_user"/>";
    var version_temp = <s:property value="#session.version_temp"/>;
    var discuss="";


    $.ajax(
        {
            type:"get",
            url: "project-getFunctionList",
            data: {
                Id_Project: id_Project,
                version: version3
            },
            dataType:"json",
            success:function(json){
                var FunctionList = JSON.parse(json.FunctionList);
                $('#FunctionList').bootstrapTable('load',FunctionList);
            },
            error:function(){
                swal({
                    icon: "error"
                });
            }
        }
    );

    $.ajax(
        {
            type:"get",
            url: "project-getTaskList",
            data: {
                Id_Project: id_Project,
                version: version3
            },
            dataType:"json",
            success:function(json){
                var TaskList = JSON.parse(json.TaskList);
                $('#TaskList').bootstrapTable('load',TaskList);
            },
            error:function(){
                swal({
                    icon: "error"
                });
            }
        }
    );
</script>
<script>
    var id_Project = "<s:property value="#session.project.id_Project"/>";
    var id_User = "<s:property value="#session.user.id_user"/>";
    var user_name = "${session.user.name}";
    var discuss="";

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


    $('#projectMember').bootstrapTable({
            columns: [
                {
                    field: 'name',
                    title: '用户名',
                    sortable: true,
                    align: 'center'
                },
                {
                    field: 'realname',
                    title: '真实姓名',
                    sortable: true,
                    align: 'center'
                },{
                    field: 'rank',
                    title: '职务',
                    align: 'center',
                    sortable: true,
                    sortOrder: 'asc',
                    rememberOrder: true,
                    formatter: "rankFormatter"
                },{
                    field: 'mail',
                    title: '邮箱',
                    align: 'center'
                },{
                    field: 'tel',
                    title: '电话',
                    align: 'center'
                },{
                    field: 'operate',
                    title: '操作',
                    align: 'center',
                    events: "actionEvents",
                    formatter: "operateFormatter"
                }
            ]
        }
    );


    $.ajax(
        {
            type: "post",
            url: "project-getProjectMember",
            data: {Id_Project: id_Project},
            dataType: "json",
            success: function (json) {
                var proList = JSON.parse(json.res);
                //finishingTask为table的id
                $('#projectMember').bootstrapTable('load', proList);
                discussInit();
                discussReload2();
            },
            error: function () {
                swal({
                    icon: "error"
                });
            }
        }
    );

    function proMemberReload() {
        $.ajax(
            {
                type: "post",
                url: "project-getProjectMember",
                data: {Id_Project: id_Project},
                dataType: "json",
                success: function (json) {
                    var proList = JSON.parse(json.res);
                    //finishingTask为table的id
                    $('#projectMember').bootstrapTable('load', proList);
//                    discussInit();
//                    discussReload2();
                },
                error: function () {
                    swal({
                        icon: "error"
                    });
                }
            }
        );
    }

    function rankFormatter(value,row,index) {
        if (row.rank===3) {
            return '组长';
        }
        else if (row.rank===4){
            return '副组长';
        }
        else {
            return '组员';
        }
    }
    function operateFormatter(value,row,index) {
        <s:if test="#session.rank==3">
        if (row.rank==5){
            return ['<a class="mod img-info"><img src="<%=basePath%>/img/deputyleader.png" height="20px" width="20px" title="设为副组长" alt="设为副组长"></a>',
                '<span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</span>',
                '<a class="delete"><img src="<%=basePath%>/img/deletemember.png" height="20px" width="20px" title="移除成员" alt="移除成员"></a>'].join('');
        }
        else if (row.rank==4){
            return ['<a class="mod img-danger"><img src="<%=basePath%>/img/undeputyleader.png" height="20px" width="20px" title="撤销副组长" alt="撤销副组长"></a>',
                '<span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</span>',
                '<a class="delete"><img src="<%=basePath%>/img/deletemember.png" height="20px" width="20px" title="移除成员" alt="移除成员"></a>'].join('');
        }</s:if>
    }



    //表格  - 操作 - 事件
    window.actionEvents = {
        'click .mod':
            function(e, value, row, index) {
                //修改操作
                var id_user = parseInt(row.id_user);
                var elem = $(this);
                if (elem.hasClass("img-info")) {
                    swal(
                        {
                            title: "您确定要将此成员设为副组长吗",
                            text: "请谨慎操作！",
                            type: "",
                            showCancelButton: true,
                            confirmButtonColor: "#18a689",
                            confirmButtonText: "确认",
                            cancelButtonText: "取消",
                            closeOnConfirm: true
                        }, function () {
                            $.ajax({
                                type: "post",
                                url: "project-setVPM",
                                data: {id_User: id_user, id_Project: id_Project},
                                dataType: "json",
                                success: function () {
                                    showtoast("success", "设置成功", "成功设为副组长");
                                    proMemberReload();
                                    /*elem.text("撤销副组长");*/
                                    elem.removeClass("img-info");
                                    elem.addClass("img-warning");
                                },
                                error: function () {
                                    swal({
                                        icon: "error"
                                    });
                                }
                            })
                        })
                }
                else {
                    swal(
                        {
                            title: "您确定要将撤除这名副组长吗",
                            text: "请谨慎操作！",
                            type: "warning",
                            showCancelButton: true,
                            confirmButtonColor: "#DD6B55",
                            confirmButtonText: "确认",
                            cancelButtonText: "取消",
                            closeOnConfirm: true
                        }, function () {
                            $.ajax({
                                type: "post",
                                url: "project-dismissVPM",
                                data: {id_User: id_user, id_Project: id_Project},
                                dataType: "json",
                                success: function () {
                                    showtoast("success", "撤销成功", "成功撤销该副组长");
                                    proMemberReload();
                                    /*elem.text("设为副组长");*/
                                    elem.removeClass("img-warning");
                                    elem.addClass("img-info");
                                },
                                error: function () {
                                    swal({
                                        icon: "error"
                                    });
                                }
                            })
                        })
                }
            },
        'click .delete' :
            function(e, value, row, index) {
                //修改操作
                var id_user = parseInt(row.id_user);
                swal(
                    {
                        title: "您确定要移除这名成员吗",
                        text: "请谨慎操作！",
                        type: "warning",
                        showCancelButton: true,
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: "移除",
                        cancelButtonText: "取消",
                        closeOnConfirm: true
                    },function () {
                        $.ajax({
                            type: "post",
                            url: "project-deleteMember",
                            data: {id_User: id_user,id_Project:id_Project},
                            dataType: "json",
                            success: function () {
                                swal("移除成功！", "您已经移除了这名成员。", "success");
                                $('#projectMember').bootstrapTable('remove', {
                                    field: 'name',
                                    values: [row.name]
                                });
                            },
                            error: function () {
                                swal({
                                    icon: "error"
                                });
                            }
                        })
                    }
                );

            }
    };

    function typeFormatter(value,row,index) {
        if (row.doc_type===1) {
            return '远景与范围文档';
        }
        else if (row.doc_type===2){
            return '设计文档';
        }
        else if (row.doc_type===3){
            return '需求文档';
        }
        else {
            return '测试计划文档';
        }
    }

    $('#projectDocs').bootstrapTable({
            columns: [
                {
                    field: 'type',
                    title: '文档组类型',
                    sortable: true,
                    align: 'center',
                    formatter: "typeFormatter"
                },{
                    field: 'version',
                    title: '版本',
                    align: 'center'
                },{
                    field: 'date',
                    title: '创建时间',
                    sortable: true,
                    align: 'center'
                },{
                    field: 'view',
                    title: '操作',
                    align: 'center',
                    events: "viewEvents",
                    formatter: "viewFormatter"
                }
            ]
        }
    );
    $.ajax(
        {
            type:"post",
            url:"project-getDocument",
            data: {Id_Project: id_Project},
            dataType:"json",
            success:function(json){
                var docList = JSON.parse(json.res);
                //finishingTask为table的id
                $('#projectDocs').bootstrapTable('load',docList);
            },
            error:function(){
                showtoast("error", "没有文档", "获取文档记录失败！");
            }
        }
    );

    function viewFormatter(value,row,index) {
        return '<a class="mod fa fa-folder btn btn-custom"> 查看文档组</a>'
    }

    var rank = "<s:property value="#session.rank"/>";
    //表格  - 操作 - 事件
    window.viewEvents = {
        'click .mod':
            function(e, value, row, index) {
                //修改操作
                var id_Project = parseInt(row.id_project);
                var type = parseInt(row.doc_type);
                $.ajax({
                    type: "GET",
                    url: "sgroup-getSGroupInfo",
                    data: {Id_Project:id_Project,DocType:type},
                    dataType: "json",
                    success: function (result) {
                        location.href = "sgroup-jmpSGroupInfo";
                    },
                    error: function () {
                        swal({
                            title:"错误",
                            text:"您的权限不够",
                            icon: "error"
                        });
                    }
                })
            }

    };



    $("button#button_invite").click(function () {
        var username = $("input#UserName").val();
        $.ajax({
            url: "project-inviteMember",
            data: {
                Id_Project: id_Project,
                Username: username
            },
            dataType: "json",
            type: "Post",
            async: "false",
            success: function (result) {
                if(result.res===true) {
                    swal("邀请成功！", "您已向该用户发出邀请。", "success");
                    $('button#button_cancel').click();
                }
                else{
                    if(result.One === 1){
                        swal("邀请失败！", "该用户已在项目中。", "error");
                    }else if(result.isIn === false){
                        swal("邀请失败！", "该用户不在“"+result.orgName+"”机构中。", "error");
                    }else {
                        swal("邀请失败！", "用户名不存在。", "error");
                    }
                }
            },
            error: function () {
                swal("邀请失败！", "服务器异常。", "error");
            }
        })
    });

    $("button#button_alter").click(function () {
        var username = $("input#MemberName").val();
        swal(
            {
                title: "您确定要转移组长给这名成员吗",
                text: "请谨慎操作！",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "转移",
                cancelButtonText: "取消",
                closeOnConfirm: true
            },function () {
                $.ajax({
                    url: "project-alterPM",
                    data: {
                        Id_Project: id_Project,
                        Username: username
                    },
                    dataType: "json",
                    type: "Post",
                    async: "false",
                    success: function (result) {
                        if (result.res===true) {
                            showtoast("success", "转移成功", "成功转移组长给该成员");
                            location.href = "user-jmpCurrentProjectList";
                        }
                        else showtoast("error", "转移失败", "该用户不在此项目组内");
                    },
                    error: function (result) {
                        showtoast("error", "转移失败", "用户名不存在!")
                    }
                })
            }
        );
    });


    $("button#endProject").click(function() {
            swal(
                {
                    title: "您确定要结束此项目吗",
                    text: "结束后将不能重新开始，请谨慎操作！",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "结束",
                    cancelButtonText: "取消",
                    closeOnConfirm: true
                },function () {
                    location.href="project-end?id_Project=<s:property value="#session.project.id_project"/>"
                }
            );
        });

    $("button#newDoc").click(function() {
        var type = $("select#type").val();
        $.ajax({
            url: "project-createDoc",
            data: {
                Id_Project: id_Project,
                Name: $("input#DocName").val(),
                DocType: $("select#type").val()
            },
            dataType: "json",
            type: "Post",
            async: "false",
            success: function (result) {
                if (result.already===true) {
                    swal(
                        {
                            title: "新建失败",
                            text: "已存在该类型文档组！",
                            type: "warning",
                            confirmButtonColor: "#DD6B55",
                            confirmButtonText: "确认",
                            closeOnConfirm: true
                        },function () {
                            location.href = "project-jmpProjectInfo";
                        }
                    )
                }
                else  location.href = "catalog-jmpTemplate?documentId="+result.id+"&rank=3&projectId="+id_Project+"&state=0"+"&type="+type;
            },
            error: function (result) {
                showtoast("error", "新建失败", "文档名不存在!")
            }
        })
    });

    $("button#modified2").click(function () {
        swal(
            {
                title: "您确认更改文档权限为开放吗",
                text: "更改后机构管理员可以查看您机构的文档",
                type: "",
                showCancelButton: true,
                confirmButtonColor: "#18a689",
                confirmButtonText: "确定",
                cancelButtonText: "取消",
                closeOnConfirm: true
            },function () {
                $.ajax({
                    url: "project-modified",
                    dataType: "json",
                    data: {
                        Id_Project: id_Project,
                        flag: 1
                    },
                    type: "Post",
                    async: "false",
                    success: function (result){
                        if(result.res) {
                            showtoast("success", "更改成功", "操作成功");
                            $("#open").show();
                            $("#close").hide();
                        }
                    }, error: function () {
                        swal("更改失败！", "请检查你的网络", "failed");
                    }
                })
            })
    })

    $("button#modified1").click(function () {
        swal(
            {
                title: "您确认更改文档权限为封闭吗",
                text: "更改后机构管理员无法查看您项目的文档",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "确定",
                cancelButtonText: "取消",
                closeOnConfirm: true
            },function () {
                $.ajax({
                    url: "project-modified",
                    dataType: "json",
                    data: {
                        Id_Project: id_Project,
                        flag: 0
                    },
                    type: "Post",
                    async: "false",
                    success: function (result) {
                        if(result.res) {
                            showtoast("success", "更改成功", "操作成功");
                            $("#open").hide();
                            $("#close").show();
                        }
                    }, error: function () {
                        swal("更改失败！", "请检查你的网络", "failed");
                    }
                })
            })
    })
</script>

<%--评论区--%>
<script>
    var num = 1;
    var page = 1;
    var max = 1;
    $("#index").text(page);
    function previous() {
        page--;
        if (page<=0){
            page = 1;
        }
        discussReload2(page-1);
        $("#index").text(page);
    }
    function next() {
        page++;
        if (page >= max){
            page = max;
        }
        discussReload2(page-1);
        $("#index").text(page);
    }
    //评论区初始化
    function discussInit() {
        $(".discuss").summernote('reset');
    }

    function forTitle(id_pro_discuss) {
        $.ajax({
            url: "discuss-getTitle",
            data: {
                id_pro_discuss: id_pro_discuss
            },
            dataType: "json",
            type: "Get",
            async: "false"
        });
    }


    //评论加载
    function discussReload2(page1) {
        $.ajax({
            url: "discuss-getProjectDis",
            data: {
                id_Project: id_Project,
                id_user: id_User,
                page : page1
            },
            dataType: "json",
            type: "Post",
            async: "false",
            success: function (result) {
                max = result.disPage;
                num = result.disNum;

                $("#pages").text(max);
                $("#num").text(num);
                var content="",tempDis,date,state;
                var title = "";
                for (var i=0;i<result.wrapperList.length;i++){
                    tempDis=result.wrapperList[i].proDiscussEntity;
                    if (tempDis.name === "<s:property value="#session.PM.name"/>"){
                        title += "<span class=\"label label-danger\">组长</span>&nbsp;";
                    }
                    else if (tempDis.name === "<s:property value="#session.user.name"/>"){
                        title += "<span class=\"label label-info\">我</span>&nbsp;";
                    }
                    state=result.wrapperList[i].state;
                    date=tempDis.time.toString().split("T");
                    content+="  <div class='row'> <div class='ibox float-e-margins ' style='margin-bottom: 10px'> <div class='ibox-title'> <h5>";
                    content+=tempDis.name+title+" "+date[0]+" "+date[1]+"</h5><input style='display: none' class='id_dis' value='"+tempDis.id_pro_discuss+"'>"

                    if (state=="2")
                        content+="<button class='btn-link deleteDis' style='margin-top: -3px'><img src='<%=basePath%>/img/delete.png' height='20px' width='20px' title='删除' alt='删除'></button>";

                    if(tempDis.id_Document != 0){
                        content+="<span>|&nbsp;</span>";
                        //forTitle(tempDis.id_pro_discuss);
                        content+="<h5>";
                        content+="-文档版本 ";
                        content+=tempDis.version+" 目录 "+tempDis.location+" </h5>";
                        var template = "";
                        template+="catalog-jmpTemplate?documentId="+tempDis.id_Document+"&rank="+rank+"&projectId="+tempDis.id_Project+"&state="+tempDis.state;
                        content+="<a href=\"catalog-jmpTemplate?documentId=";
                        content+=tempDis.id_Document;
                        content+="&rank=";
                        content+=rank;
                        content+="&projectId=";
                        content+=tempDis.id_Project;
                        content+="&state=";
                        content+=tempDis.state;
                        content+="\">";
                        content+="<img style='margin-top:-7px' src='<%=basePath%>/img/jump.png' height='27px' width='27px' title='跳转到评论文档' alt='跳转'></a>";
                    }
                    content+="<div class='ibox-tools'>";

                    for (var j=0;j<tempDis.accessoryEntityList.length;j++) {
                        content += '<a class="fa fa-file" href="' + "accessories/"+tempDis.accessoryEntityList[j].path+ '">';
                        content += tempDis.accessoryEntityList[j].filename;
                        content += '</a>';
                    }
                    content+="</div> </div> <div class='ibox-content' style='word-wrap: break-word'> <div class=' wrapper'>";
                    content+=tempDis.content+"  </div> </div> </div> </div>";
                    title="";
                }
                $("div.allDiscuss").html(content);
            },
            error: function (result) {
                showtoast("error","加载失败","加载目录失败")
            }
        })
    }


    //评论提交
    function commitDiscuss() {
         discuss = $(".discuss").summernote('code');
        if($('#fileupload').val()==""&&discuss.trim()=="") {
            showtoast("error","失败","评论不能为空");
            return;
        }
        if($('#fileupload').val()=="") {
            $.ajax({
                url: "discuss-commit2Project",
                data: {'disContent':discuss,'id_Project':id_Project,'id_user':id_User},
                type: "Post",
                async: false,
                success: function (result) {
                    swal({
                        title: "评论提交成功",
                        text: "两个小时内可自行删除",
                        type:"success",
                        confirmButtonColor: "#18a689",
                        confirmButtonText: "OK"
                    });
                    $('button#cancel-say').click();
                    discussReload2(0);
                    discussInit();
                },
                error: function (result) {
                    showtoast("error","失败","评论不能为空");
                }
            })
        }

        else {
            $('#fileupload').fileinput('upload').fileinput('clear').on('filebatchuploadsuccess', function(event, data) {
                swal({
                    title: "评论提交成功",
                    text: "两个小时内可自行删除",
                    type:"success",
                    confirmButtonColor: "#18a689",
                    confirmButtonText: "OK"
                })
                discussReload2(0);
                discussInit();
            });
        }
    }


    $('#fileupload').fileinput(
        {
            language: 'zh',
            showUpload: false,
            removeClass: "btn btn-danger",
            removeLabel: "清除",
            removeIcon: "<i class=\"glyphicon glyphicon-trash\"></i> ",
            uploadAsync: false,
            uploadUrl: "discuss-commit2Project",
            maxFileSize: 1536,
            uploadExtraData: function (previewId, index) {
                var info = {disContent: $(".discuss").summernote('code'), id_Project: id_Project, id_user: id_User};
                return info;
            }
        }

    );

    //评论跳转按钮
   function shift(id_document) {
        //var id = row.id_Project;
        location.href = "catalog-jmpTemplate?documentId="+id_document+"&rank="+rank+"&projectId="+id_Project+"&state="+state;
    };

    //评论删除按钮
    $(document).on("click",".deleteDis",function () {
        if ($(this).hasClass("btn-link")){
            var id_pro_discuss=$(this).prev("input.id_dis").val();
            swal({
                title: "删除评论？",
                text: "一旦删除无法恢复，请谨慎操作！",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "删除",
                cancelButtonText: "取消",
                closeOnConfirm: true
            }, function () {
                $.ajax({
                    url: "discuss-delete",
                    data: {id_pro_discuss: id_pro_discuss},
                    dataType: "json",
                    type: "Post",
                    async: "false",
                    success: function (result) {
                        $("button.cancel").click();
                        showtoast("success","成功","删除评论成功");
                        discussReload2(0)
                    },
                    error: function (result) {
                        showtoast("error","失败","删除评论失败")
                    }
                })
            });}
    });

    //评论编辑按钮
    function edit() {
        $("#eg").addClass("no-padding");
        $(".click2edit").summernote(
        {
            height:50,
            minHeight:50,
            lang:"zh-CN",
            focus:true,
            toolbar: [
                ['style', ['bold', 'italic', 'underline', 'clear']],
                ['picture', ['picture']]
                ],
            callbacks: {
                onImageUpload: function(files, editor, $editable) {
                    var that=$(this);
                    sendFile(files,that);
                }
            }
        })
    }
    function sendFile(files, that) {
        var data = new FormData();
        data.append("file", files[0]);
        $.ajax({
            data : data,
            type : "POST",
            url : "librarydiscuss-image", //图片上传出来的url，返回的是图片上传后的路径，http格式
            cache : false,
            contentType : false,
            processData : false,
            dataType : "json",
            success: function(data) {//data是返回的hash,key之类的值，key是定义的文件名
                $(that).summernote('insertImage', data.path);
            },
            error:function(){
                alert("上传失败");
            }
        });
    }

    //页面初始化
    $(document).ready(function () {
        edit();
        var flag= parseInt(${sessionScope.project.flag});
        if(flag==1){
            $("#open").hide();
            $("#close").show();
        }
        else{
            $("#open").show();
            $("#close").hide();
        }
    })

</script>


</html>


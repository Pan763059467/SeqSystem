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
<html lang="en">
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>功能点--${sessionScope.iter.title}</title>
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
    <link href="<%=basePath %>/css/laydate.css" type="text/css" rel="stylesheet">
    <link href="<%=basePath %>/css/laydate2.css" type="text/css" rel="stylesheet"  id="LayDateSkin">

    <link href="<%=basePath %>/css/xzw.css" rel="stylesheet">
    <link href="<%=basePath %>/css/plugins/bootstrap-fileinput/fileinput.min.css" rel="stylesheet">

    <style type="text/css">
        *{margin:0;padding:0;list-style:none;}
        html{background-color:#E3E3E3; font-size:14px; color:#000; font-family:'微软雅黑'}
        h2{line-height:30px; font-size:20px;}
        a,a:hover{ text-decoration:none;}
        pre{font-family:'微软雅黑'}
        .box{width:970px; padding:10px 20px; background-color:#fff; margin:10px auto;}
        .box a{padding-right:20px;}
        .demo1,.demo2,.demo3,.demo4,.demo5,.demo6{margin:25px 0;}
        h3{margin:10px 0;}
        .layinput{height: 22px;line-height: 22px;width: 150px;margin: 0;}
    </style>
</head>

<body onload="two()" class="gray-bg animated fadeInDown" >
<%--promp layer1--%>

<%--promp layer2--%>

<div  class="modal inmodal" id="update" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                </button>
                <h4 class="modal-title">更改需求</h4>
            </div>
            <div class="modal-body">
                <div class="form-group"><label>选择变更位置</label>
                    <select id = "chooseFiled" class="form-control">
                        <option name="" disabled  selected="selected">请选择</option>
                        <option name="0">功能描述</option>
                        <option name="1">用例过程</option>
                        <option name="2">输入</option>
                        <option name="3">输出</option>
                        <option name="4">基本操作流程</option>
                        <option name="5">备选操作流程</option>
                    </select>
                </div>
                <div class="form-group"><label>输入变更内容</label>
                    <input id="content" type="text" maxlength="9999" placeholder="请输入变更内容" class="form-control" required="">
                </div>
            </div>
            <div class="modal-footer">
                <button id="cancel_update" type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                <button id="update_req" type="submit" class="btn btn-primary">确认</button>
            </div>
        </div>
    </div>
</div>

<div  class="modal inmodal" id="Iter" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                </button>
                <h4 class="modal-title">加入迭代</h4>
            </div>
            <div class="modal-body">
                <div class="form-group"><label>选择迭代</label>
                    <select id = "chooseIter" class="form-control">
                        <option name="" disabled  selected="selected">请选择</option>
                        <s:iterator var = "iter" value="list_iter">
                            <option value="<s:property value="#iter.ID_ITER"/>"><s:property value="#iter.ITER_NAME"/> </option>
                        </s:iterator>
                    </select>
                </div>
            </div>
            <div class="modal-footer">
                <button id="cancel-apply1" type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                <button id="edit_iter" type="submit" class="btn btn-primary">确定</button>
            </div>
        </div>
    </div>
</div>

<div  class="modal inmodal" id="Priority" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                </button>
                <h4 class="modal-title">优先级</h4>
            </div>
            <div class="modal-body">
                <div class="form-group"><label>选择优先级</label>
                    <select id = "choosePri" class="form-control">
                        <option disabled  selected="selected">请选择</option>
                        <option name="0">高</option>
                        <option name="1">中</option>
                        <option name="2">低</option>
                    </select>
                </div>
            </div>
            <div class="modal-footer">
                <button id="cancel-apply2" type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                <button id="edit_pri" type="submit" class="btn btn-primary">确定</button>
            </div>
        </div>
    </div>
</div>

<div  class="modal inmodal" id="Person" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                </button>
                <h4 class="modal-title">责任人</h4>
            </div>
            <div class="modal-body">
                <div class="form-group"><label>选择责任人</label>
                    <select id = "choosePer" class="form-control">
                        <option name="" disabled  selected="selected">请选择</option>
                        <s:iterator var = "iter" value="list_members">
                            <option name=""><s:property value="#iter.name"/> </option>
                        </s:iterator>
                    </select>
                </div>
            </div>
            <div class="modal-footer">
                <button id="cancel-apply3" type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                <button id="edit_per" type="submit" class="btn btn-primary">确定</button>
            </div>
        </div>
    </div>
</div>

<div  class="modal inmodal" id="Stage" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                </button>
                <h4 class="modal-title">设置阶段</h4>
            </div>
            <div class="modal-body">
                <div class="form-group"><label>当前阶段</label>
                    <select id = "stage_choose" class="form-control">
                        <option name="" disabled  selected="selected">请选择</option>
                        <option name="0">未开始</option>
                        <option name="1">开发中</option>
                        <option name="2">测试中</option>
                        <option name="3">bug修复中</option>
                        <option name="4">已完成</option>
                    </select>
                </div>
            </div>
            <div class="modal-footer">
                <button id="cancel-apply4" type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                <button id="edit_stage" type="submit" class="btn btn-primary">确定</button>
            </div>
        </div>
    </div>
</div>

<div  class="modal inmodal" id="Time" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                </button>
                <h4 class="modal-title">设置时间</h4>
            </div>
            <div class="modal-body">
                <div class="demo3">
                    <ul class="inline" style="padding-left: 100px">
                        <span style="font-family: Arial;font-size: 20px">开始日期：</span><li class="inline laydate-icon" id="start" style="width:200px"></li>
                        <br>
                        <br>
                        <span style="font-family: Arial;font-size: 20px">截至日期：</span><li class="inline laydate-icon" id="end" style="width:200px"></li>
                    </ul>
                </div>
            </div>
            <div class="modal-footer">
                <button id="cancel-apply5" type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                <button id="edit_time" type="submit" class="btn btn-primary">确定</button>
            </div>
        </div>
    </div>
</div>


<div  class="modal inmodal" id="W_HOURS" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                </button>
                <h4 class="modal-title">设置预估工时</h4>
            </div>
            <div class="modal-body">
                <div class="form-group"><label>预估工时</label> <input id="hours_w" type="text"  maxlength="4" placeholder="请输入预估工时(max:9999)" maxlength="40" class="form-control" required="required"></div>
            </div>
            <div class="modal-footer">
                <button id="cancel-apply" type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                <button id="edit_w_hours" type="submit" class="btn btn-primary">确定</button>
            </div>
        </div>
    </div>
</div>

<div  class="modal inmodal" id="F_HOURS" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                </button>
                <h4 class="modal-title">设置完成工时</h4>
            </div>
            <div class="modal-body">
                <div class="form-group"><label>完成工时</label> <input id="hours_f" type="text"  maxlength="4" placeholder="请输入完成工时(max:9999)" maxlength="40" class="form-control" required="required"></div>
            </div>
            <div class="modal-footer">
                <button id="cancel-apply8" type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                <button id="edit_f_hours" type="submit" class="btn btn-primary">确定</button>
            </div>
        </div>
    </div>
</div>

<div  class="modal inmodal" id="S_HOURS" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                </button>
                <h4 class="modal-title">设置剩余工时</h4>
            </div>
            <div class="modal-body">
                <div class="form-group"><label>剩余工时</label> <input id="hours_s" type="text" placeholder="请输入剩余工时" maxlength="40" class="form-control" required="required"></div>
            </div>
            <div class="modal-footer">
                <button id="cancel-apply9" type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                <button id="edit_s_hours" type="submit" class="btn btn-primary">确定</button>
            </div>
        </div>
    </div>
</div>

<div  class="modal inmodal" id="B_HOURS" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                </button>
                <h4 class="modal-title">设置超出工时</h4>
            </div>
            <div class="modal-body">
                <div class="form-group"><label>超出工时</label> <input id="hours_b" type="text" placeholder="请输入超出工时" maxlength="40" class="form-control" required="required"></div>
            </div>
            <div class="modal-footer">
                <button id="cancel-apply10" type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                <button id="edit_b_hours" type="submit" class="btn btn-primary">确定</button>
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
                     >> <a href="project-jmpProjectInfo"><span class="lzf_b" style="color:#658387">项目信息</span></a>
                    >>  <span class="lzf_b">功能点--${sessionScope.iter.title}</span></a>
                </strong>
            </li>
        </ol>
    </div>

    <div id="page-wrapper" class="dashbard-1">
        <div class="ibox-content modal-body" style="height: 800px">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>${sessionScope.iter.title}</h5><button class="label label-primary"  data-toggle="modal" data-target="#update" type="submit">更改需求</button>
                    <div class="col-md-2"></div>
                </div>
                <div class="ibox-content">
                    <div style="" class="col-md-8">
                        <div class="tabs-container">
                            <div class="tabs-left">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a data-toggle="tab" href="tabs_panels.html#tab-8" aria-expanded="false"> 详细信息</a>
                                    </li>
                                    <li><a data-toggle="tab" href="tabs_panels.html#tab-9" aria-expanded="true"> 状态变更</a>
                                    </li>
                                    <li><a data-toggle="tab" href="tabs_panels.html#tab-10" aria-expanded="true"> 需求变更</a>
                                    </li>
                                </ul>
                                <div class="tab-content ">
                                    <div id="tab-8" class="tab-pane active">
                                        <div class="panel-body">
                                            <strong>功能点名称：</strong> <span id="funName"></span><br>
                                            <strong>优先级：</strong> <span id="priority1"></span><br>
                                            <strong>功能点描述：</strong><br>
                                            &nbsp &nbsp &nbsp &nbsp<span id="describe"></span><br>
                                            <strong>用例过程:</strong><br>
                                            <p id="funRoleList">
                                            </p>
                                            <p id="funUsableList">
                                            </p>
                                            <strong>输入：</strong><span id="input"></span><br>
                                            <strong>输出：</strong><span id="output"></span><br>
                                            <strong>基本操作流程：</strong><br>
                                            <span id="basic"></span><br>
                                            <strong>备选操作流程：</strong><span id="alternative"></span><br>
                                        </div>
                                    </div>
                                    <div id="tab-9" class="tab-pane ">
                                        <div class="panel-body">
                                            <div class="bootstrap-table">
                                                <table id="TrackList" data-toggle="table"
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
                                    <div id="tab-10" class="tab-pane ">
                                        <div class="panel-body">
                                            <div class="bootstrap-table">
                                                <table id="updateList" data-toggle="table"
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
                        <hr>
                    </div>
                    <div class="col-md-4">
                        <div>
                            <div class="ibox-title">
                                <div style="float: left;margin-left: 5px"><span><strong>基本信息</strong></span></div>
                            </div>
                            <div style="padding-left: 20px;padding-right: 20px" class="ibox-content">
                                <table class="table" style="width:400px;border-left: none;border-right: none">
                                    <tbody style="font-size:13px;font-family: Arial">
                                    <tr id="tr1" style="background: #FFFFFF" onmouseover="toshow1()" onmouseout="tomiss1()">
                                        <th style="width: 150px;text-align: center">迭代:</th>
                                        <th id="th1">
                                            <s:if test='#session.iter.ITER_NAME=="" || #session.iter.ITER_NAME==null '>
                                                <s:property value="" default="未分配"/>
                                            </s:if>
                                            <s:else>
                                                <s:property value="#session.iter.ITER_NAME"/>
                                            </s:else>
                                            <a id="th1_edit" style="display:none" data-toggle="modal" data-target="#Iter"><img src="<%=basePath %>/img/editTrack.png" style="height: 20px;margin: 5px 5px 5px 5px;"> </a>
                                        </th>
                                    </tr>
                                    <tr id="tr2" style="background: #FFFFFF" onmouseover="toshow2()" onmouseout="tomiss2()">
                                        <th style="width: 150px;text-align: center">优先级:</th>
                                        <th id="th2">
                                            <span id="priority2"></span>
                                            <a id="th2_edit" style="display:none" data-toggle="modal" data-target="#Priority"><img src="<%=basePath %>/img/editTrack.png" style="height: 20px;margin: 5px 5px 5px 5px;"> </a>
                                        </th>
                                    </tr>
                                    <tr id="tr3" style="background: #FFFFFF" onmouseover="toshow3()" onmouseout="tomiss3()">
                                        <th style="width: 150px;text-align: center">当前责任人:</th>
                                        <th id="th3">
                                            <s:if test='#session.iter.PERSON=="" || #session.iter.PERSON==null '>
                                                <s:property value="" default="未分配"/>
                                            </s:if>
                                            <s:else>
                                                <s:property value="#session.iter.PERSON"/>
                                            </s:else>
                                            <a id="th3_edit" style="display:none" data-toggle="modal" data-target="#Person"><img src="<%=basePath %>/img/editTrack.png" style="height: 20px;margin: 5px 5px 5px 5px;"> </a>
                                        </th>
                                    </tr>
                                    <tr id="tr4" style="background: #FFFFFF" onmouseover="toshow4()" onmouseout="tomiss4()">
                                        <th style="width: 150px;text-align: center">当前阶段:</th>
                                        <th id="th4">
                                            <s:if test='#session.iter.Stage==0'>
                                                <s:property value="" default="未开始"/>
                                            </s:if>
                                            <s:elseif test='#session.iter.Stage==1'>
                                                <s:property value="" default="开发中"/>
                                            </s:elseif>
                                            <s:elseif test='#session.iter.Stage==2'>
                                                <s:property value="" default="测试中"/>
                                            </s:elseif>
                                            <s:elseif test='#session.iter.Stage==3'>
                                                <s:property value="" default="bug修复中"/>
                                            </s:elseif>
                                            <s:elseif test='#session.iter.Stage==4'>
                                                <s:property value="" default="已完成"/>
                                            </s:elseif>
                                            <a id="th4_edit" style="display:none" data-toggle="modal" data-target="#Stage"><img src="<%=basePath %>/img/editTrack.png" style="height: 20px;margin: 5px 5px 5px 5px;"> </a>
                                        </th>
                                    </tr>
                                    <tr id="tr5" style="background: #FFFFFF" onmouseover="toshow5()" onmouseout="tomiss5()">
                                        <th style="width: 150px;text-align: center">开始日期:</th>
                                        <th id="th5">
                                            <s:if test='#session.iter.DATA_1==null'>
                                                <s:property value="" default="未设置"/>
                                            </s:if>
                                            <s:else>
                                                20<s:property value="#session.iter.DATA_1"/>
                                            </s:else>
                                            <a id="th5_edit" style="display:none" data-toggle="modal" data-target="#Time"><img src="<%=basePath %>/img/editTrack.png" style="height: 20px;margin: 5px 5px 5px 5px;"> </a>
                                        </th>
                                    </tr>
                                    <tr id="tr6" style="background: #FFFFFF" onmouseover="toshow6()" onmouseout="tomiss6()">
                                        <th style="width: 150px;text-align: center">截止日期:</th>
                                        <th id="th6">
                                            <s:if test='#session.iter.DATA_2==null'>
                                                <s:property value="" default="未设置"/>
                                            </s:if>
                                            <s:else>
                                                20<s:property value="#session.iter.DATA_2"/>
                                            </s:else>
                                            <a id="th6_edit" style="display:none" data-toggle="modal" data-target="#Time"><img src="<%=basePath %>/img/editTrack.png" style="height: 20px;margin: 5px 5px 5px 5px;"> </a>
                                        </th>
                                    </tr>
                                    <tr id="tr7" style="background: #FFFFFF" onmouseover="toshow7()" onmouseout="tomiss7()">
                                        <th  style="width: 150px;text-align: center">预估工时:</th>
                                        <th id="th7">
                                            <span id="th7_tmp">
                                            <s:if test='#session.iter.W_HOURS=="" || #session.iter.W_HOURS==null'>
                                                <s:property value="" default="0"/>
                                            </s:if>
                                            <s:else>
                                                <s:property value="#session.iter.W_HOURS"/>
                                            </s:else>
                                            </span>
                                            <a id="th7_edit" style="display:none" data-toggle="modal" data-target="#W_HOURS"><img src="<%=basePath %>/img/editTrack.png" style="height: 20px;margin: 5px 5px 5px 5px;"> </a>
                                        </th>
                                    </tr>
                                    <tr id="tr8" style="background: #FFFFFF" onmouseover="toshow8()" onmouseout="tomiss8()">
                                        <th style="width: 150px;text-align: center">完成工时:</th>
                                        <th id="th8">
                                            <span id="th8_tmp">
                                            <s:if test='#session.iter.F_HOURS==""'>
                                                <s:property value="" default="0"/>
                                            </s:if>
                                            <s:else>
                                                <s:property value="#session.iter.F_HOURS"/>
                                            </s:else>
                                            </span>
                                            <a id="th8_edit" style="display:none" data-toggle="modal" data-target="#F_HOURS"><img src="<%=basePath %>/img/editTrack.png" style="height: 20px;margin: 5px 5px 5px 5px;"> </a>
                                        </th>
                                    </tr>
                                    <tr id="tr9" style="background: #FFFFFF">
                                        <th style="width: 150px;text-align: center">剩余工时:</th>
                                        <th id="th9" style="color: lime">
                                            <s:if test='#session.iter.S_HOURS==""'>
                                                <s:property value="" default="0"/>
                                            </s:if>
                                            <s:else>
                                                <s:property value="#session.iter.S_HOURS"/>
                                            </s:else>
                                            <%--<a id="th9_edit" style="display:none" data-toggle="modal" data-target="#S_HOURS"><img src="<%=basePath %>/img/editTrack.png" style="height: 20px;margin: 5px 5px 5px 5px;"> </a>--%>
                                        </th>
                                    </tr>
                                    <tr id="tr10" style="background: #FFFFFF">
                                        <th style="width: 150px;text-align: center">超出工时:</th>
                                        <th id="th10" style="color: red">
                                            <s:if test='#session.iter.B_HOURS==""'>
                                                <s:property value="" default="0"/>
                                            </s:if>
                                            <s:else>
                                                <s:property value="#session.iter.B_HOURS"/>
                                            </s:else>
                                            <%--<a id="th10_edit" style="display:none" data-toggle="modal" data-target="#B_HOURS"><img src="<%=basePath %>/img/editTrack.png" style="height: 20px;margin: 5px 5px 5px 5px;"> </a>--%>
                                        </th>
                                    </tr>
                                    </tbody>
                                </table>
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
<script src="<%=basePath %>/js/functionInfo.js"></script>
<script type="text/javascript" src="<%=basePath %>/js/laydate.js"></script>

<script>

    var catalog = "<s:property value="#session.iter.id_catalog"/>";
    var id_catalog = "${session.iter.id_catalog}";
    var user_name = "${session.user.name}";
    var version_tmp = "${session.version_temp}";
    var version = "${session.version}";

    $.ajax(
        {
            type:"get",
            url: "project-getFunctionTrack",
            data:{catalog:catalog},
            dataType:"json",
            success:function(json){
                var TrackList = JSON.parse(json.TrackList);
                $('#TrackList').bootstrapTable('load',TrackList);
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
            url: "project-getRequirmentList",
            data:{id_catalog:id_catalog},
            dataType:"json",
            success:function(json){
                var updateList = JSON.parse(json.updateList);
                $('#updateList').bootstrapTable('load',updateList);
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

    //日期范围限制
    var start = {
        elem: '#start',
        format: 'YYYY-MM-DD',
        min: laydate.now(), //设定最小日期为当前日期
        max: '2099-06-16', //最大日期
        istime: true,
        istoday: false,
        choose: function(datas){
            end.min = datas; //开始日选好后，重置结束日的最小日期
            end.start = datas //将结束日的初始值设定为开始日
        }
    };

    var end = {
        elem: '#end',
        format: 'YYYY-MM-DD',
        min: laydate.now(),
        max: '2099-06-16',
        istime: true,
        istoday: false,
        choose: function(datas){
            start.max = datas; //结束日选好后，充值开始日的最大日期
        }
    };
    laydate(start);
    laydate(end);

    //自定义日期格式
    laydate({
        elem: '#test1',
        format: 'YYYY年MM月DD日',
        festival: true, //显示节日
        choose: function(datas){ //选择日期完毕的回调
            alert('得到：'+datas);
        }
    });

    //日期范围限定在昨天到明天
    laydate({
        elem: '#hello3',
        min: laydate.now(-1), //-1代表昨天，-2代表前天，以此类推
        max: laydate.now(+1) //+1代表明天，+2代表后天，以此类推
    });
</script>

</html>


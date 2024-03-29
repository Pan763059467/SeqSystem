<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>机构项目管理</title>
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link rel="shortcut icon" href="<%=basePath%>/example/favicon.ico">
    <link href="<%=basePath%>/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=basePath%>/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="<%=basePath%>/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="<%=basePath%>/css/animate.min.css" rel="stylesheet">
    <link href="<%=basePath%>/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="<%=basePath%>/css/plugins/bootstrap-table/bootstrap-table.css" rel="stylesheet">
    <link href="<%=basePath%>/css/z_style.css" rel="stylesheet">
    <link href="<%=basePath%>/css/plugins/toastr/toastr.min.css" rel="stylesheet">
</head>

<body class="gray-bg">
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
<div id="page-wrapper" class="white-bg dashbard-1">
    <div class=" row wrapper white-bg" style="padding: 5px" id="content-main">
        <ol class="breadcrumb" style="margin-left: 40px">
            <li style="font-size: 15px">
                <strong>
                    <a href="user-jmpHomepage" style="color:#658387">首页</a> >> <a href="Organization-jmpOrgManager" style="color:#658387">机构管理</a> >> <a href="organizationManagement-jumpOrgManager2Page">查看机构${sessionScope.org_name}的项目</a>
                </strong>
            </li>
        </ol>
    </div>
    <div class="form-group col-md-2">
    </div>
    <div class="col-md-10" style="padding: 15px 10px 0px 0px;margin-left: -50px">
        <div class="panel">
            <div class="panel-heading">
                <div class="panel-options col-md-4">
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="project_detail.html#tab-1" data-toggle="tab">当前项目</a>
                        </li>
                        <li class="">
                            <a href="project_detail.html#tab-2" data-toggle="tab">历史项目</a>
                        </li>
                    </ul>
                </div>
                <div style="float: right;width: 300px" class="col-md-4">
                </div>
            </div>
            <div class="panel-body">
                <div class="tab-content">
                    <div class="tab-pane active" id="tab-1">
                        <div style="margin:-30px 0px 0px 0px">
                            <div class="ibox float-e-margins">
                                <div class="ibox-content">
                                    <div class="bootstrap-table">
                                        <table id="showProject"
                                               data-toggle="table"
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
                                               data-page-size="10"
                                               data-height="630"
                                               data-page-list="All"
                                        >
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="tab-2">
                        <div style="margin:-30px 0px 0px 0px">
                            <div class="ibox float-e-margins">
                                <div class="ibox-content">
                                    <div class="bootstrap-table">
                                        <table id="showHistoryProject"
                                               data-toggle="table"
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
                                               data-page-size="10"
                                               data-height="630"
                                               data-page-list="All"
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
<script src="<%=basePath%>/js/jquery.min.js?v=2.1.4"></script>
<script src="<%=basePath%>/js/bootstrap.min.js?v=3.3.6"></script>
<script src="<%=basePath%>/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="<%=basePath%>/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="<%=basePath%>/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="<%=basePath%>/js/plugins/layer/layer.min.js"></script>
<script src="<%=basePath%>/js/hplus.min.js?v=4.1.0"></script>
<script type="text/javascript" src="<%=basePath%>/js/contabs.min.js"></script>
<script src="<%=basePath%>/js/plugins/pace/pace.min.js"></script>
<script src="<%=basePath%>/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
<script src="<%=basePath%>/js/plugins/toastr/toastr.min.js"></script>
<script src="<%=basePath%>/js/mjy.js"></script>
<script src="<%=basePath%>/js/plugins/suggest/bootstrap-suggest.min.js"></script>
<script src="<%=basePath%>/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
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

    $('#showProject').bootstrapTable({
            columns: [
                {
                    title: '项目名',
                    field: 'project_name',
                    align: 'center',
                    sortable: true,
                    valign: 'middle'
                },
                {
                    field: 'document_name',
                    title: '文档',
                    sortable: true,
                    align: 'center'
                },
                {
                    field: 'user_name',
                    title: '项目组长',
                    sortable: true,
                    align: 'center'
                },
                {
                    field: 'mail',
                    title: '邮箱',
                    sortable: true,
                    align: 'center'
                },{
                    field: 'flag',
                    title: '操作',
                    sortable: true,
                    align: 'center',
                    events: "actionEvents",
                    formatter: "rename"
                }
            ]
        },
        function () {
            var element = $(this).val();
            Ffive(element)
        }
    );
    $('#showHistoryProject').bootstrapTable({
            columns: [
                {
                    title: '项目名',
                    field: 'project_name',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    field: 'document_name',
                    title: '文档',
                    sortable: true,
                    align: 'center'
                }, {
                    field: 'version',
                    title: '文档编号',
                    sortable: true,
                    align: 'center'
                },
                {
                    field: 'user_name',
                    title: '项目组长',
                    sortable: true,
                    align: 'center'
                }, {
                    field: 'mail',
                    title: '邮箱',
                    sortable: true,
                    align: 'center'
                },
                {
                    field: 'flag',
                    title: '操作',
                    sortable: true,
                    align: 'center',
                    events: "actionEvents",
                    formatter: "rename"
                }
            ]
        },
        function () {
            var element = $(this).val();
            Ffive2(element)
        }
    );

    function rename(value,row,index) {
        var flag=parseInt(row.flag);
        if(flag===0)
            return ['<a class="view"><button class="btn btn-success text-center btn-xs " >查看文档</button></a>'].join('');
        else if(flag===1)
            return ['<a class="refuse"><button class="btn btn-default text-center btn-xs " >不可查看</button></a>'].join('');
    }

    $.ajax(
        {
            url:"Organization-showAllProject",
            dataType:"json",
            type: "Get",
            async: "false",
            success:function(json){
                var orgProjectList = JSON.parse(json.res);
                //finishingTask为table的id
                $('#showProject').bootstrapTable('load',orgProjectList);
            },
            error:function(){
                alert(" 错误");
            }
        }
    )

    $.ajax(
        {
            url:"Organization-showHistoryProject",
            dataType:"json",
            type: "Get",
            async: "false",
            success:function(json){
                var orgHisProjectList = JSON.parse(json.res);
                //finishingTask为table的id
                $('#showHistoryProject').bootstrapTable('load',orgHisProjectList);
            },
            error:function(){
                alert(" 错误");
            }
        }
    )

    window.actionEvents = {
        'click .refuse': function(e,value,row){
            showtoast("error", "项目组长设置项目拒绝他人访问", "如需查看文档请联系项目组长修改权限");
        },
        'click .view':
            function(e, value, row, index) {
                var id = row.id_document;
                var id_Project = row.id_project;
                location.href = "catalog-jmpOrgTemplate?documentId="+id+"&rank="+5+"&projectId="+id_Project+"&state="+row.state;
            },
    }
</script>
</html>

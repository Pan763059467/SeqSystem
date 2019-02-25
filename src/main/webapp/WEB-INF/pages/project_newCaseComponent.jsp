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
    <div id="main" style="margin-top:10px">
  	    <div class="form-group">
        <label class="col-sm-2 control-label" style="text-align: left">功能点名称：</label>
        <div class="col-sm-8">
            <input type="email" name="funName" id="funName"  class="form-control dis" disabled value="">
        </div>
    </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" style="text-align: left">优先级</label>

            <div class="col-sm-4">
                <select class="form-control m-b dis"  name="priority" id="priority" disabled>
                    <option value="1">高</option>
                    <option value="2">中</option>
                    <option value="3">低</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label style="padding-left: 15px">功能点描述</label>
            <div class="click1edit wrapper" name="describe" id="describe">
                暂无功能点描述
            </div>
        </div>
        <div class="form-group">

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
                <tr class="end" ><th colspan="4"><button  class="btn btn-primary  btn-xs col-lg-push-1 dis" disabled onclick="addFunlLine()" type="button" style="margin-right: 10px">新增用例过程</button>
                    <button  class="btn btn-primary  btn-xs col-lg-push-1 dis" disabled  type="button" data-toggle="modal" data-target="#addUsableModel" onclick="addUsable()"  style="margin-right: 10px">新增全局可用性</button>
                    <button  class="btn btn-primary  btn-xs col-lg-push-1 dis" disabled  type="button" data-toggle="modal" data-target="#addSecurityModel" onclick="addSecurity()"  style="margin-right: 10px">新增全局安全性</button></th></tr>

                </tbody>
                <tfoot>

                </tfoot>
            </table>

        </div>
        <div class="form-group">
            <label style="padding-left: 15px">输入</label>
            <div class="click1edit wrapper" name="in" id="in">
                暂无输入
            </div>
        </div>
        <div class="form-group">
            <label style="padding-left: 15px">输出</label>
            <div class="click1edit wrapper" name="out" id="out">
                暂无输出
            </div>
        </div>
        <div class="form-group">
            <label style="padding-left: 15px">基本操作流程</label>
            <div class="click1edit wrapper" name="basic" id="basic">
                暂无基本操作流程
            </div>
        </div>
        <div class="form-group">
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

    var evalrow=1;
    $('#common').bootstrapTable({
            columns: [
                {
                    field: 'ReleaseTime',
                    title: '发布日期',
                    sortable: true,
                    align: 'left'
                },
                {
                    field: 'name',
                    title: '构件名称',
                    sortable: true,
                    align: 'left'
                },
                {
                    field: 'title',
                    title: '构件类型',
                    align: 'left'
                },
                {
                    field: 'evalp',
                    title: '评分',
                    sortable: true,
                    align: 'left'
                },
                {
                    field: 'user_name',
                    title: '发布者',
                    sortable: true,
                    align: 'left'
                },
                {
                    field: 'PurchasePoint',
                    title: '收藏积分',
                    sortable: true,
                    align: 'left'
                },
                {
                    field: 'PurchaseTimes',
                    title: '热度',
                    sortable: true,
                    align: 'left'
                },
                {
                    field: 'operate',
                    title: '操作',
                    searchable: false,
                    align: 'left',
                    events: "actionEvents",
                    formatter: "operateFormatter"
                }
            ]
        }
    );
    $.ajax(
        {
            type:"GET",
            url: "sha_structure-getpri",
            dataType:"json",
            success:function(json){
                var proList = JSON.parse(json.res);
                //common为table的id
                $('#common').bootstrapTable('load',proList);
            },
            error:function(){
                swal({
                    icon: "error"
                });
            }
        }
    );
    function operateFormatter(value,row,index) {
        if(row.mention=="exist")
        {
            return ["<a class='view'><img src='<%=basePath%>/img/view.png' height='20px' width='20px' title='查看' alt='查看'></a>",
                "<a span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</a>",
                "<a class='collect'><img src='<%=basePath%>/img/fullstar.png' height='20px' width='20px' title='取消收藏' alt='已收藏'></a>"].join('');

        }
        else
        {
            return ["<a class='view'><img src='<%=basePath%>/img/view.png' height='20px' width='20px' title='查看' alt='查看'></a>",
                "<a span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</a>",
                "<a class='collect'><img src='<%=basePath%>/img/star.png' height='20px' width='20px' title='收藏' alt='收藏'></a>"].join('');

        }
    }

    $("button#SearchType").click(function (){
        //获取检索类型的select值
        var sel = document.getElementById('ChooseType');
        var index = sel.selectedIndex-1;
        //检索所有构件
        if (index == "0")
        {
            $.ajax(
                {
                    type:"GET",
                    //data: { id_template:index },
                    url:"sha_structure-getpri",
                    dataType:"json",
                    success:function(json)
                    {
                        var proList = JSON.parse(json.res);
                        $('#common').bootstrapTable('load',proList);
                    },
                    error:function(){
                        swal({
                            icon: "error"
                        });
                    }
                }
            )
        }
        //检索类型构件
        else
        {
            $.ajax(
                {
                    type:"Post",
                    data: {
                        id_template:index
                    },
                    url:"sha_structure-Search",
                    dataType:"json",
                    success:function(json)
                    {
                        var proList = JSON.parse(json.res);
                        $('#common').bootstrapTable('load',proList);
                    },
                    error:function(){
                        swal({
                            icon: "error"
                        });
                    }
                }
            )
        }
    });

    //表格  - 操作 - 事件
    window.actionEvents = {
        'click .view':
            function(e, value, row, index) {
                evalrow=row.id_structure;
                var id=parseInt(row.id_structure);
                var temp=row.id_template;
                $.ajax(
                    {
                        type: "GET",
                        url: "sha_structure-getthis",
                        data:{id_structure:id},
                        dataType: "json",
                        success: function (json) {
                            var pro = JSON.parse(json.res);
                            var tem=JSON.parse(pro.content);
                            var id_template=temp;
                            if ( id_template == "1" )
                            {
                                $('#viewcommon').modal('toggle');
                                $('#Viewcommon_name').text("构件 - "+pro.name);
                                $('#view_common_content').text(tem.content);
                                //swal({title:"图文构件:"+pro.name, text:"tem.content" })
                            }
                            else if ( id_template == "2" )
                            {
                                $('#viewuser').modal('toggle');
                                $('#Viewuser_name').text("构件 - "+pro.name);
                                $('#view_user_rolename').text(tem.roleName);
                                $('#view_user_describe').text(tem.describe);
                                $('#view_user_permissions').text(tem.permissions);
                                /*swal(
                                    {
                                        title:"构件名称："+ pro.name,
                                        text:"<div align=left><b>用户名：</b>"+ tem.roleName+"</div>"
                                            +"<div align=left><b>用户描述：</b>"+ tem.describe+"</div>"
                                            +"<div align=left><b>用户权限：</b>"+ tem.permissions+"</div>",
                                        html:true
                                    })*/
                            }
                            else if( id_template == "3" )
                            {
                                var priority;
                                if ( tem.priority == 1 ){
                                    priority = "高"
                                }else if( tem.priority == 2 ){
                                    priority = "中"
                                }
                                else if( tem.priority == 3 ) {
                                    priority = "低"
                                }
                                var funRoleList = "";
                                var tmp1 = tem.funRoleList.length;
                                for(var num = 0;num < tmp1; num++){
                                    funRoleList+="<div>角色："+tem.funRoleList[num].roleName+"</div>"
                                        +"<div>描述："+tem.funRoleList[num].roleDescribe+"</div>"
                                    if(tem.funRoleList[num].usableName!=null){
                                        funRoleList+="<div>"+tem.funRoleList[num].usableName+"</div>"
                                            +"<div>"+tem.funRoleList[num].usablePara+"</div>"
                                    }
                                }
                                var funUsableList ="";
                                var tmp2 = tem.funUsableList.length;
                                for(var num = 0;num < tmp2; num++){
                                    funUsableList+="<div>"+tem.funUsableList[num].usableName+"</div>"
                                        +"<div>"+tem.funUsableList[num].usablePara+"</div>"
                                }
                                $('#viewfun').modal('toggle');
                                $('#Viewfun_name').text("构件 - "+pro.name);
                                $('#view_fun_priority').text(priority);
                                $('#view_fun_describe').text(tem.describe);
                                document.getElementById("view_fun_role").innerHTML = funRoleList;
                                document.getElementById("view_fun_usable").innerHTML = funUsableList;
                                $('#view_fun_input').text(tem.input);
                                $('#view_fun_output').text(tem.output);
                                $('#view_fun_basic').text(tem.basic);
                                $('#view_fun_alter').text(tem.alternative);

                            }
                            else if ( id_template == "4")
                            {
                                $('#viewapp').modal('toggle');
                                $('#Viewapp_name').text("构件 - "+pro.name);
                                $('#view_app_name').text(tem.appname);
                                $('#view_app_type').text(tem.apptype);
                                $('#view_app_address').text(tem.appaddress);
                                $('#view_app_usage').text(tem.appusage);
                            }
                            else if ( id_template == "5")
                            {
                                $('#viewcommun').modal('toggle');
                                $('#Viewcommun_name').text("构件 - "+pro.name);
                                $('#view_commun_name').text(tem.communname);
                                $('#view_commun_abb').text(tem.communabb);
                                $('#view_commun_type').text(tem.communtype);
                                $('#view_commun_describe').text(tem.commundescribe);
                            }
                            else if ( id_template == "6" )
                            {
                                $('#viewdata').modal('toggle');
                                $('#Viewdata_name').text("构件 - "+pro.name);
                                $('#view_data_name').text(tem.dataname);
                                $('#view_data_type').text(tem.datatype);
                                if(tem.dataempty==0) {$('#view_data_empty').text("是");}
                                else {$('#view_data_empty').text("否");}
                                $('#view_data_constraint').text(tem.dataconstraint);
                                $('#view_data_explain').text(tem.dataexplain);
                            }
                            else if ( id_template == "7" )
                            {
                                $('#viewenvironment').modal('toggle');
                                $('#Viewenvironment_name').text("构件 - "+pro.name);
                                $('#view_environment_type').text(tem.environmenttype);
                                $('#view_environment_configure').text(tem.environmentconfigure);
                            }
                            else if ( id_template == "8" )
                            {
                                $('#viewdatabase').modal('toggle');
                                $('#Viewdatabase_name').text("构件 - "+pro.name);
                                $('#view_database_main').text(tem.maindatabase);
                                if(tem.databasetype==0) {$('#view_database_type').text("非关系型");}
                                else {$('#view_database_type').text("关系型");}
                                $('#view_database_edition').text(tem.databaseedition);
                                $('#view_database_summary').text(tem.databasesummary);
                            }
                            else if ( id_template == "9")
                            {
                                $('#viewsystem').modal('toggle');
                                $('#Viewsystem_name').text("构件 - "+pro.name);
                                $('#view_system_name').text(tem.systemname);
                                $('#view_system_type').text(tem.systemtype);
                                $('#view_system_edition').text(tem.systemedition);
                                $('#view_system_framework').text(tem.systemframework);
                                $('#view_system_summary').text(tem.systemsummary);
                            }
                            else if ( id_template == "10")
                            {
                                $('#viewhardware').modal('toggle');
                                $('#Viewhardware_name').text("构件 - "+pro.name);
                                $('#view_hardware_name').text(tem.hardwarename);
                                $('#view_hardware_type').text(tem.hardwaretype);
                                $('#view_hardware_fun').text(tem.hardwarefun);
                                $('#view_hardware_scene').text(tem.hardwarescene);
                            }
                            else if ( id_template == "11" )
                            {
                                $('#viewweb').modal('toggle');
                                $('#Viewweb_name').text("构件 - "+pro.name);
                                $('#view_web_main').text(tem.webmain);
                                $('#view_web_edition').text(tem.webedition);
                                $('#view_web_summary').text(tem.websummary);
                            }
                        },
                        error: function () {
                            swal({
                                icon: "error"
                            });
                        }
                    }
                )
            },
        'click .collect':
            function(e, value, row, index) {
                var id=parseInt(row.ID_share);
                var thisname=row.name;
                var conf="确定要收藏吗？需要消耗"+row.PurchasePoint+"点积分";
                if(row.mention=="exist")
                {
                    //swal("该构件已收藏，禁止重复收藏");return;
                    var id_str = row.id_structure;
                    swal(
                        {
                            title: "确定取消收藏吗？",
                            text: "提示：不会退回积分！",
                            type: "",
                            showCancelButton: true,
                            confirmButtonColor: "#18a689",
                            confirmButtonText: "确定",
                            cancelButtonText: "取消",
                            closeOnConfirm: false
                        }, function () {
                            /*var t=confirm("请再次确认是否取消收藏");
                            if(t==true) {*/
                            swal(
                                {
                                    title: "请再次确认是否取消收藏",
                                    text: "",
                                    type: "",
                                    showCancelButton: true,
                                    confirmButtonColor: "#18a689",
                                    confirmButtonText: "确定",
                                    cancelButtonText: "取消",
                                    closeOnConfirm: false
                                }, function () {
                                    $.ajax(
                                        {
                                            type: "GET",
                                            url: "sha_structure-Delete_collect",
                                            data: {id_structure: id_str},
                                            dataType: "json",
                                            success: function () {
                                                /*alert("已取消收藏！");
                                                window.location.reload();*/
                                                swal({
                                                    title: "已取消收藏",
                                                    type: "success"
                                                }, function (isConfirm) {
                                                    window.location.reload();
                                                });
                                            },
                                            error: function () {
                                                swal({
                                                    icon: "error"
                                                });
                                            }
                                        }
                                    )
                                })
                        })
                }
                else {
                    var conf = "确定要收藏吗？需要消耗"+row.PurchasePoint+"点积分";
                    var r=confirm(conf);
                    if(r) {
                        $.ajax({
                            url: "sha_structure-collect",
                            data: {ID_share: id, PurchasePoint: row.PurchasePoint, name: row.name},
                            dataType: "json",
                            type: "Post",
                            async: "false",
                            success: function (result) {
                                if (result.res === true) {
                                    swal({
                                        title: "收藏成功",
                                        type: "success"
                                    }, function () {
                                        window.location.reload();
                                    });
                                }
                                else {
                                    if (result.points) {
                                        swal({
                                            title: "服务器异常",
                                            type: "error",
                                            confirmButtonColor: "#18a689",
                                            confirmButtonText: "OK"
                                        })
                                    }
                                    else {
                                        swal({
                                            title: "积分不足请充值",
                                            type: "error",
                                            confirmButtonColor: "#18a689",
                                            confirmButtonText: "OK"
                                        })
                                    }
                                }
                            },
                            error: function (result) {
                                showtoast("error", "收藏失败", "服务器异常");
                            }
                        })
                    }
                    //   }


                    //   )
                }
            }
    };
    //评价
    $(document).ready(function() {
        $(document).on("mouseover", ".pingjia", function () {
            event.target.src = "<%=basePath%>/img/fullstar.png";
        });
        $(document).on("mouseout", ".pingjia", function () {
            event.target.src = "<%=basePath%>/img/star.png";
        });
        $(document).on("click", "#first", function () {
            var t = confirm("确定评价为高吗？");
            var p = 3;
            if (t == true) {
                $.ajax(
                    {
                        type: "GET",
                        url: "sha_structure-evaluate",
                        data: {id_structure: evalrow,PurchasePoint:p},
                        dataType: "json",
                        success: function () {
                            alert("评价成功！");
                            window.location.reload();
                        },
                        error: function () {
                            swal({
                                icon: "error"
                            });
                        }
                    }
                )
            }
        });
        $(document).on("click", "#second", function () {
            var t = confirm("确定评价为中吗？");
            var p = 2;
            if (t == true) {
                $.ajax(
                    {
                        type: "GET",
                        url: "sha_structure-evaluate",
                        data: {id_structure: evalrow,PurchasePoint:p},
                        dataType: "json",
                        success: function () {
                            alert("评价成功！");
                            window.location.reload();
                        },
                        error: function () {
                            swal({
                                icon: "error"
                            });
                        }
                    }
                )
            }
        });
        $(document).on("click", "#third", function () {
            var t = confirm("确定评价为低吗？");
            var p = 1;
            if (t == true) {
                $.ajax(
                    {
                        type: "GET",
                        url: "sha_structure-evaluate",
                        data: {id_structure: evalrow,PurchasePoint:p},
                        dataType: "json",
                        success: function () {
                            alert("评价成功！");
                            window.location.reload();
                        },
                        error: function () {
                            swal({
                                icon: "error"
                            });
                        }
                    }
                )
            }
        });
    })
</script>
<!-- Mirrored from www.zi-han.net/theme/hplus/ by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:17:11 GMT -->
</html>
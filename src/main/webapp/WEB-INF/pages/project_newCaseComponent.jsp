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
                    <a href="user-jmpHomepage"><span class="lzf_b" style="color:#658387">首页</span></a> >> <a href="structure-getcommon"><span class="lzf_b" style="color:#658387">构件库</span></a> >> <a href="structure-getpersonal"><span class="lzf_b" style="color:#658387">个人构件库></span></a> >> <a href="structure-newCase">编辑用例构件</a>
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
            <input type="email" name="funName" id="funName"  class="form-control dis" value="${requestScope.title}">
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
            <label class="col-sm-2 control-label" style="text-align: left">功能点描述</label>
            <div class="col-sm-8" style="margin-top: 3px">
            <input type="email" class="form-control dis" name="describe" id="describe" value="暂无功能点描述">
            </input>
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
                    <th colspan="4" style="text-align: center">
                        <button  class="btn btn-primary  btn-xs col-lg-push-1 dis" onclick="addFunlLine()" type="button" style="margin-right: 10px">新增用例过程</button>
                        <button  class="btn btn-primary  btn-xs col-lg-push-1 dis" type="button" data-toggle="modal" data-target="#addUsableModel" onclick="addUsable()"  style="margin-right: 10px">新增全局可用性</button>
                        <button  class="btn btn-primary  btn-xs col-lg-push-1 dis" type="button" data-toggle="modal" data-target="#addSecurityModel" onclick="addSecurity()"  style="margin-right: 10px">新增全局安全性</button>
                    </th>
                </tr>
                </tbody>
                <tfoot>

                </tfoot>
            </table>

        </div>
        <div class="form-group" style="margin-right: 5px;margin-left: 5px">
            <label class="col-sm-2 control-label" style="text-align: left">输入</label>
            <div class="col-sm-8" style="margin-bottom: 3px">
                <input type="email" name="in" id="in"  class="form-control dis" value="暂无输入">
            </div>
        </div>
        <div class="form-group" style="margin-right: 5px;margin-left: 5px">
            <label class="col-sm-2 control-label" style="text-align: left">输出</label>
            <div class="col-sm-8" style="margin-bottom: 3px">
            <input type="email" class="form-control dis" name="out" id="out" value="暂无输出">
            </input>
            </div>
        </div>
        <div class="form-group" style="margin-right: 5px;margin-left: 5px">
            <label class="col-sm-2 control-label" style="text-align: left">基本操作流程</label>
            <div class="col-sm-8" style="margin-bottom: 3px">
            <input type="email" class="form-control dis" name="basic" id="basic" value="暂无基本操作流程">

            </input>
            </div>
        </div>
        <div class="form-group" style="margin-right: 5px;margin-left: 5px">
            <label class="col-sm-2 control-label" style="text-align: left">备选操作流程</label>
            <div class="col-sm-8" style="margin-bottom: 3px">
            <input type="email" class="form-control dis" name="alternative" id="alternative" value="暂无备选操作流程">

            </input>
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
        <div style="text-align: center">
            <button class="btn btn-primary btn-lg" onclick="Create()" type="button">确认编辑</button>
        </div>
</div>
</div>

</body>
<script src="<%=basePath %>/js/jquery.min.js?v=2.1.4"></script>
<script src="<%=basePath %>/js/bootstrap.min.js?v=3.3.6"></script>
<script src="<%=basePath %>/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
<script src="<%=basePath %>/js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="<%=basePath %>/js/plugins/toastr/toastr.min.js"></script>
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

    function Create() {
        var funName=$("input#funName").val();
        var priority=$("select#priority").val();
        var describe=$("input#describe").val();
        var inDiv=$("input#in").val();
        var outDiv=$("input#out").val();
        var basic=$("input#basic").val();
        var alternative=$("input#alternative").val();
        var funRoleList="[{";
        var roleName,roleDescribe,usableName,usablePara,last="";
        $(".funTable tbody").find("tr").each(function () {
            if ($(this).hasClass("funTr")){//开头
                if (last!=""){//第一次，没有,
                    funRoleList+="},{"
                }
                roleName=$(this).children("th").eq(1).children(".roleName").val();
                roleDescribe=$(this).children("th").eq(2).children(".roleDescribe").val();
                funRoleList+="\"roleName\":\""+roleName+"\",\"roleDescribe\":\""+roleDescribe+"\"";
                last="funTr";
            }
            else if ($(this).hasClass("usableTr")){//开头
                usableName=$(this).children("th:first-child").text();
                usablePara=$(this).children("th").eq(1).text();
                funRoleList+=",\"usableName\":\""+usableName+"\",\"usablePara\":\""+usablePara+"\"";
                last="usableTr";
            }
        })
        funRoleList+="}]";

        var funUsableList="[",usableName,usablePara,first="yes";
        $(".funTable tfoot").find("tr").each(function () {
            if (first=="yes"){//第一次，没有,
                funUsableList+="{"
            }
            else   funUsableList+=",{"
            usableName=$(this).children("th:first-child").text();
            usablePara=$(this).children("th").eq(1).text();
            funUsableList+="\"usableName\":\""+usableName+"\",\"usablePara\":\""+usablePara+"\"}";
            first="no";
        })
        funUsableList+="]";
        //    alert(funName.length+priority.length+describe.length+inDiv.length+outDiv.length+basic.length+alternative.length);

        if(funName.length+priority.length+describe.length+inDiv.length+outDiv.length+basic.length+alternative.length>6000){
            swal("您输入内容过长，请重新输入")
        }
        else if(funName.length==0){
            swal("请输入功能点名称");
        }
        else {
            $.ajax({
                url: "catalog-saveTemplateThree2?structureId="+${requestScope.id},
                data: {
                    id_template: 3, funName: funName, priority: priority, content: describe,
                    inDiv: inDiv, outDiv: outDiv, basic: basic, alternative: alternative,
                    funRoleList: funRoleList, funUsableList: funUsableList
                },
                dataType: "json",
                type: "Post",
                async: "false",
                success: function (result) {
                    swal("用例修改成功!", "可在对应构件库引用该构件", "success");
                    $("#edit").attr("style","display:show");
                },
                error: function (result) {
                    showtoast
                    ("dangerous", "封装失败", "构件封装失败")
                }
            })
        }
    }

    var nowLine;
    function deleteUsable(obj) {
        $(obj).parent().parent().prev().children("th:last-child").children("button:first-child").show();
        $(obj).parent().parent().prev().prev().children("th:last-child").children("button:first-child").show();
        $(obj).parent().parent().remove();
    }

    function deleteSecurity(obj) {
        $(obj).parent().parent().prev().children("th:last-child").children("button:last-child").show();
        $(obj).parent().parent().prev().prev().children("th:last-child").children("button:last-child").show();
        $(obj).parent().parent().remove();
    }

    function addUsable(obj) {
        UsableInit();
        SecurityInit();
        $("#para").val("");
        if(typeof (obj)==="undefined"){
            nowLine="undefined";
            return;
        }
        nowLine=$(obj).parent().parent();
    }

    function addSecurity(obj) {
        UsableInit();
        SecurityInit();
        $("#para").val("");
        if(typeof (obj)==="undefined"){
            nowLine="undefined";
            return;
        }
        nowLine=$(obj).parent().parent();
    }

    function addUsabelLine() {
        var usableName=$("#uaname").text();
        var para=$("#para").val();
        var content;
        if (typeof (nowLine)==="undefined" ||  nowLine==="undefined"){
            content=" <tr class='usableTr'> <th colspan='2' name='usableName' class='usableName'>全局可用性："+usableName+"</th> <th  name='usablePara' class='usablePara'>发生条件："+para+"</th> <th style='text-align: center' >  <button  class='btn btn-danger  btn-xs col-lg-push-1' id='deleteUsable'  onclick='deleteUsable(this)' type='button' style='margin-right: 10px'>删除可用性</button></th> </tr>"
            $(".funTable tfoot").append(content);
            return;
        }
        content=" <tr class='usableTr'> <th></th> <th  name='usableName' class='usableName'>局部可用性："+usableName+"</th> <th  name='usablePara' class='usablePara'>发生条件："+para+"</th> <th style='text-align: center' >  <button  class='btn btn-danger  btn-xs col-lg-push-1' id='deleteUsable'  onclick='deleteUsable(this)' type='button' style='margin-right: 10px'>删除可用性</button></th> </tr>"
        $(nowLine).after(content);
        $(nowLine).children("th:last-child").children("button:first-child").hide();

    }

    function addSecurityLine() {
        var SecurityName=$("#sename").text();
        var para=$("#para2").val();
        var content;
        if (typeof (nowLine)==="undefined" ||  nowLine==="undefined"){
            content=" <tr class='securityTr'> <th colspan='2' name='securityName' class='securityName'>全局安全性："+SecurityName+"</th> <th  name='securityPara' class='securityPara'>发生条件："+para+"</th> <th style='text-align: center' >  <button  class='btn btn-danger  btn-xs col-lg-push-1' id='deleteUsable'  onclick='deleteSecurity(this)' type='button' style='margin-right: 10px'>删除安全性</button></th> </tr>"
            $(".funTable tfoot").append(content);
            return;
        }
        content=" <tr class='securityTr'> <th></th> <th  name='securityName' class='securityName'>局部安全性："+SecurityName+"</th> <th  name='securityPara' class='securityPara'>发生条件："+para+"</th> <th style='text-align: center' >  <button  class='btn btn-danger  btn-xs col-lg-push-1' id='deleteUsable'  onclick='deleteSecurity(this)' type='button' style='margin-right: 10px'>删除安全性</button></th> </tr>"
        if($(nowLine.next()).hasClass("usableTr")){
            $(nowLine.next()).after(content);
            $(nowLine).children("th:last-child").children("button:last-child").hide();
        }
        else{
            $(nowLine).after(content);
            $(nowLine).children("th:last-child").children("button:last-child").hide();
        }
    }

    function addFunlLine() {
        var optionCon="";
        var content="   <tr class='funTr'> <th > <span class='fun_down li_fa fa col-md-offset-1  fa-arrow-down black' ></span> <span class='fun_up fa li_fa col-md-offset-1  fa-arrow-up black'></span> <span class='fun_delete li_fa fa col-md-offset-1  fa-times  black' ></span></th> <th> " +
            "<input class='form-control roleName dis' name='' name='roleName'  > " +
            optionCon +
            "</input> " +
            "</th> <th> <textarea   class='form-control roleDescribe dis'   style='resize:vertical; max-width: 100%' name='roleDescribe'    ></textarea> </th> <th> <button  class='btn btn-primary  btn-xs col-lg-push-1'  id='addUsable'  data-toggle='modal' data-target='#addUsableModel' onclick='addUsable(this)' type='button' style='margin-right: 10px'>可用</button> <button class='btn btn-primary  btn-xs col-lg-push-1'  id='addSecurity'  data-toggle='modal' data-target='#addSecurityModel' onclick='addSecurity(this)' type='button' style='margin-right: 10px'>安全</button> </th> </tr>"
        $(".funTable").children("tbody").children("tr:last-child").before(content);
    }

    $(document).on("click",".fun_down",function () {
        if($(this).parent().parent().hasClass("funTr")){
            var thisLine=$(this).parent().parent();
        }
        else{
            var thisLine=$(this).parent().parent().parent();
        }
        if(thisLine.next("tr").hasClass("usableTr")||thisLine.next("tr").hasClass("securityTr")){
            var nextLine=thisLine.next();
            if(nextLine.next("tr").hasClass("securityTr")){
                var securityLine = nextLine.next();
                if(securityLine.next().hasClass("end"))
                    showtoast("warning","失败","已经到底部");
                else {
                    var afterFunTr=securityLine.next("tr.funTr");
                    if (afterFunTr.next().hasClass("end")||afterFunTr.next().hasClass("funTr")){
                        afterFunTr.after(securityLine)
                        afterFunTr.after(nextLine)
                        afterFunTr.after(thisLine)
                    }
                    else if(afterFunTr.next().next().hasClass("securityTr") && afterFunTr.next().hasClass("usableTr")){
                        afterFunTr.next().next().after(securityLine)
                        afterFunTr.next().next().after(nextLine)
                        afterFunTr.next().next().after(thisLine)
                    }
                    else{
                        afterFunTr.next().after(securityLine)
                        afterFunTr.next().after(nextLine)
                        afterFunTr.next().after(thisLine)
                    }
                }
            }
            else{
                if(nextLine.next().hasClass("end"))
                    showtoast("warning","失败","已经到底部");
                else {
                    var afterFunTr=nextLine.next("tr.funTr");
                    if (afterFunTr.next().hasClass("end")||afterFunTr.next().hasClass("funTr")){
                        afterFunTr.after(nextLine)
                        afterFunTr.after(thisLine)
                    }
                    else if(afterFunTr.next().next().hasClass("securityTr") && afterFunTr.next().hasClass("usableTr")){
                        afterFunTr.next().next().after(nextLine)
                        afterFunTr.next().next().after(thisLine)
                    }
                    else{
                        afterFunTr.next().after(nextLine)
                        afterFunTr.next().after(thisLine)
                    }
                }
            }
        }
        else {
            if(thisLine.next().hasClass("end"))
                showtoast("warning","失败","已经到底部");
            else {
                var afterFunTr=thisLine.next("tr.funTr");
                if (afterFunTr.next().hasClass("end")||afterFunTr.next().hasClass("funTr")){
                    afterFunTr.after(thisLine)
                }
                else if(afterFunTr.next().next().hasClass("securityTr") && afterFunTr.next().hasClass("usableTr")){
                    afterFunTr.next().next().after(thisLine)
                }
                else{
                    afterFunTr.next().after(thisLine)
                }
            }
        }

    })


    $(document).on("click",".fun_up",function () {
        if($(this).parent().parent().hasClass("funTr")){
            var thisLine=$(this).parent().parent();
        }
        else{
            var thisLine=$(this).parent().parent().parent();
        }
        if(thisLine.index()==0)
        {
            showtoast("warning","失败","已经到顶部");return;
        }
        if(thisLine.next("tr").hasClass("usableTr") ||thisLine.next("tr").hasClass("securityTr")){
            var nextLine=thisLine.next();
            var beforeFunTr=thisLine.prev();
            if(nextLine.next("tr").hasClass("securityTr")){
                var securityLine=nextLine.next();
                if (beforeFunTr.hasClass("funTr")){
                    beforeFunTr.before(thisLine)
                    beforeFunTr.before(nextLine)
                    beforeFunTr.before(securityLine)
                }
                else if(thisLine.prev().hasClass("securityTr") && thisLine.prev().prev().hasClass("usableTr")){
                    beforeFunTr.prev().prev().before(thisLine)
                    beforeFunTr.prev().prev().before(nextLine)
                    beforeFunTr.prev().prev().before(securityLine)
                }
                else{
                    beforeFunTr.prev().before(thisLine)
                    beforeFunTr.prev().before(nextLine)
                    beforeFunTr.prev().before(securityLine)
                }
            }
            else{
                if (beforeFunTr.hasClass("funTr")){
                    beforeFunTr.before(thisLine)
                    beforeFunTr.before(nextLine)
                }
                else if(thisLine.prev().hasClass("securityTr") && thisLine.prev().prev().hasClass("usableTr")){
                    beforeFunTr.prev().prev().before(thisLine)
                    beforeFunTr.prev().prev().before(nextLine)
                }
                else{
                    beforeFunTr.prev().before(thisLine)
                    beforeFunTr.prev().before(nextLine)
                }
            }
        }
        else {
            var beforeFunTr=thisLine.prev();
            if (beforeFunTr.hasClass("funTr")){
                beforeFunTr.before(thisLine)
            }
            else if(thisLine.prev().hasClass("securityTr") && thisLine.prev().prev().hasClass("usableTr")){
                beforeFunTr.prev().prev().before(thisLine)
            }
            else{
                beforeFunTr.prev().before(thisLine)
            }
        }
    })


    $(document).on("click",".fun_delete",function () {
        if ($(this).parent().parent().hasClass("funTr")) {
            var thisLine = $(this).parent().parent();
        }
        else {
            var thisLine = $(this).parent().parent().parent();
        }
        swal(
            {
                title: "您确认删除该用例过程吗",
                text: "删除后对应局部安全性和局部可用性也将一并删除",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "确定",
                cancelButtonText: "取消",
                closeOnConfirm: true
            },function () {
                if (thisLine.next().hasClass("usableTr") && thisLine.next().next().hasClass("securityTr")) {
                    thisLine.next().next().remove();
                    thisLine.next().remove();
                    thisLine.remove();
                }
                else if (thisLine.next().hasClass("funTr") || thisLine.next().hasClass("end")) {
                    thisLine.remove();
                }
                else {
                    thisLine.next().remove();
                    thisLine.remove();
                }
            })
    })

    var usableList;
    var securityList;
    //获取可用性
    function getUsable() {
        $.ajax({
            url: "catalog-getUsable",
            data: {},
            dataType: "json",
            type: "Post",
            async: "false",
            success: function (result) {
                usableList=result.usableList;
            },
            error: function (result) {
                showtoast("dangerous","失败","获取可用性失败")
            }
        })
    }
    //可用性初始化
    function UsableInit() {
        var content="";
        if(usableList != null){
            for (var i=0;i<usableList.length;i++){
                content+=" <option value='"+i+"' onclick='usableClick(this)'>"+(i+1)+"."+usableList[i].name+"</option>"
            }
            $("select#uaSelect").html(content);
        }
    }
    //加载详细可用性内容
    function usableClick(obj) {
        var id=parseInt($(obj).val());
        $("#uaname").text(usableList[id].name);
        $("#uaproblem").text(usableList[id].rang);
        $("#uasolution").text(usableList[id].solution);
        $("#uaexample").text(usableList[id].example);
    }

    //获取安全性
    function getSecurity() {
        $.ajax({
            url: "catalog-getSecurity",
            data: {},
            dataType: "json",
            type: "Post",
            async: "false",
            success: function (result) {
                securityList = result.securityList;
            },
            error: function (result) {
                showtoast("dangerous", "失败", "获取安全性失败")
            }
        })
    }
    //安全性初始化
    function SecurityInit() {
        var content="";
        if(securityList != null){
            for (var i=0;i<securityList.length;i++){
                content+=" <option value='"+i+"' onclick='SecurityClick(this)'>"+(i+1)+"."+securityList[i].name+"</option>"
            }
            $("select#seSelect").html(content);
        }
    }

    //加载详细安全性内容
    function SecurityClick(obj) {
        var id=parseInt($(obj).val());
        $("#sename").text(securityList[id].name);
        $("#seproblem").text(securityList[id].rang);
        $("#sesolution").text(securityList[id].solution);
        $("#seexample").text(securityList[id].example);
    }

    //加载模板3的内容
    function loadTemplateThree(entity) {
        UsableInit();
        SecurityInit();
        $("input#funName").val(entity.funName);
        $("select#priority").val(entity.priority);
        $("input#describe").val(entity.describe);
        $("input#in").val(entity.input);
        $("input#out").val(entity.output);
        $("input#basic").val(entity.basic);
        $("input#alternative").val(entity.alternative);
        //生成表格
        var funRoleList=entity.funRoleList;
        var funUsableList=entity.funUsableList;
        var funRoleContent="";
        if(funRoleList!=null)
            for (var i=0;i<funRoleList.length;i++){
                funRoleContent+=" <tr class='funTr'> <th  ><div class='hidenTh' > <span class='fun_down li_fa fa col-md-offset-1  fa-arrow-down black'></span> <span class='fun_up fa li_fa col-md-offset-1  fa-arrow-up black ' ></span> <span class='fun_delete li_fa fa col-md-offset-1  fa-times  black' ></span></div> </th> <th> <input class='form-control  roleName dis' name='roleName'  ";
                var undefined="true",roleListContent="value='";
                if(funRoleList[i].roleName!=null){
                    roleListContent+=funRoleList[i].roleName + "'>";
                    undefined="false";
                }
                if(undefined=="true"){
                    roleListContent+="未定义'>";
                }funRoleContent+=roleListContent;
                funRoleContent+="</input> </th> <th> <textarea   class='form-control roleDescribe dis'  name='roleDescribe'   style='resize:vertical; max-width: 100%' >";
                funRoleContent+=funRoleList[i].roleDescribe+"</textarea> </th>";
                if(funRoleList[i].usableName==null && funRoleList[i].securityName==null){//新增按钮
                    funRoleContent+=" <th> <button  class='btn btn-primary  btn-xs col-lg-push-1 dis'  id='addUsable'  data-toggle='modal' data-target='#addUsableModel' onclick='addUsable(this)' type='button' style='margin-right: 10px' disabled>可用</button> <button  class='btn btn-primary  btn-xs col-lg-push-1 dis'  id='addSecurity'  data-toggle='modal' data-target='#addSecurityModel' onclick='addSecurity(this)' type='button' style='margin-right: 10px' disabled>安全</button> </th></tr>";
                }else if(funRoleList[i].usableName==null){
                    funRoleContent+=" <th> <button  class='btn btn-primary  btn-xs col-lg-push-1 dis'  id='addUsable'  data-toggle='modal' data-target='#addUsableModel' onclick='addUsable(this)' type='button' style='margin-right: 10px' disabled>可用</button> <button  class='btn btn-primary  btn-xs col-lg-push-1 dis'  id='addSecurity'  data-toggle='modal' data-target='#addSecurityModel' onclick='addSecurity(this)' type='button' style='display: none; margin-right: 10px' disabled>安全</button> </th></tr>";
                    funRoleContent+="<tr class='securityTr'> <th></th> <th name='securityName' class='securityName'>"+funRoleList[i].securityName+"</th> <th  name='securityPara' class='securityPara' >"+funRoleList[i].securityPara+"</th> <th style='text-align: center' > <button  class='btn btn-danger  btn-xs col-lg-push-1 dis' id='deleteSecurity'  onclick='deleteSecurity(this)' type='button' style='margin-right: 10px' disabled>删除安全性</button></th> </tr>";
                }else if(funRoleList[i].securityName==null){
                    funRoleContent+=" <th> <button  class='btn btn-primary  btn-xs col-lg-push-1 dis'  id='addUsable'  data-toggle='modal' data-target='#addUsableModel' onclick='addUsable(this)' type='button' style='display: none; margin-right: 10px' disabled>可用</button> <button  class='btn btn-primary  btn-xs col-lg-push-1 dis'  id='addSecurity'  data-toggle='modal' data-target='#addSecurityModel' onclick='addSecurity(this)' type='button' style='margin-right: 10px' disabled>安全</button> </th></tr>";
                    funRoleContent+="<tr class='usableTr'> <th></th> <th name='usableName' class='usableName'>"+funRoleList[i].usableName+"</th> <th  name='usablePara' class='usablePara' >"+funRoleList[i].usablePara+"</th> <th style='text-align: center' > <button  class='btn btn-danger  btn-xs col-lg-push-1 dis' id='deleteUsable'  onclick='deleteUsable(this)' type='button' style='margin-right: 10px' disabled>删除可用性</button></th> </tr>";
                }else{
                    funRoleContent+=" <th> <button  class='btn btn-primary  btn-xs col-lg-push-1 dis'  id='addUsable'  data-toggle='modal' data-target='#addUsableModel' onclick='addUsable(this)' type='button' style='display: none; margin-right: 10px' disabled>可用</button> <button  class='btn btn-primary  btn-xs col-lg-push-1 dis'  id='addSecurity'  data-toggle='modal' data-target='#addSecurityModel' onclick='addSecurity(this)' type='button' style='display: none; margin-right: 10px' disabled>安全</button> </th></tr>";
                    funRoleContent+="<tr class='usableTr'> <th></th> <th name='usableName' class='usableName'>"+funRoleList[i].usableName+"</th> <th  name='usablePara' class='usablePara' >"+funRoleList[i].usablePara+"</th> <th style='text-align: center' > <button  class='btn btn-danger  btn-xs col-lg-push-1 dis' id='deleteUsable'  onclick='deleteUsable(this)' type='button' style='margin-right: 10px' disabled>删除可用性</button></th> </tr>";
                    funRoleContent+="<tr class='securityTr'> <th></th> <th name='securityName' class='securityName'>"+funRoleList[i].securityName+"</th> <th  name='securityPara' class='securityPara' >"+funRoleList[i].securityPara+"</th> <th style='text-align: center' > <button  class='btn btn-danger  btn-xs col-lg-push-1 dis' id='deleteSecurity'  onclick='deleteSecurity(this)' type='button' style='margin-right: 10px' disabled>删除安全性</button></th> </tr>";
                }
            }
        $(".funTable tbody").prepend(funRoleContent);
        var funUsableContent="";
        if(funUsableList!=null)
            for (var i=0;i<funUsableList.length;i++){
                if(funUsableList[i].usableName!=null){
                    funUsableContent+="<tr class='usableTr'> <th colspan='2' name='usableName' class='usableName'>"+funUsableList[i].usableName+"</th> <th  name='usablePara' class='usablePara' >"+funUsableList[i].usablePara+"</th> <th style='text-align: center' >  <button  class='btn btn-danger  btn-xs col-lg-push-1 dis' id='deleteUsable'  onclick='deleteUsable(this)' type='button' style='margin-right: 10px' disabled>删除可用性</button></th> </tr>"
                }else if(funUsableList[i].securityName!=null){
                    funUsableContent+="<tr class='securityTr'> <th colspan='2' name='securityName' class='securityName'>"+funUsableList[i].securityName+"</th> <th  name='securityPara' class='securityPara' >"+funUsableList[i].securityPara+"</th> <th style='text-align: center' > <button  class='btn btn-danger  btn-xs col-lg-push-1 dis' id='deleteSecurity'  onclick='deleteSecurity(this)' type='button' style='margin-right: 10px' disabled>删除安全性</button></th> </tr>";
                }
            }
        $(".funTable tfoot").append(funUsableContent);
    }

    //页面初始化
    $(document).ready(function () {
        getUsable();
        getSecurity();
        getContent();

    })
    var entity;
    var id;
    function getContent() {
        id=${requestScope.id}
        $.ajax({
            url: "structure-getContent",
            data: {id_structure : id},
            dataType: "json",
            type: "Post",
            async: "false",
            success: function (result) {
                entity=result.entity;
                loadTemplateThree(JSON.parse(entity.content));
            },
            error: function (result) {
                showtoast("dangerous", "失败", "失败")
            }
        })
    }
</script>
<!-- Mirrored from www.zi-han.net/theme/hplus/ by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:17:11 GMT -->
</html>
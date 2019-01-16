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
    <title>个人中心</title>
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <link rel="shortcut icon" href="<%=basePath %>/example/favicon.ico">
    <link href="<%=basePath%>/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="<%=basePath%>/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="<%=basePath%>/css/animate.min.css" rel="stylesheet">
    <link href="<%=basePath%>/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <!-- bootstrap-table -->
    <link href="<%=basePath%>/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="<%=basePath%>/css/z_style.css" rel="stylesheet">
    <link href="<%=basePath%>/css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <!-- Sweet Alert -->
    <link href="<%=basePath%>/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="<%=basePath %>/css/button.css" rel="stylesheet">
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
                    <a href="user-jmpHomepage" style="color:#658387">首页</a> >> <a href="user-jmpMyProfile">个人中心</a>
                </strong>
            </li>
        </ol>
    </div>

    <div style="padding: 20px" class="col-md-12">
        <div style="float: left" class="col-md-6">
            <div>
                <div class="ibox-title">
                    <div style="float: left;margin-left: 5px"><span><strong>基本资料</strong></span></div>
                    <div id="test1" style="float: left;margin-left: 10px"><button type="button" class="btn btn-custom btn-xs" data-toggle="modal" data-target="#myModal">修改资料</button></div>
                    <%--<div id="test2" style="float: left;width: 70px"><a href="user-jmpPayment"><button type="button" class="btn btn-custom btn-xs" >积分充值</button></a></div>--%>
                    <div id="test3" style="float: left;margin-left: 10px"><a href="user-jmpPointsRecord"><button type="button" class="btn btn-custom btn-xs" >积分记录</button></a></div>
                    <div id="test4" style="float: left;margin-left: 10px"><button type="button" class="btn btn-custom btn-xs" data-toggle="modal" data-target="#changepassword">修改密码</button></div>
                </div>
                <div style="padding-left: 80px" class="ibox-content">
                <table class="table" style="width:400px;border-left: none;border-right: none">
                    <tbody style="font-size:20px;font-family:KaiTi">
                    <tr >
                        <th style="width: 150px;text-align: center">用户名:</th>
                        <th>
                            ${sessionScope.user.name}
                                <s:if test='#session.user.gender=="男"'>
                                    <img src="<%=basePath%>/img/u413.png">
                                </s:if>
                                <s:elseif test='#session.user.gender=="女"'>
                                    <img style="height: 30px;width: 30px" src="<%=basePath%>/img/famale.png">
                                </s:elseif>
                                <s:else>
                                    <img style="height: 30px;width: 30px" src="<%=basePath%>/img/doublesex.png">
                                </s:else>
                        </th>
                    </tr>
                    <tr >
                        <th style="width: 150px;text-align: center">真实姓名:</th>
                        <th>
                            <s:if test='#session.user.realname==""'>
                                <s:property value="" default="-" />
                            </s:if>
                            <s:else>
                                <s:property value="#session.user.realname"/>
                            </s:else>
                        </th>
                    </tr>
                    <tr >
                        <th style="width: 150px;text-align: center">邮箱:</th>
                        <th>
                            <s:if test='#session.user.mail==""'>
                                <s:property value="" default="-" />
                            </s:if>
                            <s:else>
                                <s:property value="#session.user.mail"/>
                            </s:else>
                        </th>
                    </tr>
                    <tr >
                        <th style="width: 150px;text-align: center">QQ:</th>
                        <th>
                            <s:if test='#session.user.qq==""'>
                                <s:property value="" default="-" />
                            </s:if>
                            <s:else>
                                <s:property value="#session.user.qq"/>
                            </s:else>
                        </th>
                    </tr>
                    <tr >
                        <th style="width: 150px;text-align: center">联系电话:</th>
                        <th>
                            <s:if test='#session.user.tel==""'>
                                <s:property value="" default="-" />
                            </s:if>
                            <s:else>
                                <s:property value="#session.user.tel"/>
                            </s:else>
                        </th>
                    </tr>
                    <tr >
                        <th style="width: 150px;text-align: center">所在地:</th>
                        <th>
                            <s:if test='#session.user.address==""'>
                                <s:property value="" default="-" />
                            </s:if>
                            <s:else>
                                <s:property value="#session.user.address"/>
                            </s:else>
                        </th>
                    </tr>
                    <tr >
                        <th style="width: 150px;text-align: center">个性签名:</th>
                        <th>
                            <s:if test='#session.user.introduce==""'>
                                <s:property value="" default="-" />
                            </s:if>
                            <s:else>
                                <s:property value="#session.user.introduce"/>
                            </s:else>
                        </th>
                    </tr>
                    <tr >
                        <th style="width: 150px;text-align: center">账户积分:</th>
                        <th>
                            <s:if test='#session.user.points==""'>
                                <s:property value="" default="-" />
                            </s:if>
                            <s:else>
                                <s:property value="#session.user.points"/>
                            </s:else>
                        </th>
                    </tr>
                    <tr >
                        <th style="width: 150px;text-align: center">注册时间:</th>
                        <th>
                            <s:if test='#session.user.registrationtime==""'>
                                <s:property value="" default="-" />
                            </s:if>
                            <s:else>
                                <s:property value="#session.user.registrationtime"/>
                            </s:else>
                        </th>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div style="padding: 25px 0px 20px 18px;font-family: KaiTi;font-size: 17px;color: red" class="white-bg">
                <%--<p>会员有效期☞：${sessionScope.user.deadline}</p>--%>
            </div>
            </div>
        </div>

        <div style="float: left" class="col-md-6">
            <div class="ibox-title">
                <div style="float: left;margin-left: 5px"><span><strong>我加入的机构</strong></span></div>
                <div style="float: left;margin-left: 10px"><button type="button" class="btn btn-custom btn-xs" data-toggle="modal" data-target="#newOrg">申请创建机构</button></div>
                <div style="float: left;margin-left: 10px"><button type="button" class="btn btn-custom btn-xs" data-toggle="modal" data-target="#joinOrg">申请加入机构</button></div>
            </div>
            <div class="bootstrap-table  ibox-content">
                <table id="finishingTask" data-toggle="table"
                       data-classes="table table-no-bordered"
                       data-url="project-showList"
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
                       data-height="415"
                       data-sort-order="desc"
                       data-pagination-v-align="top"
                       data-sort-stable="true"
                >
                </table>
            </div>
        </div>
    </div>
    <div  class="modal inmodal" id="newOrg" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content animated bounceInRight">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                    </button>
                    <h4 class="modal-title">申请创建机构</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group"><label>机构名</label> <input id="org_name" type="text" placeholder="请输入机构名(必填，不超过30字符)" maxlength="40" class="form-control" required="required"></div>
                    <div class="form-group"><label>备注</label> <input id="message" type="text" placeholder="请输入备注(可不填，不超过60字符)"  maxlength="60" class="form-control" required="required"></div>
                </div>
                <div class="modal-footer">
                    <button id="cancel-apply" type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                    <button id="newOrg-button" type="submit" class="btn btn-primary">申请</button>
                </div>
            </div>
        </div>
    </div>
    <div  class="modal inmodal" id="joinOrg" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content animated bounceInRight">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                    </button>
                    <h4 class="modal-title">申请加入机构</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group"><label>机构名</label> <input id="join_org_name" type="text" placeholder="请输入机构名(必填，不超过30字符)" maxlength="40" class="form-control" required="required"></div>
                    <div class="form-group"><label>留言</label> <input id="join_message" type="text" placeholder="请输入留言(可不填，不超过60字符)"  maxlength="60" class="form-control" required="required"></div>
                </div>
                <div class="modal-footer">
                    <button id="join-cancel-apply" type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                    <button id="joinOrg-button" type="submit" class="btn btn-primary">申请</button>
                </div>
            </div>
        </div>
    </div>
    <div  class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content animated bounceInRight">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                    </button>
                    <h4 class="modal-title">修改资料</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group"><label>QQ</label>
                        <input id="qq" type="text" maxlength="20"
                        <s:if test='#session.user.qq==""'>
                               placeholder="请输入QQ(不超过20个字符)"
                        </s:if>
                        <s:else>
                               value="<s:property value="#session.user.qq"/>"
                        </s:else>
                               class="form-control" required="">
                    </div>
                    <div class="form-group"><label>真实姓名</label>
                        <input id="realname" type="text" maxlength="20"
                        <s:if test='#session.user.realname==""'>
                               placeholder="请输入真实姓名(不超过20个字符)"
                        </s:if>
                        <s:else>
                               value="<s:property value="#session.user.realname"/>"
                        </s:else>
                               class="form-control" required="">
                    </div>
                    <div class="form-group"><label>所在地</label>
                        <input id="address" type="text" maxlength="40"
                        <s:if test='#session.user.address==""'>
                               placeholder="请输入所在地(不超过40个字符)"
                        </s:if>
                        <s:else>
                               value="<s:property value="#session.user.address"/>"
                        </s:else>
                               class="form-control" required="">
                    </div>
                    <div class="form-group"><label>联系电话</label>
                        <input id="mytel" type="text" maxlength="20"
                        <s:if test='#session.user.tel==""'>
                               placeholder="请输入联系电话(不超过20个字符)"
                        </s:if>
                        <s:else>
                               value="<s:property value="#session.user.tel"/>"
                        </s:else>
                               class="form-control" required="">
                        </div>
                    <div class="form-group"><label>个性签名</label>
                        <input id="introduce" type="text" maxlength="40"
                            <s:if test='#session.user.introduce==""'>
                               placeholder="请输入个人简介(不超过40个字符)"
                            </s:if>
                            <s:else>
                                value="<s:property value="#session.user.introduce"/>"
                            </s:else>
                               class="form-control" required="">
                    </div>
                    <div class="form-group">
                        <label>性别</label>
                        <div class="form-group">
                            <select id="gender" class="form-control" name="gender">
                                <option>保密</option>
                                <option>男</option>
                                <option>女</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                    <button id="edit-button" type="button" class="btn btn-primary">保存</button>
                </div>
            </div>
        </div>
    </div>


    <div  class="modal inmodal" id="changepassword" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content animated bounceInRight">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                    </button>
                    <h4 class="modal-title">修改密码</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group"><label>原密码</label>
                        <input id="oldpwd" type="password" maxlength="22"
                               placeholder="请输入原密码"
                               class="form-control" required="">
                    </div>
                    <div class="form-group"><label>新密码</label>
                        <input id="newpwd1" type="password" maxlength="22"
                               placeholder="请设置新密码（长度为6-22个字符）"
                               class="form-control" required="">
                    </div>
                    <div class="form-group"><label>确认密码</label>
                        <input id="newpwd2" type="password" maxlength="22"
                               placeholder="请再次输入新密码"
                               class="form-control" required="">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                    <button id="change-button" type="button" class="btn btn-primary">更改</button>
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
<script src="<%=basePath%>/js/mjy.js"></script>
<script src="<%=basePath%>/js/md5.js"></script>
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

    $("button#edit-button").click(function (){
        swal(
            {
                title: "您确认保存本次修改吗？",
                text: "确认请点击保存",
                type: "",
                showCancelButton: true,
                confirmButtonColor: "#18a689",
                confirmButtonText: "保存",
                cancelButtonText: "取消",
                closeOnConfirm: false
            },function () {
                $.ajax({
                    url: "user-editProfile",
                    data: {
                        qq: $("input#qq").val(),
                        realname: $("input#realname").val(),
                        address: $("input#address").val(),
                        tel: $("input#mytel").val(),
                        introduce: $("input#introduce").val(),
                        gender: $("select#gender").val()
                    },
                    dataType: "json",
                    type: "Post",
                    async: "false",
                    success: function (result) {
                        if (result.res == true){
                            swal({
                                title: "修改成功",
                                type:"success",
                                confirmButtonColor: "#18a689",
                                confirmButtonText: "OK"
                            },function(){
                                location.href = "user-jmpMyProfile";
                            })
                        }
                        else swal("修改失败！", "服务器错误", "error");
                    },
                    error: function () {
                        swal("修改失败！", "请检查你的网络", "error");
                    }
                })
            })
    });

    $("button#change-button").click(function (){

        var md5PWD1 = $("input#oldpwd").val();
        var temp1 = hex_md5(md5PWD1);

        var md5PWD2 = $("input#newpwd1").val();
        if (md5PWD2.length < 6 || md5PWD2.length > 22) {
            swal("修改失败！", "密码长度不符合要求", "error");
            return false
        }
        var temp2 = hex_md5(md5PWD2);

        var md5PWD3 = $("input#newpwd2").val();
        if (md5PWD3.length < 6 || md5PWD3.length > 22) {
            swal("修改失败！", "密码长度不符合要求", "error");
            return false
        }
        var temp3 = hex_md5(md5PWD3);

        swal(
            {
                title: "您确认保存本次修改吗？",
                text: "确认请点击保存",
                type: "",
                showCancelButton: true,
                confirmButtonColor: "#18a689",
                confirmButtonText: "更改",
                cancelButtonText: "取消",
                closeOnConfirm: false
            },function () {
                $.ajax({
                    url: "user-changePassword",
                    data: {
                        oldpassword: temp1,
                        firstpassword: temp2,
                        secondpassword: temp3
                    },
                    dataType: "json",
                    type: "Post",
                    async: "false",
                    success: function (result) {
                        if (result.consequence === "error") {
                            swal("修改失败！", "两次输入新密码不同", "error")
                        }
                        else if(result.res === true) {
                            swal({
                                title: "修改成功",
                                type:"success",
                                confirmButtonColor: "#18a689",
                                confirmButtonText: "OK"
                            },function(){
                                location.href = "user-jmpMyProfile";
                            })
                        }
                        else if(result.res === false)
                            swal("修改失败！", "原密码错误", "error");
                    },
                    error: function () {
                        swal("修改失败！", "请检查你的网络", "error");
                    }
                })
            })
    });



    $("button#newOrg-button").click(function (){
        var org_name=$("input#org_name").val();
        console.log(org_name);
        if(org_name === "" || org_name === null){
            swal("申请失败！", "请填写机构名", "error");
        }
        else {
            swal(
                {
                    title: "您确认申请创建该机构吗？",
                    text: "确认请点击申请",
                    type: "",
                    showCancelButton: true,
                    confirmButtonColor: "#18a689",
                    confirmButtonText: "申请",
                    cancelButtonText: "取消",
                    closeOnConfirm: false
                }, function () {
                    $.ajax({
                        url: "applyOrganization-applyOrg",
                        data: {
                            org_name: $("input#org_name").val(),
                            message: $("input#message").val(),
                        },
                        dataType: "json",
                        type: "Post",
                        async: "false",
                        success: function (result) {
                            var points = "${session.user.points}";
                            var Npoints = "${session.Mpoint1}";
                            if(parseInt(points) >= parseInt(Npoints)){
                                if(result.res2 === false){
                                    if (result.res === true) {
                                        swal({title:"申请成功发出!", text:"机构申请已受理,管理员同意后则扣除${session.Mpoint1}积分", type:"success"});
                                        $('button#cancel-apply').click();
                                    }
                                    else if(result.res === false) {
                                        swal("申请失败！", "机构名被占用。", "error");
                                    }
                                }
                                else if(result.res2 === true) {
                                    swal("申请失败！", "您已申请该机构，请等待管理员处理。", "error");
                                }
                            }
                            else swal("您剩余的积分不足！", "创建一个机构需要${sessionScope.Mpoint1}个积分，请到个人中心进行积分充值。", "error");
                        },
                        error: function () {
                            swal({
                                icon: "error"
                            });
                        }
                    })
                })
        }
    });

    $("button#joinOrg-button").click(function () {
        var join_org_name = $("input#join_org_name");
        console.log(join_org_name);
        if(join_org_name === "" || join_org_name === null) {
            swal("申请失败！", "请填写机构名", "error");
        }
        else {
            swal(
                {
                    title: "您确认申请加入该机构吗？",
                    text: "确认请点击申请",
                    type: "",
                    showCancelButton: true,
                    confirmButtonColor: "#18a689",
                    confirmButtonText: "申请",
                    cancelButtonText: "取消",
                    closeOnConfirm: false
                }, function () {
                    $.ajax({
                        url: "joinOrganization-joinOrg",
                        data: {
                            org_name: $("input#join_org_name").val(),
                            message: $("input#join_message").val(),
                        },
                        dataType: "json",
                        type: "Post",
                        async: "false",
                        success: function (result) {
                            if(result.resExist === true) {
                                if(result.resBelong === true) {
                                    swal("申请失败", "已经在该机构中", "error");
                                }
                                else {
                                    if (result.res === true) {
                                        swal("加入申请成功发出!", "机构加入申请已受理,等待机构管理员同意", "success");
                                        $('button#join-cancel-apply').click();
                                    }
                                    else if (result.res === false) {
                                        swal("申请失败！", "不能向同一个机构重复发送申请", "error");
                                    }
                                }
                            }
                            else {
                                swal("申请失败", "输入的机构不存在", "error");
                            }

                        },
                        error: function () {
                            swal({
                                icon: "error"
                            });
                        }
                    })
                })
        }
    })
</script>
<script>
    $('#finishingTask').bootstrapTable({
            columns: [
                {
                    title: '机构编码',
                    field: 'ID_ORGANIZATION',
                    align: 'center',
                    sortable: true,
                    valign: 'middle'
                },
                {
                    field: 'ORG_NAME',
                    title: '机构名称',
                    sortable: true,
                    align: 'center'
                }, {
                    field: 'USER_NAME',
                    title: '管理员',
                    sortable: true,
                    align: 'center'
                },
                {
                    field: 'operate',
                    title: '操作',
                    align: 'center',
                    events: "actionEvents",
                    formatter: "AddFunctionAlty"
                }
            ]
        }
    );
    /**
     * @return {string}
     */

    $.ajax(
        {
            type:"GET",
            url:"personalcenter-showList",
            dataType:"json",
            success:function(json){
                var proList = JSON.parse(json.listorg);
                //finishingTask为table的id
                $('#finishingTask').bootstrapTable('load',proList);
            },
            error:function(){
                alert("错误");
            }
        }
    )
    /**
     *个人机构
     * */
    function AddFunctionAlty(value,row,index) {
        return '<a class="exit zfont3">退出</a>'
    }
    window.actionEvents = {
        'click .exit': function (e, value, row, index) {
            var id_admin = parseInt(row.ID_USER);
            var id_user = ${sessionScope.user.id_user};
            if(id_admin === id_user){
                swal("错误", "机构管理员不能退出自己的机构", "error");
            }
            else {
                swal({
                    title: "您确定要退出这个机构吗",
                    text: "点击确定后讲退出机构，请谨慎操作！",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "确定",
                    cancelButtonText: "取消",
                    closeOnConfirm: false
                }, function () {
                    var id = row.ID_ORGANIZATION;
                    var ID_ORGANIZATION = parseInt(id);
                    $.ajax({
                        url: "personalcenter-quitorg?ID_ORGANIZATION=" + ID_ORGANIZATION,
                        dataType: "json",
                        type: "Post",
                        async: "false",
                        success: function (result) {
                            if (result.res === true) {
                                swal({
                                    title: "退出成功",
                                    type: "success",
                                    confirmButtonColor: "#18a689",
                                    confirmButtonText: "OK"
                                }, function () {
                                    location.href = "user-jmpMyProfile";
                                })
                            }
                            else swal("退出失败！", "机构管理员不能退出自己的机构", "error");
                        }, error: function () {
                            swal("退出！", "请检查你的网络", "error");
                        }
                    })
                })
                //修改操作
            }
        }
    };

</script>

</html>
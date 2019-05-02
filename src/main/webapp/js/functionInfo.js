var timer1=null;
function toshow1(){
    clearTimeout(timer1);
    th1_edit.style.display='block';
    tr1.style.background='lightcyan'
}
function tomiss1() {
    timer1=setTimeout(function () {
        th1_edit.style.display='none';
        tr1.style.background='#FFFFFF'
    },0);
    th1_edit.onmouseover=function() {
        clearTimeout(timer1);
    }
}

var timer2=null;
function toshow2(){
    clearTimeout(timer2);
    th2_edit.style.display='block';
    tr2.style.background='lightcyan'
}
function tomiss2() {
    timer2=setTimeout(function () {
        th2_edit.style.display='none';
        tr2.style.background='#FFFFFF'
    },0);
    th2_edit.onmouseover=function() {
        clearTimeout(timer2);
    }
}

var timer3=null;
function toshow3(){
    clearTimeout(timer3);
    th3_edit.style.display='block';
    tr3.style.background='lightcyan'
}
function tomiss3() {
    timer3=setTimeout(function () {
        th3_edit.style.display='none';
        tr3.style.background='#FFFFFF'
    },0);
    th3_edit.onmouseover=function() {
        clearTimeout(timer3);
    }
}

var timer4=null;
function toshow4(){
    clearTimeout(timer4);
    th4_edit.style.display='block';
    tr4.style.background='lightcyan'
}
function tomiss4() {
    timer4=setTimeout(function () {
        th4_edit.style.display='none';
        tr4.style.background='#FFFFFF'
    },0);
    th4_edit.onmouseover=function() {
        clearTimeout(timer4);
    }
}

var timer5=null;
function toshow5(){
    clearTimeout(timer5);
    th5_edit.style.display='block';
    tr5.style.background='lightcyan'
}
function tomiss5() {
    timer5=setTimeout(function () {
        th5_edit.style.display='none';
        tr5.style.background='#FFFFFF'
    },0);
    th5_edit.onmouseover=function() {
        clearTimeout(timer5);
    }
}

var timer6=null;
function toshow6(){
    clearTimeout(timer6);
    th6_edit.style.display='block';
    tr6.style.background='lightcyan'
}
function tomiss6() {
    timer6=setTimeout(function () {
        th6_edit.style.display='none';
        tr6.style.background='#FFFFFF'
    },0);
    th6_edit.onmouseover=function() {
        clearTimeout(timer6);
    }
}

var timer7=null;
function toshow7() {
    clearTimeout(timer7);
    th7_edit.style.display='block';
    tr7.style.background='lightcyan'
}
function tomiss7() {
    timer7=setTimeout(function () {
        th7_edit.style.display='none';
        tr7.style.background='#FFFFFF'
    },0);
    th7_edit.onmouseover=function() {
        clearTimeout(timer7);
    }
}

var timer8=null;
function toshow8() {
    clearTimeout(timer8);
    th8_edit.style.display='block';
    tr8.style.background='lightcyan'
}
function tomiss8() {
    timer8=setTimeout(function () {
        th8_edit.style.display='none';
        tr8.style.background='#FFFFFF'
    },0);
    th8_edit.onmouseover=function() {
        clearTimeout(timer8);
    }
}

var timer9=null;
function toshow9() {
    clearTimeout(timer9);
    th9_edit.style.display='block';
    tr9.style.background='lightcyan'
}
function tomiss9() {
    timer9=setTimeout(function () {
        th9_edit.style.display='none';
        tr9.style.background='#FFFFFF'
    },0);
    th9_edit.onmouseover=function() {
        clearTimeout(timer9);
    }
}

var timer10=null;
function toshow10() {
    clearTimeout(timer10);
    th10_edit.style.display='block';
    tr10.style.background='lightcyan'
}
function tomiss10() {
    timer10=setTimeout(function () {
        th10_edit.style.display='none';
        tr10.style.background='#FFFFFF'
    },0);
    th10_edit.onmouseover=function() {
        clearTimeout(timer10);
    }
}
function two(){
    $.ajax(
        {
            type:"GET",
            url:"project-getContent",
            data:{catalog:catalog},
            dataType:"json",
            success:function(json)
            {
                var it = JSON.parse(json.res);
                var tem = JSON.parse(it.content);
                $('#funName').text(tem.funName);
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
                $('#priority1').text(priority);
                $('#priority2').text(priority);
                $('#describe').text(tem.describe);
                document.getElementById("funRoleList").innerHTML = funRoleList;
                document.getElementById("funUsableList").innerHTML = funUsableList;
                $('#input').text(tem.input);
                $('#output').text(tem.output);
                $('#basic').text(tem.basic);
                $('#basic').text(tem.basic);
                $('#alternative').text(tem.alternative);

            },
            error:function(){
                swal({
                    icon: "error"
                });
            }
        }
    )
}

$("button#edit_iter").click(function (){
    swal(
        {
            title: "您确认修改功能点当前迭代吗？",
            text: "确认请点击确认",
            type: "",
            showCancelButton: true,
            confirmButtonColor: "#18a689",
            confirmButtonText: "确认",
            cancelButtonText: "取消",
            closeOnConfirm: false
        }, function () {
            var iter = $("select#chooseIter").val();
            var iter_name = $("select#chooseIter").find("option:selected").text();
            alert(iter);
            alert(iter_name)
            $.ajax({
                url: "project-edit_iter",
                data: {
                    id_iter: iter,
                    id_catalog:id_catalog,
                    user_name:user_name
                },
                dataType: "json",
                type: "get",
                async: "false",
                success: function (result) {
                    var TrackList = JSON.parse(result.TrackList);
                    $('#TrackList').bootstrapTable('load',TrackList);
                    if (result.res === true) {
                        swal({
                            title: "修改成功",
                            type: "success",
                            confirmButtonColor: "#18a689",
                            confirmButtonText: "OK"
                        }, function () {
                            $("#th1").html(iter_name + "  <a id=\"th1_edit\" style=\"display:none\" data-toggle=\"modal\" data-target=\"#Iter\"><img src=\"/img/editTrack.png\" style=\"height: 20px;margin: 5px 5px 5px 5px;\"> </a>");
                            var oDiv = document.getElementById('cancel-apply1');
                            oDiv.click();
                        })
                    }
                }, error: function () {
                    swal("修改失败！", "服务器异常", "error");
                }
            })
        })

});

$("button#edit_per").click(function (){
    swal(
        {
            title: "您确认修改功能点当前责任人吗？",
            text: "确认请点击确认",
            type: "",
            showCancelButton: true,
            confirmButtonColor: "#18a689",
            confirmButtonText: "确认",
            cancelButtonText: "取消",
            closeOnConfirm: false
        }, function () {
            var person_name = $("select#choosePer").find("option:selected").text();
            alert(person_name);
            $.ajax({
                url: "project-edit_per",
                data: {
                    person_name: person_name,
                    id_catalog:id_catalog,
                    user_name:user_name
                },
                dataType: "json",
                type: "get",
                async: "false",
                success: function (result) {
                    var TrackList = JSON.parse(result.TrackList);
                    $('#TrackList').bootstrapTable('load',TrackList);
                    if (result.res === true) {
                        swal({
                            title: "修改成功",
                            type: "success",
                            confirmButtonColor: "#18a689",
                            confirmButtonText: "OK"
                        }, function () {
                            $("#th3").html(person_name + "  <a id=\"th3_edit\" style=\"display:none\" data-toggle=\"modal\" data-target=\"#Person\"><img src=\"/img/editTrack.png\" style=\"height: 20px;margin: 5px 5px 5px 5px;\"> </a>");
                            var oDiv = document.getElementById('cancel-apply3');
                            oDiv.click();
                        })
                    }
                }, error: function () {
                    swal("修改失败！", "服务器异常", "error");
                }
            })
        })

});

$("button#edit_pri").click(function (){
    swal(
        {
            title: "您确认修改功能点优先级吗？",
            text: "确认请点击确认",
            type: "",
            showCancelButton: true,
            confirmButtonColor: "#18a689",
            confirmButtonText: "确认",
            cancelButtonText: "取消",
            closeOnConfirm: false
        }, function () {
            var pri_after = $("select#choosePri").find("option:selected").text();
            alert(pri_after);
            $.ajax({
                url: "project-edit_pri",
                data: {
                    pri_after: pri_after,
                    id_catalog:id_catalog,
                    user_name:user_name
                },
                dataType: "json",
                type: "get",
                async: "false",
                success: function (result) {
                    var TrackList = JSON.parse(result.TrackList);
                    $('#TrackList').bootstrapTable('load',TrackList);
                    if (result.res === true) {
                        swal({
                            title: "修改成功",
                            type: "success",
                            confirmButtonColor: "#18a689",
                            confirmButtonText: "OK"
                        }, function () {
                            $("#priority1").html(pri_after);
                            $("#th2").html(pri_after + "  <a id=\"th2_edit\" style=\"display:none\" data-toggle=\"modal\" data-target=\"#Priority\"><img src=\"/img/editTrack.png\" style=\"height: 20px;margin: 5px 5px 5px 5px;\"> </a>");
                            var oDiv = document.getElementById('cancel-apply2');
                            oDiv.click();
                        })
                    }
                }, error: function () {
                    swal("修改失败！", "服务器异常", "error");
                }
            })
        })

});

$("button#edit_stage").click(function (){
    swal(
        {
            title: "您确认修改功能点当前阶段吗？",
            text: "确认请点击确认",
            type: "",
            showCancelButton: true,
            confirmButtonColor: "#18a689",
            confirmButtonText: "确认",
            cancelButtonText: "取消",
            closeOnConfirm: false
        }, function () {
            var stage = $("select#stage_choose").get(0).options.selectedIndex;
            $.ajax({
                url: "project-edit_stage",
                data: {
                    Stage: stage,
                    id_catalog:id_catalog,
                    user_name:user_name
                },
                dataType: "json",
                type: "get",
                async: "false",
                success: function (result) {
                    var TrackList = JSON.parse(result.TrackList);
                    $('#TrackList').bootstrapTable('load',TrackList);
                    if (result.res === true) {
                        swal({
                            title: "修改成功",
                            type: "success",
                            confirmButtonColor: "#18a689",
                            confirmButtonText: "OK"
                        }, function () {
                            if(stage == 0){
                                $("#th4").html("未开始" + "  <a id=\"th4_edit\" style=\"display:none\" data-toggle=\"modal\" data-target=\"#Stage\"><img src=\"/img/editTrack.png\" style=\"height: 20px;margin: 5px 5px 5px 5px;\"> </a>");
                            }else if(stage == 1){
                                $("#th4").html("开发中" + "  <a id=\"th4_edit\" style=\"display:none\" data-toggle=\"modal\" data-target=\"#Stage\"><img src=\"/img/editTrack.png\" style=\"height: 20px;margin: 5px 5px 5px 5px;\"> </a>");
                            }else if(stage == 2){
                                $("#th4").html("测试中" + "  <a id=\"th4_edit\" style=\"display:none\" data-toggle=\"modal\" data-target=\"#Stage\"><img src=\"/img/editTrack.png\" style=\"height: 20px;margin: 5px 5px 5px 5px;\"> </a>");
                            }else if(stage == 3){
                                $("#th4").html("bug修复中" + "  <a id=\"th4_edit\" style=\"display:none\" data-toggle=\"modal\" data-target=\"#Stage\"><img src=\"/img/editTrack.png\" style=\"height: 20px;margin: 5px 5px 5px 5px;\"> </a>");
                            }else if(stage == 4){
                                $("#th4").html("已完成" + "  <a id=\"th4_edit\" style=\"display:none\" data-toggle=\"modal\" data-target=\"#Stage\"><img src=\"/img/editTrack.png\" style=\"height: 20px;margin: 5px 5px 5px 5px;\"> </a>");
                            }
                            var oDiv = document.getElementById('cancel-apply4');
                            oDiv.click();
                        })
                    }
                }, error: function () {
                    swal("修改失败！", "服务器异常", "error");
                }
            })
        })

});

$("button#edit_time").click(function (){
    swal(
        {
            title: "您确认修改功能点开始/截至时间吗？",
            text: "确认请点击确认",
            type: "",
            showCancelButton: true,
            confirmButtonColor: "#18a689",
            confirmButtonText: "确认",
            cancelButtonText: "取消",
            closeOnConfirm: false
        }, function () {
            var start = $("li#start").text();
            var end = $("li#end").text();
            alert(start);
            alert(end);
            $.ajax({
                url: "project-edit_time",
                data: {
                    start: start,
                    end: end,
                    id_catalog:id_catalog,
                    user_name:user_name
                },
                dataType: "json",
                type: "get",
                async: "false",
                success: function (result) {
                    var TrackList = JSON.parse(result.TrackList);
                    $('#TrackList').bootstrapTable('load',TrackList);
                    if (result.res === true) {
                        swal({
                            title: "修改成功",
                            type: "success",
                            confirmButtonColor: "#18a689",
                            confirmButtonText: "OK"
                        }, function () {
                            $("#th5").html(start + "  <a id=\"th5_edit\" style=\"display:none\" data-toggle=\"modal\" data-target=\"#Time\"><img src=\"/img/editTrack.png\" style=\"height: 20px;margin: 5px 5px 5px 5px;\"> </a>");
                            $("#th6").html(end + "  <a id=\"th6_edit\" style=\"display:none\" data-toggle=\"modal\" data-target=\"#Time\"><img src=\"/img/editTrack.png\" style=\"height: 20px;margin: 5px 5px 5px 5px;\"> </a>");
                            var oDiv = document.getElementById('cancel-apply5');
                            oDiv.click();
                        })
                    }
                }, error: function () {
                    swal("修改失败！", "服务器异常", "error");
                }
            })
        })

});

$("button#edit_w_hours").click(function (){
    swal(
        {
            title: "您确认修改预估工时吗？",
            text: "确认请点击确认",
            type: "",
            showCancelButton: true,
            confirmButtonColor: "#18a689",
            confirmButtonText: "确认",
            cancelButtonText: "取消",
            closeOnConfirm: false
        }, function () {
            var hours = $("input#hours_w").val();
            $.ajax({
                url: "project-edit_w_hours",
                data: {
                    hours: $("input#hours_w").val(),
                    id_catalog:id_catalog,
                    user_name:user_name
                },
                dataType: "json",
                type: "get",
                async: "false",
                success: function (result) {
                    var TrackList = JSON.parse(result.TrackList);
                    $('#TrackList').bootstrapTable('load',TrackList);
                    if (result.res === true) {
                        swal({
                            title: "修改成功",
                            type: "success",
                            confirmButtonColor: "#18a689",
                            confirmButtonText: "OK"
                        }, function () {
                            $("#th7").html(hours + "  <a id=\"th7_edit\" style=\"display:none\" data-toggle=\"modal\" data-target=\"#W_HOURS\"><img src=\"/img/editTrack.png\" style=\"height: 20px;margin: 5px 5px 5px 5px;\"> </a>");
                            var oDiv = document.getElementById('cancel-apply');
                            oDiv.click();
                        })
                    }
                }, error: function () {
                    swal("修改失败！", "服务器异常", "error");
                }
            })
        })

});

$("button#edit_f_hours").click(function (){
    swal(
        {
            title: "您确认修改完成工时吗？",
            text: "确认请点击确认",
            type: "",
            showCancelButton: true,
            confirmButtonColor: "#18a689",
            confirmButtonText: "确认",
            cancelButtonText: "取消",
            closeOnConfirm: false
        }, function () {
            var hours = $("input#hours_f").val();
            $.ajax({
                url: "project-edit_f_hours",
                data: {
                    hours: hours,
                    id_catalog:id_catalog,
                    user_name:user_name
                },
                dataType: "json",
                type: "get",
                async: "false",
                success: function (result) {
                    var TrackList = JSON.parse(result.TrackList);
                    $('#TrackList').bootstrapTable('load',TrackList);
                    if (result.res === true) {
                        swal({
                            title: "修改成功",
                            type: "success",
                            confirmButtonColor: "#18a689",
                            confirmButtonText: "OK"
                        }, function () {
                            $("#th8").html(hours + "  <a id=\"th8_edit\" style=\"display:none\" data-toggle=\"modal\" data-target=\"#F_HOURS\"><img src=\"/img/editTrack.png\" style=\"height: 20px;margin: 5px 5px 5px 5px;\"> </a>");
                            var oDiv = document.getElementById('cancel-apply8');
                            oDiv.click();
                        })
                    }
                }, error: function () {
                    swal("修改失败！", "服务器异常", "error");
                }
            })
        })

});

$("button#edit_s_hours").click(function (){
    swal(
        {
            title: "您确认修改剩余工时吗？",
            text: "确认请点击确认",
            type: "",
            showCancelButton: true,
            confirmButtonColor: "#18a689",
            confirmButtonText: "确认",
            cancelButtonText: "取消",
            closeOnConfirm: false
        }, function () {
            var hours = $("input#hours_s").val();
            $.ajax({
                url: "project-edit_s_hours",
                data: {
                    hours: hours,
                    id_catalog:id_catalog,
                    user_name:user_name
                },
                dataType: "json",
                type: "get",
                async: "false",
                success: function (result) {
                    var TrackList = JSON.parse(result.TrackList);
                    $('#TrackList').bootstrapTable('load',TrackList);
                    if (result.res === true) {
                        swal({
                            title: "修改成功",
                            type: "success",
                            confirmButtonColor: "#18a689",
                            confirmButtonText: "OK"
                        }, function () {
                            $("#th9").html(hours + "  <a id=\"th9_edit\" style=\"display:none\" data-toggle=\"modal\" data-target=\"#S_HOURS\"><img src=\"/img/editTrack.png\" style=\"height: 20px;margin: 5px 5px 5px 5px;\"> </a>");
                            var oDiv = document.getElementById('cancel-apply9');
                            oDiv.click();
                        })
                    }
                }, error: function () {
                    swal("修改失败！", "服务器异常", "error");
                }
            })
        })

});

$("button#edit_b_hours").click(function (){
    swal(
        {
            title: "您确认修改超出工时吗？",
            text: "确认请点击确认",
            type: "",
            showCancelButton: true,
            confirmButtonColor: "#18a689",
            confirmButtonText: "确认",
            cancelButtonText: "取消",
            closeOnConfirm: false
        }, function () {
            var hours = $("input#hours_b").val();
            $.ajax({
                url: "project-edit_b_hours",
                data: {
                    hours: hours,
                    id_catalog:id_catalog,
                    user_name:user_name
                },
                dataType: "json",
                type: "get",
                async: "false",
                success: function (result) {
                    var TrackList = JSON.parse(result.TrackList);
                    $('#TrackList').bootstrapTable('load',TrackList);
                    if (result.res === true) {
                        swal({
                            title: "修改成功",
                            type: "success",
                            confirmButtonColor: "#18a689",
                            confirmButtonText: "OK"
                        }, function () {
                            $("#th10").html(hours + "  <a id=\"th10_edit\" style=\"display:none\" data-toggle=\"modal\" data-target=\"#B_HOURS\"><img src=\"/img/editTrack.png\" style=\"height: 20px;margin: 5px 5px 5px 5px;\"> </a>");
                            var oDiv = document.getElementById('cancel-apply10');
                            oDiv.click();
                        })
                    }
                }, error: function () {
                    swal("修改失败！", "服务器异常", "error");
                }
            })
        })

});

$('#TrackList').bootstrapTable({
        columns: [
            {
                field: 'DATE',
                title: '变更时间',
                sortable: true,
                align: 'center'
            },
            {
                field: 'USER_NAME',
                title: '变更人',
                sortable: true,
                align: 'center'
            },{
                field: 'WHERE1',
                title: '变更字段',
                align: 'center'
            },{
                field: 'BEFORE1',
                title: '变更前',
                align: 'center'

            },{
                field: 'AFTER1',
                title: '变更后',
                align: 'center'
            }
        ]
    }
);

// TASK
var num_t = 1;
var page_t = 1;
var max_t = 1;
$("#index_t").text(page_t);

function previous_t() {
    page_t--;
    if (page_t<=0){
        page_t = 1;
    }
    discussReload_t(page_t-1);
    $("#index_t").text(page_t);
}
function next() {
    page_t++;
    if (page_t >= max_t){
        page_t = max_t;
    }
    discussReload_t(page_t-1);
    $("#index_t").text(page_t);
}



//评论加载
function discussReload_t(page2) {
    $.ajax({
        url: "discuss-getProjectDis",
        data: {
            id_Project: id_Project,
            id_user: id_User,
            page : page2
        },
        dataType: "json",
        type: "Post",
        async: "false",
        success: function (result) {
            max_t = result.disPage;
            num = result.disNum;

            $("#pages_t").text(max_t);
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

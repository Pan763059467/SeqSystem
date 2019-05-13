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
    var iter = $("select#chooseIter").val();
    var iter_name = $("select#chooseIter").find("option:selected").text();
    if(iter === "" || iter === null || iter === "请选择") {
        swal("分配失败！", "请选择迭代", "error");
    }
    else {
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
                alert(iter);
                $.ajax({
                    url: "project-edit_iter",
                    data: {
                        id_iter: iter,
                        id_catalog: id_catalog,
                        user_name: user_name
                    },
                    dataType: "json",
                    type: "get",
                    async: "false",
                    success: function (result) {
                        if(result.res === false){
                            swal("迭代未改变！", "请选择不同迭代", "error");
                        }
                        else{
                            var TrackList = JSON.parse(result.TrackList);
                            $('#TrackList').bootstrapTable('load', TrackList);
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
                        }
                    }, error: function () {
                        swal("修改失败！", "服务器异常", "error");
                    }
                })
            })
    }
});

$("button#edit_per").click(function (){
    var person_name = $("select#choosePer").find("option:selected").text();
    if(person_name === "" || person_name === null || person_name === "请选择") {
        swal("修改失败！", "请选择责任人", "error");
    }
    else {
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
                $.ajax({
                    url: "project-edit_per",
                    data: {
                        person_name: person_name,
                        id_catalog: id_catalog,
                        user_name: user_name
                    },
                    dataType: "json",
                    type: "get",
                    async: "false",
                    success: function (result) {
                        if (result.res === false){
                            swal("责任人未改变！", "请选择不同责任人", "error");
                        } else{
                            var TrackList = JSON.parse(result.TrackList);
                            $('#TrackList').bootstrapTable('load', TrackList);
                            if (result.res === true) {
                                swal({
                                    title: "修改成功",
                                    type: "success",
                                    confirmButtonColor: "#18a689",
                                    confirmButtonText: "OK"
                                }, function () {
                                    $("#th3").html(person_name+ "  <a id=\"th3_edit\" style=\"display:none\" data-toggle=\"modal\" data-target=\"#Person\"><img src=\"/img/editTrack.png\" style=\"height: 20px;margin: 5px 5px 5px 5px;\"> </a>");
                                    var oDiv = document.getElementById('cancel-apply3');
                                    oDiv.click();
                                })
                            }
                        }

                    }, error: function () {
                        swal("修改失败！", "服务器异常", "error");
                    }
                })
            })
    }
});

$("button#edit_pri").click(function (){
    var pri_after = $("select#choosePri").find("option:selected").text();
    var pri_before = $("span#priority2").text();
    if(pri_after === "" || pri_after === null || pri_after === "请选择") {
        swal("修改失败！", "请选择优先级", "error");
    }
    else if(pri_after === pri_before) {
        swal("优先级未改变！", "请选择不同优先级", "error");
    }
    else {
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

                $.ajax({
                    url: "project-edit_pri",
                    data: {
                        pri_after: pri_after,
                        id_catalog: id_catalog,
                        user_name: user_name
                    },
                    dataType: "json",
                    type: "get",
                    async: "false",
                    success: function (result) {
                        var TrackList = JSON.parse(result.TrackList);
                        $('#TrackList').bootstrapTable('load', TrackList);
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
    }
});

$("button#edit_stage").click(function (){
    var stage = $("select#stage_choose").get(0).options.selectedIndex;
    stage = stage - 1;
    if(stage === "" || stage === null || stage === -1) {
        swal("修改失败！", "请选择当前阶段", "error");
    }
    else {
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
                $.ajax({
                    url: "project-edit_stage",
                    data: {
                        Stage: stage,
                        id_catalog: id_catalog,
                        user_name: user_name
                    },
                    dataType: "json",
                    type: "get",
                    async: "false",
                    success: function (result) {
                        if (result.res === false){
                            swal("阶段未改变！", "请选择不同阶段", "error");
                        } else{
                            var TrackList = JSON.parse(result.TrackList);
                            $('#TrackList').bootstrapTable('load', TrackList);
                            if (result.res === true) {
                                swal({
                                    title: "修改成功",
                                    type: "success",
                                    confirmButtonColor: "#18a689",
                                    confirmButtonText: "OK"
                                }, function () {
                                    if (stage == 0) {
                                        $("#th4").html("未开始" + "  <a id=\"th4_edit\" style=\"display:none\" data-toggle=\"modal\" data-target=\"#Stage\"><img src=\"/img/editTrack.png\" style=\"height: 20px;margin: 5px 5px 5px 5px;\"> </a>");
                                    } else if (stage == 1) {
                                        $("#th4").html("开发中" + "  <a id=\"th4_edit\" style=\"display:none\" data-toggle=\"modal\" data-target=\"#Stage\"><img src=\"/img/editTrack.png\" style=\"height: 20px;margin: 5px 5px 5px 5px;\"> </a>");
                                    } else if (stage == 2) {
                                        $("#th4").html("测试中" + "  <a id=\"th4_edit\" style=\"display:none\" data-toggle=\"modal\" data-target=\"#Stage\"><img src=\"/img/editTrack.png\" style=\"height: 20px;margin: 5px 5px 5px 5px;\"> </a>");
                                    } else if (stage == 3) {
                                        $("#th4").html("bug修复中" + "  <a id=\"th4_edit\" style=\"display:none\" data-toggle=\"modal\" data-target=\"#Stage\"><img src=\"/img/editTrack.png\" style=\"height: 20px;margin: 5px 5px 5px 5px;\"> </a>");
                                    } else if (stage == 4) {
                                        $("#th4").html("已完成" + "  <a id=\"th4_edit\" style=\"display:none\" data-toggle=\"modal\" data-target=\"#Stage\"><img src=\"/img/editTrack.png\" style=\"height: 20px;margin: 5px 5px 5px 5px;\"> </a>");
                                    }
                                    var oDiv = document.getElementById('cancel-apply4');
                                    oDiv.click();
                                })
                            }
                        }
                    }, error: function () {
                        swal("修改失败！", "服务器异常", "error");
                    }
                })
            })
    }
});

$("button#edit_time").click(function (){
    var start = $("li#start").text();
    var end = $("li#end").text();
    if(start === "" || start === null) {
        swal("修改失败！", "请选择开始时间", "error");
    }
    else if(end === "" || end === null) {
        swal("修改失败！", "请选择截止时间", "error");
    }
    else {
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
                $.ajax({
                    url: "project-edit_time",
                    data: {
                        start: start,
                        end: end,
                        id_catalog: id_catalog,
                        user_name: user_name
                    },
                    dataType: "json",
                    type: "get",
                    async: "false",
                    success: function (result) {
                        var TrackList = JSON.parse(result.TrackList);
                        $('#TrackList').bootstrapTable('load', TrackList);
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
    }
});

$("button#edit_w_hours").click(function (){
    var hours = $("input#hours_w").val();
    if(hours === "" || hours === null) {
        swal("修改失败！", "请输入预估工时", "error");
    }
    else {
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
                var hours_f = $("span#th8_tmp").text();
                if (hours_f === "") {
                    hours_f = 0;
                }
                var hours_s = 0;
                var hours_b = 0;
                if (parseInt(hours_f) > parseInt(hours)) {
                    hours_b = hours_f - hours;
                } else {
                    hours_s = hours - hours_f;
                }
                $.ajax({
                    url: "project-edit_w_hours",
                    data: {
                        hours: $("input#hours_w").val(),
                        id_catalog: id_catalog,
                        user_name: user_name
                    },
                    dataType: "json",
                    type: "get",
                    async: "false",
                    success: function (result) {
                        var TrackList = JSON.parse(result.TrackList);
                        $('#TrackList').bootstrapTable('load', TrackList);
                        if (result.res === true) {
                            swal({
                                title: "修改成功",
                                type: "success",
                                confirmButtonColor: "#18a689",
                                confirmButtonText: "OK"
                            }, function () {
                                $("#th7").html("<span id=\"th7_tmp\">" + hours + " </span>" + "  <a id=\"th7_edit\" style=\"display:none\" data-toggle=\"modal\" data-target=\"#W_HOURS\"><img src=\"/img/editTrack.png\" style=\"height: 20px;margin: 5px 5px 5px 5px;\"> </a>");
                                var oDiv = document.getElementById('cancel-apply');
                                oDiv.click();
                                $("#th9").html(hours_s);
                                $("#th10").html(hours_b);
                            })
                        }
                    }, error: function () {
                        swal("修改失败！", "服务器异常", "error");
                    }
                })
            })
    }
});

$("button#edit_f_hours").click(function (){
    var hours = $("input#hours_f").val();
    if(hours === "" || hours === null) {
        swal("修改失败！", "请输入完成工时", "error");
    }
    else {
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
                var hours_w = $("span#th7_tmp").text();
                if (hours_w === "") {
                    hours_w = 0;
                }
                var hours_s = 0;
                var hours_b = 0;
                if (parseInt(hours_w) > parseInt(hours)) {
                    hours_s = hours_w - hours;
                } else {
                    hours_b = hours - hours_w;
                }
                $.ajax({
                    url: "project-edit_f_hours",
                    data: {
                        hours: hours,
                        id_catalog: id_catalog,
                        user_name: user_name
                    },
                    dataType: "json",
                    type: "get",
                    async: "false",
                    success: function (result) {
                        var TrackList = JSON.parse(result.TrackList);
                        $('#TrackList').bootstrapTable('load', TrackList);
                        if (result.res === true) {
                            swal({
                                title: "修改成功",
                                type: "success",
                                confirmButtonColor: "#18a689",
                                confirmButtonText: "OK"
                            }, function () {
                                $("#th8").html("<span id=\"th8_tmp\">"+hours +" </span>" +  "  <a id=\"th8_edit\" style=\"display:none\" data-toggle=\"modal\" data-target=\"#F_HOURS\"><img src=\"/img/editTrack.png\" style=\"height: 20px;margin: 5px 5px 5px 5px;\"> </a>");
                                var oDiv = document.getElementById('cancel-apply8');
                                oDiv.click();
                                $("#th9").html(hours_s);
                                $("#th10").html(hours_b);
                            })
                        }
                    }, error: function () {
                        swal("修改失败！", "服务器异常", "error");
                    }
                })
            })
    }
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

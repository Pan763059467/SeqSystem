function IterChange(){
    var element = $("#chooseIter").val();
    if(element == "全部功能点"){
        $.ajax(
            {
                url:"project-getFunctionList",
                data: {
                    version: version3,
                    id_Project: id_Project
                },
                dataType:"json",
                type: "Get",
                async: "false",
                success:function(json){
                    var FunctionList = JSON.parse(json.FunctionList);
                    $('#FunctionList').bootstrapTable('load',FunctionList);
                },
                error:function(){
                    alert(" 错误");
                }
            }
        )
    }
    else{
        $.ajax(
            {
                url:"project-displayIteration",
                data: {
                    iter_name: element,
                    id_Project: id_Project
                },
                dataType:"json",
                type: "Get",
                async: "false",
                success:function(json){
                    var FunctionList = JSON.parse(json.FunctionList);
                    $('#FunctionList').bootstrapTable('load',FunctionList);
                },
                error:function(){
                    alert(" 错误");
                }
            }
        )
    }

}

$("button#choose").click(function () {
    var version4 = $("select#version").val();
    $.ajax({
        url: "project-showVersion",
        data: {
            id_Project: id_Project,
            version: version4
        },
        dataType: "json",
        type: "Post",
        async: "false",
        success: function (result) {
            var FunctionList = JSON.parse(result.FunctionList);
            $('#FunctionList').bootstrapTable('load',FunctionList);
            var listIter = result.iter_list;
            var content = "";
            for (var i=0;i<listIter.length;i++){
                content += "<option>" + listIter[i].ITER_NAME+"</option>\n";
            }
            $('#chooseIter').html(" <option name=\"all\">全部功能点</option>\n" + content);
            $('#now').html("当前需求版本：" + version4);
            $('#cancel_choose').click();
            var version_temp = result.version_temp;
            if (version3 != version_temp){
                newIteration2.style.display = 'none';
            }
            if(version3 == version_temp){
                newIteration2.style.display = 'block';
            }
        },

        error: function (result) {
            showtoast("error", "错误", "服务器异常!")
        }
    })
});

$("button#button_newIter").click(function () {
    swal(
        {
            title: "您确定要创建新迭代吗",
            text: "请谨慎操作！",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "确定",
            cancelButtonText: "取消",
            closeOnConfirm: true
        },function () {
            var iter_name = $("input#IterationName").val();
            $.ajax({
                url: "project-newIteration",
                data: {
                    Id_Project: id_Project,
                    iter_name: iter_name,
                    version: version2
                },
                dataType: "json",
                type: "Post",
                async: "false",
                success: function (result) {
                    if (result.res===true) {
                        showtoast("success", "创建成功", "以成功创建该迭代");
                        window.location.reload()
                    }
                    else showtoast("error", "创建失败", "服务器异常");
                },
                error: function (result) {
                    showtoast("error", "创建失败", "服务器异常!")
                }
            })
        }
    );
});



$('#FunctionList').bootstrapTable({
        columns: [
            {
                field: 'title',
                title: '功能点名称',
                sortable: true,
                align: 'center'
            },
            {
                field: 'Stage',
                title: '当前阶段',
                sortable: true,
                align: 'center',
                formatter: "rename"
            },{
                field: 'PERSON',
                title: '责任人',
                align: 'center',
                formatter: "rename2"
            },{
                field: 'ITER_NAME',
                title: '迭代',
                align: 'center',
                formatter: "rename3"
            },{
                field: 'operate',
                title: '操作',
                align: 'center',
                events: "actionEvents2",
                formatter: "operateFormatter2"
            }
        ]
    }
);
function operateFormatter2(value,row,index) {
    return '<a class="mod fa fa-folder btn btn-custom"> 查看</a>'
}
function rename(value,row,index) {
    if (row.Stage===0) {
        return '未开始';
    }
    else if (row.Stage===1){
        return '开发中';
    }
    else if (row.Stage===2){
        return '测试中';
    }
    else if (row.Stage===3){
        return 'bug修复中';
    }
    else if (row.Stage===4){
        return '已完成';
    }
}
function rename2(value,row,index) {
    if (row.PERSON===undefined) {
        return '未分配';
    }
    else {
        return row.PERSON;
    }
}
function rename3(value,row,index) {
    if (row.ITER_NAME===undefined) {
        return '未分配';
    }
    else {
        return row.ITER_NAME;
    }
}
window.actionEvents2 = {
    'click .mod':
        function(e, value, row, index) {
            //修改操作
            var catalog = parseInt(row.id_catalog);
            $.ajax({
                type: "GET",
                url: "project-getFunctionInfo",
                data: {catalog:catalog},
                dataType: "json",
                success: function (result) {
                    location.href = "project-jmpFunctionInfo";
                },
                error: function () {
                    swal({
                        icon: "error"
                    });
                }
            })
        }
}
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
                $('#priority').text(priority);
                $('#priority2').text(priority);
                $('#describe').text(tem.describe);
                document.getElementById("funRoleList").innerHTML = funRoleList;
                document.getElementById("funUsableList").innerHTML = funUsableList;
                $('#input').text(tem.input);
                $('#output').text(tem.output);
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

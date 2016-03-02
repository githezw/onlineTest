/**
 * Created by hezw on 2016/3/2.
 */

/*登录时角色选择功能函数*/
$(document).ready(function() {
    roleSelect();
});

/*登录时角色选择功能函数*/
function roleSelect(){
    var role = $("#role");
    $("#roleSelect").children().click(function(){
        if($(this).text()=="教师")
        {
            role.val("teacher");
        }else{
            role.val("student");
        }
    });
}


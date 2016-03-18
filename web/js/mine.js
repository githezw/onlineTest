/**
 * Created by hezw on 2016/3/2.
 */

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

//返回顶部函数
function pageScroll()
{
    //把内容滚动指定的像素数（第一个参数是向右滚动的像素数，第二个参数是向下滚动的像素数）
    window.scrollBy(0,-100);
    //延时递归调用，模拟滚动向上效果
    scrolldelay = setTimeout('pageScroll()',30);
    //获取scrollTop值，声明了DTD的标准网页取document.documentElement.scrollTop，否则取document.body.scrollTop；因为二者只有一个会生效，另一个就恒为0，所以取和值可以得到网页的真正的scrollTop值
    var sTop=document.documentElement.scrollTop+document.body.scrollTop;
    //判断当页面到达顶部，取消延时代码（否则页面滚动到顶部会无法再向下正常浏览页面）
    if(sTop==0) clearTimeout(scrolldelay);
}

//修改公告页面实现点击可重复编辑,并且更新到数据库中
function modifyNoticeFun() {
    var clickNode = $(this);
    var textTemp = clickNode.text();
    clickNode.html("");
    var inputNode = $("<input>");
    inputNode.attr("class", "form-control");
    inputNode.val(textTemp);
    clickNode.append(inputNode);
    clickNode.find("input").focus();
    inputNode.blur(function () {
        var textNew = $(this).val();
        clickNode.html(textNew);
        clickNode.click(modifyNoticeFun);
        var id = clickNode.parent().find("input").val();
        /*var notice = ;
        var author = ;
        var pubtime = ;*/
        $.ajax({
            type:"post",
            contentType:"application/json",
            data:{},
            url:"/onlineTest/updateNotice.action"
        });
        alert(clickNode.parent().find("input").val());
    });
    clickNode.unbind("click");
}
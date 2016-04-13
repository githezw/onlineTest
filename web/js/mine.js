/**
 * Created by hezw on 2016/3/2.
 */

/*登录时角色选择功能函数*/
function roleSelect() {
    var role = $("#role");
    $("#roleSelect").children().click(function () {
        if ($(this).text() == "教师") {
            role.val("teacher");
        } else {
            role.val("student");
        }
    });
}

//返回顶部函数
function pageScroll() {
    //把内容滚动指定的像素数（第一个参数是向右滚动的像素数，第二个参数是向下滚动的像素数）
    window.scrollBy(0, -100);
    //延时递归调用，模拟滚动向上效果
    scrolldelay = setTimeout('pageScroll()', 30);
    //获取scrollTop值，声明了DTD的标准网页取document.documentElement.scrollTop，否则取document.body.scrollTop；因为二者只有一个会生效，另一个就恒为0，所以取和值可以得到网页的真正的scrollTop值
    var sTop = document.documentElement.scrollTop + document.body.scrollTop;
    //判断当页面到达顶部，取消延时代码（否则页面滚动到顶部会无法再向下正常浏览页面）
    if (sTop == 0) clearTimeout(scrolldelay);
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
        if (textTemp != textNew) {
            var id = clickNode.parent().find("input").val();
            var notice = clickNode.parent().find("div[name='noticeInput']").text();
            var pubtime = clickNode.parent().find("div[name='pubtimeInput']").text();
            var author = (clickNode.parent().find("div[name='authorInput']").text()).substr(3);
            $.ajax({
                type: "post",
                contentType: "application/json",
                data: JSON.stringify({'id': id, 'notice': notice, 'author': author, 'pubtime': pubtime}),
                url: "/onlineTest/updateNotice.action",
                success: function (result) {
                    if (result == "success") {
                        $('#resultModel').modal('show');
                        $("div.modal-body").html("修改成功");
                        $("#model-button").click(function () {
                            $('#resultModel').modal('hide')
                        });
                    }
                    else {
                        $('#resultModel').modal('show');
                        $("div.modal-body").html("修改失败");
                        $("#model-button").click(function () {
                            $('#resultModel').modal('hide')
                        });
                    }
                }
            });
        }
    });
    clickNode.unbind("click");
}

//考题实现点击可重复编辑,并且更新到数据库中
function modifyPaperFun() {
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
        if (textTemp != textNew) {
            var id = clickNode.parent().find("input").val();
            var title = clickNode.parent().find("div[name='title']").text();
            var opt1 = clickNode.parent().find("div[name='opt1']").text();
            var opt2 = clickNode.parent().find("div[name='opt2']").text();
            var opt3 = clickNode.parent().find("div[name='opt3']").text();
            var opt4 = clickNode.parent().find("div[name='opt4']").text();
            var tablename = $("#examSelectedId").val()+"_"+$("#examSelected").val()+"_"+$("#subject").val() ;
            $.ajax({
                type: "post",
                contentType: "application/json",
                data: JSON.stringify({
                    'id': id,
                    'title': title,
                    'opt1': opt1,
                    'opt2': opt2,
                    'opt3': opt3,
                    'opt4': opt4,
                    'tablename': tablename
                }),
                url: "/onlineTest/updateExamPaperItem.action",
                success: function (result) {
                    if (result == "success") {
                        $('#resultModel').modal('show');
                        $("div.modal-body").html("修改成功");
                        $("#model-button").click(function () {
                            $('#resultModel').modal('hide')
                        });
                    }
                    else {
                        $('#resultModel').modal('show');
                        $("div.modal-body").html("修改失败");
                        $("#model-button").click(function () {
                            $('#resultModel').modal('hide')
                        });
                    }
                }
            });
        }
    });
    clickNode.unbind("click");
}
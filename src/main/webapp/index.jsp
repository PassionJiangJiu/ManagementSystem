<%--
  Created by IntelliJ IDEA.
  User: 10259
  Date: 2019/9/6
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>员工列表</title>
    <% pageContext.setAttribute("APP_PATH",request.getContextPath());%>
    <!--    引入jquery-->
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
    <!--    引入样式-->
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<!--搭建显示页面-->
<div class="container">
    <!--        标题-->
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <!--    按钮-->
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <!--    显示表格数据-->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="staffs_table">
                <thead>
                <tr>
                    <th>#</th>
                    <th>职工ID</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>岗位</th>
                    <th>职称</th>
                    <th>学历</th>
                    <th>生日</th>
                    <th>籍贯</th>
                    <th>家庭地址</th>
                    <th>身份证号码</th>
                    <th>电话</th>
                    <th>专业</th>
                    <th>入职时间</th>
                    <th>工资</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
    <!--    显示分页信息-->
    <div class="row">
        <!-- 分页文字信息 -->
        <div class="col-md-6" id="page_info_area">
        </div>
        <!-- 分页条信息 -->
        <div class="col-md-6" id="page_nav_area">

        </div>
    </div>

</div>
<script type="text/javascript">
    //页面加载完成以后，直接发送一个Ajax请求，要到分页数据
    $(function () {
        $.ajax({
            url:"${APP_PATH}/staffs",
            data:"pn=1",
            type:"GET",
            success:function (result) {
                // console.log(result);
                // 1.解析并显示员工数据  
                build_staffs_table(result);

                // 2。解析并显示分页信息
                build_page_info(result);
                // 3.解析显示分页条数据
                build_page_nav(result);


            }
        })
    })
    function build_staffs_table(result) {
        var staffs = result.extend.PageInfo.list;
        $.each(staffs,function (index,item) {
            var idTd = $("<td></td>").append(item.id);
            var staffIdTd = $("<td></td>").append(item.staffid);
            var staffNameTd = $("<td></td>").append(item.staffname);
            var sexsTd = $("<td></td>").append(item.sexs.sexname);
            var jobsTd = $("<td></td>").append(item.jobs.jobname);
            var gradesTd = $("<td></td>").append(item.grades.gradename);
            var eduBackgroundsTd = $("<td></td>").append(item.eduBackgrounds.edubackgroundname);
            var birthdayTd = $("<td></td>").append(item.birthday);
            var nativeplaceTd = $("<td></td>").append(item.nativeplace);
            var familyaddressTd = $("<td></td>").append(item.familyaddress);
            var idcardTd = $("<td></td>").append(item.idcard);
            var telTd = $("<td></td>").append(item.tel);
            var majorTd = $("<td></td>").append(item.major);
            var employeddateTd = $("<td></td>").append(item.employeddate);
            var salaryTd = $("<td></td>").append(item.salary);
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm")
                            .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm")
                            .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            // append方法执行完成后返回原来的元素
            $("<tr></tr>").append(idTd)
                .append(staffIdTd)
                .append(staffNameTd)
                .append(sexsTd)
                .append(jobsTd)
                .append(gradesTd)
                .append(eduBackgroundsTd)
                .append(birthdayTd)
                .append(nativeplaceTd)
                .append(familyaddressTd)
                .append(idcardTd)
                .append(telTd)
                .append(majorTd)
                .append(employeddateTd)
                .append(salaryTd)
                .append(btnTd)
                .appendTo("#staffs_table tbody");
        })
        
    }
    // 解析显示分页信息
        function build_page_info(result) {
            $("#page_info_area").append("当前"+result.extend.PageInfo.pageNum+"页,总"
                                                +result.extend.PageInfo.pages+"页,总"
                                                +result.extend.PageInfo.total+"条记录");
    }
    // 解析显示分页条
    function build_page_nav(result) {
        // page_nav_area
        var ul = $("<ul></ul>").addClass("pagination");
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo"));
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        // 添加首页和前一页的提示
        ul.append(firstPageLi).append(prePageLi);
        $.each(result.extend.pageInfo.navigatepageNums,function (index,item) {
            //1.2.3遍历给ul添加页码的提示
             var numLi =  $("<li></li>").append($("<a></a>").append(item));
             ul.append(numLi);
        })
        // 添加下一页和末页的提示
        ul.append(nextPageLi).append(lastPageLi);
        // 把ul加入到nav元素
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }
</script>
</body>
</html>

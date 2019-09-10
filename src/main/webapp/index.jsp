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

<!-- 员工添加模态框 -->
<div class="modal fade" id="staffAddModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">员工添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">员工ID</label>
                        <div class="col-sm-10">
                            <input type="text"  name="staffid" class="form-control" id="staffid_add_input" placeholder="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">员工姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="staffname" class="form-control" id="staffname_add_input" placeholder="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="sexid" id="sex1_add_input" value="1" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="sexid" id="sex2_add_input" value="2"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">岗位</label>
                        <div class="col-sm-4">
<%--                            岗位提交岗位id即可--%>
                            <select class="form-control" name="jobid" id="job_add_select">

                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">职称</label>
                        <div class="col-sm-4">
                            <%--                            岗位提交岗位id即可--%>
                            <select class="form-control" name="gradeid" id="grade_add_select">

                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">学历</label>
                        <div class="col-sm-4">
                            <%--                            岗位提交岗位id即可--%>
                                <select class="form-control" name="edubackgroundid" id="edubackground_add_select">

                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">生日</label>
                        <div class="col-sm-10">
                            <input type="text" name="birthday" class="form-control" id="birthday_add_input" placeholder="XXXX.XX.XX">
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">籍贯</label>
                        <div class="col-sm-10">
                            <input type="text" name="nativeplace" class="form-control" id="nativeplace_add_input" placeholder="XX省XX市">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">地址</label>
                        <div class="col-sm-10">
                            <input type="text" name="familyaddress" class="form-control" id="familyaddressaddress_add_input" placeholder="XX省XX市XX区XX小区">
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">身份证</label>
                        <div class="col-sm-10">
                            <input type="text" name="idcard" class="form-control" id="idcard_add_input" placeholder="">
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">电话</label>
                        <div class="col-sm-10">
                            <input type="text" name="tel" class="form-control" id="tel_add_input" placeholder="">
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">专业</label>
                        <div class="col-sm-10">
                            <input type="text" name="major" class="form-control" id="major_add_input" placeholder="">
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">入职时间</label>
                        <div class="col-sm-10">
                            <input type="text" name="employeddate" class="form-control" id="employeddate" placeholder="XXXX.XX.XX">
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">薪水(元)</label>
                        <div class="col-sm-10">
                            <input type="text" name="salary" class="form-control" id="salary_add_input" placeholder="">
                        </div>
                    </div>



                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="staff_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>


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
            <button class="btn btn-primary" id="staff_add_model_btn">新增</button>
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
    var totalRecord;
    //页面加载完成以后，直接发送一个Ajax请求，要到分页数据
    $(function () {
        //去首页
        to_page(1);
    });
    function to_page(pn) {
        $.ajax({
            url:"${APP_PATH}/staffs",
            data:"pn="+pn,
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
    }
    function build_staffs_table(result) {
        // 清空表格
        $("#staffs_table tbody").empty();
        var staffs = result.extend.PageInfo.list;
        $.each(staffs,function (index,item) {
            var idTd = $("<td></td>").append(item.id);
            var staffIdTd = $("<td></td>").append(item.staffid);
            var staffNameTd = $("<td></td>").append(item.staffname);
            var sexsTd = $("<td></td>").append(item.sexs.sexname);
            var jobsTd = $("<td></td>").append(item.jobs.jobname);
            var gradesTd = $("<td></td>").append(item.grades.gradename);
            var eduBackgroundsTd = $("<td></td>").append(item.eduBackgrounds.eduBackgroundname);
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
            $("#page_info_area").empty();
            $("#page_info_area").append("当前"+result.extend.PageInfo.pageNum+"页,总"
                                                +result.extend.PageInfo.pages+"页,总"
                                                +result.extend.PageInfo.total+"条记录");
            totalRecord = result.extend.PageInfo.total+1;
    }
    // 解析显示分页条
    function build_page_nav(result) {
        // page_nav_area
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");
        // 构建元素
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo"));
        if (result.extend.PageInfo.hasPreviousPage == false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }
        else {
            // 添加翻页点击事件
            firstPageLi.click(function () {
                to_page(1);
            });
            prePageLi.click(function () {
                to_page(result.extend.PageInfo.pageNum -1);
            });
        }
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        if (result.extend.PageInfo.NextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }
        else {
            // 添加翻页点击事件
            lastPageLi.click(function () {
                to_page(result.extend.PageInfo.pages);
            });
            nextPageLi.click(function () {
                to_page(result.extend.PageInfo.pageNum +1);
            });
        }

        // 添加首页和前一页的提示
        ul.append(firstPageLi).append(prePageLi);
        $.each(result.extend.PageInfo.navigatepageNums,function (index,item) {
            //1.2.3遍历给ul添加页码的提示
             var numLi =  $("<li></li>").append($("<a></a>").append(item));
             if (result.extend.PageInfo.pageNum == item){
                 numLi.addClass("active");
             }
             numLi.click(function () {
                 to_page(item);
             })

             ul.append(numLi);
        })
        // 添加下一页和末页的提示
        ul.append(nextPageLi).append(lastPageLi);
        // 把ul加入到nav元素
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }
    //点击新增按钮弹出模态框
    $("#staff_add_model_btn").click(function () {
        //发送ajax请求，显示出部门信息，显示再下拉列表中
        getJobs();
        getGrades();
        getEduBackground();
        //弹出模态框
        $("#staffAddModel").modal({
            backdrop:"static"
        });
    });
    //查出岗位信息并显示在下拉列表中
    function getJobs() {
        $.ajax({
            url:"${APP_PATH}/jobs",
            type:"GET",
            success:function (result) {
                // console.log(result);
                $("#job_add_select");
                $.each(result.extend.jobs,function () {
                    var optionEle = $("<option></option>").append(this.jobname).attr("value",this.jobid);
                    optionEle.appendTo("#job_add_select");
                })
            }

        })
    }
    //查出职称信息并显示在下拉列表中
    function getGrades() {
        $.ajax({
            url:"${APP_PATH}/grades",
            type:"GET",
            success:function (result) {
                // console.log(result);
                $("#grade_add_select");
                $.each(result.extend.grades, function () {
                    var optionEle = $("<option></option>").append(this.gradename).attr("value",this.gradeid);
                    optionEle.appendTo("#grade_add_select");
                })
            }

        })
    }
    //查出学历信息并显示在下拉列表中
    function getEduBackground() {
        $.ajax({
            url:"${APP_PATH}/eduBackgrounds",
            type:"GET",
            success:function (result) {
                console.log(result);
                $("#edubackground_add_select");
                $.each(result.extend.eduBackgrounds,function () {
                    var optionEle = $("<option></option>").append(this.edubackgroundname).attr("value",this.edubackgroundid);
                    optionEle.appendTo("#edubackground_add_select");
                })
            }

        })
    }

    //校验表单数据
    function validate_add_form(){
        //1.拿到要校验的数据，使用正则表达式
        var staffid = $("#staffid_add_input").val();
        var regid = /^[0-9]{10}$/;
        if(!regid.test(staffid)){
            alert("用户id为10位数字");
            return false;
        }

        var staffname = $("#staffname_add_input").val();
        var regname = /^([a-zA-Z0-9_-]{1,20}$)|(^[\u2E80-\u9FFF]{2,5)/;


        if(!regname.test(staffname)){
            alert("格式不正确");
            return false;
        }



        return false;
    }

    //点击保存，保存员工
    $("#staff_save_btn").click(function() {
        //1.模态框中填写的表单数据提交给服务器进行保存
        //先对要提交给服务器的数据进行校验
        if(!validate_add_form()){
            return false;
        };

        //2.发送ajax请求保存员工
        $.ajax({
            url:"${APP_PATH}/staff",
            type:"POST",
            data:$("#staffAddModel form").serialize(),
            success:function (result) {
                // alert(result.msg);
                // 1.关闭模态框
                $("#staffAddModel").modal('hide')
                // 来到最后一页显示刚才保存的数据
                // 发送ajax请求显示最后一页
                to_page(totalRecord);
            }
        });
        // alert($("#staffAddModel form").serialize());

    });
</script>
</body>
</html>

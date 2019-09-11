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



<!-- 员工修改模态框 -->
<div class="modal fade" id="staffUpdateModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >员工修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">员工ID</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="staffid_update_static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">员工姓名</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="staffname_update_static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="sexid" id="sex1_update_input" value="1" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="sexid" id="sex2_update_input" value="2"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">岗位</label>
                        <div class="col-sm-4">
                            <%--                            岗位提交岗位id即可--%>
                            <select class="form-control" name="jobid" id="job_update_select">

                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">职称</label>
                        <div class="col-sm-4">
                            <%--                            岗位提交岗位id即可--%>
                            <select class="form-control" name="gradeid" id="grade_update_select">

                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">学历</label>
                        <div class="col-sm-4">
                            <%--                            岗位提交岗位id即可--%>
                            <select class="form-control" name="edubackgroundid" id="edubackground_update_select">

                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">生日</label>
                        <div class="col-sm-10">
                            <input type="text" name="birthday" class="form-control" id="birthday_update_input" placeholder="XXXX.XX.XX">
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">籍贯</label>
                        <div class="col-sm-10">
                            <input type="text" name="nativeplace" class="form-control" id="nativeplace_update_input" placeholder="XX省XX市">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">地址</label>
                        <div class="col-sm-10">
                            <input type="text" name="familyaddress" class="form-control" id="familyaddress_update_input" placeholder="XX省XX市XX区XX小区">
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">身份证</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="idcard_update_static"></p>
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">电话</label>
                        <div class="col-sm-10">
                            <input type="text" name="tel" class="form-control" id="tel_update_input" placeholder="">
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">专业</label>
                        <div class="col-sm-10">
                            <input type="text" name="major" class="form-control" id="major_update_input" placeholder="">
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">入职时间</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="employeddate_update_static"></p>
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">薪水(元)</label>
                        <div class="col-sm-10">
                            <input type="text" name="salary" class="form-control" id="salary_update_input" placeholder="">
                        </div>
                    </div>



                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="staff_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>

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
                            <input type="text" name="familyaddress" class="form-control" id="familyaddress_add_input" placeholder="XX省XX市XX区XX小区">
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
        <div class="col-md-12"> b 
            <h1>高校管理系统</h1>
        </div>
    </div>
    <!--    按钮-->
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="staff_add_model_btn">新增</button>
<%--            <button class="btn btn-danger" id="staff_delete_all_btn">删除</button>--%>
        </div>
    </div>
    <!--    显示表格数据-->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="staffs_table">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="check_all"/>
                    </th>
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
    var totalRecord, currentPage;
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
            var checkBoxTd = $("<td><input type = 'checkbox' class = 'check_item'/></td>");
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

            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                            .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            //为编辑按钮添加一个自定义的属性，来表示当前员工的id
            editBtn.attr("edit-id",item.staffid);

            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                            .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            //为删除按钮添加一个自定义的属性来表示当前删除的员工ID
            delBtn.attr("del-id",item.staffid);

            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            // append方法执行完成后返回原来的元素
            $("<tr></tr>").append(checkBoxTd)
                .append(idTd)
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
            currentPage = result.extend.PageInfo.pageNum;
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
        getJobs("#job_add_select");
        getGrades("#grade_add_select");
        getEduBackground("#edubackground_add_select");
        //弹出模态框
        $("#staffAddModel").modal({
            backdrop:"static"
        });
    });
    //查出岗位信息并显示在下拉列表中
    function getJobs(ele) {
        //清空下拉列表的值
        $(ele).empty();
        $.ajax({
            url:"${APP_PATH}/jobs",
            type:"GET",
            success:function (result) {
                // console.log(result);
                $("#job_add_select");
                $.each(result.extend.jobs,function () {
                    var optionEle = $("<option></option>").append(this.jobname).attr("value",this.jobid);
                    optionEle.appendTo(ele);
                })
            }

        })
    }
    //查出职称信息并显示在下拉列表中
    function getGrades(ele) {
        //清空下拉列表的值
        $(ele).empty();
        $.ajax({
            url:"${APP_PATH}/grades",
            type:"GET",
            success:function (result) {
                // console.log(result);
                $("#grade_add_select");
                $.each(result.extend.grades, function () {
                    var optionEle = $("<option></option>").append(this.gradename).attr("value",this.gradeid);
                    optionEle.appendTo(ele);
                })
            }

        })
    }
    //查出学历信息并显示在下拉列表中
    function getEduBackground(ele) {
        //清空下拉列表的值
        $(ele).empty();
        $.ajax({
            url:"${APP_PATH}/eduBackgrounds",
            type:"GET",
            success:function (result) {
                console.log(result);
                $("#edubackground_add_select");
                $.each(result.extend.eduBackgrounds,function () {
                    var optionEle = $("<option></option>").append(this.edubackgroundname).attr("value",this.edubackgroundid);
                    optionEle.appendTo(ele);
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
        var regname = /^([a-zA-Z0-9_-]{1,20}$)|(^[\u2E80-\u9FFF]{2,5})/;


        if(!regname.test(staffname)){
            alert("员工姓名格式不正确或重复");
            return false;
        }

        var idcard = $("#idcard_add_input").val();
        var regidcard = /^[A-Z0-9]{18}$/;


        if(!regidcard.test(idcard)){
            alert("身份证位数不正确或重复");
            return false;
        }


        var tel = $("#tel_add_input").val();
        var regtel = /^[0-9]{11,15}$/;


        if(!regtel.test(tel)){
            alert("电话格式不正确");
            return false;
        }



        return true;
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
                $("#staffAddModel").modal('hide');
                // 来到最后一页显示刚才保存的数据
                // 发送ajax请求显示最后一页
                to_page(totalRecord);
            }
        });
        // alert($("#staffAddModel form").serialize());
    });

    //单个删除
    $(document).on("click",".delete_btn",function () {
        //1.弹出确认删除对话框
        var staffName = $(this).parents("tr").find("td:eq(3)").text();
        var staffId = $(this).attr("del-id");

        if(confirm("确认删除【"+staffName+"】吗？")){
            //确认，发送ajax请求删除即可
            $.ajax({
                url:"${APP_PATH}/staff/"+staffId,
                type:"DELETE",
                success:function (result) {
                    // alert(result.msg);
                    to_page(currentPage);
                }
            });
        }
    });



    //修改功能
    $(document).on("click",".edit_btn",function () {
        // alert("edit");
        // 查出下拉框信息
        getJobs("#job_update_select");
        getGrades("#grade_update_select");
        getEduBackground("#edubackground_update_select");

        //查出员工信息，显示
        getStaff($(this).attr("edit-id"));

        //把员工的staffid传递给模态框的更新按钮
        $("#staff_update_btn").attr("edit-id",$(this).attr("edit-id"));

        $("#staffUpdateModel").modal({
            backdrop:"static"

    });
    });
    
    function getStaff(staffid) {
        $.ajax({
            url:"${APP_PATH}/staff/"+staffid,
            type:"GET",
            success:function (result) {
                console.log(result);
                //使修改表单初始数据是原始数据
                var staffData = result.extend.staff;
                //静态表单 员工id 员工姓名 身份证 入职时间
                $("#staffid_update_static").text(staffData.staffid);
                $("#staffname_update_static").text(staffData.staffname);
                $("#idcard_update_static").text(staffData.idcard);
                $("#employeddate_update_static").text(staffData.employeddate);
                //性别
                $("#staffUpdateModel input[name = sexid]").val([staffData.sexid]);
                //下拉表单 岗位 职称 学历
                $("#staffUpdateModel select[name = jobid]").val([staffData.jobid]);
                $("#staffUpdateModel select[name = gradeid]").val([staffData.gradeid]);
                $("#staffUpdateModel select[name = edubackgroundid]").val([staffData.edubackgroundid]);
                //可修改文本表单 生日 籍贯 地址 电话 专业 薪水
                $("#birthday_update_input").val(staffData.birthday);
                $("#nativeplace_update_input").val(staffData.nativeplace);
                $("#familyaddress_update_input").val(staffData.familyaddress);
                $("#tel_update_input").val(staffData.tel);
                $("#major_update_input").val(staffData.major);
                $("#salary_update_input").val(staffData.salary);

            }
        });
    }

    //点击更新按钮，更新员工信息
    $("#staff_update_btn").click(function () {
        //1.验证合法性
        var tel = $("#tel_update_input").val();
        var regtel = /^[0-9]{11,15}$/;

        if(!regtel.test(tel)){
            alert("电话格式不正确");
            return false;
        }

        //2.发送ajax请求保存更新的员工数据
        $.ajax({
            url:"${APP_PATH}/staff/"+$(this).attr("edit-id"),
            type:"PUT",
            data:$("#staffUpdateModel form").serialize(),
            success:function (result) {
                // alert(result.msg);
                //1.关闭对话框
                $("#staffUpdateModel").modal("hide");
                //2.回到本界面
                to_page(currentPage);
            }
        });
    });
    //完成全选/全不选功能
    $("#check_all").click(function () {
        //attr获取checked时是undefined
        //prop获取原生值，attr获取自定义值
        //prop修改和读取dom原生属性的值
        // alert($(this).prop("checked"));
        $(".check_item").prop("checked",$(this).prop("checked"));
    });

    //check_item
    $(document).on("click",".check_item",function () {
        //判断当前选中的元素值是否为5个
        var flag = $(".check_item:checked").length==$(".check_item").length;
        $("#check_all").prop("checked",flag);
    });

</script>
</body>
</html>

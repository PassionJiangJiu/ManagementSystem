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
            <table class="table table-hover">
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
                <c:forEach items="${pageInfo.list}" var="staffs">
                <tr>
                    <th>${staffs.id}</th>
                    <th>${staffs.staffid}</th>
                    <th>${staffs.staffname}</th>
                    <th>${staffs.sexs.sexname}</th>
                    <th>${staffs.jobs.jobname}</th>
                    <th>${staffs.grades.gradename}</th>
                    <th>${staffs.eduBackgrounds.edubackgroundname}</th>
                    <th>${staffs.birthday}</th>
                    <th>${staffs.nativeplace}</th>
                    <th>${staffs.familyaddress}</th>
                    <th>${staffs.idcard}</th>
                    <th>${staffs.tel}</th>
                    <th>${staffs.major}</th>
                    <th>${staffs.employeddate}</th>
                    <th>${staffs.salary}</th>
                    <th>
                        <button type="button" class="btn btn-primary btn-sm">
                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>编辑</button>
                        <button type="button" class="btn btn-danger btn-sm">
								<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除</button>
                    </th>
                </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <!--    显示分页信息-->
    <div class="row">
        <!-- 分页文字信息 -->
        <div class="col-md-6">
            当前${pageInfo.pageNum}页，总${pageInfo.pages}   页，总${pageInfo.total}条记录
        </div>
        <!-- 分页条信息 -->
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="${APP_PATH}/staffs?pn=1">首页</a></li>
                    <c:if test="${pageInfo.hasPreviousPage}"></c:if>
                    <li>
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <c:forEach items="${PageInfo.navigatepageNums}" var="pageNums">
                        <c:if test="${pageNums == pageInfo.pageNum}"></c:if>
                            <li class="active"><a href="#">${pageNums}</a></li>
                        <c:if test="${pageNums != pageInfo.pageNum}">
                            <li><a href="${APP_PATH}/staffs?pn=${pageNums}">${pageNums}</a></li>
                        </c:if >
                    </c:forEach>
                    <c:if  test="!${pageInfo.isLastPage}"></c:if>
                    <li>
                        <a href="${APP_PATH}/staffs?pn=${pageInfo.pageNum+1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                    <li><a href="${APP_PATH}/staffs?pn=${pageInfo.pages}">末页</a></li>
                </ul>
            </nav>
        </div>
    </div>

</div>
</body>
</html>

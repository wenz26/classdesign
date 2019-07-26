<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/pages/common/common.jspf" %>
<html>
<head>
    <title>308陈文振课程设计 -首页</title>

    <link href="../css/bootstrap-treeview.min.css" rel="stylesheet">
    <link href="../css/bootstrap-table.min.css" rel="stylesheet">
    <script src="../js/bootstrap-table.min.js"></script>
    <script src="../js/bootstrap-treeview.min.js"></script>
    <script src="../js/bootstrap-table-locale-all.min.js"></script>
    <script type="text/javascript" src="../js/user.js"></script>
</head>
<body style="background-color: #FFF">
    <button type="button" class="btn btn-default" id="refresh" >刷新</button>

    <div>
        <form action="/getAllStudentCourse" method="post">
            学生姓名<input type="text" name="nameToCourse" id="nameToCourse"
                       size="8" value="${sourcename }">
            &nbsp;&nbsp;
            <input type="submit" value="查询课程信息" >
        </form>
    </div><br>

    <div class="bootstrap-table">
        <div class="fixed-table-toolbar">
            <div class="bs-bars pull-left"></div>
        </div>

        <div class="fixed-table-container" style="height: 426px; padding-bottom: 40px;">
            <div class="fixed-table-header" style="margin-right: 0px;">
                <table class="table table-hover table-striped" >
                    <thead>
                    <tr>
                        <th class="bs-checkbox " style="width: 36px; " data-field="0" tabindex="0">
                            <div class="th-inner ">
                                <input name="btSelectAll" type="checkbox">
                            </div>
                            <div class="fht-cell"></div>
                        </th>
                        <th style="" data-field="id" tabindex="0">
                            <div class="th-inner ">学生编号</div>
                            <div class="fht-cell"></div>
                        </th>
                        <th style="" data-field="name" tabindex="0">
                            <div class="th-inner ">学生姓名</div>
                            <div class="fht-cell"></div>
                        </th>
                        <th style="" data-field="majornum" tabindex="0">
                            <div class="th-inner ">选课</div>
                            <div class="fht-cell"></div>
                        </th>
                        <th style="" data-field="phone" tabindex="0">
                            <div class="th-inner ">任课老师</div>
                            <div class="fht-cell"></div>
                        </th>
                        <th style="" data-field="age" tabindex="0">
                            <div class="th-inner ">分数</div>
                            <div class="fht-cell"></div>
                        </th>
                        <th style="" data-field="operate" tabindex="0">
                            <div class="th-inner ">操作</div>
                            <div class="fht-cell"></div>
                        </th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${pageInfo.list }" var="item">
                        <c:forEach items="${item.students}" var="stu">
                            <tr data-index="0">
                                <td class="bs-checkbox ">
                                    <input data-index="0" name="btSelectItem" type="checkbox">
                                </td>
                                <td style="">${stu.id }</td>
                                <td style="">${stu.name }</td>
                                <td style="">${item.coursename }</td>
                                <td style="">${item.teacher }</td>
                                <td style="">${stu.grade }</td>
                                <td style="">
                                    <button type="button" data-toggle="modal"
                                            onclick="getStudentCourse('${stu.id }', '${item.courseno }')"
                                            class="RoleOfA btn btn-default  btn-sm" data-target="#studentCourse"
                                            style="margin-right:15px;">修改
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="fixed-table-pagination">
                <div class="pull-left pagination-detail">
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <li>
                                <c:if test="${pageInfo.isFirstPage}">
                                    <span aria-hidden="true">&laquo;</span>
                                </c:if>
                                <c:if test="${!pageInfo.isFirstPage}">
                                    <a href="${basePath }/getAllStudentCourse?currentPage=${pageInfo.pageNum-1}"
                                       aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </c:if>
                            </li>

                            <c:forEach items="${pageInfo.navigatepageNums }" var="navNum">
                                <li
                                        <c:if test="${navNum eq pageInfo.pageNum }">class="active"</c:if> >
                                    <a href="${basePath }/getAllStudentCourse?currentPage=${navNum}">${navNum}</a>
                                </li>
                            </c:forEach>


                            <li>
                                <c:if test="${pageInfo.isLastPage}">
                                    <span aria-hidden="true">&raquo;</span>
                                </c:if>

                                <c:if test="${!pageInfo.isLastPage}">
                                    <a href="${basePath }/getAllStudentCourse?currentPage=${pageInfo.pageNum+1}" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </c:if>
                            </li>
                        </ul>
                    </nav>
                </div>
                '
                <div class="pull-right pagination" style="display: none;">
                    <ul class="pagination">
                        <li class="page-pre">
                            <a href="javascript:void(0)">‹</a>
                        </li>
                        <li class="page-number active">
                            <a href="javascript:void(0)">1</a>
                        </li>
                        <li class="page-next">
                            <a href="javascript:void(0)">›</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <input type="hidden" id="id">
    <div class="modal fade" id="tips" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span><span class="sr-only">Close</span>
                    </button>
                    <h4 class="modal-title">提示</h4>
                </div>
                <div class="modal-body">
                    <p id="tip">操作成功!</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal" id="studentCourse" tabindex="-1" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span><span class="sr-only">Close</span>
                    </button>
                    <h2 class="modal-title">修改学生课程成绩信息</h2></div><br>
                <div class="modal-body">
                    <form id="courseStudent" class="form-horizontal">
                        <label for="name" class="col-sm-2 control-label">编号</label>
                        <input type="text" name="id" id="id"
                               readonly="readonly" class="form-control"/><br>

                        <label for="name" class="col-sm-2 control-label">姓名</label>
                        <input type="text" name="name" id="name"
                               readonly="readonly" class="form-control"/><br>

                        <label for="name" class="col-sm-2 control-label">课程编号</label>
                        <input type="text" name="courseno" id="courseno"
                               readonly="readonly" class="form-control"/><br>

                        <label for="name" class="col-sm-2 control-label">选课</label>
                        <input type="text" name="coursename" id="coursename"
                               readonly="readonly" class="form-control" /><br>

                        <label for="name" class="col-sm-2 control-label">任课老师</label>
                        <input type="text" name="teacher" id="teacher"
                               readonly="readonly" class="form-control" /><br>

                        <label for="name" class="col-sm-2 control-label">分数</label>
                        <input type="text" name="grade" id="grade"
                               class="form-control"/><br>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" data-dismiss="modal" class="btn btn-default">关闭</button>
                    <button type="button" onclick="updateStudentCourse()" class="btn btn-default"
                            data-dismiss="modal">保存修改</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ask" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span><span class="sr-only">Close</span>
                    </button>
                    <h4 class="modal-title">提示</h4>
                </div>
                <div class="modal-body">
                    <p id="tip">是否要删除?</p>
                </div>
                <div class="modal-footer">
                    <button id="enter" type="button" class="btn btn-default" data-dismiss="modal">确定</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>

</body>
</html>

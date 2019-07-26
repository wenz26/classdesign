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
    <button type="button" class="btn btn-default" id="addUser" data-toggle="modal"
            data-target="#studentCreate" onclick="clearStudent()">增加</button>
    <div>
        <form action="/main" method="post">
            学生姓名<input type="text" name="name" size="8" value="${name }">&nbsp;&nbsp;
            学生专业<select name="majornum">
            <option value="">--请选择--</option>
            <c:forEach items="${majors }" var="item">
                <option value="${item.majornum }"
                        <c:if test="${item.majornum == majornum }">selected</c:if>>
                        ${item.major }</option>
            </c:forEach>
        </select>&nbsp;&nbsp;
            <input type="submit" value="查询">
        </form>
    </div>

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
                            <div class="th-inner ">学生专业</div>
                            <div class="fht-cell"></div>
                        </th>
                        <th style="" data-field="phone" tabindex="0">
                            <div class="th-inner ">电话</div>
                            <div class="fht-cell"></div>
                        </th>
                        <th style="" data-field="age" tabindex="0">
                            <div class="th-inner ">年龄</div>
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
                        <tr data-index="0">
                            <td class="bs-checkbox ">
                                <input data-index="0" name="btSelectItem" type="checkbox">
                            </td>
                            <td style="">${item.id }</td>
                            <td style="">${item.name }</td>
                            <td style="">${item.major.major }</td>
                            <td style="">${item.phone }</td>
                            <td style="">${item.age }</td>
                            <td style="">
                                <button type="button" data-toggle="modal" onclick="getStudentInfo('${item.id}')"
                                        class="RoleOfA btn btn-default  btn-sm" data-target="#studentUpdate"
                                        style="margin-right:15px;">修改
                                </button>
                                <button type="button" data-toggle="modal" onclick="deteleStudent('${item.id}')"
                                        class="RoleOfC btn btn-default  btn-sm"
                                        style="margin-right:15px;">删除
                                </button>
                            </td>
                        </tr>
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
                                    <a href="${basePath }/main?currentPage=${pageInfo.pageNum-1}"
                                       aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </c:if>
                            </li>

                            <c:forEach items="${pageInfo.navigatepageNums }" var="navNum">
                                <li
                                        <c:if test="${navNum eq pageInfo.pageNum }">class="active"</c:if> >
                                    <a href="${basePath }/main?currentPage=${navNum}">${navNum}</a>
                                </li>
                            </c:forEach>


                            <li>
                                <c:if test="${pageInfo.isLastPage}">
                                    <span aria-hidden="true">&raquo;</span>
                                </c:if>

                                <c:if test="${!pageInfo.isLastPage}">
                                    <a href="${basePath }/main?currentPage=${pageInfo.pageNum+1}" aria-label="Next">
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

    <div class="modal " id="studentUpdate" tabindex="-1" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span><span class="sr-only">Close</span>
                    </button>
                    <h2 class="modal-title">修改学生信息</h2></div><br>
                <div class="modal-body">
                    <form id="updateStudent" class="form-horizontal">
                        <label for="name" class="col-sm-2 control-label">编号</label>
                        <input type="text" name="id" id="id"
                               readonly="readonly" class="form-control"/><br>
                        <label for="name" class="col-sm-2 control-label">姓名</label>
                        <input type="text" name="name" id="name" class="form-control"/>
                        <br>
                        <label for="name" class="col-sm-2 control-label">专业</label>
                        <select name="majornum" id="majornum" class="form-control">
                        <option value="">--请选择--</option>
                        <c:forEach items="${majors }" var="item">
                            <option value="${item.majornum }"
                                    <c:if test="${item.majornum == majornum }">selected</c:if>>
                                    ${item.major }</option>
                        </c:forEach>
                        </select><br>
                        <label for="name" class="col-sm-2 control-label">电话</label>
                        <input type="text" name="phone" id="phone" class="form-control"/>
                        <br>
                        <label for="name" class="col-sm-2 control-label">年龄</label>
                        <input type="text" name="age" id="age" class="form-control"/>
                        <br>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" data-dismiss="modal" class="btn btn-default">关闭</button>
                    <button type="button" onclick="updateStudent()" class="btn btn-default"
                            data-dismiss="modal">保存修改</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal" id="studentCreate" tabindex="-1" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span><span class="sr-only">Close</span>
                    </button>
                    <h2 class="modal-title">新建学生信息</h2></div><br>
                <div class="modal-body">
                    <form id="createStudent" class="form-horizontal">
                        <label for="name" class="col-sm-2 control-label">编号</label>
                        <input type="text" name="id" id="id"
                               placeholder="学生编号" class="form-control"/><br>
                        <label for="name" class="col-sm-2 control-label">姓名</label>
                        <input type="text" name="name" id="name" class="form-control" placeholder="姓名"/>
                        <br>
                        <label for="name" class="col-sm-2 control-label">专业</label>
                        <select name="majornum" id="majornum" class="form-control">
                            <option value="">--请选择--</option>
                            <c:forEach items="${majors }" var="item">
                                <option value="${item.majornum }"
                                        <c:if test="${item.majornum == majornum }">selected</c:if>>
                                        ${item.major }</option>
                            </c:forEach>
                        </select><br>
                        <label for="name" class="col-sm-2 control-label">电话</label>
                        <input type="text" name="phone" id="phone" class="form-control" placeholder="电话"/>
                        <br>
                        <label for="name" class="col-sm-2 control-label">年龄</label>
                        <input type="text" name="age" id="age" class="form-control" placeholder="年龄"/>
                        <br>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" data-dismiss="modal" class="btn btn-default">关闭</button>
                    <button type="button" onclick="createStudent()" data-dismiss="modal"
                            class="btn btn-default">创建学生</button>
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

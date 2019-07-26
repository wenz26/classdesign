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
    <h2 class="modal-title">修改账号信息</h2><br />
    <div class="form-group">
        <label class="col-sm-2 control-label">账号</label>
        <div class="col-sm-10">
            <input type="text" name="id" class="form-control" value="${admin.id}">
        </div>
    </div>
    <br />
    <div class="form-group">
        <label class="col-sm-2 control-label">用户名</label>
        <div class="col-sm-10">
            <input type="text" name="name" class="form-control" value="${admin.name}">
        </div>
    </div>
    <br />
    <div class="form-group">
        <label class="col-sm-2 control-label">密码</label>
        <div class="col-sm-10">
            <input type="password" name="password" class="form-control" value="${admin.password}">
        </div>
    </div>
</body>
</html>

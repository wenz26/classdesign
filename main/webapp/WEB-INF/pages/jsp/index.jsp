<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/pages/common/common.jspf" %>
<html>
<head>
    <title>308陈文振课程设计 -首页</title>

    <script src="../js/sidebar-menu.js"></script>
    <script src="../js/bootstrap-tab.js"></script>
    <script src="../js/ace-extra.min.js"></script>
    <script src="../js/ace.min.js"></script>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
</head>

<body>

    <div class="navbar navbar-default" id="navbar">
        <div class="navbar-container" id="navbar-container">
            <div class="navbar-header pull-left">
                <a href="#" class="navbar-brand">
                    <small>
                        <i class="icon-leaf"></i>
                        陈文振学生信息管理系统
                    </small>
                </a>
            </div>

            <div class="navbar-header pull-right" role="navigation">
                <div style="background-color: #579ec8 !important; color: #fff;
                    height:45px; line-height:45px; margin-right: 50px;">
                    欢迎光临, ${admin.name}
                    <a href="logout" style="color: #fff;">
                        <i class="icon-off"></i>
                        退出
                    </a>
                </div>
            </div>

            <div class="navbar-header ace-settings-container"
                 id="ace-settings-container" style="float:right;top:15px;">
                <div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
                    <i class="icon-cog bigger-150"></i>
                </div>
                <div class="ace-settings-box" id="ace-settings-box">
                    <div>
                        <div class="pull-left">
                            <select id="skin-colorpicker" class="hide">
                                <option data-skin="default" value="#438EB9">#438EB9</option>
                                <option data-skin="skin-1" value="#222A2D">#222A2D</option>
                                <option data-skin="skin-2" value="#C6487E">#C6487E</option>
                                <option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
                            </select>
                        </div>
                        <span>&nbsp; 选择皮肤</span>
                    </div>
                    <div>
                        <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-navbar" />
                        <label class="lbl" for="ace-settings-navbar"> 固定导航条</label>
                    </div>
                    <div>
                        <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar" />
                        <label class="lbl" for="ace-settings-sidebar"> 固定滑动条</label>
                    </div>
                    <div>
                        <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-breadcrumbs" />
                        <label class="lbl" for="ace-settings-breadcrumbs">固定面包屑</label>
                    </div>

                    <div>
                        <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" />
                        <label class="lbl" for="ace-settings-rtl">切换到左边</label>
                    </div>

                    <div>
                        <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container" />
                        <label class="lbl" for="ace-settings-add-container">
                            切换窄屏
                            <b></b>
                        </label>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div class="main-container" id="main-container">
        <div class="main-container-inner">
            <a class="menu-toggler" id="menu-toggler" href="#">
                <span class="menu-text"></span>
            </a>
            <div class="sidebar" id="sidebar">
                <ul class="nav nav-list" id="menu">
                    <li class="open">
                        <a href="#" class="dropdown-toggle">
                            <i class="icon-cog"></i>
                            <span class="menu-text">系统管理</span>
                            <b class="arrow icon-angle-down"></b>
                        </a>
                        <ul class="submenu" style="display: block;">
                            <li>
                                <a href="javascript:addTabs({id:'11',title: '账号管理',close: true,
                                    url: '/getAdminInfo?id=111'});">
                                    <i class="icon-glass"></i>
                                    <span class="menu-text">账号管理</span>
                                </a>
                                <a href="javascript:addTabs({id:'11',title: '学生管理',close: true,
                                    url: '/main'});">
                                    <i class="icon-glass"></i>
                                    <span class="menu-text">学生管理</span>
                                </a>
                                <%--<a href="javascript:addTabs({id:'11',title: '权限列表',close: true,
                                    url: '/ShiroActiviti/organization/index'});">
                                    <i class="icon-glass"></i>
                                    <span class="menu-text">权限列表</span>
                                </a>--%>
                                <a href="javascript:addTabs({id:'11',title: '课表管理',close: true,
                                    url: '/getAllStudentCourse'});">
                                    <i class="icon-glass"></i>
                                    <span class="menu-text">课表管理</span>
                                </a>
                            </li>
                        </ul>
                    </li>

                </ul>
                <div class="sidebar-collapse" id="sidebar-collapse">
                    <i class="icon-double-angle-left" data-icon1="icon-double-angle-left"
                       data-icon2="icon-double-angle-right"></i>
                </div>
            </div>

            <div class="main-content">
                <div class="page-content">
                    <div class="row">
                        <div class="col-xs-12" style="padding-left:5px;">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="active"><a href="#Index" role="tab" data-toggle="tab">首页</a></li>
                            </ul>
                            <div class="tab-content" style="height:865px" >
                                <div role="tabpanel"  class="tab-pane active" id="Index" style="height:100%">
                                    <h2>欢迎回来</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
            <i class="icon-double-angle-up icon-only bigger-110"></i>
        </a>
    </div>
    <script type="text/javascript">
        /*$(function () {
             var data;
            $.ajax({
                url:"menu",
                type:"get",
                dataType:"json",
                async : false,
                success:function(re){
                    data=re;
                    console.log(re);
                }
            })
              $('#menu').sidebarMenu({
                 url:"menu"
             });
        })*/
    </script>
</body>

</html>

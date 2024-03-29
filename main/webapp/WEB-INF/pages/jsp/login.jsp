<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>308陈文振课程设计 -首页</title>

    <meta name="viewPort" content="width=device-width,initial-scale=1">

    <link href="../css/main.css" rel="stylesheet" />
    <script src="../js/jquery-1.11.0.min.js"></script>

</head>
<body>

    <div class="login-block">
        <div class="login-animate">
            <div class="left-ear"></div>
            <div class="right-ear"></div>
            <div class="head">
                <div class="left-eye"></div>
                <div class="right-eye"></div>
                <div class="face">
                    <div class="nose"></div>
                    <div class="mouth"></div>
                </div>
            </div>
            <div class="body"></div>
            <div class="left-arm"></div>
            <div class="right-arm"></div>
        </div>
        <div class="login-form">
            <div class="username">
                <input type="text" name="username">
            </div>
            <div class="password">
                <input type="password" name="password" width="240px" >
                <div class="pwd-eye" style="background-image: url('img/password-show.png');" data-flag="hide"></div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function(){
            $(".pwd-eye").hide();
            $(".pwd-eye").click(function(){
                var flag = $(this).attr('data-flag');
                $(this).css('background-image','url("img/password-'+flag+'.png")');
                $(this).attr('data-flag',flag=='show'?'hide':'show');
                $('input[name="password"]').attr('type',flag=='show'?'password':'text');
                if(flag!='show'&&$('input[name="password"]').val() != ''){
                    $('.left-arm').addClass('show');
                    $('.mouth').addClass('show');
                    $('.right-arm').addClass('show');
                }else{
                    $('.left-arm').removeClass('show');
                    $('.mouth').removeClass('show');
                    $('.right-arm').removeClass('show');
                }
            });
            $('input[name="username"]').focus(function(){
                $(".login-animate").addClass('username-animate');
                $(".login-animate").removeClass('password-animate');
                var length = $(this).val().length;
                getposition(length);
            });
            $('input[name="username"]').bind('input', function(){
                var length = $(this).val().length;
                getposition(length);
            });
            function getposition(length){
                var face = parseFloat(1.5/36*length);
                var nose = parseFloat(1/36*length);
                var left_eye = parseFloat(1.5/36*length);
                var right_eye = parseFloat(2/36*length);
                var left_ear = parseFloat(1/36*length);
                var right_ear = parseFloat(1/36*length);
                $('.face').css('left',1+(face>1.5?1.5:face)+'em');
                $('.nose').css('left',0.9+(nose>1?1:nose)+'em');
                $('.left-eye').css('left',0.5+(left_eye>1.5?1.5:left_eye)+'em');
                $('.right-eye').css('left',4+(right_eye>2?2:right_eye)+'em');
                $('.left-ear').css('left',1.5-(left_ear>1?1:left_ear)+'em');
                $('.right-ear').css('left',7.5-(right_ear>1?1:right_ear)+'em');
                if(length >= 6){
                    $('.left-eye').addClass('doe');
                    $('.right-eye').addClass('doe');
                    $('.mouth').addClass('doe');
                }else{
                    $('.left-eye').removeClass('doe');
                    $('.right-eye').removeClass('doe');
                    $('.mouth').removeClass('doe');
                }
            }
            $('input[name="username"]').blur(function(){
                $(".login-animate").removeClass('username-animate');
                $(".login-animate").removeClass('password-animate');
                $('.face').attr('style','');
                $('.nose').attr('style','');
                $('.left-eye').attr('style','');
                $('.right-eye').attr('style','');
                $('.left-ear').attr('style','');
                $('.right-ear').attr('style','');
            });
            $('input[name="password"]').focus(function(){
                $(".pwd-eye").show();
                $(".login-animate").removeClass('username-animate');
                $(".login-animate").addClass('password-animate');
            });
            $('input[name="password"]').blur(function(){
                if($(this).val() == '') {
                    $(".pwd-eye").hide();
                    $(".login-animate").removeClass('username-animate');
                    $(".login-animate").removeClass('password-animate');
                }
            });
        });
    </script>

</body>
</html>

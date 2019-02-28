<%@page contentType="text/html;charset=utf-8" language="java" %>
<div class="col-md-2">
    <img src="${user.image}" alt="" style="box-shadow: 3px 3px 3px #888888;">
</div>
<div class="col-md-10" style="background-color: #FFFFFF;">
    <div class="row section01">
        <div class="col-md-3" style="border-left: 0px;">
            <h4>账号</h4>
            <h5>${user.username}</h5>
        </div>
        <div class="col-md-2">
            <h4>账户</h4>
            <h5>0.00元</h5>
        </div>
        <div class="col-md-2">
            <h4>待收收益</h4>
            <h5>0.00元</h5>
        </div>
        <div class="col-md-2">
            <h4>待返本金</h4>
            <h5>0.00元</h5>
        </div>
        <div class="col-md-3" style="padding-top: 15px;">
            <a href="" class="btn btn-primary btn-lg">充值</a>
            <a href="" class="btn btn-warning btn-lg">兑现</a>
        </div>
    </div>
</div>
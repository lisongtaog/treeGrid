<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="shortcut icon" type="image/x-icon" href="/images/bird.ico"/>
    <link rel="stylesheet" href="/css/bootstrap.min.css"/>
    <title>登录</title>
</head>
<body>
<div class="container">
    <h2 style="color: red" align="center">${user}</h2>
    <form action="/Login" method="post"
          style="max-width: 300px; padding: 15px; margin: 0 auto;"
          class="form-group">
        <div class="form-group">
            <label class="control-label">账号：</label> <input class="form-control"
                                                            type="text" id="user" name="userName"/>
        </div>
        <div class="form-group">
            <label class="control-label">密码：</label> <input class="form-control"
                                                            type="password" id="pass" name="passWard"/>
        </div>
        <div class="form-group">
            <input class="btn btn-primary btn-block" type="submit" value="登录"/>
        </div>
    </form>
</div>
</body>
</html>
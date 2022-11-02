<%-- 
    Document   : login
    Created on : Nov 2, 2022, 11:09:44 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <form action="login" method="POST">
            Username: <input type="text" name="username"/> <br/>
            password: <input type="password" name="password" /> <br/>
            <input type="submit" value="Login" /> 
        </form>    
    </body>
</html>

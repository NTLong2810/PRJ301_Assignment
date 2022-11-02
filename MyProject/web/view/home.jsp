<%-- 
    Document   : home
    Created on : Nov 2, 2022, 11:08:47 AM
    Author     : DELL
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <c:if test="${sessionScope.account ne null}">
            Hello ${sessionScope.account.displayname},  click 
            <a href="logout">here</a> 
            to logout.<br/>
            <a href="lecturer/timetable?lid=1">TimeTable</a>
        </c:if>
        <c:if test="${sessionScope.account eq null}">
            you are not logged in yet!
        </c:if>
    </body>
</html>

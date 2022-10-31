<%-- 
    Document   : detail.jsp
    Created on : Oct 31, 2022, 8:33:30 PM
    Author     : DELL
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../css/DetailStyle.css"/>
    </head>
    <body>
        <p style="font-size: 20px; color:blue">Take Attendance Sucessfully For Session: ${requestScope.attlist[0].session.id}</p>
       <p style="font-size: 15px"> AT DATE: ${requestScope.attlist[0].session.date} </p>
            <table class="table">
                <tr>
                    <th>No</th>
                    <th>ID</th>
                    <th>Student name</th>
                    <th>Image</th>
                    <th>Status</th>
                    <th>Comment</th>
                    <th>Record Time</th>
                </tr>
                 <c:set var="total" value="0"/>
                 <c:set var="absent" value="0"/>
                <c:forEach items="${requestScope.attlist}" var="c" varStatus="loop">
                    <c:set var="total" value="${total+1}"/>
                    <tr>  
                        <td>${loop.index+1}</td>
                        <td>${c.student.id}</td>
                        <td>${c.student.name}</td>
                        <td><img src="../img/depositphotos_64486573-stock-photo-people.jpg" alt="alt" style="height:146px;width:111px;border-width:0px;"/></td>
                        <td><c:if test="${c.present}">
                                <p style="color: blue">Present</p>
                        </c:if>
                        <c:if test="${!c.present}">
                                <p style="color: red">Absent</p>
                                <c:set var="absent" value="${absent+1}"/>
                        </c:if>
                        </td>
                        <td>${c.description}</td>
                        <td>${c.record_time}</td>
                    </tr>
                </c:forEach>
               
            </table>
        <br/>
        <p style="font-size: 20px; color:green">Absent: ${absent}/${total} Student (${absent/total*100}% of Total)</p>
        <a style="font-size: 20px" href="takeatt?id=${requestScope.attlist[0].session.id}">Edit Take Attendance</a>
    </body>
</html>

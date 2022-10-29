<%-- 
    Document   : takeattend
    Created on : Oct 23, 2022, 10:48:01 AM
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
    </head>
    <body>
         Take attendance for Group: ${requestScope.ses.group.name} <br/>
        Subject: ${requestScope.ses.group.subject.name} <br/>
        Room: ${requestScope.ses.room.name} <br/>
        Date: ${requestScope.ses.date} - ${requestScope.ses.timeslot.description}<br/>
        Attended: <span style="color: red;"> ${requestScope.ses.attended?"Yes":"No"} </span>
        <form action="takeatt" method="POST">
            <input type="hidden" name="sesid" value="${param.id}"/>
            <table border="1px">
                <tr>
                    <td>No.</td>
                    <td>StudentID</td>
                    <td>Full Name</td>
                    <td>Present</td>
                    <td>Absent</td>
                    <td>Description</td>
                    <td>Record_time</td>
                </tr>
                 <c:forEach items="${requestScope.ses.attendances}" var="a" varStatus="loop">
                 <tr>
                    <td>${loop.index+1}</td>
                    <td>${a.student.id}
                    <input type="hidden" name="stdid" value="${a.student.id}"/>
                    </td>
                    <td>${a.student.name}</td>
                    <td><input type="radio"
                               <c:if test="${a.present}">
                               checked="checked"
                               </c:if>
                               name="present${a.student.id}" value="present" /></td>
                    <td><input type="radio"
                               <c:if test="${!a.present}">
                               checked="checked"
                               </c:if>
                               name="present${a.student.id}" value="absent" /></td>
                    <td><input type="text" name="description${a.student.id}" value="${a.description}" /></td>
                    <td>${a.record_time}</td>
                </tr>   
                    
                </c:forEach>
                
                
            </table>
            <input type="submit" value="Save"/>
        </form>
    </body>
</html>

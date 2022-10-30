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
        <link rel="stylesheet" href="../css/TakeAttendStyle.css"/>
        <script>
            function takeattend() {
            alert('Take Attend Sucessfully');
            }
        </script>
    </head>
    <body>
        <a>Take attendance for Group: ${requestScope.ses.group.name} <br/></a>
        Subject: ${requestScope.ses.group.subject.name} <br/>
        Room: ${requestScope.ses.room.name} <br/>
        Date: ${requestScope.ses.date}<br/>
        TimeSlot: ${requestScope.ses.timeslot.description}<br/>
        <b> Attended:</b> <span style="color: red; font-weight: bold"> ${requestScope.ses.attended?"Yes":"No"} </span>
        <form action="takeatt" method="POST">
            <input type="hidden" name="sesid" value="${param.id}"/>
            <table border="1px">
                <thead>
                <tr>
                    <th>No.</th>
                    <th>StudentID</th>
                    <th>Full Name</th>
                    <th>Present</th>
                    <th>Absent</th>
                    <th>Description</th>
                    <th>Record_time</th>
                </tr>
                </thead>
                <tbody>
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
                
                </tbody>
            </table>
            <input type="submit" value="Save" onclick="takeattend();"/>              
        </form>
          <a style="font-size: 20px" href="timetable?lid=${requestScope.ses.lecturer.id}">Back</a>
    </body>
</html>

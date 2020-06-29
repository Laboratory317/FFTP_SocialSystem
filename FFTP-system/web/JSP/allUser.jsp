
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <table>
            <th>firstName</th>
            <th>lastName</th>
            <c:forEach items="${requestScope.list}" var="user">
            <tr>
                <td></td>
                <td></td>  
            </tr>
            </c:forEach>
        </table>
    </body>
</html>

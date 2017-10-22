<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Books Page</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <style type="text/css">
        .btn {
            padding: 2px 2px;
            width: 5em;
            height: 2em;
            background-color: #4d3a1e;
            color: #f1f1f1;
            border-radius: 0;
            transition: .2s;
        }

        .btn:hover, .btn:focus {
            border: 1px solid #4d3a1e;
            background-color: #fff;
            color: #000;
        }

        a.aEdit:link, a.aDelete:link , a.bookTitle:link {
            color: #a83016;
        }

        a.aEdit:visited, a.aDelete:visited {
            color: #947872;
        }

        a.bookTitle:visited {
            color: #a83016;
        }

        a.aEdit:hover, a.aDelete:hover, a.bookTitle:hover {
            color: #60a870;
            text-decoration: none;
        }

        a.aEdit:active, a.aDelete:active, a.bookTitle:active {
            color: #ded728;
        }

        a.aCreateUser:link {
            color: #d1cbbc;
        }

        a.aCreateUser:visited {
            color: #c4bba5;
        }

        a.aCreateUser:hover {
            color: #a0cc95;
            text-decoration: none;
        }

        .panel-footer a{
            font-size: 1.2em;
        }
        .panel-footer a:link {
            color: #d1cbbc;
        }

        .panel-footer a:visited {
            color: #c4bba5;
            text-decoration: none;
        }

        .panel-footer a:hover {
            color: #a0cc95;
            text-decoration: none;
        }

        .panel-footer a:active {
            color: #ded728;
            text-decoration: none;
        }

        .searchPane {
            margin: 0;
        }
        .searchLine {
            padding: 10px;
            background-color: #786455;
        }

        .panel-title {
            line-height: 25px;
        }

        .table {
            margin-top: 20px;
        }

    </style>
</head>
<body>

<h2 style="text-align: center;"><a href="/" class="aEdit">Book List</a></h2>

<div class="panel-body">
    <c:url var="searchAction" value="/searchtitle"/>

        <div class="row searchLine">
            <form:form action="${searchAction}" cssClass="searchPane" commandName="book">
                <div class="col-md-2" style="color: #d1cbbc; font-size: 18px;">Search book by title:</div>
                <div class="col-md-4"><input type="text" name="searchTitle" id="searchTitle" placeholder="Title type here..">
                    <input class="btn btn-xs" type='submit' value='Search'/>
                </div>
            </form:form>
            <div class="col-md-2"></div>
            <div class="col-md-2"></div>
            <div class="col-md-2">
                <h3 class="panel-title ">
                    <div align="right">
                        <a class="aCreateUser" href="addbook">Add new book</a>
                    </div>
                </h3>
            </div>
        </div>

    <c:if test="${empty listBooks}">
        <h4 style="text-align: center; color: #333;">There are no Books</h4>
    </c:if>
    <c:if test="${not empty listBooks}">
        <table class="table table-hover table-bordered">
            <thead style="background-color: #b39b89;">
            <tr>
                <th width="80">Id</th>
                <th width="120">Title</th>
                <th width="300">Description</th>
                <th width="200">Author</th>
                <th width="80">ISBN</th>
                <th width="80">PrintYear</th>
                <th width="80">ReadAlready</th>
                <th width="80">Edit</th>
                <th width="80">Delete</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listBooks}" var="book">
                <tr>
                    <th width="80">${book.id}</th>
                    <th width="120"><a href="/bookdata/${book.id}" class="bookTitle">${book.title}</a></th>
                    <th width="300">${book.description}</th>
                    <th width="200">${book.author}</th>
                    <th width="80">${book.isbn}</th>
                    <th width="80">${book.printYear}</th>
                    <th width="80">${book.readAlready}</th>
                    <th width="80"><a class="aEdit" href="<c:url value='/addbook/edit/${book.id}'/>">Edit</a></th>
                    <th width="80"><a class="aDelete" href="<c:url value='/remove/${book.id}'/>">Delete</a></th>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
    <div align="center" class="row panel-footer" style="background-color:#786455; color: white;" id="pagination">
        <c:url value="/" var="prev">
            <c:param name="page" value="${page-1}"/>
        </c:url>
        <c:if test="${page > 1}">
            <a href="<c:out value="${prev}" />" class="pn prev">Prev</a>
        </c:if>

        <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
            <c:choose>
                <c:when test="${page == i.index}">
                    <span>${i.index}</span>
                </c:when>
                <c:otherwise>
                    <c:url value="/" var="url">
                        <c:param name="page" value="${i.index}"/>
                    </c:url>
                    <a href='<c:out value="${url}" />'>${i.index}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:url value="/" var="next">
            <c:param name="page" value="${page + 1}"/>
        </c:url>
        <c:if test="${page + 1 <= maxPages}">
            <a href='<c:out value="${next}" />' class="pn next">Next</a>
        </c:if>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
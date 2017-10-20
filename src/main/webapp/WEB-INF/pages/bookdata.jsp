<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

<html>
<head>
    <title>Book Data</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <style type="text/css">
        .myrow-container {
            margin: 20px;
        }

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

        a.aEdit:link, a.aDelete:link {
            color: #a83016;
        }

        a.aEdit:visited, a.aDelete:visited {
            color: #947872;
        }

        a.aEdit:hover, a.aDelete:hover {
            color: #60a870;
        }

        a.aEdit:active, a.aDelete:active {
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
        }

        .panel-footer a{
            font-size: 1.2em;
        }
        .panel-footer a:link {
            color: #d1cbbc;
        }

        .panel-footer a:visited {
            color: #c4bba5;
        }

        .panel-footer a:hover {
            color: #a0cc95;
        }

        .panel-footer a:active {
            color: #ded728;
        }

        .buttonSave, .buttonAdd {

        }

        .buttonSave:hover, .buttonAdd:hover {
            background: white;
            color: #c76d2d;
            text-decoration: none;
        }

        .back {
            color: #d1cbbc;
            display: table;
            margin: 0 auto;
            border: 1px solid #c76d2d;
            background: #786455;
            padding: 2px 20px;
            text-decoration: none;
        }

    </style>

</head>
<body>

<%--<br/>--%>
<%--<br/>--%>

<%--<a href="/" class="back">Back to books</a>--%>

<%--<br/>--%>
<%--<br/>--%>

<%--<h2 style="text-align: center">Book Details</h2>--%>
<div class="panel-heading" style="background-color:#786455">
    <h3 class="panel-title" style="color: #d1cbbc">
        Book Details
    </h3>
</div>

<div class="panel-body">
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
        </tr>
        </thead>
        <tbody>
            <tr>
                <th width="80">${book.id}</th>
                <th width="120">${book.title}</th>
                <th width="300">${book.description}</th>
                <th width="200">${book.author}</th>
                <th width="80">${book.isbn}</th>
                <th width="80">${book.printYear}</th>
                <th width="80">${book.readAlready}</th>
            </tr>
        </tbody>
    </table>
    <div class="form-group">
        <div class="row">
            <div class="col-xs-4">
            </div>
            <div class="col-xs-1">
            </div>
            <div class="col-xs-2">
                <a href="/" class="buttonSave back">Back</a>
            </div>
            <div class="col-xs-1">
            </div>
            <div class="col-xs-4">
            </div>
        </div>
    </div>
</div>
</body>
</html>
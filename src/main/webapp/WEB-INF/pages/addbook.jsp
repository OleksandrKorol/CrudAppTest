<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User Information</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <style type="text/css">
        .myrow-container {
            margin: 50px auto 0 auto;
        }
        .panel-title{
            color: #d1cbbc;
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

        .buttonSave, .buttonAdd {
            color: #d1cbbc;
            display: block;
            margin: 0 auto;
            border: 1px solid #c76d2d;
            background: #786455;
            float: right;
            padding: 2px 20px;
        }

        .buttonSave:hover, .buttonAdd:hover {
            background: white;
            color: #c76d2d;
            text-decoration: none;
        }

        .back {
            float: left;
            padding: 2px 20px;
        }
    </style>
</head>

<body class=".container-fluid" style="background-color:whitesmoke">
<div class="container myrow-container">
    <div class="panel panel-success">
        <div class="panel-heading" style="background-color:#786455">
            <h3 class="panel-title" style="color: #d1cbbc">
                Book Details
            </h3>
        </div>
        <div class="panel-body">
            <c:url var="addAction" value="/add"/>
            <form:form action="${addAction}" commandName="book" id="UserRegisterForm" cssClass="form-horizontal">
                <div class="form-group">
                    <div class="control-label col-xs-3">
                        <form:label path="title" >
                             <spring:message text="Title"/>
                         </form:label> </div>
                    <div class="col-xs-6">
                        <form:hidden path="id" value="${book.id}"/>
                        <form:input cssClass="form-control" path="title" value="${book.title}"/>
                    </div>
                </div>

                <c:if test="${empty book.author}">
                <div class="form-group">
                    <form:label path="author" cssClass="control-label col-xs-3">
                        <spring:message text="Author"/>
                    </form:label>
                    <div class="col-xs-6">
                        <form:input cssClass="form-control" path="author" value="${book.author}"/>
                    </div>
                </div>
                </c:if>

                <c:if test="${!empty book.author}">
                    <div class="form-group">
                        <form:label path="author" cssClass="control-label col-xs-3">
                            <spring:message text="Author"/>
                        </form:label>
                        <div class="col-xs-6">
                            <form:input cssClass="form-control"  id="disabledInput" path="author" value="${book.author}" readonly="true" disabled="true"/>
                            <form:hidden path="author"/>
                        </div>
                    </div>
                </c:if>

                <div class="form-group">
                    <form:label path="description" cssClass="control-label col-xs-3">
                        <spring:message text="Description"/>
                    </form:label>
                    <div class="col-xs-6">
                        <form:textarea rows="3" cssClass="form-control" path="description" value="${book.description}"/>

                    </div>
                </div>

                <div class="form-group">
                    <form:label path="isbn" cssClass="control-label col-xs-3">
                        <spring:message text="ISBN"/>
                    </form:label>
                    <div class="col-xs-6">
                        <form:input cssClass="form-control" path="isbn" value="${book.isbn}"/>
                    </div>
                </div>

                <div class="form-group">
                    <form:label path="printYear" cssClass="control-label col-xs-3">
                        <spring:message text="PrintYear"/>
                    </form:label>
                    <div class="col-xs-6">
                        <form:input cssClass="form-control" path="printYear" value="${book.printYear}"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="row">
                        <div class="col-xs-4">
                        </div>
                        <div class="col-xs-1">
                        </div>
                        <div class="col-xs-2">
                            <a href="/" class="buttonSave back">Back</a>
                            <c:if test="${!empty book.title}">
                                <input class="buttonSave" type="submit" value="<spring:message text="Save"/>"/>
                            </c:if>
                            <c:if test="${empty book.title}">
                                <input class="buttonAdd" type="submit" value="<spring:message text="Add"/>"/>
                            </c:if>
                        </div>
                        <div class="col-xs-1">
                        </div>
                        <div class="col-xs-4">
                        </div>
                    </div>
                </div>

            </form:form>
        </div>
    </div>
</div>

</body>
</html>

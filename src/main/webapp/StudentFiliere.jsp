<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="Header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Find All Students By Branch </title>
    <link rel="stylesheet" type="text/css" href="bootstrap/bootstrap.min.css" />
    <link rel="stylesheet" 	href="css/bootstrap.css">
</head>
<body>
<div class="container  col-md-12">
    <div class="row">
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Select Branch :</h4>
                    <form action="<%=request.getContextPath()%>/StudentFiliereWeb" method="post">
                        <div class="form-group">
                            <label for="filiere">Branch:</label>
                            <select class="form-control" name="filiere" id="filiere">
                                <c:forEach var="filiere" items="${filieres}">
                                    <option value="${filiere.id}">${filiere.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-success" name="filter">Find</button>
                    </form>
                </div>
            </div>
        </div>
    

    <div class="row ">
        <div class="col-md-8">
            <div >
		<div class="table-responsive-sm">
                    <h4 class="card-title">Students :</h4>
                    <table class="table table-bordered">
                        <thead class="thead-light">
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">Login</th>
                                <th scope="col">FirstName</th>
                                <th scope="col">LastName</th>
                                <th scope="col">Phone</th>
                                <th scope="col">Filiere</th>
                                <th scope="col">Role</th>
                            </tr>
                        </thead>
                        <c:forEach items="${students}" var="f">
                            <tr>
                                <td>${f.id}</td>
                                <td>${f.login}</td>
                                <td>${f.firstName}</td>
                                <td>${f.lastName}</td>
                                <td>${f.telephone}</td>
                                <td>${f.filiere.name}</td>
                                <td>${f.roles}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

<script src="bootstrap/bootstrap.bundle.min.js"></script>
</body>
</html>
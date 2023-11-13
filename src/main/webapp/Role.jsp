<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="Header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Role Management</title>
    <link rel="stylesheet" 	href="css/bootstrap.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>

<div class="container col-md-12">
    <div class="row">
        <div class="col-md-6">
            <h4>Add Role :</h4>
            <div class="card">
                <div class="card-body">
                    <form action="<%=request.getContextPath()%>/RoleWeb" method="post">
                        <div class="form-group row">
                            <label for="name" class="col-sm-2 col-form-label">Name</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="name" placeholder="Role name">
                            </div>
                        </div>
                        
                        <div class="col-sm-3 mx-auto">
					<button type="submit" class="btn btn-success" name="action" value="add">Add Role</button>
					</div>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <h4>Roles :</h4>
            <div class="card">
                <div class="card-body">
                    <table class="table table-bordered">
                        <thead class="thead-light">
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">Name</th>
                                <th scope="col">Actions</th>
                            </tr>
                        </thead>
                        <c:forEach items="${role}" var="r">
                           <tr>
    <td>${r.id}</td>
    <td>${r.name}</td>
    <td>
        <div class="btn-group" role="group">

            <button type="button" class="btn btn-primary" style="border-radius: 10px" data-toggle="modal" data-target="#updateModal${r.id}">
                <i >Update</i>
            </button>
            
            <form action="<%=request.getContextPath()%>/RoleWeb" method="post">
                <input type="hidden" name="action" value="del" />
                <input type="hidden" name="id" value="${r.id}" />
                <button type="submit" class="btn btn-danger" style="border-radius: 10px"><i >Delete</i></button>
            </form>
        </div>

        <div class="modal fade" id="updateModal${r.id}" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="updateModalLabel">Update Role</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="<%=request.getContextPath()%>/RoleWeb" method="post">
                            <input type="hidden" name="action" value="update" />
                            <input type="hidden" name="id" value="${r.id}" />
                            <div class="form-group">
                                <label for="updateName">Name:</label>
                                <input type="text" class="form-control" id="updateName" name="name" value="${r.name}">
                            </div>
                            <button type="submit" class="btn btn-primary">Update</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </td>
</tr>

                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>

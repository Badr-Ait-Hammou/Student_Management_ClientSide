<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="Header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Branch  Management</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
   
</head>
<body>

<div class="container col-md-12">
    <div class="row">
        <div class="col-md-6">
            <h4>Add Branch :</h4>
            <div class="card">
                <div class="card-body">
                    <form action="<%=request.getContextPath()%>/FiliereWeb" method="post">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="code">Code</label>
                                <input type="text" class="form-control" name="code" placeholder="Enter code">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="name">Name</label>
                                <input type="text" class="form-control" name="name" placeholder="Enter name">
                            </div>
                        </div>
                        
                         <div class="col-sm-3 mx-auto">
					<button type="submit" class="btn btn-success" name="action" value="add">Add Branch</button>
					</div>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <h4>Branches :</h4>
            <div class="card">
                <div class="card-body">
                    <table class="table table-bordered">
                        <thead class="thead-light">
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">Code</th>
                                <th scope="col">Name</th>
                                <th scope="col">Actions</th>
                            </tr>
                        </thead>
                        <c:forEach items="${filiere}" var="f">
                              <tr>
                        <td>${f.id}</td>
                        <td>${f.code}</td>
                        <td>${f.name}</td>
                        <td>
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-primary " style="border-radius: 10px" data-toggle="modal" data-target="#updateModal${f.id}">
                                    <i >Update</i>
                                </button>
                                <form action="<%=request.getContextPath()%>/FiliereWeb" method="post">
                                    <input type="hidden" name="action" value="del" />
                                    <input type="hidden" name="id" value="${f.id}" />
                                    <button type="submit" style="border-radius: 10px" class="btn btn-danger"><i >Delete</i></button>
                                </form>
                            </div>
                            <div class="modal fade" id="updateModal${f.id}" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="updateModalLabel">Update Filiere</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <form action="<%=request.getContextPath()%>/FiliereWeb" method="post">
                                                <input type="hidden" name="action" value="update" />
                                                <input type="hidden" name="id" value="${f.id}" />
                                                <div class="form-group">
                                                    <label for="updateCode">Code:</label>
                                                    <input type="text" class="form-control" id="updateCode" name="code" value="${f.code}">
                                                </div>
                                                <div class="form-group">
                                                    <label for="updateName">Name:</label>
                                                    <input type="text" class="form-control" id="updateName" name="name" value="${f.name}">
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

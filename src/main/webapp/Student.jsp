<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="Header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Management</title>
<link rel="stylesheet" type="text/css"
	href="bootstrap/bootstrap.min.css" />
<link rel="stylesheet"
	href="css/bootstrap.css">
</head>
<body>
	<div class="container col-md-12 ">
		<div class="row">
			<div class="col-md-3">
				<h4>Add Student :</h4>
		<div class="card">
			<div class="card-body">
				<form action="<%=request.getContextPath()%>/StudentWeb"
					method="post">
					<div class="form-group row">
						<label for="login" class="col-sm-5 col-form-label">Login</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="login"
								placeholder=" login">
						</div>
					</div>
					<div class="form-group row">
						<label for="login" class="col-sm-5 col-form-label">Password</label>
						<div class="col-sm-7">
							<input type="password" class="form-control" name="password"
								placeholder=" password">
						</div>
					</div>
					<div class="form-group row">
						<label for="firstName" class="col-sm-5 col-form-label ">F_Name</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="firstName"
								placeholder=" firstName">
						</div>
					</div>

					<div class="form-group row">
						<label for="lastName" class="col-sm-5 col-form-label">L_Name</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="lastName"
								placeholder="lastName">
						</div>
					</div>

					<div class="form-group row">
						<label for="tell" class="col-sm-5 col-form-label">Phone</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="telephone"
								placeholder="Phone">
						</div>
					</div>

					<div class="form-group row">
						<label for="filiere" class="col-sm-5 col-form-label">Filiere</label>
						<div class="col-sm-7">
							<select class="form-select" aria-label="Default select example"
								name="filiere">
								<c:forEach items="${filieres}" var="fil">
									<option value="${fil.id}">${fil.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group row">
					<div class="col-sm-6 mx-auto">
					<button type="submit" class="btn btn-success" name="action" value="add">Add Student</button>
					</div>
					</div>

				</form>
			</div>
		</div>
	</div>
	

			<div class="col-md-9">
		<h4>Students :</h4>
		<div class="container">
		<div class="table-responsive-sm">
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
						
							<th scope="col">Actions</th>
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
					
							
							<td>
								<div class="btn-group" role="group">

									  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#updateModal${f.id}">
                <i>Update</i>
            </button>
            </div>
		<div class="btn-group" role="group">
									<form action="<%=request.getContextPath()%>/StudentWeb"
										method="post">
										<input type="hidden" name="action" value="del" /> <input
											type="hidden" name="id" value="${f.id}" />
										<button type="submit" class="btn btn-danger">
											<i >Delete</i>
										</button>
									</form>
									
								</div>
										<div class="btn-group" role="group">
			 <button type="button" class="btn btn-success" data-toggle="modal" data-target="#affectRole${f.id}">
                 <i >Grant </i>
            </button>
            </div>
   
					<div class="modal fade" id="affectRole${f.id}" tabindex="-1"
									role="dialog" aria-labelledby="updateModalLabel"
									aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="updateModalLabel">Grant Role</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<form action="<%=request.getContextPath()%>/StudentWeb"
													method="post">
													<input type="hidden" name="action" value="affect" /> <input
														type="hidden" name="id" value="${f.id}" />
												
													<div class="form-group row">
														<label for="filiere" class="col-sm-2 col-form-label">Roles</label>
														<div class="col-sm-7">
															<select class="form-select"
																aria-label="Default select example" name="role">
																<c:forEach items="${roles}" var="rl">
																	<option value="${rl.id}">${rl.name}</option>
																</c:forEach>
															</select> </select>
														</div>
													</div>
													<button type="submit" class="btn btn-primary">Grant</button>
												</form>
											</div>
										</div>
									</div>
								</div>
								<div class="modal fade" id="updateModal${f.id}" tabindex="-1"
									role="dialog" aria-labelledby="updateModalLabel"
									aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="updateModalLabel">Update Students</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<form action="<%=request.getContextPath()%>/StudentWeb"
													method="post">
													<input type="hidden" name="action" value="update" /> <input
														type="hidden" name="id" value="${f.id}" />
													<div class="form-group">
														<label for="updateCode">Login:</label> <input type="text"
															class="form-control" name="login"
															value="${f.login}">
													</div>
													<div class="form-group">
														<label for="updateCode">Password:</label> <input type="text"
															class="form-control" name="password"
															value="${f.password}">
													</div>
													<div class="form-group">
														<label for="updateCode">FirstName:</label> <input
															type="text" class="form-control"
															name="firstName" value="${f.firstName}">
													</div>
													<div class="form-group">
														<label for="updateName">LastName:</label> <input
															type="text" class="form-control"
															name="lastName" value="${f.lastName}">
													</div>
													<div class="form-group">
														<label for="updateName">Phone:</label> <input type="text"
															class="form-control" name="telephone"
															value="${f.telephone}">
													</div>
													<div class="form-group row">
														<label for="filiere" class="col-sm-2 col-form-label">Filiere</label>
														<div class="col-sm-7">
															<select class="form-select"
																aria-label="Default select example" name="filiere">
																<c:forEach items="${filieres}" var="fil">
																	<option value="${fil.id}">${fil.name}</option>
																</c:forEach>
															</select> </select>
														</div>
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
</body>
</html>
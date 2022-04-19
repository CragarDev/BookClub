<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.Date" %>
    <!-- Here we have to import the Date class. -->
    <!-- You will put the import in the first line of the jsp tag. Use the import attribute -->

    <!-- c:out ; c:forEach ; c:if -->
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!-- Formatting (like dates) -->
        <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!-- form:form -->
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                <!-- for rendering errors on PUT routes -->
                <%@ page isErrorPage="true" %>

                    <!DOCTYPE html>

                    <html>

                    <head>
                        <meta charset="UTF-8" />
                        <title>Craig Burke - Book Club - Login/Registration</title>
                        <!-- Bootstrap -->
                        <!-- CSS only -->
                        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
                            rel="stylesheet"
                            integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
                            crossorigin="anonymous" />
                        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
                            integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
                            crossorigin="anonymous"></script>
                        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
                            integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
                            crossorigin="anonymous"></script>
                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
                        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
                        <link rel="stylesheet" type="text/css" href="/css/style.css">
                    </head>

                    <body>
                        <!-- Main Container START -->
                        <div class="container mt-5 w-75">
                            <!-- Error Messages -->
                            <h1 class="text-danger text-center">
                                <c:out value="${error}" />
                            </h1>

                            <!-- Page Titles -->
                            <div>
                                <h1 class="bg-primary text-light text-center ps-5">Welcome to Book Club
                                </h1>
                                <h1 class="bg-primary text-light text-center ps-5 mb-5">Please Log In or Register!</h1>
                            </div>

                            <p class="w-100"></p>

                            <!-- Login/Registration Form START -->
                            <div class="container d-flex g-4">

                                <!-- Login START -->
                                <div class="container">
                                    <h2 class="bg-primary text-light mb-2">LogIn</h2>
                                    <form:form action="/login" method="post" modelAttribute="newLogin">
                                        <div class="form-group">
                                            <label>Email:</label>
                                            <form:input path="email" class="form-control" />
                                            <form:errors path="email" class="text-danger" />
                                        </div>
                                        <div class="form-group">
                                            <label>Password:</label>
                                            <form:password path="password" class="form-control" />
                                            <form:errors path="password" class="text-danger" />
                                        </div>
                                        <input type="submit" value="Login" class="btn btn-success mt-3" />
                                    </form:form>
                                </div>
                                <!-- Login END -->

                                <p class="w-25"></p>

                                <!-- Registration START -->
                                <div class="container">
                                    <h2 class="bg-primary text-light mb-2">Register</h2>
                                    <form:form action="/register" method="post" modelAttribute="newUser">
                                        <div class="form-group">
                                            <label>First Name:</label>
                                            <form:input path="firstName" class="form-control" />
                                            <form:errors path="firstName" class="text-danger" />
                                        </div>
                                        <div class="form-group">
                                            <label>Last Name:</label>
                                            <form:input path="lastName" class="form-control" />
                                            <form:errors path="lastName" class="text-danger" />
                                        </div>
                                        <div class="form-group">
                                            <label>Email:</label>
                                            <form:input path="email" class="form-control" />
                                            <form:errors path="email" class="text-danger" />
                                        </div>
                                        <div class="form-group">
                                            <label>Password:</label>
                                            <form:password path="password" class="form-control" />
                                            <form:errors path="password" class="text-danger" />
                                        </div>
                                        <div class="form-group">
                                            <label>Confirm Password:</label>
                                            <form:password path="confirm" class="form-control" />
                                            <form:errors path="confirm" class="text-danger" />
                                        </div>
                                        <input type="submit" value="Register" class="btn btn-primary mt-3" />
                                    </form:form>
                                </div>
                                <!-- Registration END -->

                            </div>
                            <!-- Login/Registration Form END -->

                            <p class="w-100"></p>

                        </div>
                        <!-- Main Container END -->

                        <script src="/js/app.js"></script>
                    </body>

                    </html>
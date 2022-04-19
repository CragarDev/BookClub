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
                <h3%@ page isErrorPage="true" %>

                    <!DOCTYPE html>

                    <html>

                    <head>
                        <meta charset="UTF-8" />
                        <title>Craig Burke - Book Club - Book Details</title>
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

                        <!--  Nav START -->
                        <nav class="navbar navbar-expand-xl navbar-light bg-light">
                            <div class="container">

                                <!-- Landing button -->
                                <a class="navbar-brand" href="/">Book Club</a>

                                <!-- Toggler for mobile/small screen -->
                                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#navbarWithDropdown" aria-controls="navbarWithDropdown"
                                    aria-expanded="false" aria-label="Toggle navigation">
                                    <span class="navbar-toggler-icon"></span>
                                </button>

                                <!-- Collapsable nav bar -->
                                <div class="collapse navbar-collapse show" id="navbarWithDropdown">
                                    <ul class="navbar-nav">

                                        <!-- Home/Index button -->
                                        <!-- <li class="nav-item">
                                            <a class="nav-link active" aria-current="page" href="/home">Home</a>
                                        </li> -->

                                        <!-- Login/Registration button -->
                                        <li class="nav-item">
                                            <a class="nav-link" href="/login">Login</a>
                                        </li>

                                        <!-- Dashboard button -->
                                        <li class="nav-item">
                                            <a class="nav-link" href="/dashboard">Dashboard</a>
                                        </li>

                                        <!-- Add to my shelf button -->
                                        <li class="nav-item">
                                            <a class="nav-link" href="/createNewBook">Add To My Shelf</a>
                                        </li>

                                        <!-- Logout button -->
                                        <li class="nav-item">
                                            <a class="nav-link" href="/logout">Logout</a>
                                        </li>


                                    </ul>

                                </div>
                            </div>
                        </nav>
                        <!--  Nav END -->

                        <!-- Main container START -->
                        <div class="container">

                            <!-- Page Title / start button START -->
                            <div>
                                <h1 class="bg-dark text-light ps-5 text-center">Welcome to Book Club</h1>
                                <!-- <a class="btn btn-primary mt-4" href="/">Start Doing Something!</a> -->
                            </div>
                            <!-- Page Title END -->

                            <p class="w-100"></p>

                            <!-- show user name on page START -->
                            <div>
                                <h3 class="bg-primary text-light ps-5 text-center">Welcome <span
                                        class="text-warning h2">${logged_user.firstName}</span>, to the Book Club One
                                    Book
                                    Details
                                    Page</h3>
                            </div>
                            <br>
                            <!-- show user name on page END -->

                            <p class="w-100"></p>

                            <!-- Book Details -->

                            <!-- Show One Details START -->

                            <div class="container w-75">
                                <!-- <div>
                                    <h1 class="bg-primary text-light">Book Details</h1>
                                </div>
                                <p class="w-100"></p> -->


                                <h3 class="text-white list-inline-item">

                                    <c:choose>
                                        <c:when test="${book.user.id == logged_user.id}">

                                            <h2 class="text-danger list-inline-item">You</h2>

                                            have read
                                        </c:when>
                                        <c:otherwise>

                                            <h2 class="text-danger list-inline-item h2">${book.user.firstName}</h2>

                                            read
                                        </c:otherwise>

                                    </c:choose>

                                    <h2 class="text-primary list-inline-item ms-1">
                                        ${book.title}</h2>

                                    by
                                    <h2 class="text-success list-inline-item ms-1">${book.author}</h2>
                                </h3>

                                <h5>Here are <c:out value="${book.user.firstName}"></c:out>'s thoughts:</h5>
                                <hr>
                                <h5 class="h5">

                                    <c:out value="${book.thoughts}"></c:out>

                                    <hr>
                                </h5>

                                <c:choose>
                                    <c:when test="${book.user.id == logged_user.id}">

                                        <!-- update button -->
                                        <a class="btn btn-warning" href="/updateBook/${book.id}">Update Book</a>
                                        <a class="btn btn-danger" href="/deleteBook/${book.id}">Delete Book</a>
                                    </c:when>
                                    <c:otherwise>

                                    </c:otherwise>

                                </c:choose>
                                <a class="btn btn-info float-end" href="/dashboard">Back</a>

                            </div>

                            <!-- Show One Details END -->



                            <p class="w-100"></p>

                            <!-- Main container END -->
                        </div>

                        <script src="/js/app.js"></script>
                    </body>

                    </html>
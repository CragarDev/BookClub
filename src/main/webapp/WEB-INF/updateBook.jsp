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
                        <title>Craig Burke - Book Club - Update Book</title>
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

                                        <!-- Login/Registration button -->
                                        <li class="nav-item">
                                            <a class="nav-link" href="/login">Login</a>
                                        </li>

                                        <!-- Logout button -->
                                        <li class="nav-item">
                                            <a class="nav-link" href="/logout">Logout</a>
                                        </li>

                                        <!-- Dashboard button -->
                                        <li class="nav-item">
                                            <a class="nav-link" href="/dashboard">Dashboard</a>
                                        </li>
                                        <!-- Add to my shelf button -->
                                        <li class="nav-item">
                                            <a class="nav-link" href="/createNewBook">Add To My Shelf</a>
                                        </li>

                                    </ul>

                                </div>
                            </div>
                        </nav>
                        <!--  Nav END -->

                        <!-- Main container START -->
                        <div class="container text-center">

                            <!-- Page Title / start button START -->
                            <div>
                                <h3 class="bg-dark text-light ps-5">Welcome to Book Club</h3>
                                <!-- <a class="btn btn-primary mt-4" href="/">Start Doing Something!</a> -->
                            </div>
                            <!-- Page Title END -->

                            <p class="w-100"></p>

                            <!-- show user name on page START -->
                            <div>
                                <h1 class="bg-primary text-light ps-5">Welcome <span
                                        class="text-primary ">${user.userName}</span>, to the Book Club Update Book
                                    Page</h1>
                            </div>
                            <!-- show user name on page END -->

                            <p class="w-100"></p>


                            <!-- BaseProject Create New Form START -->
                            <div
                                class="container bg-secondary text-light rounded-3 w-50 mt-5 border border-info border-5 pb-5 p-3">
                                <form:form action="/updateBook/${book.id}" method="post" modelAttribute="book">
                                    <!-- the next line is for updating -->
                                    <input type="hidden" name="_method" value="put" />

                                    <!-- for attaching the owner to the book -->
                                    <form:input type="hidden" path="user" class="float-start" value="${user.id}" />

                                    <div class="mb-3">
                                        <p>
                                            <form:label path="title" class="float-start">Book Title</form:label>
                                            <form:errors path="title" class="text-danger h5" />
                                            <form:input path="title" class="form-control text-dark"
                                                placeholder="title" />
                                        </p>
                                    </div>

                                    <div class="mb-3 mt-3">
                                        <p>
                                            <form:label path="author" class="float-start">Author
                                            </form:label>
                                            <form:errors path="author" class="text-danger h5" />
                                            <form:input path="author" class="form-control" cols="30" rows="5"
                                                placeholder="author" />
                                        </p>
                                    </div>

                                    <div class="mb-3 mt-3">
                                        <p>
                                            <form:label path="thoughts" class="float-start">Thoughts
                                            </form:label>
                                            <form:errors path="thoughts" class="text-danger h5" />
                                            <form:textarea path="thoughts" class="form-control" cols="30" rows="5"
                                                placeholder="thoughts" />
                                        </p>
                                    </div>


                                    <p class="w-100"></p>

                                    <input type="submit" value="Update Book" class="btn btn-warning float-start" />
                                    <!-- == Cancel button == -->
                                    <p class="w-100"></p>
                                    <a class="btn btn-info float-end mb-3" href="/dashboard">Cancel</a>
                                    <p class="w-100"></p>

                                </form:form>



                                <p class="w-100"></p>

                                <!-- Main container END -->
                            </div>

                            <script src="/js/app.js"></script>
                    </body>

                    </html>
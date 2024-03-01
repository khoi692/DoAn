<%-- 
    Document   : blog_detail
    Created on : Jun 5, 2023, 9:12:41 AM
    Author     : Drag
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${sessionScope.b.getTitle()}</title>
        <link rel="stylesheet" type="text/css" href="../css/util.css">
        <link rel="stylesheet" type="text/css" href="../css/main.css">
        <link rel="stylesheet" href="../css/header.css">
        <script src="../js/header.js"></script>
        <link rel="stylesheet" href="../css/footer.css">
        <style>
            a {
                cursor: pointer;
            }

            a:hover{
                text-decoration: underline!important;
            }

            .row>div{
                padding: 10px;
            }

            .tags {
                display: flex;
                flex-wrap: wrap;
            }

            .blog img{
                max-width: 100%;
                height: auto;
            }

            #search-results {
                position: absolute;
                z-index: 2;
                width: 100%;
            }
            footer {
                color: white;
            }

        </style>
    </head>
    <body>
        <%@include file="components/header.jsp"%>
        <div class="content container" style="margin: 3rem auto;">
            <div class="row">
                <div class="blog col-lg-8">
                    <h1 style="font-weight: 700">${sessionScope.b.getTitle()}</h1>
                    <p style="font-style: italic">Lastest modified by <a style="font-style: normal">${sessionScope.b.getAuthor()}</a> on ${sessionScope.b.getTime()}</p>
                    <c:forEach items="${sessionScope.tagList}" var="tag">
                        <a class="badge bg-secondary text-decoration-none link-light">${tag}</a>
                    </c:forEach>
                    <img src="./${sessionScope.b.getThumbnail()}" alt="Thumbnail" style="width: 100%; padding: 10px 0"/>
                    <p style="font-weight: 600">${sessionScope.b.getSummary()}</p>
                    <p>${sessionScope.b.getContent()}</p>
                </div>
                <div class="col-lg-4">
                    <!-- Search widget-->
                    <div class="card mb-4">
                        <div class="card-header">Search</div>
                        <div class="card-body">
                            <div class="input-group">
                                <input style="border: 1px solid black" id="search-blog" class="form-control" type="text" placeholder="Enter blog title..." aria-label="Enter blog title..." aria-describedby="button-search">
                            </div>
                            <ul id="search-results" class="list-group mt-2"></ul>
                        </div>
                    </div>
                    <!-- Categories widget-->
                    <div class="card mb-4">
                        <div class="card-header">Categories</div>
                        <div class="card-body">
                            <div class="row">
                                <c:forEach items="${sessionScope.cateList}" var="category" varStatus="loop">
                                    <div class="col-sm-6">
                                        <ul class="list-unstyled mb-0">
                                            <li><a href="#!">${category}</a></li>
                                        </ul>
                                    </div>
                                    <c:if test="${loop.index % 2 == 1 && !loop.last}">
                                    </div><div class="row">
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>
                    </div>


                    <div class="tags card mb-4">
                        <div class="card-header">Tags</div>
                        <div class="card-body">
                            <c:forEach items="${sessionScope.tagListFull}" var="tag">
                                <a class="badge bg-secondary text-decoration-none link-light">${tag}</a>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="components/footer.jsp"%>

        <script>
            // Get references to the search input and results elements
            const searchInput = document.querySelector('#search-blog');
            const searchResults = document.querySelector('#search-results');

            // Get the session-scoped blog list and convert it to a JavaScript array
            const blogs = [
            <c:forEach items="${sessionScope.blogList}" var="blog" varStatus="loop">
            {
            title: "${blog.getTitle()}",
                    thumbnail: "${blog.getThumbnail()}",
                    id: "${blog.getBlogId()}",
            }<c:if test="${!loop.last}">,</c:if>
            </c:forEach>
            ];
//            console.log(blogs);
            // Add an event listener to the search input to listen for changes
            searchInput.addEventListener('input', () => {
                // Get the current value of the search input
                const searchTerm = searchInput.value;

                // Clear any existing search results
                searchResults.innerHTML = '';

                // Only show results if there is something in the search input
                if (searchTerm) {
                    // Filter the blogs array to only include blogs with titles that match the search term
                    const matchingBlogs = blogs.filter(blog => blog.title.toLowerCase().includes(searchTerm.toLowerCase()));

                    // Add a border to the searchResults element if there are any matching blogs
                    if (matchingBlogs.length > 0) {
                        searchResults.style.border = '1px solid black';
                    } else {
                        searchResults.style.border = 'none';
                    }

                    // Loop through the matching blogs and create a list item for each one
                    matchingBlogs.forEach(blog => {
                        const listItem = document.createElement('li');
                        listItem.classList.add('list-group-item');

                        // Create an anchor element for the list item
                        const listItemLink = document.createElement('a');
                        listItemLink.href = '/cozastore/blog/detail?id=' + blog.id;
                        listItem.appendChild(listItemLink);

                        // Create a row to hold the image and title
                        const row = document.createElement('div');
                        row.classList.add('row');
                        listItemLink.appendChild(row);

                        // Create a column for the blog thumbnail
                        const thumbnailCol = document.createElement('div');
                        thumbnailCol.classList.add('col-4');
                        row.appendChild(thumbnailCol);

                        // Create an img element for the blog thumbnail
                        const thumbnailImg = document.createElement('img');
                        thumbnailImg.src = "../" + blog.thumbnail;
                        thumbnailImg.style.width = '100%';
                        thumbnailCol.appendChild(thumbnailImg);

                        // Create a column for the blog title
                        const titleCol = document.createElement('div');
                        titleCol.classList.add('col-8');
                        row.appendChild(titleCol);

                        // Create a span element for the blog title
                        const titleSpan = document.createElement('span');
                        titleSpan.textContent = blog.title;
                        titleCol.appendChild(titleSpan);

                        searchResults.appendChild(listItem);
                    });
                } else {
                    // Remove the border from the searchResults element if there is nothing in the search input
                    searchResults.style.border = 'none';
                }
            });

// Add some CSS styles to the searchResults element to give it a max height and make it scrollable
            searchResults.style.maxHeight = '200px';
            searchResults.style.overflowY = 'auto';

        </script>
    </body>
</html>

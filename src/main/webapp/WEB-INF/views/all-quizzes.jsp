<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>view-quizzes</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<c:set var="activePage" value="quizzes" scope="request" />
<%@ include file="/WEB-INF/views/components/nav.jsp" %>
<div class="max-w-6xl mx-auto px-6 py-8">
    <h1 class="text-4xl font-bold mb-8 text-center text-navy-800">Available Quizzes</h1>
    <nav class="flex mb-4" aria-label="Breadcrumb">
        <ol class="inline-flex items-center space-x-1 md:space-x-2 rtl:space-x-reverse">
          <li class="inline-flex items-center">
            <a href="${pageContext.request.contextPath}/quizzes" class="inline-flex items-center text-sm font-medium text-blue-800 hover:text-blue-600 dark:text-gray-900 dark:text-blue-400 hover:text-blue-600 dark:text-gray-400 dark:hover:text-gray-400">
              <svg class="w-3 h-3 me-2.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
                <path d="m19.707 9.293-2-2-7-7a1 1 0 0 0-1.414 0l-7 7-2 2a1 1 0 0 0 1.414 1.414L2 10.414V18a2 2 0 0 0 2 2h3a1 1 0 0 0 1-1v-4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v4a1 1 0 0 0 1 1h3a2 2 0 0 0 2-2v-7.586l.293.293a1 1 0 0 0 1.414-1.414Z"/>
              </svg>
              All
            </a>
          </li>
          <c:forEach var="category" items="${categories}">
              <li>
                <div class="flex items-center">
                  <a href="${pageContext.request.contextPath}/quizzes?category=${category.categoryName}" class="ms-1 text-sm font-medium text-blue-800 hover:text-blue-600 dark:text-gray-900 dark:text-blue-400  md:ms-2 dark:text-gray-400 dark:hover:text-gray-400">${category.categoryName}</a>
                </div>
              </li>
          </c:forEach>
        </ol>
    </nav>
    <table class="table-auto w-full border-collapse border border-gray-400 text-center text-lg">
        <thead>
            <tr class="bg-blue-900 text-white">
                <th class="border px-4 py-2">Title</th>
                <th class="border px-4 py-2">Description</th>
                <th class="border px-4 py-2">Category</th>
                <th class="border px-4 py-2">Number of Questions To Play</th>
                <th class="border px-4 py-2">Status</th>
                <th class="border px-4 py-2">Quiz By</th>
                <th class="border px-4 py-2">Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="quiz" items="${quizzes}">
                <tr class="text-gray-800">
                    <td class="border px-4 py-2">${quiz.quizName}</td>
                    <td class="border px-4 py-2">${quiz.quizDesc}</td>
                    <td class="border px-4 py-2">${quiz.category.categoryName}</td>
                    <td class="border px-4 py-2">${quiz.noOfQuestionToPlay}</td>
                    <td class="border px-4 py-2">${quiz.status}</td>
                    <td class="border px-4 py-2">${quiz.user.username}</td>
                    <td class="border px-4 py-2 space-x-auto">
                        <a href="${pageContext.request.contextPath}/books/item/${book.bookId}" class="bg-blue-500 hover:bg-blue-600 text-white px-3 py-1 rounded">Edit</a>
                        <form action="${pageContext.request.contextPath}/books/delete/${book.bookId}" method="post" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete ${book.bookName}?');">
                            <input type="hidden" name="_method" value="delete" />
                            <button type="submit" class="bg-red-600 hover:bg-red-700 text-white font-medium px-3 py-1 rounded">Delete</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>

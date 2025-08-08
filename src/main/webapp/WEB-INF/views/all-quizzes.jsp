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
<div class="max-w-screen-xl mx-16 px-16 py-4">
    <nav class="text-base font-medium flex mb-4" aria-label="Breadcrumb">
        <ol class="inline-flex items-center space-x-1 md:space-x-2 rtl:space-x-reverse">
          <li class="inline-flex items-center">
            <a href="${pageContext.request.contextPath}/quizzes"
               class="inline-flex items-center text-blue-800 hover:text-blue-600 dark:hover:text-gray-400 dark:text-gray-900 dark:text-blue-400
                      ${empty param.category ? 'text-lg underline font-extrabold dark:font-extrabold' : ''}">
              All
            </a>
          </li>
          <c:forEach var="category" items="${categories}">
              <li>
                <div class="flex items-center">
                  <a href="${pageContext.request.contextPath}/quizzes?category=${category.categoryName}"
                     class="ms-1 text-blue-800 hover:text-blue-600 dark:text-gray-900 dark:text-blue-400 md:ms-2 dark:text-gray-400 dark:hover:text-gray-400
                            ${category.categoryName == param.category ? 'text-lg underline font-extrabold dark:font-extrabold' : ''}">
                    ${category.categoryName}
                  </a>
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
                <th class="border px-4 py-2">Questions in Game</th>
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

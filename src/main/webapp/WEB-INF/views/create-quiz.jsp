<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Quiz</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class = "bg-gray-100">
<c:set var="activePage" value="create-quiz" scope="request" />
<%@ include file="/WEB-INF/views/components/nav.jsp" %>
<div class="max-w-lg mx-auto mt-10 bg-white shadow p-6 rounded-lg">
    <h1 class="text-2xl font-bold text-center mb-6">Create a Quiz</h1>

    <form action="${pageContext.request.contextPath}/quizzes" method="post" class="space-y-4">

        <!-- Quiz Title -->
        <div>
            <label class="block font-medium text-gray-700 mb-1">Quiz Title</label>
            <input type="text" name="quizName" required
                   class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500">
        </div>

        <!-- Quiz Description -->
        <div>
            <label class="block font-medium text-gray-700 mb-1">Quiz Description</label>
            <textarea name="quizDesc" rows="3" required
                      class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"></textarea>
        </div>

        <!-- Quiz Category -->
        <div>
            <label class="block font-medium text-gray-700 mb-1">Quiz Category</label>
            <select name="categoryId" required
                    class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500">
                <option value="">Select a category</option>
                <c:forEach var="category" items="${categories}">
                    <option value="${category.categoryId}">${category.categoryName}</option>
                </c:forEach>
            </select>
        </div>

        <!-- Number of Questions to Play -->
        <div>
            <label class="block font-medium text-gray-700 mb-1">Questions in Game</label>
            <input type="number" name="noOfQuestionToPlay" min="1" required
                   class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500">
            <p class="text-sm text-gray-500 mt-1">Number of random questions to include when playing</p>
        </div>

        <!-- Submit Button -->
        <div class="text-right">
            <button type="submit"
                    class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                Create Quiz
            </button>
        </div>
    </form>
</div>
</body>
</html>

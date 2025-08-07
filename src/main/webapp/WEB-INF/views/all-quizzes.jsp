<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>view-quizzes</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/components/nav.jsp" %>
<div class="max-w-6xl mx-auto px-6 py-8">
    <h1 class="text-4xl font-bold mb-8 text-center text-navy-800">Available Category</h1>
    <table class="table-auto w-full border-collapse border border-gray-400 text-center text-lg">
        <thead>
            <tr class="bg-blue-900 text-white">
                <th class="border px-4 py-2">Title</th>
                <th class="border px-4 py-2">Description</th>
                <th class="border px-4 py-2">Category</th>
                <th class="border px-4 py-2">Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="quiz" items="${quizzes}">
                <tr class="text-gray-800">
                    <td class="border px-4 py-2">${quiz.quizName}</td>
                    <td class="border px-4 py-2">${quiz.quizDesc}</td>
                    <td class="border px-4 py-2">${quiz.category.categoryName}</td>
                    <td class="border px-4 py-2 space-x-2">
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

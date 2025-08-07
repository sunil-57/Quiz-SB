<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>add-quiz</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/components/nav.jsp" %>
<div class="max-w-5xl mx-auto px-6 py-8">
    <h2 class="text-4xl font-bold mb-8 text-center text-navy-800">Create a quiz</h2>
    <form action="${pageContext.request.contextPath}/quizzes" method="post" class="space-y-4">
        <div class="flex items-center">
            <label class="w-40 font-medium text-lg">Quiz Title:</label>
            <input type="text" name="quizName" class="flex-1 border border-gray-300 p-2 rounded text-lg" required>
        </div>
        <div class="flex items-center">
            <label class="w-40 font-medium text-lg">Quiz Description:</label>
            <input type="text" name="quizDesc" class="flex-1 border border-gray-300 p-2 rounded text-lg">
        </div>
        <div class="flex items-center">
            <label class="w-40 font-medium text-lg">Number of Questions to play:</label>
            <input type="number" name="noOfQuestionToPlay" class="flex-1 border border-gray-300 p-2 rounded text-lg">
        </div>
        <div class="flex justify-end mt-4">
            <button type="submit" class="bg-blue-700 text-white px-6 py-2 rounded hover:bg-blue-800 text-lg">Create Quiz</button>
        </div>
    </form>
</div>
</body>
</html>

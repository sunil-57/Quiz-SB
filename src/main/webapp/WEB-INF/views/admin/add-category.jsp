<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>add-category</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<div class="max-w-5xl mx-auto px-6 py-8">
    <h1 class="text-4xl font-bold mb-8 text-center text-navy-800">Add a New Book</h1>
    <form action="${pageContext.request.contextPath}/categories" method="post" class="space-y-4">
        <div class="flex items-center">
            <label class="w-40 font-medium text-lg">Category Name:</label>
            <input type="text" name="categoryName" class="flex-1 border border-gray-300 p-2 rounded text-lg" required>
        </div>
        <div class="flex items-center">
            <label class="w-40 font-medium text-lg">Category Description:</label>
            <input type="text" name="categoryDesc" class="flex-1 border border-gray-300 p-2 rounded text-lg">
        </div>
        <div class="flex justify-end mt-4">
            <button type="submit" class="bg-blue-700 text-white px-6 py-2 rounded hover:bg-blue-800 text-lg">Add Category</button>
        </div>
    </form>
</div>
</body>
</html>

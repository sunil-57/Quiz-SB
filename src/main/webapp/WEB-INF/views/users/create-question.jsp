<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Question</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class = "bg-gray-100">
<c:set var="activePage" value="create-quiz" scope="request" />
<%@ include file="/WEB-INF/views/components/nav.jsp" %>
<div class="max-w-lg mx-auto mt-10 bg-white shadow p-6 rounded-lg">
    <h1 class="text-2xl font-bold text-center mb-6">Create a Question</h1>

    <form class="max-w-md mx-auto space-y-4">
      <!-- Question Textarea -->
      <div class="mb-6">
        <label for="question" class="block text-md font-medium text-gray-700 mb-2">Question</label>
        <textarea
          id="question"
          name="question"
          rows="3"
          class="w-full px-3 py-2 text-gray-700 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
          placeholder="Enter your question here..."></textarea>
        <p class="mt-1 text-xs text-gray-500">The text area will expand as you add more content</p>
      </div>

      <!-- Options Section -->
      <div class="mb-6">
        <label class="block text-md font-medium text-gray-700 mb-2">Options</label>
        <div class="space-y-2">
          <!-- Option 1 -->
          <div class="flex items-center">

            <input type="text" name = "option1" placeholder="Option 1" class="w-full px-3 py-2 border border-gray-300 rounded-md flex-grow focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent">
          </div>

          <!-- Option 2 -->
          <div class="flex items-center">

            <input type="text" name = "option2" placeholder="Option 2" class="w-full px-3 py-2 border border-gray-300 rounded-md flex-grow focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent">
          </div>

          <!-- Option 3 -->
          <div class="flex items-center">

            <input type="text" name = "option3" placeholder="Option 3" class="w-full px-3 py-2 border border-gray-300 rounded-md flex-grow focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent">
          </div>
          <!-- Option 4 -->
          <div class="flex items-center">
            <input type="text" name = "option4" placeholder="Option 4" class="w-full px-3 py-2 border border-gray-300 rounded-md flex-grow focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent">
          </div>

        </div>
      </div>

      <!-- Answer Key Section -->
      <div class="mb-6">
        <div class="flex items-center justify-stretch space-x-4">
            <label class="block text-md font-medium text-gray-700 px-2 py-2">Answer Key</label>
            <select name = "correctAnswer" class="px-2 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent" required>
                <option value="">Select correct option</option>
                       <option value="A">Option 1</option>
                       <option value="B">Option 2</option>
                       <option value="C">Option 3</option>
                       <option value="D">Option 4</option>
            </select>
        </div>
      </div>

      <!-- Form Actions -->
      <div class="flex justify-end space-x-3">
        <button type="button" class="px-4 py-2 border border-gray-300 rounded-md shadow-sm text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500">
          Cancel
        </button>
        <button type="submit" class="px-4 py-2 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500">
          Save Question
        </button>
      </div>
    </form>

</div>
</body>
</html>

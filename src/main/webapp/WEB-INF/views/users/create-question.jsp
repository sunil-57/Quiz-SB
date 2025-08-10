<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Question</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
                .sticky-below-nav {
                    position: sticky;
                    top: 5.5rem;
                    z-index: 45;
                    background-color: white;
                }
                .dark .sticky-below-nav {
                    background-color: #1f2937;
                    border-bottom-color: #374151;
                }
        </style>
</head>
<body class = "bg-gray-100">
<%@ include file="/WEB-INF/views/components/nav.jsp" %>
<div class="sticky-below-nav">
    <div class="max-w-screen-xl mx-16 px-16 py-2">
        <!-- Breadcrumb -->
        <nav class="text-base font-medium flex my-1 py-1" aria-label="Breadcrumb">
            <ol class="inline-flex items-center space-x-1 md:space-x-2 rtl:space-x-reverse">
                <li class="inline-flex items-center">
                    <a href="${pageContext.request.contextPath}/"
                       class="inline-flex items-center text-sm font-medium text-blue-800 hover:text-blue-600 dark:text-gray-900 dark:text-blue-400 hover:text-blue-600 dark:text-gray-400 dark:hover:text-gray-400">
                        <svg class="w-3 h-3 me-2.5" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
                            <path d="m19.707 9.293-2-2-7-7a1 1 0 0 0-1.414 0l-7 7-2 2a1 1 0 0 0 1.414 1.414L2 10.414V18a2 2 0 0 0 2 2h3a1 1 0 0 0 1-1v-4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v4a1 1 0 0 0 1 1h3a2 2 0 0 0 2-2v-7.586l.293.293a1 1 0 0 0 1.414-1.414Z"/>
                        </svg>
                        Home
                    </a>
                </li>
                <li>
                    <div class="flex items-center">
                        <svg class="rtl:rotate-180 w-3 h-3 text-gray-400 mx-1" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
                            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 9 4-4-4-4"/>
                        </svg>
                        <a href="${pageContext.request.contextPath}/quizzes/${sessionScope.loggedInUser.userid}"
                           class="ms-1 text-sm font-medium text-blue-800 hover:text-blue-600 dark:text-gray-900 dark:text-blue-400 md:ms-2 dark:text-gray-400 dark:hover:text-gray-400">
                            My Quizzes
                        </a>
                    </div>
                </li>
                <li>
                    <div class="flex items-center">
                        <svg class="rtl:rotate-180 w-3 h-3 text-gray-400 mx-1" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
                            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 9 4-4-4-4"/>
                        </svg>
                        <a href="${pageContext.request.contextPath}/quizzes/${sessionScope.loggedInUser.userid}"
                           class="ms-1 text-sm font-medium text-blue-800 hover:text-blue-600 dark:text-gray-900 dark:text-blue-400 md:ms-2 dark:text-gray-400 dark:hover:text-gray-400">
                            ${quiz.quizName}
                        </a>
                    </div>
                </li>
                <li>
                    <div class="flex items-center">
                        <svg class="rtl:rotate-180 w-3 h-3 text-gray-400 mx-1" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
                            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 9 4-4-4-4"/>
                        </svg>
                        <a href="${pageContext.request.contextPath}/quizzes/${sessionScope.loggedInUser.userid}"
                           class="ms-1 text-sm font-medium text-blue-800 hover:text-blue-600 dark:text-gray-900 dark:text-blue-400 md:ms-2 dark:text-gray-400 dark:hover:text-gray-400">
                            Create a Question
                        </a>
                    </div>
                </li>
            </ol>
        </nav>
    </div>
</div>
<div class="max-w-full mx-8 px-8 flex flex-col md:flex-row gap-8">
<!-- Left: Question form -->
    <div class="max-w-lg md:w-1/2 mx-16 mt-4 bg-white shadow p-6 rounded-lg">
        <form action = "${pageContext.request.contextPath}/quizzes/${quiz.quizId}/questions" method="post" class="max-w-md mx-auto space-y-4">
          <!-- Question Textarea -->
          <div class="mb-6">
            <label for="question" class="block text-md font-medium text-gray-700 mb-2">Question</label>
            <textarea
              id="question"
              name="title"
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

                <input type="text" id="option1" name = "option1" value="${param.option1}" placeholder="Option 1" class="w-full px-3 py-2 border border-gray-300 rounded-md flex-grow focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent">
              </div>

              <!-- Option 2 -->
              <div class="flex items-center">

                <input type="text" id="option2" name = "option2" value="${param.option2}" placeholder="Option 2" class="w-full px-3 py-2 border border-gray-300 rounded-md flex-grow focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent">
              </div>

              <!-- Option 3 -->
              <div class="flex items-center">

                <input type="text" id="option3" name = "option3" value="${param.option3}" placeholder="Option 3" class="w-full px-3 py-2 border border-gray-300 rounded-md flex-grow focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent">
              </div>
              <!-- Option 4 -->
              <div class="flex items-center">
                <input type="text" id="option4" name = "option4" value="${param.option4}" placeholder="Option 4" class="w-full px-3 py-2 border border-gray-300 rounded-md flex-grow focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent">
              </div>
            </div>
          </div>

          <!-- Answer Key Section -->
          <div class="mb-6">
            <div class="flex items-center space-x-4">
                <label class="block text-md font-medium text-gray-700 px-2 py-2">Answer Key</label>
                <select id="correctAnswer" name="correctAnswer"
                            class="px-2 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent" required>
                      <option value="">Select correct option</option>
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
    <!-- Right: Questions -->
    <div  class="max-w-full md:w-1/2 mt-4 shadow rounded-lg">
        <%@ include file="/WEB-INF/views/components/questions.jsp" %>
    </div>
</div>
<script>
        const optionInputs = [
          document.getElementById('option1'),
          document.getElementById('option2'),
          document.getElementById('option3'),
          document.getElementById('option4'),
        ];

        const select = document.getElementById('correctAnswer');

        function updateSelectOptions() {
          // Clear existing options except first placeholder
          select.options.length = 0;

          let hasValidOption = false;

          optionInputs.forEach((input, index) => {
            const val = input.value.trim();
            if(val !== '') {
              const option = document.createElement('option');
              option.value = val;
              option.text = val;
              select.appendChild(option);
              hasValidOption = true;
            }
          });

          if (!hasValidOption) {
            const option = document.createElement('option');
            option.value = "";
            option.text = "No options added";
            option.disabled = true;
            option.selected = true;
            select.appendChild(option);
          }
        }


        // Initial populate on page load
        updateSelectOptions();

        // Add input event listeners to update live
        optionInputs.forEach(input => {
          input.addEventListener('input', updateSelectOptions);
        });
      </script>
</body>
</html>

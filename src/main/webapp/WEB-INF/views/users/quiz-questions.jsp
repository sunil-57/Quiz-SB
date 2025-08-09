<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>view-quizzes</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/flowbite@2.5.1/dist/flowbite.min.js"></script>

</head>
<body>
<%@ include file="/WEB-INF/views/components/nav.jsp" %>
<div class="max-w-screen-xl mx-16 px-16 py-4">
  <nav class="text-base font-medium flex mb-4 bg-white" aria-label="Breadcrumb">
    <ol class="inline-flex items-center space-x-1 md:space-x-2 rtl:space-x-reverse">
      <li class="inline-flex items-center">
        <a href="${pageContext.request.contextPath}/" class="inline-flex items-center text-sm font-medium text-blue-800 hover:text-blue-600 dark:text-gray-900 dark:text-blue-400 hover:text-blue-600 dark:text-gray-400 dark:hover:text-gray-400">
          <svg class="w-3 h-3 me-2.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
            <path d="m19.707 9.293-2-2-7-7a1 1 0 0 0-1.414 0l-7 7-2 2a1 1 0 0 0 1.414 1.414L2 10.414V18a2 2 0 0 0 2 2h3a1 1 0 0 0 1-1v-4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v4a1 1 0 0 0 1 1h3a2 2 0 0 0 2-2v-7.586l.293.293a1 1 0 0 0 1.414-1.414Z"/>
          </svg>
          Home
        </a>
      </li>
      <li>
        <div class="flex items-center">
          <svg class="rtl:rotate-180 w-3 h-3 text-gray-400 mx-1" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 9 4-4-4-4"/>
          </svg>
          <a href="${pageContext.request.contextPath}/quizzes/${sessionScope.loggedInUser.userid}" class="ms-1 text-sm font-medium text-blue-800 hover:text-blue-600 dark:text-gray-900 dark:text-blue-400  md:ms-2 dark:text-gray-400 dark:hover:text-gray-400">My Quizzes</a>
        </div>
      </li>
      <li>
        <div class="flex items-center">
          <svg class="rtl:rotate-180 w-3 h-3 text-gray-400 mx-1" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 9 4-4-4-4"/>
          </svg>
          <a href="${pageContext.request.contextPath}/quizzes/${sessionScope.loggedInUser.userid}" class="ms-1 text-sm font-medium text-blue-800 hover:text-blue-600 dark:text-gray-900 dark:text-blue-400  md:ms-2 dark:text-gray-400 dark:hover:text-gray-400">${quiz.quizName}</a>
        </div>
      </li>
      <li>
          <div class="flex items-center">
            <svg class="rtl:rotate-180 w-3 h-3 text-gray-400 mx-1" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
              <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 9 4-4-4-4"/>
            </svg>
            <a href="${pageContext.request.contextPath}/quizzes/${sessionScope.loggedInUser.userid}" class="ms-1 text-sm font-medium text-blue-800 hover:text-blue-600 dark:text-gray-900 dark:text-blue-400  md:ms-2 dark:text-gray-400 dark:hover:text-gray-400">Questions</a>
          </div>
      </li>
    </ol>
  </nav>
  <nav class="text-base font-medium flex mb-4" aria-label="Breadcrumb">
          <ol class="inline-flex items-center space-x-1 md:space-x-2 rtl:space-x-reverse">
            <li class="inline-flex items-center">
              <a href="${pageContext.request.contextPath}/quizzes/${sessionScope.loggedInUser.userid}"
                 class="inline-flex items-center text-blue-800 hover:text-blue-600 dark:hover:text-gray-400 dark:text-gray-900 dark:text-blue-400
                        ${empty param.category ? 'text-lg underline font-extrabold dark:font-extrabold' : ''}">
                All(${quizCount})
              </a>
            </li>
            <c:forEach var="category" items="${categories}">
                <li>
                  <div class="flex items-center">
                    <a href="${pageContext.request.contextPath}/quizzes/${sessionScope.loggedInUser.userid}?category=${category.categoryName}"
                       class="ms-1 text-blue-800 hover:text-blue-600 dark:text-gray-900 dark:text-blue-400 md:ms-2 dark:text-gray-400 dark:hover:text-gray-400
                              ${category.categoryName == param.category ? 'text-lg underline font-extrabold dark:font-extrabold' : ''}">
                      ${category.categoryName}(${categoryCounts[category.categoryName] != null ? categoryCounts[category.categoryName] : 0})
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
                    <th class="border px-4 py-2">Option 1</th>
                    <th class="border px-4 py-2">Option 2</th>
                    <th class="border px-4 py-2">Option 3</th>
                    <th class="border px-4 py-2">Option 4</th>
                    <th class="border px-4 py-2">Correct Answer</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="question" items="${questions}">
                    <tr class="text-gray-800">
                        <td class="border px-4 py-2">${question.title}</td>
                        <td class="border px-4 py-2">${question.option1}</td>
                        <td class="border px-4 py-2">${question.option2}</td>
                        <td class="border px-4 py-2">${question.option3}</td>
                        <td class="border px-4 py-2">${question.option4}</td>
                        <td class="border px-4 py-2">${question.correctAnswer}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
</div>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sign Up</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/components/nav.jsp" %>
<form method = "post" action = "${pageContext.request.contextPath}/users/register" class="bg-white rounded-lg border-gray-200 dark:bg-gray-900 p-4 m-4 dark:border-gray-700 max-w-sm mx-auto" >
  <div class="mb-5">
      <label for="fullname" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Full Name</label>
      <input type="text" id="fullname" name = "fullname" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="full name" required />
    </div>
  <div class="mb-5">
    <label for="username" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Username</label>
    <input type="text" id="username" name = "username" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="username" required />
    <c:if test="${not empty errors.getFieldError('username')}">
          <span class="text-red-500">${errors.getFieldError('username').defaultMessage}</span>
    </c:if>
  </div>
  <div class="mb-5">
    <label for="password" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Password</label>
    <input type="password" id="password" name = "password"  class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" required />
     <c:if test="${not empty errors.getFieldError('password')}">
          <span class="text-red-500">${errors.getFieldError('password').defaultMessage}</span>
     </c:if>
  </div>
  <div class="mb-5">
      <label for="confirm-password" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Confirm Password</label>
      <input type="password" id="confirmPassword" name = "confirmPassword" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" required />
    </div>
  <button type="submit" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Sign Up</button>
</form>
</body>
</html>

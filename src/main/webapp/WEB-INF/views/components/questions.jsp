<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="bg-white rounded-lg py-4 antialiased dark:bg-gray-900 md:py-4">
  <p class="text-3xl font-bold mb-4 px-8 text-white">Questions</p>
  <div class="mx-auto max-w-screen-xl px-8 2xl:px-0">
      <div class="mt-6 w-full space-y-6">
        <div class="flow-root">
            <c:choose>
              <c:when test="${empty questions}">
                <p class="text-2xl font-bold mb-8 text-center text-white">No Questions Available</p>
              </c:when>
              <c:otherwise>
                <c:forEach var="question" items="${questions}">
                  <div class="-my-3 divide-y divide-gray-200 dark:divide-gray-800">
                    <dl class="flex items-center justify-between gap-4 py-3">
                        <dt class="text-lg font-medium text-gray-900 dark:text-white"><c:out value="${question.title}"/></dt>
                    </dl>
                    <dl class="flex items-center justify-start gap-4 py-1">
                      <dt class="font-medium text-gray-500 dark:text-gray-400">Option 1</dt>
                      <dd class="text-base font-medium text-gray-900 dark:text-white"><c:out value="${question.option1}"/></dd>
                    </dl>
                     <dl class="flex items-center justify-start gap-4 py-1">
                      <dt class="font-medium text-gray-500 dark:text-gray-400">Option 2</dt>
                      <dd class="text-base font-medium text-gray-900 dark:text-white"><c:out value="${question.option2}"/></dd>
                    </dl>
                    <dl class="flex items-center justify-start gap-4 py-1">
                      <dt class="font-medium text-gray-500 dark:text-gray-400">Option 3</dt>
                      <dd class="text-base font-medium text-gray-900 dark:text-white"><c:out value="${question.option3}"/></dd>
                    </dl>
                    <dl class="flex items-center justify-start gap-4 py-1">
                      <dt class="font-medium text-gray-500 dark:text-gray-400">Option 4</dt>
                      <dd class="text-base font-medium text-gray-900 dark:text-white"><c:out value="${question.option4}"/></dd>
                    </dl>
                    <dl class="flex items-center justify-start gap-4 py-2">
                      <dt class="font-medium text-gray-500 dark:text-gray-400">Correct Answer: </dt>
                      <dd class="text-base font-extrabold text-green-500"><c:out value="${question.correctAnswer}"/></dd>
                    </dl>
                  </div>
                </c:forEach>
              </c:otherwise>
            </c:choose>
        </div>
      </div>
    </div>
  </div>
</section>
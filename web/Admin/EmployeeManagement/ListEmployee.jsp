<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Employee</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body>

        <%@ include file="../AdminNav.jsp" %>
        <br>

        <div class="px-4 sm:px-6 lg:px-8">
            <div class="sm:flex sm:items-center">
                <div class="sm:flex-auto">
                    <h1 class="text-base font-semibold leading-6 text-gray-900">Employees</h1>
                    <p class="mt-2 text-sm text-gray-700">A list of all the users in your account including their name, title, email and role.</p>
                </div>
                <div class="mt-4 sm:ml-16 sm:mt-0 sm:flex-none">
                    <button type="button" class="block rounded-md bg-indigo-600 px-3 py-2 text-center text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
                        <a href="/ResortHub/Admin/EmployeeManagement/CreateEmployee.jsp"> Add Employee</a>
                    </button>
                </div>
            </div>
            <div class="mt-8 flow-root">
                <div class="-mx-4 -my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
                    <div class="inline-block min-w-full py-2 align-middle sm:px-6 lg:px-8">
                        <div class="overflow-hidden shadow ring-1 ring-black ring-opacity-5 sm:rounded-lg">
                            <table class="min-w-full divide-y divide-gray-300">
                                <thead class="bg-gray-50">
                                    <tr>
                                        <th scope="col" class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900 sm:pl-6">ID</th>
                                        <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Name</th>
                                        <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Birthday</th>
                                        <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Gender</th>
                                        <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Email</th>
                                        <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Phone number</th>

                                    </tr>
                                </thead>
                                <tbody class="divide-y divide-gray-200 bg-white">

                                    <c:forEach items="${employees}" var="c">

                                        <tr class="hover:bg-gray-200 ">

                                            <td class="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-gray-900 sm:pl-6">${c.id}</td>
                                            <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">${c.fullName}</td>
                                            <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">${c.birthDate}</td>
                                            <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">${c.gender}</td>
                                            <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">${c.email}</td>
                                            <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">${c.phoneNumber}</td>
                                            <td class="relative whitespace-nowrap py-4 pl-3 text-right text-sm font-medium sm:pr-6">
                                                <a href="/ResortHub/EmployeeController?action=getById&id=${c.id}" class="text-indigo-600 hover:text-indigo-900 cursor-pointer">
                                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                                                    <path stroke-linecap="round" stroke-linejoin="round" d="m16.862 4.487 1.687-1.688a1.875 1.875 0 1 1 2.652 2.652L10.582 16.07a4.5 4.5 0 0 1-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 0 1 1.13-1.897l8.932-8.931Zm0 0L19.5 7.125M18 14v4.75A2.25 2.25 0 0 1 15.75 21H5.25A2.25 2.25 0 0 1 3 18.75V8.25A2.25 2.25 0 0 1 5.25 6H10" />
                                                    </svg>

                                                </a>
                                            </td>
                                            <td class="relative whitespace-nowrap py-4 pr-4 text-right text-sm font-medium sm:pr-6">
                                                <a href="/ResortHub/EmployeeController?action=delete&id=${c.id}" class="text-red-600 hover:text-red-900 cursor-pointer">
                                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                                                    <path stroke-linecap="round" stroke-linejoin="round" d="m14.74 9-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 0 1-2.244 2.077H8.084a2.25 2.25 0 0 1-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 0 0-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 0 1 3.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 0 0-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 0 0-7.5 0" />
                                                    </svg>

                                                </a>
                                            </td>

                                        </tr>

                                    </c:forEach>

                                </tbody>
                            </table>

                        </div>

                        <!--Pagination-->
                        <nav class="flex items-center justify-between border-t border-gray-200 px-4 sm:px-0 mt-6">
                            <div class="-mt-px flex w-0 flex-1">
                                <c:if test="${meta.page > 1}">
                                    <a href='EmployeeController?action=getAll&Page=${meta.page - 1}&PageSize=10' class="inline-flex items-center border-t-2 border-transparent pr-1 pt-4 text-sm font-medium text-gray-500 hover:border-gray-300 hover:text-gray-700">
                                        <svg class="mr-3 h-5 w-5 text-gray-400" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                        <path fill-rule="evenodd" d="M18 10a.75.75 0 01-.75.75H4.66l2.1 1.95a.75.75 0 11-1.02 1.1l-3.5-3.25a.75.75 0 010-1.1l3.5-3.25a.75.75 0 111.02 1.1l-2.1 1.95h12.59A.75.75 0 0118 10z" clip-rule="evenodd" />
                                        </svg>
                                        Previous
                                    </a>
                                </c:if>
                            </div>

                            <div class="hidden md:-mt-px md:flex">
                                <c:forEach begin="1" end="${meta.pageCount}" varStatus="page">
                                    <c:choose>
                                        <c:when test="${page.index == meta.page}">
                                            <a href="#" class="inline-flex items-center border-t-2 border-indigo-500 px-4 pt-4 text-sm font-medium text-indigo-600" aria-current="page">${page.index}</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href='EmployeeController?action=getAll&Page=${page.index}&PageSize=10' class="inline-flex items-center border-t-2 border-transparent px-4 pt-4 text-sm font-medium text-gray-500 hover:border-gray-300 hover:text-gray-700">${page.index}</a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </div>

                            <div class="-mt-px flex w-0 flex-1 justify-end">
                                <c:if test="${meta.page < meta.pageSize && meta.page < meta.pageCount}">
                                    <a href='EmployeeController?action=getAll&Page=${meta.page + 1}&PageSize=10' class="inline-flex items-center border-t-2 border-transparent pl-1 pt-4 text-sm font-medium text-gray-500 hover:border-gray-300 hover:text-gray-700">
                                        Next
                                        <svg class="ml-3 h-5 w-5 text-gray-400" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                        <path fill-rule="evenodd" d="M2 10a.75.75 0 01.75-.75h12.59l-2.1-1.95a.75.75 0 111.02-1.1l3.5 3.25a.75.75 0 010 1.1l-3.5 3.25a.75.75 0 11-1.02-1.1l2.1-1.95H2.75A.75.75 0 012 10z" clip-rule="evenodd" />
                                        </svg>
                                    </a>
                                </c:if>
                            </div>
                        </nav>




                    </div>
                </div>
            </div>
        </div>
        <%@ include file="/layout/footer.jsp" %>
    </body>
</html>
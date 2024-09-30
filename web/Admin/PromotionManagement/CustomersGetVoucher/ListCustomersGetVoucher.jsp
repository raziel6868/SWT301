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

        <%@ include file="../../AdminNav.jsp" %>
        <br>

        <div class="px-4 sm:px-6 lg:px-8">
            <div class="sm:flex sm:items-center">
                <div class="sm:flex-auto">
                    <h1 class="text-base font-semibold leading-6 text-gray-900">Promotion</h1>
                    <p class="mt-2 text-sm text-gray-700">A list of all the users in your account including their name, title, email and role.</p>
                </div>
                <button type="button" class="mt-2 rounded-md bg-white px-2.5 py-1.5 text-sm font-semibold text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 hover:bg-gray-50">
                    <a href="/ResortHub/Admin/PromotionManagement/CustomersGetVoucher/CreateVouchers.jsp">Create voucher</a>
                </button>

            </div>
            <form class="block sm:flex gap-x-4 mt-4"
                  name="PromotionController"
                  method="POST"
                  action="/ResortHub/PromotionController?action=ListCustomersGetVoucher&Page=1&PageSize=10">
                <div>
                    <div class="">
                        <input
                            name="Year"
                            type="text"
                            placeholder="Year"
                            required
                            class="w-[200px] rounded border-0 py-1.5 px-4 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                            />
                    </div>
                </div>

                <div>
                    <div class="">
                        <input
                            name="Month"
                            type="text"
                            placeholder="Month"
                            required
                            class="w-[200px] rounded border-0 py-1.5 px-4 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                            />
                    </div>
                </div>
         

                <div>
                    <button
                        type="submit"
                        class="flex w-full justify-center rounded-sm bg-black px-3 py-2 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-gray-600 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
                        >
                        <span>View vouchers</span>
                    </button>

                </div>
            </form>
            <div class="px-4 sm:px-6 lg:px-8">

                <c:if test="${not empty useServices}">
                    <div class="mt-8 flow-root">
                        <div class="-mx-4 -my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
                            <div class="inline-block min-w-full py-2 align-middle sm:px-6 lg:px-8">
                                <table class="min-w-full divide-y divide-gray-300">
                                    <thead>
                                        <tr class="divide-x divide-gray-200">
                                            <th scope="col" class="py-3.5 pl-4 pr-4 text-left text-sm font-semibold text-gray-900 sm:pl-0">ID</th>
                                            <th scope="col" class="px-4 py-3.5 text-left text-sm font-semibold text-gray-900">Customer name</th>
                                            <th scope="col" class="px-4 py-3.5 text-left text-sm font-semibold text-gray-900">Voucher Type</th>
                                        </tr>
                                    </thead>
                                    <tbody class="divide-y divide-gray-200 bg-white">
                                        <c:forEach items="${useServices}" var="c">
                                            <tr class="divide-x divide-gray-200">
                                                <td class="whitespace-nowrap py-4 pl-4 pr-4 text-sm font-medium text-gray-900 sm:pl-0">${c.id}</td>
                                                <td class="whitespace-nowrap p-4 text-sm text-gray-500">${c.fullName}</td>
                                                <td class="whitespace-nowrap py-4 pl-4 pr-4 text-sm text-gray-500 sm:pr-0">${c.voucherType}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </c:if>


            </div>

        </div>

    </body>
</html>
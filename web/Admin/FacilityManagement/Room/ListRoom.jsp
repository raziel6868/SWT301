<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Villa Management</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body>

        <%@ include file="../../AdminNav.jsp" %>
        <br>

        <div class="px-4 sm:px-6 lg:px-8">
            <a href="/ResortHub/Admin/FacilityManagement/ListFacility.jsp" class="text-sm font-semibold leading-6 hover:text-indigo-500 text-gray-600"><span aria-hidden="true">←</span> Back to Facility main page</a>

            <main class="mx-auto max-w-2xl px-4 pb-24 pt-16 sm:px-6 lg:max-w-7xl lg:px-8">
                <h1 class="text-3xl font-bold tracking-tight text-gray-900 sm:text-4xl">Room Management</h1>

                <form class="mt-12 lg:grid lg:grid-cols-12 lg:items-start lg:gap-x-12 xl:gap-x-16">
                    <section aria-labelledby="cart-heading" class="lg:col-span-7">
                        <h2 id="cart-heading" class="sr-only">Items in your shopping cart</h2>

                        <ul role="list" class="divide-y divide-gray-200 border-b border-t border-gray-200">

                            <c:forEach items="${facilities}" var="c">

                                <li class="flex py-6 sm:py-10">
                                    <div class="flex-shrink-0">
                                        <img src="${c.imgSrc}" alt="Front of men&#039;s Basic Tee in sienna." class="h-24 w-24 rounded-md object-cover object-center sm:h-48 sm:w-48">
                                    </div>

                                    <div class="ml-4 flex flex-1 flex-col justify-between sm:ml-6">
                                        <div class="relative pr-9 sm:grid sm:grid-cols-2 sm:gap-x-6 sm:pr-0">
                                            <div>
                                                <div class="flex justify-between">
                                                    <h3 class="text-sm">
                                                        <a href="#" class="font-medium text-gray-700 hover:text-gray-800">${c.name}</a>
                                                    </h3>
                                                </div>
                                                <div class="mt-1 flex text-sm">
                                                    <p class="text-gray-500">${c.facilityType}</p>
                                                    <p class="ml-4 border-l border-gray-200 pl-4 text-gray-500">${c.rentType}</p>
                                                </div>
                                                <p class="mt-1 text-sm font-medium text-gray-900">$${c.rentalCost}</p>
                                            </div>

                                            <div class="mt-4 sm:mt-0 sm:pr-9">
                                                <label for="quantity-0" class="sr-only">Quantity, Basic Tee</label>
                                                <select id="quantity-0" name="quantity-0" class="max-w-full rounded-md border border-gray-300 py-1.5 text-left text-base font-medium leading-5 text-gray-700 shadow-sm focus:border-indigo-500 focus:outline-none focus:ring-1 focus:ring-indigo-500 sm:text-sm">

                                                    <c:forEach begin="1" end="${c.maxOccupancy}" varStatus="loop">
                                                        <option value="${loop.index}">${loop.index}</option>
                                                    </c:forEach>
                                                </select>

                                                <div class="absolute right-0 top-0">
                                                    <button type="button" class="-m-2 inline-flex p-2 text-gray-400 hover:text-gray-500">
                                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
                                                        <path stroke-linecap="round" stroke-linejoin="round" d="m16.862 4.487 1.687-1.688a1.875 1.875 0 1 1 2.652 2.652L10.582 16.07a4.5 4.5 0 0 1-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 0 1 1.13-1.897l8.932-8.931Zm0 0L19.5 7.125M18 14v4.75A2.25 2.25 0 0 1 15.75 21H5.25A2.25 2.25 0 0 1 3 18.75V8.25A2.25 2.25 0 0 1 5.25 6H10" />
                                                        </svg>


                                                    </button>
                                                    <button type="button" class="-m-2 inline-flex p-2 text-gray-400 hover:text-gray-500">
                                                        <span class="sr-only">Remove</span>
                                                        <svg class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                                        <path d="M6.28 5.22a.75.75 0 00-1.06 1.06L8.94 10l-3.72 3.72a.75.75 0 101.06 1.06L10 11.06l3.72 3.72a.75.75 0 101.06-1.06L11.06 10l3.72-3.72a.75.75 0 00-1.06-1.06L10 8.94 6.28 5.22z" />
                                                        </svg>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>

                                        <p class="mt-4 flex space-x-2 text-sm text-gray-700">
                                            <svg class="h-5 w-5 flex-shrink-0 text-green-500" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                            <path fill-rule="evenodd" d="M16.704 4.153a.75.75 0 01.143 1.052l-8 10.5a.75.75 0 01-1.127.075l-4.5-4.5a.75.75 0 011.06-1.06l3.894 3.893 7.48-9.817a.75.75 0 011.05-.143z" clip-rule="evenodd" />
                                            </svg>
                                            <span>Available</span>
                                        </p>
                                    </div>
                                </li>



                            </c:forEach>

                        </ul>
                        <div class="flex items-center justify-between border-t border-gray-200 bg-white px-4 py-3 sm:px-6">
                            <div class="flex flex-1 justify-between sm:hidden">
                                <c:if test="${meta.page > 1}">

                                    <a href='FacilityController?action=getAll&facilityType=room&Page=${meta.page - 1}&PageSize=10' class="relative inline-flex items-center rounded-md border border-gray-300 bg-white px-4 py-2 text-sm font-medium text-gray-700 hover:bg-gray-50">Previous</a>
                                </c:if>
                                <c:if test="${meta.page < meta.pageSize && meta.page < meta.pageCount}">
                                    <a href='FacilityController?action=getAll&facilityType=room&Page=${meta.page + 1}&PageSize=10' class="relative ml-3 inline-flex items-center rounded-md border border-gray-300 bg-white px-4 py-2 text-sm font-medium text-gray-700 hover:bg-gray-50">Next</a>
                                </c:if>
                            </div>
                            <div class="hidden sm:flex sm:flex-1 sm:items-center sm:justify-between">
                                <div>
                                    <p class="text-sm text-gray-700">
                                        Showing page
                                        <span class="font-medium">${meta.page}</span>

                                        of
                                        <span class="font-medium">${meta.itemCount}</span>
                                        results
                                    </p>
                                </div>
                                <div>
                                    <nav class="isolate inline-flex -space-x-px rounded-md shadow-sm" aria-label="Pagination">
                                        <c:forEach begin="1" end="${meta.pageCount}" varStatus="page">
                                            <c:choose>
                                                <c:when test="${page.index == meta.page}">
                                                    <a href="#" aria-current="page" class="relative z-10 inline-flex items-center bg-indigo-600 px-4 py-2 text-sm font-semibold text-white focus:z-20 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">${page.index}</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href='FacilityController?action=getAll&facilityType=room&Page=${page.index}&PageSize=10' class="relative inline-flex items-center px-4 py-2 text-sm font-semibold text-gray-900 ring-1 ring-inset ring-gray-300 hover:bg-gray-50 focus:z-20 focus:outline-offset-0">${page.index}</a>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </section>


                    <!-- Order summary -->
                    <section aria-labelledby="summary-heading" class="mt-16 rounded-lg bg-gray-50 px-4 py-6 sm:p-6 lg:col-span-5 lg:mt-0 lg:p-8">
                        <h2 id="summary-heading" class="text-lg font-medium text-gray-900">Room Management summary</h2>

                        <dl class="mt-6 space-y-4">

                            <div class="flex items-center justify-between border-t border-gray-200 pt-4">
                                <dt class="text-base font-medium text-gray-900">Total Facility</dt>
                                <dd class="text-base font-medium text-gray-900">${facilities.size()}</dd>
                            </div>
                        </dl>

                        <div class="mt-6">
                            <a href="/ResortHub/Admin/FacilityManagement/Room/CreateRoom.jsp">
                                <button type="button" class="w-full rounded-md border border-transparent bg-indigo-600 px-4 py-3 text-base font-medium text-white shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 focus:ring-offset-gray-50">Add Room</button>
                            </a>
                        </div>
                    </section>
                </form>

            </main>
        </div>
        <%@ include file="/layout/footer.jsp" %>
    </body>
</html>
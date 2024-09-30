<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Booking History</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body>

        <jsp:include page="../../layout/header.jsp"/> 
        <br>

        <div class="px-4 sm:px-6 lg:px-8">

            <div class="bg-white">
                <div class="mx-auto max-w-3xl px-4 py-12 sm:px-6 sm:py-16 lg:px-8">
                    <div class="max-w-xl">
                        <h1 class="text-base font-medium text-indigo-600">Story details</h1>
                        <p class="mt-2 text-base text-gray-500">Posted on ${story.postDate} by ${story.customerName}.</p>

                    </div>

                    <div class="mt-10 border-t border-gray-200">
                        <h2 class="sr-only">Your order</h2>

                        <h3 class="sr-only">Items</h3>
                        <div class="flex space-x-6 border-b border-gray-200 py-10">

                            <div class="flex flex-auto flex-col">
                                <div>
                                    <h4 class="font-medium text-gray-900">
                                        <a href="#">${story.title}</a>
                                    </h4>
                                    <p class="mt-2 text-sm text-gray-600">${story.description}</p>
                                </div>
                                <div class="mt-6 flex flex-1 items-end">
                                    <dl class="flex space-x-4 divide-x divide-gray-200 text-sm sm:space-x-6">
                                        <div class="flex">
                                            <dt class="font-medium text-gray-900">Status</dt>
                                            <dd class="ml-2 text-gray-700">${story.customerStatus}</dd>
                                        </div>
                                        <div class="flex pl-4 sm:pl-6">
                                            <dt class="font-medium text-gray-900">Service used</dt>
                                            <dd class="ml-2 text-gray-700">${story.facilityName}</dd>
                                        </div>
                                    </dl>
                                </div>
                            </div>
                        </div>

                        <div class="sm:ml-40 sm:pl-6">
                            <h3 class="sr-only">Your information</h3>


                            <dl class="grid grid-cols-2 gap-x-6 py-10 text-sm">
                                <div>
                                    <dt class="font-medium text-gray-900">Customer ID</dt>
                                    <dd class="mt-2 text-gray-700">
                                        <address class="not-italic">
                                            <span class="block">${story.customerId}</span>

                                        </address>
                                    </dd>
                                </div>
                                <div>
                                    <dt class="font-medium text-gray-900">Facility ID</dt>
                                    <dd class="mt-2 text-gray-700">
                                        <address class="not-italic">
                                            <span class="block">${story.facilityId}</span>

                                        </address>
                                    </dd>
                                </div>
                            </dl>



                        </div>
                    </div>


                </div>

            </div>    </div>


    </body>
</html>
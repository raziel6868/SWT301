
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdn.tailwindcss.com"></script>
        <title>JSP Page</title>

    </head>
    <body>

        <div class="flex min-h-full flex-1 flex-col justify-center py-12 p-0">
            <div class="sm:mx-auto sm:w-full sm:max-w-sm">
                <img class="mx-auto h-12 w-auto" src="https://github.com/jpeseWang/ResortHub_Servlet/blob/main/web/assets/images/logo.png?raw=true" alt="Your Company" />
                <h2 class="mt-4 text-center text-3xl font-bold tracking-tight text-gray-900">
                    Create customer voucher
                </h2>
            </div>

            <div class="mt-10 sm:mx-auto sm:w-full sm:max-w-sm">
                <form class="space-y-4"  
                      name="PromotionController"
                      method="POST"
                      action="/ResortHub/PromotionController?action=CreateVouchers">
                    <div>
                        <input class="hidden" name="Month" id="currentMonth" />
                        <input class="hidden" name="Year" id="currentYear" />
                        <div class="mt-2">
                            <input

                                name="NumTenPercentDiscountVouchers"
                                type="text"

                                placeholder="Number 10% DiscountVouchers"
                                required
                                class="block w-full rounded border-0 py-1.5 px-4 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                                />
                        </div>
                    </div>

                    <div>
                        <div class="">
                            <input

                                name="NumTwentyPercentDiscountVouchers"
                                type="text"

                                placeholder="Number of 20% DiscountVouchers"
                                required
                                class="block w-full rounded border-0 py-1.5 px-4 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                                />

                        </div>
                    </div>

                    <div>
                        <div class="">
                            <input

                                name="NumFiftyPercentDiscountVouchers"
                                type="text"

                                placeholder="Number of 50% DiscountVouchers"
                                required
                                class="block w-full rounded border-0 py-1.5 px-4 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                                />

                            <span class="text-red-400 font-medium text-base">${requestScope.error}</span>


                        </div>
                    </div>

                    <div>
                        <button
                            type="submit"
                            class="flex w-full justify-center rounded-sm bg-black px-3 py-2 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-gray-600 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
                            >

                            <span>Create</span>
                        </button>
                    </div>
                </form>

            </div>
        </div>
        <script>
            // Get the current date
            var currentDate = new Date();

            // Get the current month and year
            var currentMonth = currentDate.getMonth() + 1; // JavaScript months are zero-based, so we add 1
            var currentYear = currentDate.getFullYear();

            // Set the values of the input fields
            document.getElementById('currentMonth').value = currentMonth;
            document.getElementById('currentYear').value = currentYear;
        </script>
    </body>
</html>

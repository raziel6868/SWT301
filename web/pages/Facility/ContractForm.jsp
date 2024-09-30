<%-- 
    Document   : MarketPlace
    Created on : Jan 30, 2024, 11:39:22 PM
    Author     : jpesewang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdn.tailwindcss.com"></script>
        <title>Facility Details</title>
        <script src="pages/Facility/MarketplaceScript.js"></script>
        <script>
            // Get the current date
            var currentDate = new Date();

            // Format the date to yyyy-mm-dd
            var year = currentDate.getFullYear();
            var month = ('0' + (currentDate.getMonth() + 1)).slice(-2); // Adding 1 to month since it's zero-indexed
            var day = ('0' + currentDate.getDate()).slice(-2);
            var formattedDate = year + '-' + month + '-' + day;

            // Set the formatted date as the value of BookingDate input field
            window.onload = function () {
                document.getElementsByName('BookingDate')[0].value = formattedDate;
            };
        </script>
    </head>
    <body>
        <script type="text/javascript"><%@include file="MarketplaceScript.js" %></script>

        <%@ include file="/layout/header.jsp" %>
        <c:set var="c" value="${totalPrice}"/>
        <c:set var="e" value="${bookingID}"/>
        <div class="bg-white">
            <div class="mx-auto max-w-2xl px-4 py-16 sm:px-6 sm:py-24 lg:grid lg:max-w-7xl lg:grid-cols-2 lg:gap-x-8 lg:px-8">
                <!-- Product details -->
                <div class="lg:max-w-lg lg:self-end">
                    <nav aria-label="Breadcrumb">
                        <ol role="list" class="flex items-center space-x-2">
                            <li>
                                <div class="flex items-center text-sm">
                                    <a href="#" class="font-medium text-gray-500 hover:text-gray-900">Facility Contract </a>
                                    <svg viewBox="0 0 20 20" fill="currentColor" aria-hidden="true" class="ml-2 h-5 w-5 flex-shrink-0 text-gray-300">
                                    <path d="M5.555 17.776l8-16 .894.448-8 16-.894-.448z" />
                                    </svg>
                                </div>
                            </li>

                        </ol>
                    </nav>

                    <div class="mt-4">
                        <h1 class="text-3xl font-bold tracking-tight text-gray-900 sm:text-4xl">Create contract</h1>
                    </div>

                    <section aria-labelledby="information-heading" class="mt-4">
                        <h2 id="information-heading" class="sr-only">Product information</h2>

                        <div class="mt-4 space-y-6">
                            <p class="text-base text-gray-500">

                                Facility ID

                            </p>
                        </div>

                        <div class="mt-6 flex items-center">
                            <svg class="h-5 w-5 flex-shrink-0 text-green-500" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                            <path fill-rule="evenodd" d="M16.704 4.153a.75.75 0 01.143 1.052l-8 10.5a.75.75 0 01-1.127.075l-4.5-4.5a.75.75 0 011.06-1.06l3.894 3.893 7.48-9.817a.75.75 0 011.05-.143z" clip-rule="evenodd" />
                            </svg>
                            <p class="ml-2 text-sm text-gray-500">In stock and ready to sign</p>
                        </div>
                    </section>
                </div>

                <!-- Product image -->
                <div class="mt-10 lg:col-start-2 lg:row-span-2 lg:mt-0 lg:self-center">
                    <div class="aspect-h-1 aspect-w-1 overflow-hidden rounded-lg">
                        <img src="https://plus.unsplash.com/premium_photo-1661752229232-96232a11c62b?q=80&w=2340&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="Model wearing light green backpack with black canvas straps and front zipper pouch." class="h-full w-full object-cover object-center">
                    </div>
                </div>

                <!-- Product form -->
                <div class="mt-10 lg:col-start-1 lg:row-start-2 lg:max-w-lg lg:self-start">
                    <section aria-labelledby="options-heading">
                        <h2 id="options-heading" class="sr-only">Product options</h2>


                        <form 
                            name="BookingController"
                            method="POST"
                            action="/ResortHub/BookingController?action=createContract">
                            <input class="hidden" value="${bookingIDs}" name="BookingIds"/>
                            <input class="hidden" value="${totalPrice}" name="TotalAmount"/>

                            <div>Booking ID: ${bookingIDs}</div>

                            
                                <input
                                    type="text"
                                    name="Deposit"
                                    placeholder="Deposit ($)"
                                    required
                                    class="block w-1/2 rounded border-0 py-1.5 px-4 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6 my-4"
                                    />
                            <dl class="mt-6 space-y-4">

                                <div class="flex items-center justify-between border-t border-gray-200 pt-4">
                                    <dt class="text-base font-medium text-gray-900">Total fee</dt>
                                    <dd class="text-base font-medium text-gray-900">${totalPrice}$</dd>
                                </div>
                            </dl>

                            <div class="mt-4">
                                <a href="#" class="group inline-flex text-sm text-gray-500 hover:text-gray-700">
                                    <span>Have question about contract term?</span>
                                    <svg class="ml-2 h-5 w-5 flex-shrink-0 text-gray-400 group-hover:text-gray-500" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                    <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zM8.94 6.94a.75.75 0 11-1.061-1.061 3 3 0 112.871 5.026v.345a.75.75 0 01-1.5 0v-.5c0-.72.57-1.172 1.081-1.287A1.5 1.5 0 108.94 6.94zM10 15a1 1 0 100-2 1 1 0 000 2z" clip-rule="evenodd" />
                                    </svg>
                                </a>
                            </div>
                            <div class="mt-10">
                                <button type="submit" class="flex w-full items-center justify-center rounded-md border border-transparent bg-indigo-600 px-8 py-3 text-base font-medium text-white hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 focus:ring-offset-gray-50">Create contract</button>
                            </div>
                            <div class="mt-6 text-center">
                                <a href="#" class="group inline-flex text-base font-medium">
                                    <svg class="mr-2 h-6 w-6 flex-shrink-0 text-gray-400 group-hover:text-gray-500" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M9 12.75L11.25 15 15 9.75m-3-7.036A11.959 11.959 0 013.598 6 11.99 11.99 0 003 9.749c0 5.592 3.824 10.29 9 11.623 5.176-1.332 9-6.03 9-11.622 0-1.31-.21-2.571-.598-3.751h-.152c-3.196 0-6.1-1.248-8.25-3.285z" />
                                    </svg>
                                    <span class="text-gray-500 hover:text-gray-700">Lifetime Guarantee</span>
                                </a>
                            </div>
                        </form>
                    </section>
                </div>
            </div>
        </div>



        <%@ include file="/layout/footer.jsp" %>


    </body>
</html>

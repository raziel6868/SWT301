

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

        </script>
    </head>
    <body>
        <script type="text/javascript"><%@include file="MarketplaceScript.js" %></script>

        <%@ include file="/layout/header.jsp" %>
        <c:set var="c" value="${facility}"/>
        <div class="bg-white">
            <div class="mx-auto max-w-2xl px-4 py-16 sm:px-6 sm:py-24 lg:max-w-7xl lg:px-8">
                <div class="lg:grid lg:grid-cols-2 lg:items-start lg:gap-x-8">
                    <!-- Image gallery -->
                    <div class="flex flex-col-reverse">
                        <!-- Image selector -->
                        <div class="mx-auto mt-6 hidden w-full max-w-2xl sm:block lg:max-w-none">
                            <div class="grid grid-cols-4 gap-6" aria-orientation="horizontal" role="tablist">
                                <button id="tabs-1-tab-1" class="relative flex h-24 cursor-pointer items-center justify-center rounded-md bg-white text-sm font-medium uppercase text-gray-900 hover:bg-gray-50 focus:outline-none focus:ring focus:ring-opacity-50 focus:ring-offset-4" aria-controls="tabs-1-panel-1" role="tab" type="button">
                                    <span class="sr-only">Angled view</span>
                                    <span class="absolute inset-0 overflow-hidden rounded-md">
                                        <img src="${c.imgSrc}" alt="" class="h-full w-full object-cover object-center">
                                    </span>
                                    <!-- Selected: "ring-indigo-500", Not Selected: "ring-transparent" -->
                                    <span class="ring-transparent pointer-events-none absolute inset-0 rounded-md ring-2 ring-offset-2" aria-hidden="true"></span>
                                </button>

                            </div>
                        </div>

                        <div class="">
                            <div id="tabs-1-panel-1" aria-labelledby="tabs-1-tab-1" role="tabpanel" tabindex="0">
                                <img src="${c.imgSrc}" alt="Angled front view with bag zipped and handles upright." class="h-full w-full object-cover object-center sm:rounded-lg max-h-[524px]">
                            </div>


                        </div>
                    </div>

                    <!-- Product info -->
                    <div class="mt-10 px-4 sm:mt-16 sm:px-0 lg:mt-0">
                        <h1 class="text-3xl font-bold tracking-tight text-gray-900">${c.name}</h1>

                        <div class="mt-3">
                            <h2 class="sr-only">Product information</h2>
                            <p class="text-3xl tracking-tight text-gray-900">$${c.rentalCost}</p>
                        </div>



                        <div class="mt-6">
                            <h3 class="sr-only">Description</h3>

                            <div class="space-y-6 text-base text-gray-700">
                                <p>As you approach the gated entrance, a winding cobblestone driveway leads you through meticulously manicured gardens adorned with vibrant blooms and fragrant herbs. Tall cypress trees stand sentinel along the path, guiding you to the grand entrance of the villa.</p>
                            </div>
                        </div>

                        <div class="mt-10">
                            <h3 class="text-sm font-medium text-gray-900">Highlights</h3>

                            <div class="mt-4">
                                <ul role="list" class="list-disc space-y-2 pl-4 text-sm">
                                    <li class="text-gray-400"><span class="text-gray-600">Area: ${c.area} m2</span></li>
                                    <li class="text-gray-400"><span class="text-gray-600">$Rent type: ${c.rentType}</span></li>
                                    <li class="text-gray-400"><span class="text-gray-600">Facility type: ${c.facilityType}</span></li>

                                </ul>
                            </div>
                        </div>

                        <form class="mt-6"
                              name="BookingController"
                              method="POST"
                              action="/ResortHub/BookingController?action=createBooking&total=${c.rentalCost}">
                            <input name="BookingDate" class="hidden"/>
                            <input name="FacilityId" value="${c.id}" class="hidden"/>


                            <c:if test="${sessionScope.User.userRole == UserRole.User}">
                                <div>
                                    <input name="CustomerId" value="${sessionScope.User.customerId}" class="hidden"/>
                                </div>
                            </c:if>
                            <c:if test="${sessionScope.User.userRole == UserRole.Admin}">
                                <div>
                                    <h3 class="text-sm font-medium text-gray-900">Customer ID</h3>

                                    <select id="quantity-0" name="CustomerId" 
                                            class="block w-[220px] h-[38px] rounded border-0 py-1.5 px-4 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6 my-4">
                                        <c:forEach items="${customers}" var="cus">
                                            <option value="${cus.id}">${cus.id}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </c:if>


                            <div>
                                <h3 class="text-sm font-medium text-gray-900">Occupancy Quantity</h3>
                                <select id="quantity-0" name="Occupancy" 
                                        class="block w-[220px] h-[38px] rounded border-0 py-1.5 px-4 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6 my-4">

                                    <c:forEach begin="1" end="${c.maxOccupancy}" varStatus="loop">
                                        <option value="${loop.index}">${loop.index}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div>
                                <h3 class="text-sm font-medium text-gray-900">Check in date</h3>
                                <input
                                    type="date"
                                    name="StartDate"
                                    required
                                    class="block w-[220px] rounded border-0 py-1.5 px-4 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6 my-4"
                                    />
                            </div>

                            <div>
                                <h3 class="text-sm font-medium text-gray-900">Check out date</h3>
                                <input
                                    type="date"
                                    name="EndDate"
                                    required
                                    class="block w-[220px]  rounded border-0 py-1.5 px-4 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6 my-4"
                                    />
                            </div>

                            <div class="mt-10 flex">
                                <button type="submit" class="flex max-w-xs flex-1 items-center justify-center rounded-md border border-transparent bg-indigo-600 px-8 py-3 text-base font-medium text-white hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 focus:ring-offset-gray-50 sm:w-full">Book now</button>

                                <button type="button" class="ml-4 flex items-center justify-center rounded-md px-3 py-3 text-gray-400 hover:bg-gray-100 hover:text-gray-500">
                                    <svg class="h-6 w-6 flex-shrink-0" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12z" />
                                    </svg>
                                    <span class="sr-only">Add to favorites</span>
                                </button>
                            </div>
                        </form>

                        <section aria-labelledby="details-heading" class="mt-12">
                            <h2 id="details-heading" class="sr-only">Additional details</h2>

                            <div class="divide-y divide-gray-200 border-t">
                                <div>
                                    <h3>
                                        <!-- Expand/collapse question button -->
                                        <button type="button" class="group relative flex w-full items-center justify-between py-6 text-left" aria-controls="disclosure-1" aria-expanded="false">
                                            <!-- Open: "text-indigo-600", Closed: "text-gray-900" -->
                                            <span class="text-gray-900 text-sm font-medium">Features</span>
                                            <span class="ml-6 flex items-center">
                                                <!-- Open: "hidden", Closed: "block" -->
                                                <svg class="block h-6 w-6 text-gray-400 group-hover:text-gray-500" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
                                                <path stroke-linecap="round" stroke-linejoin="round" d="M12 4.5v15m7.5-7.5h-15" />
                                                </svg>
                                                <!-- Open: "block", Closed: "hidden" -->
                                                <svg class="hidden h-6 w-6 text-indigo-400 group-hover:text-indigo-500" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
                                                <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 12h-15" />
                                                </svg>
                                            </span>
                                        </button>
                                    </h3>
                                    <div class="prose prose-sm pb-6" id="disclosure-1">
                                        <ul role="list">
                                            <li>Multiple strap configurations</li>

                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>



                <!-- Feedback   -->
                <div class="mx-12">  
                    <div class="bg-white">
                        <div class="mx-auto max-w-2xl px-4 py-16 sm:px-6 sm:py-24 lg:max-w-7xl lg:px-8">
                            <h2 class="text-lg font-medium text-gray-900">Recent reviews</h2>
                            <div class="mt-6 space-y-10 divide-y divide-gray-200 border-b border-t border-gray-200 pb-10">

                                <c:forEach items="${feedback}" var="fb">
                                    <div class="pt-10 lg:grid lg:grid-cols-12 lg:gap-x-8">
                                        <div class="lg:col-span-8 lg:col-start-5 xl:col-span-9 xl:col-start-4 xl:grid xl:grid-cols-3 xl:items-start xl:gap-x-8">
                                            <div class="flex items-center xl:col-span-1">
                                                <div class="flex items-center">

                                                    <c:forEach begin="1" end="${fb.starRating}" varStatus="loop">
                                                        <svg class="text-yellow-400 h-5 w-5 flex-shrink-0" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                                        <path fill-rule="evenodd" d="M10.868 2.884c-.321-.772-1.415-.772-1.736 0l-1.83 4.401-4.753.381c-.833.067-1.171 1.107-.536 1.651l3.62 3.102-1.106 4.637c-.194.813.691 1.456 1.405 1.02L10 15.591l4.069 2.485c.713.436 1.598-.207 1.404-1.02l-1.106-4.637 3.62-3.102c.635-.544.297-1.584-.536-1.65l-4.752-.382-1.831-4.401z" clip-rule="evenodd" />
                                                        </svg>
                                                    </c:forEach>
                                                    <c:forEach begin="1" end="${5 - fb.starRating}" varStatus="loop">
                                                        <svg class="h-5 w-5 flex-shrink-0 text-gray-300" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                                        <path fill-rule="evenodd" d="M10.868 2.884c-.321-.772-1.415-.772-1.736 0l-1.83 4.401-4.753.381c-.833.067-1.171 1.107-.536 1.651l3.62 3.102-1.106 4.637c-.194.813.691 1.456 1.405 1.02L10 15.591l4.069 2.485c.713.436 1.598-.207 1.404-1.02l-1.106-4.637 3.62-3.102c.635-.544.297-1.584-.536-1.65l-4.752-.382-1.831-4.401z" clip-rule="evenodd" />
                                                        </svg>
                                                    </c:forEach>

                                                </div>
                                                <p class="ml-3 text-sm text-gray-700">${fb.starRating}<span class="sr-only"> out of 5 stars</span></p>
                                            </div>

                                            <div class="mt-4 lg:mt-6 xl:col-span-2 xl:mt-0">
                                                <!--                                                <h3 class="text-sm font-medium text-gray-900">Can&#039;t say enough good things</h3>-->

                                                <div class="mt-3 space-y-6 text-sm text-gray-500">
                                                    <p>${fb.description}</p>

                                                </div>
                                            </div>
                                        </div>

                                        <div class="mt-6 flex items-center text-sm lg:col-span-4 lg:col-start-1 lg:row-start-1 lg:mt-0 lg:flex-col lg:items-start xl:col-span-3">
                                            <p class="font-medium text-gray-900">${fb.customerName}</p>

                                        </div>
                                    </div>
                                </c:forEach>

                            </div>
                        </div>
                    </div>



                </div>


            </div>

        </div>
        <script>
            var currentDate = new Date();

            // Format the date to yyyy-mm-dd
            var year = currentDate.getFullYear();
            var month = ('0' + (currentDate.getMonth() + 1)).slice(-2);
            var day = ('0' + currentDate.getDate()).slice(-2);
            var formattedDate = year + '-' + month + '-' + day;

            function validateDates() {
                var startDate = document.getElementsByName('StartDate')[0].value;
                var endDate = document.getElementsByName('EndDate')[0].value;


                var today = new Date();
                var startDateObj = new Date(startDate);
                var endDateObj = new Date(endDate);


                if (startDateObj < today) {
                    alert("Check-in date cannot be in the past.");
                    return false;
                }


                if (endDateObj < today) {
                    alert("Check-out date cannot be in the past.");
                    return false;
                }


                if (startDateObj >= endDateObj) {
                    alert("Check-out date must be after the check-in date.");
                    return false;
                }

                if (endDateObj < startDateObj) {
                    alert("Check-in date must be less the check-in date.");
                    return false;
                }

                return true;
            }


            window.onload = function () {
                var currentDate = new Date();
                var year = currentDate.getFullYear();
                var month = ('0' + (currentDate.getMonth() + 1)).slice(-2);
                var day = ('0' + currentDate.getDate()).slice(-2);
                var formattedDate = year + '-' + month + '-' + day;
                document.getElementsByName('BookingDate')[0].value = formattedDate;
            };



        </script>


        <%@ include file="/layout/footer.jsp" %>


    </body>
</html>

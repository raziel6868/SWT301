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


        <br>
        <jsp:include page="../layout/header.jsp"/>  
        <div class="px-4 sm:px-6 lg:px-8">

            <div class="bg-white">
                <div class="mx-auto max-w-3xl px-4 py-12 sm:px-6 sm:py-16 lg:px-8">
                    <div class="max-w-xl">
                        <h1 class="text-base font-medium text-indigo-600">Thank you!</h1>
                        <p class="mt-2 text-4xl font-bold tracking-tight sm:text-5xl">It's on the way!</p>
                        <p class="mt-2 text-base text-gray-500">Your booking #${booking.id} has ordered successfully.</p>

                    </div>

                    <div class="mt-10 border-t border-gray-200">
                        <h2 class="sr-only">Your order</h2>

                        <h3 class="sr-only">Items</h3>
                        <div class="flex space-x-6 border-b border-gray-200 py-10">
                            <img src="${booking.imgSrc}" alt="Glass bottle with black plastic pour top and mesh insert." class="h-20 w-20 flex-none rounded-lg bg-gray-100 object-cover object-center sm:h-40 sm:w-40">
                            <div class="flex flex-auto flex-col">
                                <div>
                                    <h4 class="font-medium text-gray-900">
                                        <a href="#">Cold Brew Bottle</a>
                                    </h4>
                                    <p class="mt-2 text-sm text-gray-600">Booking placed on ${booking.bookingDate}</p>
                                </div>
                                <div class="mt-6 flex flex-1 items-end">
                                    <dl class="flex space-x-4 divide-x divide-gray-200 text-sm sm:space-x-6">
                                        <div class="flex">
                                            <dt class="font-medium text-gray-900">Quantity</dt>
                                            <dd class="ml-2 text-gray-700">${booking.occupancy}</dd>
                                        </div>
                                        <div class="flex pl-4 sm:pl-6">
                                            <dt class="font-medium text-gray-900">Price</dt>
                                            <dd class="ml-2 text-gray-700">$${booking.rentalCost}</dd>
                                        </div>
                                    </dl>
                                </div>
                            </div>
                        </div>

                        <div class="sm:ml-40 sm:pl-6">
                            <h3 class="sr-only">Your information</h3>

                            <h4 class="sr-only">Addresses</h4>
                            <dl class="grid grid-cols-2 gap-x-6 py-10 text-sm">
                                <div>
                                    <dt class="font-medium text-gray-900">Customer ID</dt>
                                    <dd class="mt-2 text-gray-700">
                                        <address class="not-italic">
                                            <span class="block">${booking.customerId}</span>

                                        </address>
                                    </dd>
                                </div>
                                <div>
                                    <dt class="font-medium text-gray-900">Facility ID</dt>
                                    <dd class="mt-2 text-gray-700">
                                        <address class="not-italic">
                                            <span class="block">${booking.facilityId}</span>

                                        </address>
                                    </dd>
                                </div>
                            </dl>

                            <h4 class="sr-only">Payment</h4>
                            <dl class="grid grid-cols-2 gap-x-6 border-t border-gray-200 py-10 text-sm">
                                <div>
                                    <dt class="font-medium text-gray-900">Start date</dt>
                                    <dd class="mt-2 text-gray-700">
                                        <p>${booking.startDate}</p>

                                    </dd>
                                </div>
                                <div>
                                    <dt class="font-medium text-gray-900">End date</dt>
                                    <dd class="mt-2 text-gray-700">
                                        <p>${booking.endDate}</p>

                                    </dd>
                                </div>
                            </dl>

                            <h3 class="sr-only">Summary</h3>

                            <dl class="space-y-6 border-t border-gray-200 pt-10 text-sm">
                                <!--                                <div class="flex justify-between">
                                                                    <dt class="font-medium text-gray-900">Subtotal</dt>
                                                                    <dd class="text-gray-700">$36.00</dd>
                                                                </div>
                                                                <div class="flex justify-between">
                                                                    <dt class="flex font-medium text-gray-900">
                                                                        Discount
                                                                        <span class="ml-2 rounded-full bg-gray-200 px-2 py-0.5 text-xs text-gray-600">STUDENT50</span>
                                                                    </dt>
                                                                    <dd class="text-gray-700">-$18.00 (50%)</dd>
                                                                </div>
                                                                <div class="flex justify-between">
                                                                    <dt class="font-medium text-gray-900">Shipping</dt>
                                                                    <dd class="text-gray-700">$5.00</dd>
                                                                </div>-->
                                <div class="flex justify-between">
                                    <dt class="font-medium text-gray-900">Total</dt>
                                    <dd class="text-gray-900">$${booking.rentalCost * booking.occupancy}</dd>
                                </div>
                            </dl>
                        </div>
                    </div>


                </div>

                <!-- Feedback   -->
                <div class="mx-12">  
                    <form 
                        name="BookingController"
                        method="POST"
                        action="/ResortHub/FacilityController?action=createCustomerFeedback"
                        >
                        <input name="BookingId" value="${booking.id}" class="hidden"/>
                        <input name="FacilityId" value="${booking.facilityId}" class="hidden"/>
                        <div>
                            <div class="flex items-center" aria-orientation="horizontal" role="tablist">

                                <button id="tabs-1-tab-1" class="bg-white text-gray-500 hover:bg-gray-100 hover:text-gray-900 rounded-md border border-transparent px-3 py-1.5 text-sm font-medium" aria-controls="tabs-1-panel-1" role="tab" type="button">Feedback about this Facility</button>
                            </div>
                            <div class="mt-2">
                                <div id="tabs-1-panel-1" class="-m-0.5 rounded-lg p-0.5" aria-labelledby="tabs-1-tab-1" role="tabpanel" tabindex="0">
                                    <label for="comment" class="sr-only">Comment</label>
                                    <div class="flex items-center"> 
                                        <h3 class="mr-2">Rating:</h3> 
                                        <select name="StarRating" class="h-[30px] rounded border-0 py-1.5 px-4 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6 my-4">
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                        </select>
                                    </div>

                                    <div>
                                        <textarea rows="5" name="Description" id="comment" class="block w-full rounded-md border-0 py-1.5 px-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" placeholder="Add your comment..."></textarea>
                                    </div>
                                </div>

                                <div id="tabs-1-panel-2" class="-m-0.5 rounded-lg p-0.5" aria-labelledby="tabs-1-tab-2" role="tabpanel" tabindex="0">
                                    <div class="border-b">
                                        <div class="mx-px mt-px px-3 pb-12 pt-2 text-sm leading-5 text-gray-800">Preview content will render here.</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="mt-2 flex justify-end">
                            <button type="submit" class="inline-flex items-center rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Post</button>
                        </div>
                    </form>

             

                </div>
            </div>




        </div>

        <%@ include file="/layout/footer.jsp" %>
    </body>
</html>
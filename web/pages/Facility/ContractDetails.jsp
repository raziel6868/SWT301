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

    </head>
    <body>
        <script type="text/javascript"><%@include file="MarketplaceScript.js" %></script>

        <%@ include file="/layout/header.jsp" %>

        <main class="mx-auto max-w-2xl pb-24 pt-8 sm:px-6 sm:pt-16 lg:max-w-7xl lg:px-8">
            <div class="space-y-2 px-4 sm:flex sm:items-baseline sm:justify-between sm:space-y-0 sm:px-0">
                <div class="flex sm:items-baseline sm:space-x-4">
                    <h1 class="text-2xl font-bold tracking-tight text-gray-900 sm:text-3xl">Contract #${rentalContract.id}</h1>
                    <a href="#" class="hidden text-sm font-medium text-indigo-600 hover:text-indigo-500 sm:block">
                        View invoice
                        <span aria-hidden="true"> &rarr;</span>
                    </a>
                </div>
                <p class="text-sm text-gray-600">Create placed <span class="font-medium text-gray-900">March 22, 2021</span></p>
                <a href="#" class="text-sm font-medium text-indigo-600 hover:text-indigo-500 sm:hidden">
                    View invoice
                    <span aria-hidden="true"> &rarr;</span>
                </a>
            </div>

          
            <!-- Products -->
            <section aria-labelledby="products-heading" class="mt-6">
                <h2 id="products-heading" class="sr-only">Products purchased</h2>

                <div class="space-y-8">
                    <div class="border-b border-t border-gray-200 bg-white shadow-sm sm:rounded-lg sm:border">

                    </div>

                

                    <!--Bookings-->
                    <c:forEach items="${rentalContract.bookings}" var="booking">
                        <div class="border-b border-t border-gray-200 bg-white shadow-sm sm:rounded-lg sm:border">
                            <div class="px-4 py-6 sm:px-6 lg:grid lg:grid-cols-12 lg:gap-x-8 lg:p-8">
                                <div class="sm:flex lg:col-span-7">
                                    <div class="aspect-h-1 aspect-w-1 w-full flex-shrink-0 overflow-hidden rounded-lg sm:aspect-none sm:h-40 sm:w-40">
                                        <img src="${booking.imgSrc}" alt="Arm modeling wristwatch with black leather band, white watch face, thin watch hands, and fine time markings." class="h-full w-full object-cover object-center sm:h-full sm:w-full">
                                    </div>

                                    <div class="mt-6 sm:ml-6 sm:mt-0">
                                        <h3 class="text-base font-medium text-gray-900">
                                            <a href="#">Minimalist Wristwatch</a>
                                        </h3>
                                        <p class="mt-2 text-sm font-medium text-gray-900">$${booking.rentalCost}</p>
                                        <p class="mt-3 text-sm text-gray-500">This contemporary wristwatch has a clean, minimalist look and high quality components.</p>
                                    </div>
                                </div>

                                <div class="mt-6 lg:col-span-5 lg:mt-0">
                                    <dl class="grid grid-cols-2 gap-x-6 text-sm">
                                        <div>
                                            <dt class="font-medium text-gray-900">Booking information</dt>
                                            <dd class="mt-3 text-gray-500">
                                                <span class="block">Quanity: x${booking.occupancy}</span>
                                                <span class="block">Facility ID: ${booking.facilityId}</span>
                                               
                                            </dd>
                                        </div>
                                        <div>
                                            <dt class="font-medium text-gray-900">Check in and out</dt>
                                            <dd class="mt-3 space-y-3 text-gray-500">
                                                <p>From <strong>${booking.startDate}</strong></p>
                                                <p>To <strong>${booking.endDate}</strong></p>
<!--                                                <button type="button" class="font-medium text-indigo-600 hover:text-indigo-500">Edit</button>-->
                                            </dd>
                                        </div>
                                    </dl>
                                </div>
                            </div>
                            <div class="border-t border-gray-200 px-4 py-6 sm:px-6 lg:p-8">
                                <h4 class="sr-only">Status</h4>
                                <p class="text-sm font-medium text-gray-900">Booked on <span>${booking.bookingDate}</span></p>
<!--                                <div class="mt-6" aria-hidden="true">
                                    <div class="overflow-hidden rounded-full bg-gray-200">
                                        <div class="h-2 rounded-full bg-indigo-600" style="width: calc((0 * 2 + 1) / 8 * 100%)"></div>
                                    </div>
                                    <div class="mt-6 hidden grid-cols-4 text-sm font-medium text-gray-600 sm:grid">
                                        <div class="text-indigo-600">Order placed</div>
                                        <div class="text-center">Processing</div>
                                        <div class="text-center">Shipped</div>
                                        <div class="text-right">Delivered</div>
                                    </div>
                                </div>-->
                            </div>
                        </div>
                    </c:forEach>


                    <!-- More products... -->
                </div>
            </section>

            <!-- Billing -->
            <section aria-labelledby="summary-heading" class="mt-16">
                <h2 id="summary-heading" class="sr-only">Billing Summary</h2>

                <div class="bg-gray-100 px-4 py-6 sm:rounded-lg sm:px-6 lg:grid lg:grid-cols-12 lg:gap-x-8 lg:px-8 lg:py-8">
                    <dl class="grid grid-cols-2 gap-6 text-sm sm:grid-cols-2 md:gap-x-8 lg:col-span-7">
                        <div>
                            <dt class="font-medium text-gray-900">Billing address</dt>
                            <dd class="mt-3 text-gray-500">
                                <!--                                <span class="block">Floyd Miles</span>
                                                                <span class="block">7363 Cynthia Pass</span>
                                                                <span class="block">Toronto, ON N3Y 4H8</span>-->
                                None
                            </dd>
                        </div>
                        <div>
                            <dt class="font-medium text-gray-900">Payment information</dt>
                            <dd class="-ml-4 -mt-1 flex flex-wrap">

                                <!--                                <div class="ml-4 mt-4 flex-shrink-0">
                                                                    <svg aria-hidden="true" width="36" height="24" viewBox="0 0 36 24" class="h-6 w-auto">
                                                                    <rect width="36" height="24" rx="4" fill="#224DBA" />
                                                                    <path d="M10.925 15.673H8.874l-1.538-6c-.073-.276-.228-.52-.456-.635A6.575 6.575 0 005 8.403v-.231h3.304c.456 0 .798.347.855.75l.798 4.328 2.05-5.078h1.994l-3.076 7.5zm4.216 0h-1.937L14.8 8.172h1.937l-1.595 7.5zm4.101-5.422c.057-.404.399-.635.798-.635a3.54 3.54 0 011.88.346l.342-1.615A4.808 4.808 0 0020.496 8c-1.88 0-3.248 1.039-3.248 2.481 0 1.097.969 1.673 1.653 2.02.74.346 1.025.577.968.923 0 .519-.57.75-1.139.75a4.795 4.795 0 01-1.994-.462l-.342 1.616a5.48 5.48 0 002.108.404c2.108.057 3.418-.981 3.418-2.539 0-1.962-2.678-2.077-2.678-2.942zm9.457 5.422L27.16 8.172h-1.652a.858.858 0 00-.798.577l-2.848 6.924h1.994l.398-1.096h2.45l.228 1.096h1.766zm-2.905-5.482l.57 2.827h-1.596l1.026-2.827z" fill="#fff" />
                                                                    </svg>
                                                                    <p class="sr-only">Visa</p>
                                                                </div>
                                                                <div class="ml-4 mt-4">
                                                                    <p class="text-gray-900">Ending with 4242</p>
                                                                    <p class="text-gray-600">Expires 02 / 24</p>
                                                                </div>-->

                                <div class="ml-4 mt-4 flex-shrink-0">

                                    <p>None</p>
                                </div>
                            </dd>
                        </div>
                    </dl>

                    <dl class="mt-8 divide-y divide-gray-200 text-sm lg:col-span-5 lg:mt-0">
                        <div class="flex items-center justify-between pb-4">
                            <dt class="text-gray-600">Deposit</dt>
                            <dd class="font-medium text-gray-900">$${rentalContract.deposit}</dd>
                        </div>
                        <div class="flex items-center justify-between py-4">
                            <dt class="text-gray-600">Rental Amount</dt>
                            <dd class="font-medium text-gray-900">$${rentalContract.totalAmount}</dd>
                        </div>

                        <div class="flex items-center justify-between pt-4">
                            <dt class="font-medium text-gray-900">Rest amount</dt>
                            <dd class="font-medium text-indigo-600">$${rentalContract.totalAmount - rentalContract.deposit}</dd>
                        </div>
                    </dl>
                </div>
            </section>
        </main>



        <%@ include file="/layout/footer.jsp" %>


    </body>
</html>

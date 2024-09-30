<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Domain.Enums.UserRole" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <script src="https://cdn.tailwindcss.com"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <header class="bg-white">
            <nav
                class="mx-auto flex max-w-7xl items-center justify-between p-6 lg:px-8"
                aria-label="Global"
                >
                <div class="flex lg:flex-1">
                    <a href="/ResortHub/pages/Home/index.jsp" class="-m-1.5 p-1.5">
                        <span class="sr-only">Resort Hub Logo</span>
                        <img class="h-12 w-auto" src="https://github.com/jpeseWang/ResortHub_Servlet/blob/main/web/assets/images/logo.png?raw=true" alt="" />

                    </a>
                </div>
                <div class="flex lg:hidden">
                    <button
                        id="openMobileNav"
                        type="button"
                        class="-m-2.5 inline-flex items-center justify-center rounded-md p-2.5 text-gray-700"
                        >
                        <span class="sr-only">Open main menu</span>
                        <svg
                            class="h-6 w-6"
                            fill="none"
                            viewBox="0 0 24 24"
                            stroke-width="1.5"
                            stroke="currentColor"
                            aria-hidden="true"
                            >
                        <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5"
                            />
                        </svg>
                    </button>
                </div>
                <div class="hidden lg:flex lg:gap-x-12">

                    <c:if test="${sessionScope.User.userRole == UserRole.Admin}">
                        <a href="/ResortHub/Admin/FacilityManagement/ListFacility.jsp" class="text-sm font-semibold leading-6 text-gray-900"
                           >Management</a
                        >
                    </c:if>
                    <c:if test="${sessionScope.User.userRole == UserRole.User}">
                        <a href="/ResortHub/BookingController?action=getMyBooking&Page=1&PageSize=10" class="text-sm font-semibold leading-6 text-gray-900"
                           >My Bookings</a
                        >
                    </c:if>
                    <a href="#" class="text-sm font-semibold leading-6 text-gray-900"
                       >About us</a
                    >
                    <a href="/ResortHub/FacilityController?action=getMarketplaceItem&Page=1&PageSize=12" class="text-sm font-semibold leading-6 text-gray-900"
                       >Marketplace</a
                    >
                    <a href="/ResortHub/FacilityController?action=getStory&Page=1&PageSize=20" class="text-sm font-semibold leading-6 text-gray-900"
                       >Story</a
                    >
                </div>
                <div class="hidden lg:flex lg:flex-1 lg:justify-end">

                    <c:if test="${sessionScope.User.customerId == null}">
                        <a
                            href="/ResortHub/pages/Auth/login.jsp"
                            class="text-sm font-semibold leading-6 text-gray-900"
                            >Log in <span aria-hidden="true">&rarr;</span></a
                        >
                    </c:if>


                </div>

                <ul>
                    <li class="top_links"><a href="#"></a>

                        <c:if test="${sessionScope.User.customerId != null}">
                            <div class="flex">
                                <a href="#" class="group block flex-shrink-0">
                                    <div class="flex items-center">
                                        <div>
                                            <img class="inline-block h-9 w-9 rounded-full" src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80" alt="">
                                        </div>
                                        <div class="ml-3">
                                            <p class="text-sm font-medium text-gray-700 group-hover:text-gray-900">${sessionScope.User.username}</p>
                                            <p class="text-xs font-medium text-gray-500 group-hover:text-gray-700">${sessionScope.User.userRole}</p>

                                        </div>
                                    </div>
                                </a>
                                <div class="border-l mx-4"></div>
                                <a
                                    href="/ResortHub/AuthController?action=logout"
                                    class="text-sm font-semibold leading-6 text-gray-900 hover:text-indigo-600 pt-1"
                                    >Log out <span aria-hidden="true">&rarr;</span></a
                                >
                            </div>
                        </c:if>




                        </nav>
                        <!-- Mobile navigation menu -->
                        <div id="mobileNav" class="lg:hidden" role="dialog" aria-modal="true" style="display: none;">
                            <div class="fixed inset-0 z-10"></div>
                            <div class="fixed inset-y-0 right-0 z-10 w-full overflow-y-auto bg-white px-6 py-6 sm:max-w-sm sm:ring-1 sm:ring-gray-900/10">
                                <div class="flex items-center justify-between">
                                    <a href="#" class="-m-1.5 p-1.5">
                                        <span class="sr-only">Your Company</span>
                                        <img class="h-12 w-auto" src="../assets/images/logo.png" alt="">
                                    </a>
                                    <button id="closeMobileNav" type="button" class="-m-2.5 rounded-md p-2.5 text-gray-700">
                                        <span class="sr-only">Close menu</span>
                                        <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
                                        </svg>
                                    </button>
                                </div>
                                <div class="mt-6 flow-root">
                                    <div class="-my-6 divide-y divide-gray-500/10">
                                        <div class="space-y-2 py-6">
                                            <a href="#" class="-mx-3 block rounded-lg px-3 py-2 text-base font-semibold leading-7 text-gray-900 hover:bg-gray-50">Product</a>
                                            <a href="#" class="-mx-3 block rounded-lg px-3 py-2 text-base font-semibold leading-7 text-gray-900 hover:bg-gray-50">Features</a>
                                            <a href="#" class="-mx-3 block rounded-lg px-3 py-2 text-base font-semibold leading-7 text-gray-900 hover:bg-gray-50">Marketplace</a>
                                            <a href="#" class="-mx-3 block rounded-lg px-3 py-2 text-base font-semibold leading-7 text-gray-900 hover:bg-gray-50">Company</a>
                                        </div>
                                        <div class="py-6">
                                            <a href="#" class="-mx-3 block rounded-lg px-3 py-2.5 text-base font-semibold leading-7 text-gray-900 hover:bg-gray-50">Log in</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </header>
                        <script>

                            // JavaScript to toggle mobile navigation
                            document.getElementById('openMobileNav').addEventListener('click', function () {
                                var mobileNav = document.getElementById('mobileNav');
                                mobileNav.style.display = 'block';
                            });

                            // JavaScript to close mobile navigation when the close button is clicked
                            document.getElementById('closeMobileNav').addEventListener('click', function () {
                                var mobileNav = document.getElementById('mobileNav');
                                mobileNav.style.display = 'none';
                            });
                        </script>


                        </body>
                        </html>

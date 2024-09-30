

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdn.tailwindcss.com"></script>
        <title>JSP Page</title>
        <script src="pages/Facility/MarketplaceScript.js"></script>
    </head>
    <body>
        <script type="text/javascript"><%@include file="MarketplaceScript.js" %></script>

        <div class="bg-gray-50">
            <%@ include file="/layout/header.jsp" %>

            <div>
                <div class="relative z-40 sm:hidden" role="dialog" aria-modal="true">

                    <!-- Off-canvas menu backdrop -->
                    <div id="menuBackdrop" class="fixed inset-0 bg-black bg-opacity-25" style="display: none;"></div>
                    <div class="fixed inset-0 bg-black bg-opacity-25"></div>

                    <div class="fixed inset-0 z-40 flex">

                        <div class="hidden relative ml-auto flex h-full w-full max-w-xs flex-col overflow-y-auto bg-white py-4 pb-12 shadow-xl">
                            <div class="flex items-center justify-between px-4">
                                <h2 class="text-lg font-medium text-gray-900">Filters</h2>
                                <button type="button" class="-mr-2 flex h-10 w-10 items-center justify-center rounded-md bg-white p-2 text-gray-400">
                                    <span class="sr-only">Close menu</span>
                                    <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
                                    </svg>
                                </button>
                            </div>

                            <!-- Filters -->
                            <form class="mt-4 ">

                                <div class="border-t border-gray-200 px-4 py-6">
                                    <h3 class="-mx-2 -my-3 flow-root">
                                        <!-- Expand/collapse section button -->
                                        <button type="button" class="flex w-full items-center justify-between bg-white px-2 py-3 text-sm text-gray-400" aria-controls="filter-section-1" aria-expanded="false">
                                            <span class="font-medium text-gray-900">Category</span>
                                            <span class="ml-6 flex items-center">

                                                <svg class="rotate-0 h-5 w-5 transform" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                                <path fill-rule="evenodd" d="M5.23 7.21a.75.75 0 011.06.02L10 11.168l3.71-3.938a.75.75 0 111.08 1.04l-4.25 4.5a.75.75 0 01-1.08 0l-4.25-4.5a.75.75 0 01.02-1.06z" clip-rule="evenodd" />
                                                </svg>
                                            </span>
                                        </button>
                                    </h3>
                                    <!-- Filter section, show/hide based on section state. -->
                                    <div class="pt-6" id="filter-section-1">
                                        <div class="space-y-6">
                                            <div class="flex items-center">
                                                <input id="filter-mobile-color-0" name="color[]" value="white" type="checkbox" class="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500">
                                                <label for="filter-mobile-color-0" class="ml-3 text-sm text-gray-500">Family</label>
                                            </div>
                                            <div class="flex items-center">
                                                <input id="filter-mobile-color-1" name="color[]" value="beige" type="checkbox" class="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500">
                                                <label for="filter-mobile-color-1" class="ml-3 text-sm text-gray-500">Couple</label>
                                            </div>
                                            <div class="flex items-center">
                                                <input id="filter-mobile-color-2" name="color[]" value="blue" type="checkbox" class="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500">
                                                <label for="filter-mobile-color-2" class="ml-3 text-sm text-gray-500">Custom</label>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <div class="border-t border-gray-200 px-4 py-6">
                                    <h3 class="-mx-2 -my-3 flow-root">
                                        <!-- Expand/collapse section button -->
                                        <button type="button" class="flex w-full items-center justify-between bg-white px-2 py-3 text-sm text-gray-400" aria-controls="filter-section-2" aria-expanded="false">
                                            <span class="font-medium text-gray-900">Sizes</span>
                                            <span class="ml-6 flex items-center">
                                                <svg class="rotate-0 h-5 w-5 transform" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                                <path fill-rule="evenodd" d="M5.23 7.21a.75.75 0 011.06.02L10 11.168l3.71-3.938a.75.75 0 111.08 1.04l-4.25 4.5a.75.75 0 01-1.08 0l-4.25-4.5a.75.75 0 01.02-1.06z" clip-rule="evenodd" />
                                                </svg>
                                            </span>
                                        </button>
                                    </h3>
                                    <!-- Filter section, show/hide based on section state. -->
                                    <div class="pt-6" id="filter-section-2">
                                        <div class="space-y-6">
                                            <div class="flex items-center">
                                                <input id="filter-mobile-sizes-0" name="sizes[]" value="xs" type="checkbox" class="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500">
                                                <label for="filter-mobile-sizes-0" class="ml-3 text-sm text-gray-500">XS</label>
                                            </div>
                                            <div class="flex items-center">
                                                <input id="filter-mobile-sizes-1" name="sizes[]" value="s" type="checkbox" class="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500">
                                                <label for="filter-mobile-sizes-1" class="ml-3 text-sm text-gray-500">S</label>
                                            </div>
                                            <div class="flex items-center">
                                                <input id="filter-mobile-sizes-2" name="sizes[]" value="m" type="checkbox" class="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500">
                                                <label for="filter-mobile-sizes-2" class="ml-3 text-sm text-gray-500">M</label>
                                            </div>
                                            <div class="flex items-center">
                                                <input id="filter-mobile-sizes-3" name="sizes[]" value="l" type="checkbox" class="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500">
                                                <label for="filter-mobile-sizes-3" class="ml-3 text-sm text-gray-500">L</label>
                                            </div>
                                            <div class="flex items-center">
                                                <input id="filter-mobile-sizes-4" name="sizes[]" value="xl" type="checkbox" class="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500">
                                                <label for="filter-mobile-sizes-4" class="ml-3 text-sm text-gray-500">XL</label>
                                            </div>
                                            <div class="flex items-center">
                                                <input id="filter-mobile-sizes-5" name="sizes[]" value="2xl" type="checkbox" class="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500">
                                                <label for="filter-mobile-sizes-5" class="ml-3 text-sm text-gray-500">2XL</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>


                <!--                Desktop-->
                <main>
                    <div class="bg-white">
                        <div class="mx-auto max-w-7xl px-4 py-16 sm:px-6 lg:px-8">
                            <h1 class="text-3xl font-bold tracking-tight text-gray-900">Your One Stop Gateway</h1>
                            <p class="mt-4 max-w-xl text-sm text-gray-700">We are partnering with hotel chains across the globe to ensure a comfortable stay wherever you travel!</p>
                        </div>
                    </div>

                    <!-- Filters -->
                    <section aria-labelledby="filter-heading">
                        <h2 id="filter-heading" class="sr-only">Filters</h2>

                        <div class="border-b border-gray-200 bg-white pb-4">
                            <div class="mx-auto flex max-w-7xl items-center justify-between px-4 sm:px-6 lg:px-8">
                                <div class="relative inline-block text-left" onclick="toggleSort()">
                                    <div>
                                        <button type="button" class="group inline-flex justify-center text-sm font-medium text-gray-700 hover:text-gray-900" id="menu-button" aria-expanded="false" aria-haspopup="true">
                                            Sort
                                            <svg class="-mr-1 ml-1 h-5 w-5 flex-shrink-0 text-gray-400 group-hover:text-gray-500" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                            <path fill-rule="evenodd" d="M5.23 7.21a.75.75 0 011.06.02L10 11.168l3.71-3.938a.75.75 0 111.08 1.04l-4.25 4.5a.75.75 0 01-1.08 0l-4.25-4.5a.75.75 0 01.02-1.06z" clip-rule="evenodd" />
                                            </svg>
                                        </button>
                                    </div>

                                    <div class="sort-selection hidden absolute left-0 z-10 mt-2 w-40 origin-top-left rounded-md bg-white shadow-2xl ring-1 ring-black ring-opacity-5 focus:outline-none " role="menu" aria-orientation="vertical" aria-labelledby="menu-button" tabindex="-1">
                                        <div class="py-1" role="none">

                                            <a href="#" class="font-medium text-gray-900 block px-4 py-2 text-sm" role="menuitem" tabindex="-1" id="menu-item-0">Most Popular</a>
                                            <a href="#" class="text-gray-500 block px-4 py-2 text-sm" role="menuitem" tabindex="-1" id="menu-item-1">Best Rating</a>
                                            <a href="#" class="text-gray-500 block px-4 py-2 text-sm" role="menuitem" tabindex="-1" id="menu-item-2">Newest</a>
                                            <a href="#" class="text-gray-500 block px-4 py-2 text-sm" role="menuitem" tabindex="-1" id="menu-item-3">Price: Low to High</a>
                                            <a href="#" class="text-gray-500 block px-4 py-2 text-sm" role="menuitem" tabindex="-1" id="menu-item-4">Price: High to Low</a>
                                        </div>
                                    </div>
                                </div>

                                <!-- Mobile filter dialog toggle, controls the 'mobileFiltersOpen' state. -->
                                <button type="button" class="inline-block text-sm font-medium text-gray-700 hover:text-gray-900 sm:hidden">Filters</button>

                                <div class="hidden sm:block">
                                    <div class="flow-root">
                                        <div class="-mx-4 flex items-center divide-x divide-gray-200">

                                            <div class="relative inline-block px-4 text-left">
                                                <button onclick="toggleColor()" type="button" class="group inline-flex justify-center text-sm font-medium text-gray-700 hover:text-gray-900" aria-expanded="false">
                                                    <span>Category</span>
                                                    <svg class="-mr-1 ml-1 h-5 w-5 flex-shrink-0 text-gray-400 group-hover:text-gray-500" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                                    <path fill-rule="evenodd" d="M5.23 7.21a.75.75 0 011.06.02L10 11.168l3.71-3.938a.75.75 0 111.08 1.04l-4.25 4.5a.75.75 0 01-1.08 0l-4.25-4.5a.75.75 0 01.02-1.06z" clip-rule="evenodd" />
                                                    </svg>
                                                </button>


                                                <div class="color-selection hidden absolute right-0 z-10 mt-2 origin-top-right rounded-md bg-white p-4 shadow-2xl ring-1 ring-black ring-opacity-5 focus:outline-none">
                                                    <form class="space-y-4">
                                                        <div class="flex items-center">
                                                            <input id="filter-color-0" name="color[]" value="white" type="checkbox" class="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500">
                                                            <label for="filter-color-0" class="ml-3 whitespace-nowrap pr-6 text-sm font-medium text-gray-900">Family</label>
                                                        </div>
                                                        <div class="flex items-center">
                                                            <input id="filter-color-1" name="color[]" value="beige" type="checkbox" class="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500">
                                                            <label for="filter-color-1" class="ml-3 whitespace-nowrap pr-6 text-sm font-medium text-gray-900">Couple</label>
                                                        </div>
                                                        <div class="flex items-center">
                                                            <input id="filter-color-2" name="color[]" value="blue" type="checkbox" class="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500">
                                                            <label for="filter-color-2" class="ml-3 whitespace-nowrap pr-6 text-sm font-medium text-gray-900">Custom</label>
                                                        </div>

                                                    </form>
                                                </div>
                                            </div>
                                            <div class="relative inline-block px-4 text-left">
                                                <button onclick="toggleSize()" type="button" class="group inline-flex justify-center text-sm font-medium text-gray-700 hover:text-gray-900" aria-expanded="false">
                                                    <span>Areas</span>
                                                    <svg class="-mr-1 ml-1 h-5 w-5 flex-shrink-0 text-gray-400 group-hover:text-gray-500" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                                    <path fill-rule="evenodd" d="M5.23 7.21a.75.75 0 011.06.02L10 11.168l3.71-3.938a.75.75 0 111.08 1.04l-4.25 4.5a.75.75 0 01-1.08 0l-4.25-4.5a.75.75 0 01.02-1.06z" clip-rule="evenodd" />
                                                    </svg>
                                                </button>


                                                <div class="size-selection hidden absolute right-0 z-10 mt-2 origin-top-right rounded-md bg-white p-4 shadow-2xl ring-1 ring-black ring-opacity-5 focus:outline-none">
                                                    <form class="space-y-4">
                                                        <div class="flex items-center">
                                                            <input id="filter-sizes-0" name="sizes[]" value="xs" type="checkbox" class="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500">
                                                            <label for="filter-sizes-0" class="ml-3 whitespace-nowrap pr-6 text-sm font-medium text-gray-900"><= 15 m2</label>
                                                        </div>
                                                        <div class="flex items-center">
                                                            <input id="filter-sizes-1" name="sizes[]" value="s" type="checkbox" class="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500">
                                                            <label for="filter-sizes-1" class="ml-3 whitespace-nowrap pr-6 text-sm font-medium text-gray-900"><= 30 m2</label>
                                                        </div>
                                                        <div class="flex items-center">
                                                            <input id="filter-sizes-2" name="sizes[]" value="m" type="checkbox" class="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500">
                                                            <label for="filter-sizes-2" class="ml-3 whitespace-nowrap pr-6 text-sm font-medium text-gray-900"><= 50 m2</label>
                                                        </div>
                                                        <div class="flex items-center">
                                                            <input id="filter-sizes-3" name="sizes[]" value="l" type="checkbox" class="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500">
                                                            <label for="filter-sizes-3" class="ml-3 whitespace-nowrap pr-6 text-sm font-medium text-gray-900"><= 100 m2</label>
                                                        </div>
                                                        <div class="flex items-center">
                                                            <input id="filter-sizes-4" name="sizes[]" value="xl" type="checkbox" class="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500">
                                                            <label for="filter-sizes-4" class="ml-3 whitespace-nowrap pr-6 text-sm font-medium text-gray-900"><= 150 m2</label>
                                                        </div>
                                                        <div class="flex items-center">
                                                            <input id="filter-sizes-5" name="sizes[]" value="2xl" type="checkbox" class="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500">
                                                            <label for="filter-sizes-5" class="ml-3 whitespace-nowrap pr-6 text-sm font-medium text-gray-900">> 150 m2</label>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Active filters -->
                        <div class="bg-gray-100">
                            <div class="mx-auto max-w-7xl px-4 py-3 sm:flex sm:items-center sm:px-6 lg:px-8">
                                <h3 class="text-sm font-medium text-gray-500">
                                    Filters
                                    <span class="sr-only">, active</span>
                                </h3>

                                <div aria-hidden="true" class="hidden h-5 w-px bg-gray-300 sm:ml-4 sm:block"></div>

                                <div class="mt-2 sm:ml-4 sm:mt-0">
                                    <div class="-m-1 flex flex-wrap items-center" id="filter-buttons">
                                        <span class="cursor-pointer m-1 inline-flex items-center rounded-full border border-gray-200 bg-white py-1.5 pl-3 pr-2 text-sm font-medium text-gray-900 filter-button" data-type="All">
                                            <span>
                                                <a href="/ResortHub/FacilityController?action=getMarketplaceItem&Page=1&PageSize=12">All</a>

                                            </span>
                                        </span>
                                        <span class="cursor-pointer m-1 inline-flex items-center rounded-full border border-gray-200 bg-white py-1.5 pl-3 pr-2 text-sm font-medium text-gray-900 filter-button" data-type="Villa">
                                            <span>
                                                <a href="/ResortHub/FacilityController?action=getMarketplaceItem&facilityType=villa&Page=1&PageSize=12">Villa</a>

                                            </span>
                                        </span>
                                        <span class="cursor-pointer m-1 inline-flex items-center rounded-full border border-gray-200 bg-white py-1.5 pl-3 pr-2 text-sm font-medium text-gray-900 filter-button" data-type="House">
                                            <span>
                                                <a href="/ResortHub/FacilityController?action=getMarketplaceItem&facilityType=house&Page=1&PageSize=12">House</a>

                                            </span>
                                        </span>
                                        <span class="cursor-pointer m-1 inline-flex items-center rounded-full border border-gray-200 bg-white py-1.5 pl-3 pr-2 text-sm font-medium text-gray-900 filter-button" data-type="Room">
                                            <span>
                                                <a href="/ResortHub/FacilityController?action=getMarketplaceItem&facilityType=room&Page=1&PageSize=12">Room</a>

                                            </span>
                                        </span>
                                    </div>
                                </div>


                            </div>
                            <!--                            <form class="block sm:flex gap-x-4 mt-4 mx-6"
                                                              name="FacilityController"
                                                              method="POST"
                                                              action="/ResortHub/FacilityController?action=getFilterFacility&Page=1&PageSize=12">
                                                            <div>
                                                                <div class="">
                                                                    <input
                                                                        name="MinArea"
                                                                        type="text"
                                                                        placeholder="Min Area"
                                                                       
                                                                        class="w-[100px] rounded border-0 py-1.5 px-4 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                                                                        />
                                                                </div>
                                                            </div>
                            
                                                            <div>
                                                                <div class="">
                                                                    <input
                                                                        name="MaxArea"
                                                                        type="text"
                                                                        placeholder="Max Area"
                                                                        
                                                                        class="w-[100px] rounded border-0 py-1.5 px-4 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                                                                        />
                                                                </div>
                                                            </div>
                                                             <div>
                                                                <div class="">
                                                                    <input
                                                                        name="MinRentalCost"
                                                                        type="text"
                                                                        placeholder="MinRentalCost"
                                                                        
                                                                        class="w-[150px] rounded border-0 py-1.5 px-4 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                                                                        />
                                                                </div>
                                                            </div>
                                                             <div>
                                                                <div class="">
                                                                    <input
                                                                        name="MaxRentalCost"
                                                                        type="text"
                                                                        placeholder="MaxRentalCost"
                                                                        
                                                                        class="w-[150px] rounded border-0 py-1.5 px-4 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                                                                        />
                                                                </div>
                                                            </div>
                                                             <div>
                                                                <div class="">
                                                                    <input
                                                                        name="LowerMaxOccupancy"
                                                                        type="text"
                                                                        placeholder="LowerMaxOccupancy"
                                                                        
                                                                        class="w-[200px] rounded border-0 py-1.5 px-4 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                                                                        />
                                                                </div>
                                                            </div>
                                                             <div>
                                                                <div class="">
                                                                    <input
                                                                        name="UpperMaxOccupancy"
                                                                        type="text"
                                                                        placeholder="UpperMaxOccupancy"
                                                                        
                                                                        class="w-[200px] rounded border-0 py-1.5 px-4 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                                                                        />
                                                                </div>
                                                            </div>
                            
                            
                                                            <div>
                                                                <button
                                                                    type="submit"
                                                                    class="flex w-full justify-center rounded-sm bg-black px-3 py-2 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-gray-600 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
                                                                    >
                                                                    <span>Filter facility</span>
                                                                </button>
                            
                                                            </div>
                                                        </form>-->
                            <form class="block sm:flex gap-x-4 mt-4 mx-6"
                                  name="FacilityController"
                                  method="POST"
                                  action="/ResortHub/FacilityController?action=getSuggestFacility">

                                <div>
                                    <div class="">
                                        <input
                                            name="TotalOccupancy"
                                            type="text"
                                            placeholder="TotalOccupancy"

                                            class="w-[200px] rounded border-0 py-1.5 px-4 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                                            />
                                    </div>
                                </div>

                                <div>
                                    <div class="">
                                        <input
                                            name="MaxNumOfFacilities"
                                            type="text"
                                            placeholder="MaxNumOfFacilities"

                                            class="w-[200px] rounded border-0 py-1.5 px-4 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                                            />
                                    </div>
                                </div>



                                <div>
                                    <button
                                        type="submit"
                                        class="flex w-full justify-center rounded-sm bg-black px-3 py-2 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-gray-600 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
                                        >
                                        <span>Filter facility</span>
                                    </button>

                                </div>
                            </form>
                        </div>
                    </section>
                    
                 Count: 

                    <!-- Product grid -->
                    <section aria-labelledby="products-heading" class="mx-auto max-w-2xl px-4 pb-16 pt-12 sm:px-6 sm:pb-24 sm:pt-16 lg:max-w-7xl lg:px-8">
                        <h2 id="products-heading" class="sr-only">Products</h2>

                        <div class="grid grid-cols-1 gap-x-6 gap-y-10 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 xl:gap-x-8">


                            <c:forEach items="${facilities.getSuggestedFacilities()}" var="c">
                                <div class="facility-item" data-type="${c.facilityType}">
                                    <a href="/ResortHub/FacilityController?action=getById&id=${c.id}&Page=1&PageSize=90" class="group">
                                        <div class="w-[300px] h-[200px] overflow-hidden rounded-lg bg-gray-200 xl:aspect-h-8 xl:aspect-w-7">
                                            <img src="${c.imgSrc}" alt="Olive drab green insulated bottle with flared screw lid and flat top." class="h-full w-full object-cover object-center group-hover:opacity-75">
                                        </div>
                                        <h3 class="mt-4 text-sm text-gray-700">${c.name} | ${c.facilityType}</h3>
                                        <p class="mt-1 text-lg font-medium text-gray-900">$${c.rentalCost}</p>
                                    </a>
                                </div>
                            </c:forEach>



                        </div>
                        <!--Pagination-->
                        <nav class="flex items-center justify-between border-t border-gray-200 px-4 sm:px-0 mt-6">
                            <div class="-mt-px flex w-0 flex-1">
                                <c:if test="${meta.page > 1}">
                                    <a href='FacilityController?action=getMarketplaceItem&Page=${meta.page - 1}&PageSize=12' class="inline-flex items-center border-t-2 border-transparent pr-1 pt-4 text-sm font-medium text-gray-500 hover:border-gray-300 hover:text-gray-700">
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
                                            <a href='FacilityController?action=getMarketplaceItem&Page=${page.index}&PageSize=12' class="inline-flex items-center border-t-2 border-transparent px-4 pt-4 text-sm font-medium text-gray-500 hover:border-gray-300 hover:text-gray-700">${page.index}</a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </div>

                            <div class="-mt-px flex w-0 flex-1 justify-end">
                                <c:if test="${meta.page < meta.pageSize && meta.page < meta.pageCount}">
                                    <a href='FacilityController?action=getMarketplaceItem&Page=${meta.page + 1}&PageSize=12' class="inline-flex items-center border-t-2 border-transparent pl-1 pt-4 text-sm font-medium text-gray-500 hover:border-gray-300 hover:text-gray-700">
                                        Next
                                        <svg class="ml-3 h-5 w-5 text-gray-400" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                        <path fill-rule="evenodd" d="M2 10a.75.75 0 01.75-.75h12.59l-2.1-1.95a.75.75 0 111.02-1.1l3.5 3.25a.75.75 0 010 1.1l-3.5 3.25a.75.75 0 11-1.02-1.1l2.1-1.95H2.75A.75.75 0 012 10z" clip-rule="evenodd" />
                                        </svg>
                                    </a>
                                </c:if>
                            </div>
                        </nav>
                    </section>
                </main>

                <%@ include file="/layout/footer.jsp" %>
            </div>
        </div>

    </body>
</html>

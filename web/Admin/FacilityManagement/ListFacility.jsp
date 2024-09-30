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

        <%@ include file="../AdminNav.jsp" %>
        <br>

        <div class="px-4 sm:px-6 lg:px-8">

            <div class=" flow-root">
                <div class="-mx-4  overflow-x-auto sm:-mx-6 lg:-mx-8">
                    <div class="bg-white py-6">
                        <div class="mx-auto max-w-7xl px-6 lg:px-8">
                            <div class="mx-auto max-w-2xl text-center">
                                <h2 class="text-3xl font-bold tracking-tight text-gray-900 sm:text-4xl">ResortHub's Facility</h2>
                                <p class="mt-2 text-lg leading-8 text-gray-600">Learn how to grow your business with our expert advice.</p>
                                <button type="button" class="mt-2 rounded-md bg-white px-2.5 py-1.5 text-sm font-semibold text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 hover:bg-gray-50">
                                    <a href="/ResortHub/FacilityController?action=getListMaintenance">Facility maintenance</a>
                                    </button>
                            </div>
                            <div class=" mx-auto grid max-w-2xl auto-rows-fr grid-cols-1 gap-8 sm:mt-9 lg:mx-0 lg:max-w-none lg:grid-cols-3">
                                <article class="relative isolate flex flex-col justify-end overflow-hidden rounded-2xl bg-gray-900 px-8 pb-8 pt-80 sm:pt-48 lg:pt-80 hover:opacity-80">
                                    <a href="http://localhost:8080/ResortHub/FacilityController?action=getAll&facilityType=villa&Page=1&PageSize=10">
                                        <img src="https://images.unsplash.com/photo-1580587771525-78b9dba3b914?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dmlsbGF8ZW58MHx8MHx8fDA%3D" alt="" class="absolute inset-0 -z-10 h-full w-full object-cover">
                                        <div class="absolute inset-0 -z-10 bg-gradient-to-t from-gray-900 via-gray-900/40"></div>
                                        <div class="absolute inset-0 -z-10 rounded-2xl ring-1 ring-inset ring-gray-900/10"></div>
                                        <h3 class="mt-3 text-lg font-semibold leading-6 text-white">

                                            <span class="absolute inset-0"></span>
                                            Villa Management

                                        </h3></a> 
                                </article>

                                <!-- More posts... -->
                                <article class="relative isolate flex flex-col justify-end overflow-hidden rounded-2xl bg-gray-900 px-8 pb-8 pt-80 sm:pt-48 lg:pt-80 hover:opacity-80">
                                            <a href="http://localhost:8080/ResortHub/FacilityController?action=getAll&facilityType=house&Page=1&PageSize=10">
                                        <img src="https://plus.unsplash.com/premium_photo-1661915661139-5b6a4e4a6fcc?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGhvdXNlfGVufDB8fDB8fHww" alt="" class="absolute inset-0 -z-10 h-full w-full object-cover">
                                        <div class="absolute inset-0 -z-10 bg-gradient-to-t from-gray-900 via-gray-900/40"></div>
                                        <div class="absolute inset-0 -z-10 rounded-2xl ring-1 ring-inset ring-gray-900/10"></div>


                                        <h3 class="mt-3 text-lg font-semibold leading-6 text-white">

                                            <span class="absolute inset-0"></span>
                                            House Management

                                        </h3>
                                    </a>
                                </article>




                                <article class="relative isolate flex flex-col justify-end overflow-hidden rounded-2xl bg-gray-900 px-8 pb-8 pt-80 sm:pt-48 lg:pt-80 hover:opacity-80">
                                    <img src="https://plus.unsplash.com/premium_photo-1674676471380-1258cb31b3ac?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cm9vbXxlbnwwfHwwfHx8MA%3D%3D" alt="" class="absolute inset-0 -z-10 h-full w-full object-cover">
                                    <div class="absolute inset-0 -z-10 bg-gradient-to-t from-gray-900 via-gray-900/40"></div>
                                    <div class="absolute inset-0 -z-10 rounded-2xl ring-1 ring-inset ring-gray-900/10"></div>


                                    <h3 class="mt-3 text-lg font-semibold leading-6 text-white">
                                               <a href="http://localhost:8080/ResortHub/FacilityController?action=getAll&facilityType=room&Page=1&PageSize=10">
                                            <span class="absolute inset-0"></span>
                                            Room Management
                                        </a>
                                    </h3>
                                </article>


                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    <%@ include file="/layout/footer.jsp" %>
    </body>
</html>
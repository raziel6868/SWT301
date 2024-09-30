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
            <div class="sm:flex sm:items-center">
                <div class="sm:flex-auto">
                    <h1 class="text-base font-semibold leading-6 text-gray-900">Promotion</h1>
                    <p class="mt-2 text-sm text-gray-700">A list of all the users in your account including their name, title, email and role.</p>
                </div>

            </div>
            <div class="px-4 sm:px-6 lg:px-8">

                <div class=" flow-root">
                    <div class="-mx-4  overflow-x-auto sm:-mx-6 lg:-mx-8">
                        <div class="bg-white py-6">
                            <div class="mx-auto max-w-7xl px-6 lg:px-8">

                                <div class=" mx-auto grid max-w-2xl auto-rows-fr grid-cols-1 gap-8 sm:mt-9 lg:mx-0 lg:max-w-none lg:grid-cols-2">
                                    <article class="relative isolate flex flex-col justify-end overflow-hidden rounded-2xl bg-gray-900 px-8 pb-8 pt-80 sm:pt-48 lg:pt-80 hover:opacity-80">
                                        <a href="http://localhost:8080/ResortHub/PromotionController?action=ListCustomersUseService">
                                            <img src="https://images.unsplash.com/photo-1605152276897-4f618f831968?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2VydmljZXxlbnwwfHwwfHx8MA%3D%3D" alt="" class="absolute inset-0 -z-10 h-full w-full object-cover">
                                            <div class="absolute inset-0 -z-10 bg-gradient-to-t from-gray-900 via-gray-900/40"></div>
                                            <div class="absolute inset-0 -z-10 rounded-2xl ring-1 ring-inset ring-gray-900/10"></div>
                                            <h3 class="mt-3 text-lg font-semibold leading-6 text-white">

                                                <span class="absolute inset-0"></span>
                                                Customers use service

                                            </h3></a> 
                                    </article>

                                    <!-- More posts... -->
                                    <article class="relative isolate flex flex-col justify-end overflow-hidden rounded-2xl bg-gray-900 px-8 pb-8 pt-80 sm:pt-48 lg:pt-80 hover:opacity-80">
                                        <a href="/ResortHub/Admin/PromotionManagement/CustomersGetVoucher/ListCustomersGetVoucher.jsp">
                                            <img src="https://images.unsplash.com/photo-1494426383302-7b9d36a1a028?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8dm91Y2hlcnxlbnwwfHwwfHx8MA%3D%3D" alt="" class="absolute inset-0 -z-10 h-full w-full object-cover">
                                            <div class="absolute inset-0 -z-10 bg-gradient-to-t from-gray-900 via-gray-900/40"></div>
                                            <div class="absolute inset-0 -z-10 rounded-2xl ring-1 ring-inset ring-gray-900/10"></div>


                                            <h3 class="mt-3 text-lg font-semibold leading-6 text-white">

                                                <span class="absolute inset-0"></span>
                                                Customers get voucher

                                            </h3>
                                        </a>
                                    </article>






                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>


        </div>
        <%@ include file="/layout/footer.jsp" %>
    </body>
</html>
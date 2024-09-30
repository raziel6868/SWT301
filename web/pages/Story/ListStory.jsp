
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
        <jsp:include page="../../layout/header.jsp"/> 

        <div class="bg-white py-12 sm:py-24">
            <div class="mx-auto max-w-7xl px-6 lg:px-8">
                <div class="mx-auto max-w-xl text-center">
                    <h2 class="text-lg font-semibold leading-8 tracking-tight text-indigo-600">Stories </h2>
                    <p class="mt-2 text-3xl font-bold tracking-tight text-gray-900 sm:text-4xl">We have worked with thousands of amazing people</p>
                </div>
                <div class="mx-auto mt-16 flow-root max-w-2xl sm:mt-20 lg:mx-0 lg:max-w-none">
                    <div class="-mt-8 sm:-mx-4 sm:columns-2 sm:text-[0] lg:columns-3">

                        <c:forEach items="${story}" var="c">
                            <%
// Generate a random size between 1 and 100
int size = (int) (Math.random() * 100) + 1;
                            %>
                            <a href="/ResortHub/FacilityController?action=getStoryById&id=${c.id}" class="pt-8 sm:inline-block sm:w-full sm:px-4">
                                <figure class="rounded-2xl bg-gray-50 p-8 text-sm leading-6">
                                    <blockquote class="text-gray-900">

                                        <p>“${c.description}”</p>
                                        <span class="block text-gray-400 italic">Feeling ${c.customerStatus} about ${c.facilityName} on ${c.postDate}</span>
                                    </blockquote>
                                    <figcaption class="mt-6 flex items-center gap-x-4">
                                        <img class="h-10 w-10 rounded-full bg-gray-50" src="https://i.pravatar.cc/<%= size %>" alt="">
                                        <div>
                                            <div class="font-semibold text-gray-900">${c.customerName}</div>
                                            <div class="text-gray-600">${c.customerId}</div>
                                        </div>


                                    </figcaption>

                                </figure>

                            </a>

                        </c:forEach>

                        <!-- More testimonials... -->
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>

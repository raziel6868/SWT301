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
                    <h1 class="text-base font-semibold leading-6 text-gray-900">Bookings</h1>
                    <p class="mt-2 text-sm text-gray-700">A list of all the users in your account including their name, title, email and role.</p>
                </div>

                <div class="mt-4 sm:ml-16 sm:mt-0 sm:flex gap-x-4">
                    <a href="/ResortHub/BookingController?action=getAllContract&Page=1&PageSize=10" class="py-2.5 px-5 me-2 mb-2 text-sm font-medium text-gray-900 focus:outline-none bg-white rounded-lg border border-gray-200 hover:bg-gray-100 hover:text-blue-700 focus:z-10 focus:ring-4 focus:ring-gray-100 dark:focus:ring-gray-700 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700">List Contract</button>
                        <a href="/ResortHub/FacilityController?action=getMarketplaceItem&Page=1&PageSize=10" class="text-white bg-gradient-to-r from-purple-500 via-purple-600 to-purple-700 hover:bg-gradient-to-br focus:ring-4 focus:outline-none focus:ring-purple-300 dark:focus:ring-purple-800 shadow-lg shadow-purple-500/50 dark:shadow-lg dark:shadow-purple-800/80 font-medium rounded-lg text-sm px-5 py-2.5 text-center me-2 mb-2">Add booking</a>
                        <button onclick="handleCreateContract()" type="submit" class="text-white bg-gradient-to-r from-cyan-400 via-cyan-500 to-cyan-600 hover:bg-gradient-to-br focus:ring-4 focus:outline-none focus:ring-cyan-300 dark:focus:ring-cyan-800 shadow-lg shadow-cyan-500/50 dark:shadow-lg dark:shadow-cyan-800/80 font-medium rounded-lg text-sm px-5 py-2.5 text-center me-2 mb-2">Create Contract</button>

                </div>
            </div>

            <div class="px-4 sm:px-6 lg:px-8">

                <div class="mt-8 flow-root">
                    <div class="-mx-4 -my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
                        <div class="inline-block min-w-full py-2 align-middle sm:px-6 lg:px-8">
                            <table class="min-w-full divide-y divide-gray-300">
                                <thead>
                                    <tr class="divide-x divide-gray-200">
                                        <th scope="col" class="py-3.5 pl-4 pr-4 text-left text-sm font-semibold text-gray-900 sm:pl-0"></th>
                                        <th scope="col" class="py-3.5 pl-4 pr-4 text-left text-sm font-semibold text-gray-900 ">Booking ID</th>
                                        <th scope="col" class="py-3.5 pl-4 pr-4 text-left text-sm font-semibold text-gray-900 ">Facility ID</th>
                                        <th scope="col" class="px-4 py-3.5 text-left text-sm font-semibold text-gray-900">Customer ID</th>
                                        <th scope="col" class="px-4 py-3.5 text-left text-sm font-semibold text-gray-900">Start Date</th>
                                        <th scope="col" class="py-3.5 pl-4 pr-4 text-left text-sm font-semibold text-gray-900 sm:pr-0">End Date</th>
                                        <th scope="col" class="py-3.5 pl-4 pr-4 text-left text-sm font-semibold text-gray-900 sm:pr-0">Booking Date</th>
                                        <th scope="col" class="py-3.5 pl-4 pr-4 text-left text-sm font-semibold text-gray-900 sm:pr-0">Rental Cost</th>
                                    </tr>
                                </thead>
                                <tbody class="divide-y divide-gray-200 bg-white">

                                <form
                                    id="contractForm"
                                    name="reviewContract"
                                    method="POST"
                                    action="/ResortHub/BookingController?action=reviewContract">
                                    <c:forEach items="${bookings}" var="c">
                                        <tr class="divide-x divide-gray-200">
                                            <td class="whitespace-nowrap py-4 pl-4 pr-4 text-sm font-medium text-gray-900 sm:pl-0">
                                                <input type="checkbox" class="accent-pink-300 focus:accent-pink-500 w-[18px] h-[18px] ml-4" ></td>
                                            <td class="facilityId customerId whitespace-nowrap p-4 text-sm text-gray-500">${c.id}</td>
                                            <td class="whitespace-nowrap py-4 pl-4 pr-4 text-sm font-medium text-gray-900"> ${c.facilityId}</td>
                                            <td class="customerId whitespace-nowrap p-4 text-sm text-gray-500">${c.customerId}</td>
                                            <td class="startDate whitespace-nowrap p-4 text-sm text-gray-500">${c.startDate}</td>
                                            <td class="endDate whitespace-nowrap py-4 pl-4 pr-4 text-sm text-gray-500 sm:pr-0">${c.endDate}</td>
                                            <td class="bookingDate whitespace-nowrap py-4 pl-4 pr-4 text-sm text-gray-500 sm:pr-0">${c.bookingDate}</td>
                                            <td class="rentalCost whitespace-nowrap py-4 pl-4 pr-4 text-sm text-gray-500 sm:pr-0">${c.rentalCost * c.occupancy}$</td>
                                        </tr>
                                    </c:forEach>

                                    <input name="BookingIds" id="selectedFacilities" class="hidden"/>
                                    <input name="totalPrice" id="totalPrice" class="hidden"/>
                                </form>

                                </tbody>
                            </table>



                        </div>
                    </div>
                </div>
            </div>

        </div>
        <script>

//            

            function parseArrayToString(array) {
                var result = array.join(", ");
                return result;
            }

            function handleCreateContract() {
                var selectedFacilities = [];
                var totalPrice = 0;

                // Loop through each checkbox and gather selected facilities and calculate total price
                var checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');
                checkboxes.forEach(function (checkbox) {
                    var row = checkbox.closest('tr');
                    var facilityId = row.querySelector('.facilityId').textContent;
                    var rentalCost = parseFloat(row.querySelector('.rentalCost').textContent.replace('$', ''));
                    selectedFacilities.push(facilityId);
                    totalPrice += rentalCost;
                });

                console.log(parseArrayToString(selectedFacilities))
                console.log(totalPrice)
                document.getElementById('selectedFacilities').value = parseArrayToString(selectedFacilities)
                document.getElementById('totalPrice').value = totalPrice;
                document.getElementById('contractForm').submit();
            }
        </script>
        <%@ include file="/layout/footer.jsp" %>
    </body>
</html>

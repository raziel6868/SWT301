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
                    <a href="/ResortHub/BookingController?action=getAll&Page=1&PageSize=10" class="py-2.5 px-5 me-2 mb-2 text-sm font-medium text-gray-900 focus:outline-none bg-white rounded-lg border border-gray-200 hover:bg-gray-100 hover:text-blue-700 focus:z-10 focus:ring-4 focus:ring-gray-100 dark:focus:ring-gray-700 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700">List Booking</button>
                    <a href="/ResortHub/FacilityController?action=getMarketplaceItem&Page=1&PageSize=10" class="text-white bg-gradient-to-r from-purple-500 via-purple-600 to-purple-700 hover:bg-gradient-to-br focus:ring-4 focus:outline-none focus:ring-purple-300 dark:focus:ring-purple-800 shadow-lg shadow-purple-500/50 dark:shadow-lg dark:shadow-purple-800/80 font-medium rounded-lg text-sm px-5 py-2.5 text-center me-2 mb-2">Add booking</a>

                   
                </div>
            </div>

            <div class="px-4 sm:px-6 lg:px-8">

                <div class="mt-8 flow-root">
                    <div class="-mx-4 -my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
                        <div class="inline-block min-w-full py-2 align-middle sm:px-6 lg:px-8">
                            <table class="min-w-full divide-y divide-gray-300">
                                <thead>
                                    <tr class="divide-x divide-gray-200">
                                       
                                        <th scope="col" class="py-3.5 pl-4 text-left text-sm font-semibold text-gray-900 ">Contract ID</th>
           
                                        <th scope="col" class="px-4 py-3.5 text-left text-sm font-semibold text-gray-900">Customer ID</th>
                                        <th scope="col" class="px-4 py-3.5 text-left text-sm font-semibold text-gray-900">Deposit</th>
                                        <th scope="col" class="py-3.5 pl-4 pr-4 text-left text-sm font-semibold text-gray-900 sm:pr-0">Total</th>
                                        <th scope="col" class="py-3.5 pl-4 pr-4 text-left text-sm font-semibold text-gray-900 sm:pr-0">Details</th>
                                       
                                    </tr>
                                </thead>
                                <tbody class="divide-y divide-gray-200 bg-white">

                                <form
                                    id="contractForm"
                                    name="reviewContract"
                                    method="POST"
                                    action="/ResortHub/BookingController?action=reviewContract">
                                    <c:forEach items="${rentalContract}" var="c">
                                        <tr class="divide-x divide-gray-200">
                                          
                                            <td class="facilityId customerId whitespace-nowrap p-4 text-sm text-gray-500">${c.id}</td>
                                            <td class="whitespace-nowrap py-4 pl-4 pr-4 text-sm font-medium text-gray-900"> ${c.customerId}</td>
                                        
                                            <td class="startDate whitespace-nowrap p-4 text-sm text-gray-500">${c.deposit}</td>
                                            <td class=" whitespace-nowrap py-4 pl-4 pr-4 text-sm text-gray-500 sm:pr-0">${c.totalAmount}</td>
                                            <td class="font-medium whitespace-nowrap py-4 pl-4 pr-4 text-sm text-indigo-600 sm:pr-0 hover:opacity-50">
                                                <a href="/ResortHub/BookingController?action=getContractById&id=${c.id}" class="cursor-pointer">
                                                
                                                View</a></td>
    
                                        </tr>
                                    </c:forEach>
                                    <input name="BookingIds" value="14,15,16" class="hidden"/>
                                    <!--                                    <input name="BookingIds" id="selectedFacilities" class="hidden"/>-->
                                    <input name="totalPrice" id="totalPrice" class="hidden"/>
                                </form>

                                </tbody>
                            </table>


                            <!--                            <nav class="flex items-center justify-between border-t border-gray-200 px-4 sm:px-0">
                                                            <div class="-mt-px flex w-0 flex-1">
                                                                <a href="#" class="inline-flex items-center border-t-2 border-transparent pr-1 pt-4 text-sm font-medium text-gray-500 hover:border-gray-300 hover:text-gray-700">
                                                                    <svg class="mr-3 h-5 w-5 text-gray-400" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                                                    <path fill-rule="evenodd" d="M18 10a.75.75 0 01-.75.75H4.66l2.1 1.95a.75.75 0 11-1.02 1.1l-3.5-3.25a.75.75 0 010-1.1l3.5-3.25a.75.75 0 111.02 1.1l-2.1 1.95h12.59A.75.75 0 0118 10z" clip-rule="evenodd" />
                                                                    </svg>
                                                                    Previous
                                                                </a>
                                                            </div>
                                                            <div class="hidden md:-mt-px md:flex">
                                                                <a href="#" class="inline-flex items-center border-t-2 border-transparent px-4 pt-4 text-sm font-medium text-gray-500 hover:border-gray-300 hover:text-gray-700">1</a>
                                                                 Current: "border-indigo-500 text-indigo-600", Default: "border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300" 
                                                                <a href="#" class="inline-flex items-center border-t-2 border-indigo-500 px-4 pt-4 text-sm font-medium text-indigo-600" aria-current="page">2</a>
                                                                <a href="#" class="inline-flex items-center border-t-2 border-transparent px-4 pt-4 text-sm font-medium text-gray-500 hover:border-gray-300 hover:text-gray-700">3</a>
                                                                <span class="inline-flex items-center border-t-2 border-transparent px-4 pt-4 text-sm font-medium text-gray-500">...</span>
                                                                <a href="#" class="inline-flex items-center border-t-2 border-transparent px-4 pt-4 text-sm font-medium text-gray-500 hover:border-gray-300 hover:text-gray-700">8</a>
                                                                <a href="#" class="inline-flex items-center border-t-2 border-transparent px-4 pt-4 text-sm font-medium text-gray-500 hover:border-gray-300 hover:text-gray-700">9</a>
                                                                <a href="#" class="inline-flex items-center border-t-2 border-transparent px-4 pt-4 text-sm font-medium text-gray-500 hover:border-gray-300 hover:text-gray-700">10</a>
                                                            </div>
                                                            <div class="-mt-px flex w-0 flex-1 justify-end">
                                                                <a href="#" class="inline-flex items-center border-t-2 border-transparent pl-1 pt-4 text-sm font-medium text-gray-500 hover:border-gray-300 hover:text-gray-700">
                                                                    Next
                                                                    <svg class="ml-3 h-5 w-5 text-gray-400" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                                                    <path fill-rule="evenodd" d="M2 10a.75.75 0 01.75-.75h12.59l-2.1-1.95a.75.75 0 111.02-1.1l3.5 3.25a.75.75 0 010 1.1l-3.5 3.25a.75.75 0 11-1.02-1.1l2.1-1.95H2.75A.75.75 0 012 10z" clip-rule="evenodd" />
                                                                    </svg>
                                                                </a>
                                                            </div>
                                                        </nav>-->

                        </div>
                    </div>
                </div>
            </div>

        </div>
        <script>

            document.addEventListener('DOMContentLoaded', function () {
                // Add an event listener to the button
                document.getElementById('createContractBtn').addEventListener('click', function () {
                    // Submit the form when the button is clicked
                    document.getElementById('contractForm').submit();
                });

                document.getElementById('contractForm').addEventListener('submit', function (event) {
                    event.preventDefault(); // Prevent default form submission

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

                    // Set the values to the hidden inputs
                    document.getElementById('selectedFacilities').value = JSON.stringify(selectedFacilities);
                    document.getElementById('totalPrice').value = totalPrice;

                    // Submit the form
                    this.submit();
                });
            });


            function parseArrayToString(array) {
                // Join the array elements into a single string
                var result = array.join(", ");
                return result;
            }

            function printData() {
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
                document.getElementById('totalPrice').value = totalPrice;
                document.getElementById('contractForm').submit();
            }
        </script>
        <%@ include file="/layout/footer.jsp" %>
    </body>
</html>

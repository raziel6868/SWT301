<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Domain.DTOs.EmployeeDto.CreateEmployeeDto" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    CreateEmployeeDto formData = (CreateEmployeeDto) request.getAttribute("formData");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Employee</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body>
        <%@ include file="../AdminNav.jsp" %>

        <div class="space-y-10 divide-y divide-gray-900/10 mx-6 mt-12">
            <div class="grid grid-cols-1 gap-x-8 gap-y-8 md:grid-cols-3">
                <div class="px-4 sm:px-0">
                    <h2 class="text-base font-semibold leading-7 text-gray-900">Create new Employee</h2>
                    <p class="mt-1 text-sm leading-6 text-gray-600">This information will be displayed publicly so be careful what you share.</p>
                    <% String error = (String) request.getAttribute("error");%>
                    <span class="text-red-400 font-medium text-lg"><%= error != null ? error : ""%></span>
                </div>


                <form class="bg-white shadow-sm ring-1 ring-gray-900/5 sm:rounded-xl md:col-span-2"
                      name="CreateEmployee"
                      method="POST"
                      action="/ResortHub/EmployeeController?action=create">
                    <div class="px-4 py-6 sm:p-8">
                        <div class="grid max-w-2xl grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">

                            <div class="sm:col-span-4">
                                <label for="website" class="block text-sm font-medium leading-6 text-gray-900">Employee ID</label>
                                <div class="mt-2">
                                    <div class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                        <input value="${employee.id}" type="text" name="Id" placeholder="Ex: NV-0000" id="website" class="block flex-1 border-0 bg-transparent py-1.5 px-1.5 pl-1 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6" >
                                    </div>
                                </div>
                            </div>

                            <div class="sm:col-span-4">
                                <label for="website" class="block text-sm font-medium leading-6 text-gray-900">Full name</label>
                                <div class="mt-2">
                                    <div class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                        <input  value="${employee.fullName}" type="text" name="FullName" placeholder="Ex: Tran Quang Huy" id="website" class="block flex-1 border-0 bg-transparent py-1.5 px-1.5 pl-1 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6" >
                                    </div>
                                </div>
                            </div>

                            <div class="sm:col-span-4">
                                <label for="website" class="block text-sm font-medium leading-6 text-gray-900">Birthday</label>
                                <div class="mt-2">
                                    <div class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                        <input type="date" value="${employee.birthDate}" name="BirthDate" class="block flex-1 border-0 bg-transparent py-1.5 px-1.5 pl-1 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6" >
                                    </div>
                                </div>
                            </div>

                            <div class="sm:col-span-4">
                                <label for="country" class="block text-sm font-medium leading-6 text-gray-900">Gender</label>
                                <div class="mt-2">
                                    <select name="Gender"  class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:max-w-xs sm:text-sm sm:leading-6">
                                        <!--                                        <option>Male</option>
                                                                                <option>Female</option>  -->


                                        <option value="Male" <c:if test="${employee.gender eq 'Male'}">selected</c:if>>Male</option>
                                        <option value="2" <c:if test="${employee.gender eq 'Female'}">selected</c:if>>Female</option>

                                        </select>



                                    </div>
                                </div>

                                <div class="sm:col-span-3">
                                    <label for="first-name" class="block text-sm font-medium leading-6 text-gray-900">Identification Number</label>
                                    <div class="mt-2">
                                        <input value="${employee.idNumber}" type="text" name="IdNumber" placeholder="It should have 9 or 12 digits" id="first-name" class="block w-full rounded-md border-0 py-1.5 px-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                                </div>
                            </div>

                            <div class="sm:col-span-3">
                                <label for="last-name" class="block text-sm font-medium leading-6 text-gray-900">Phone Number</label>
                                <div class="mt-2">
                                    <input value="${employee.phoneNumber}" type="text" name="PhoneNumber" placeholder="It should start with 0 and have 10 digits" id="last-name" class="block w-full rounded-md border-0 py-1.5 px-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                                </div>
                            </div>

                            <div class="sm:col-span-4">
                                <label for="website" class="block text-sm font-medium leading-6 text-gray-900">Email</label>
                                <div class="mt-2">
                                    <div class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                        <input value="${employee.email}" type="text" name="Email" placeholder="Ex: employe0@gmail.com" id="website" class="block flex-1 border-0 bg-transparent py-1.5 px-1.5 pl-1 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6" >
                                    </div>
                                </div>
                            </div>

                            <div class="sm:col-span-2 sm:col-start-1">
                                <label for="city" class="block text-sm font-medium leading-6 text-gray-900">Qualification</label>
                                <div class="mt-2">           
                                    <select id="country" name="Qualification" autocomplete="country-name" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:max-w-xs sm:text-sm sm:leading-6">
                                        <option value="1" <c:if test="${employee.qualification.getIndex() eq '1'}">selected</c:if>>Intermediate</option>
                                        <option value="2" <c:if test="${employee.qualification.getIndex() eq '2'}">selected</c:if>>College</option>
                                        <option value="3" <c:if test="${employee.qualification.getIndex() eq '3'}">selected</c:if>>University</option>
                                        <option value="4" <c:if test="${employee.qualification.getIndex() eq '4'}">selected</c:if>>PostGraduate</option>
                                        </select> 
                                    </div>
                                </div>
                                <div class="sm:col-span-2">
                                    <label for="region" class="block text-sm font-medium leading-6 text-gray-900">Position</label>
                                    <div class="mt-2">
                                        <select id="country" name="Position" autocomplete="country-name" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:max-w-xs sm:text-sm sm:leading-6">
                                            <option <c:if test="${employee.position.getIndex() eq '1'}">selected</c:if> value="1">Receptionist</option>  
                                        <option <c:if test="${employee.position.getIndex() eq '2'}">selected</c:if> value="2">Server</option> 
                                        <option <c:if test="${employee.position.getIndex() eq '3'}">selected</c:if> value="3">Specialist</option> 
                                        <option <c:if test="${employee.position.getIndex() eq '4'}">selected</c:if> value="4">Supervisor</option> 
                                        <option <c:if test="${employee.position.getIndex() eq '5'}">selected</c:if> value="5">Manager</option> 
                                        <option <c:if test="${employee.position.getIndex() eq '6'}">selected</c:if> value="6">Director</option>  
                                        </select>                                    
                                    </div>
                                </div>
                                <div class="sm:col-span-2">
                                    <label for="postal-code" class="block text-sm font-medium leading-6 text-gray-900">Salary</label>
                                    <div class="mt-2">
                                        <input value="${employee.salary}" type="text" name="Salary" placeholder="Ex: 50,000,000" id="website" class="block w-full rounded-md border-0 py-1.5 px-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:max-w-xs sm:text-sm sm:leading-6" >
                                </div>
                            </div>


                        </div>
                    </div>
                    <div class="flex items-center justify-end gap-x-6 border-t border-gray-900/10 px-4 py-4 sm:px-8">
                        <button type="button" class="text-sm font-semibold leading-6 text-gray-900">Cancel</button>
                        <button type="submit" value="Submit" class="rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Save</button>
                    </div>
                </form>
            </div>



        </div>
        <%@ include file="/layout/footer.jsp" %>
    </body>
</html>
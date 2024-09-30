

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Domain.Enums.QualificationType" %>
<%@ page import="Domain.Enums.PositionType" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body>
        <%@ include file="../AdminNav.jsp" %>
        <c:set var="c" value="${employee}"/>
        <% String error = (String) request.getAttribute("error");%>
        <div class="overflow-hidden bg-white shadow sm:rounded-lg ">
            <div class="px-4 py-6 sm:px-6">
                <h3 class="text-base font-semibold leading-7 text-gray-900">Employee Information</h3>
                <p class="mt-1 max-w-2xl text-sm leading-6 text-gray-500">Personal details and application.</p>
            </div>
            <span class="text-red-400 font-medium text-lg"><%= error != null ? error : ""%></span>
            <form 
                class="border-t border-gray-100 mb-16"
                name="UpdateEmployee"
                method="POST"
                action="EmployeeController?action=update"
                >
                <dl class="divide-y divide-gray-100">
                    <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                        <dt class="text-sm font-medium text-gray-900">Employee ID</dt>
                        <dd class="mt-1 text-sm leading-6 text-gray-700 sm:col-span-2 sm:mt-0">
                            <input value="${c.id}" type="text" name="Id" readonly/>

                        </dd>
                    </div>
                    <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                        <dt class="text-sm font-medium text-gray-900">Full name</dt>
                        <dd class="mt-1 text-sm leading-6 text-gray-700 sm:col-span-2 sm:mt-0">
                            <input value="${c.fullName}" name="FullName" type="text"/>
                        </dd>
                    </div>
                    <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                        <dt class="text-sm font-medium text-gray-900">Date of Birth</dt>
                        <dd class="mt-1 text-sm leading-6 text-gray-700 sm:col-span-2 sm:mt-0">
                            <input value="${c.birthDate}"  name="BirthDate" type="date"/></dd>
                    </div>
                    <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                        <dt class="text-sm font-medium text-gray-900">Gender</dt>
                        <dd class="mt-1 text-sm leading-6 text-gray-700 sm:col-span-2 sm:mt-0">
                            <input value="${c.gender}" name="Gender" type="text"/></dd>
                    </div>
                    <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                        <dt class="text-sm font-medium text-gray-900">Identification number</dt>
                        <dd class="mt-1 text-sm leading-6 text-gray-700 sm:col-span-2 sm:mt-0">
                            <input value="${c.idNumber}" name="IdNumber"  type="text"/></dd>
                    </div>
                    <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                        <dt class="text-sm font-medium text-gray-900">Phone number</dt>
                        <dd class="mt-1 text-sm leading-6 text-gray-700 sm:col-span-2 sm:mt-0">
                            <input value="${c.phoneNumber}" name="PhoneNumber" type="text"/></dd>
                    </div>
                    <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                        <dt class="text-sm font-medium text-gray-900">Email address</dt>
                        <dd class="mt-1 text-sm leading-6 text-gray-700 sm:col-span-2 sm:mt-0">
                            <input value="${c.email}" name="Email" type="text"/></dd>
                    </div>
                    <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                        <dt class="text-sm font-medium text-gray-900">Qualification</dt>
                        <dd class="mt-1 text-sm leading-6 text-gray-700 sm:col-span-2 sm:mt-0">
                            <select id="country" name="Qualification" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:max-w-xs sm:text-sm sm:leading-6">
                                <option value="1" <c:if test="${c.qualification.getIndex() eq '1'}">selected</c:if>>Intermediate</option>
                                <option value="2" <c:if test="${c.qualification.getIndex() eq '2'}">selected</c:if>>College</option>
                                <option value="3" <c:if test="${c.qualification.getIndex() eq '3'}">selected</c:if>>University</option>
                                <option value="4" <c:if test="${c.qualification.getIndex() eq '4'}">selected</c:if>>PostGraduate</option>
                                </select>


                            </dd>
                        </div>
                        <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                            <dt class="text-sm font-medium text-gray-900">Position</dt>
                            <dd class="mt-1 text-sm leading-6 text-gray-700 sm:col-span-2 sm:mt-0">
                                <select name="Position" autocomplete="country-name" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:max-w-xs sm:text-sm sm:leading-6">
                                    <option <c:if test="${c.position.getIndex() eq '1'}">selected</c:if> value="1">Receptionist</option>  
                                <option <c:if test="${c.position.getIndex() eq '1'}">selected</c:if> value="2">Server</option> 
                                <option <c:if test="${c.position.getIndex() eq '1'}">selected</c:if> value="3">Specialist</option> 
                                <option <c:if test="${c.position.getIndex() eq '1'}">selected</c:if> value="4">Supervisor</option> 
                                <option <c:if test="${c.position.getIndex() eq '1'}">selected</c:if> value="5">Manager</option> 
                                <option <c:if test="${c.position.getIndex() eq '1'}">selected</c:if> value="6">Director</option>  
                                </select>  
                            </dd>
                        </div>

                        <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                            <dt class="text-sm font-medium text-gray-900">Salary</dt>
                            <dd class="mt-1 text-sm leading-6 text-gray-700 sm:col-span-2 sm:mt-0">
                                <input value="${c.salary} " name="Salary" type="text"/></dd>
                    </div>
                </dl>
                <div class="flex items-center justify-end gap-x-6 border-t border-gray-900/10 px-4 py-4 sm:px-8">
                    <button type="button" class="text-sm font-semibold leading-6 text-gray-900">Cancel</button>
                    <button type="submit" value="Submit" class="rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Update</button>
                </div>
            </form>

        </div>



    </body>
</html>

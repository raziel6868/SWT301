<%-- 
    Document   : welcome
    Created on : Jan 6, 2024, 2:06:37 PM
    Author     : jpesewang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <script src="https://cdn.tailwindcss.com"></script>
        <title>JSP Page</title>
    </head>
 <div class="relative bg-white">
  <div class="mx-auto max-w-7xl lg:grid lg:grid-cols-12 lg:gap-x-8 lg:px-8">
    <div class="px-6 pb-24 pt-10 sm:pb-32 lg:col-span-7 lg:px-0 lg:pb-56 lg:pt-48 xl:col-span-6">
      <div class="mx-auto max-w-2xl lg:mx-0">
        <img class="h-11" src="https://github.com/jpeseWang/ResortHub_Servlet/blob/main/web/assets/images/logo.png?raw=true" alt="Your Company">
        <div class="hidden sm:mt-32 sm:flex lg:mt-16">
          <div class="relative rounded-full px-3 py-1 text-sm leading-6 text-gray-500 ring-1 ring-gray-900/10 hover:ring-gray-900/20">
              Welcome <span class="whitespace-nowrap font-semibold text-indigo-600"><span class="absolute inset-0" aria-hidden="true"></span>${sessionScope.User.username} </span> to Resort Hub!
          </div>
        </div>
        <h1 class="mt-24 text-4xl font-bold tracking-tight text-emerald-400 sm:mt-10 sm:text-6xl">Login successfully!</h1>
        <p class="mt-6 text-lg leading-8 text-gray-600">Anim aute id magna aliqua ad ad non deserunt sunt. Qui irure qui lorem cupidatat commodo. Elit sunt amet fugiat veniam occaecat fugiat aliqua.</p>
        <div class="mt-10 flex items-center gap-x-6">
          <a href="/ResortHub/FacilityController?action=getMarketplaceItem&Page=1&PageSize=10" class="rounded-md bg-indigo-600 px-3.5 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Get started</a>
          <a href="/ResortHub" class="text-sm font-semibold leading-6 text-gray-900">Learn more <span aria-hidden="true">→</span></a>
        </div>
      </div>
    </div>
    <div class="relative lg:col-span-5 lg:-mr-8 xl:absolute xl:inset-0 xl:left-1/2 xl:mr-0">
      <img class="aspect-[3/2] w-full bg-gray-50 object-cover lg:absolute lg:inset-0 lg:aspect-auto lg:h-full" src="https://images.unsplash.com/photo-1708918025913-3674375f616b?q=80&w=2000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="">
    </div>
  </div>
</div>



</html>

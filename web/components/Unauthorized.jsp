<%-- 
    Document   : Unauthorized
    Created on : Feb 26, 2024, 9:16:04 PM
    Author     : PC0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Unauthorized Access</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body>
 
<div class="flex min-h-full flex-col bg-white pb-12 pt-16">
  <main class="mx-auto flex w-full max-w-7xl flex-grow flex-col justify-center px-6 lg:px-8">
    <div class="flex flex-shrink-0 justify-center">
      <a href="#" class="inline-flex">
        <span class="sr-only">Your Company</span>
        <img class="h-12 w-auto" src="https://github.com/jpeseWang/ResortHub_Servlet/blob/main/web/assets/images/logo.png?raw=true" alt="" />
      </a>
    </div>
    <div class="py-16">
      <div class="text-center">
        <p class="text-base font-semibold text-red-500">401</p>
        <h1 class="mt-2 text-4xl font-bold tracking-tight text-gray-900 sm:text-5xl">Unauthorized Access</h1>
        <p class="mt-2 text-base text-gray-500"> Sorry, you don't have the necessary permissions to access this resource.</p>
        <div class="mt-6">
          <a href="/ResortHub/" class="text-base font-medium text-indigo-600 hover:text-indigo-500">
            Go back home
            <span aria-hidden="true"> &rarr;</span>
          </a>
        </div>
      </div>
    </div>
  </main>
  <footer class="mx-auto w-full max-w-7xl flex-shrink-0 px-6 lg:px-8">
    <nav class="flex justify-center space-x-4">
      <a href="#" class="text-sm font-medium text-gray-500 hover:text-gray-600">Contact Support</a>
      <span class="inline-block border-l border-gray-300" aria-hidden="true"></span>
      <a href="#" class="text-sm font-medium text-gray-500 hover:text-gray-600">Status</a>
    </nav>
  </footer>
</div>

    </body>
</html>

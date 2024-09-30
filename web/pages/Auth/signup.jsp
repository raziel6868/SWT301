

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdn.tailwindcss.com"></script>
        <title>Sign Page</title>
    </head>
    <body>
        <jsp:include page="../../layout/header.jsp"/>  
        <div class="flex min-h-full flex-1 flex-col justify-center px-6 py-12 lg:px-8">
            <div class="sm:mx-auto sm:w-full sm:max-w-sm">
                <img class="mx-auto h-12 w-auto" src="../../assets/images/logo.png" alt="ResortHub Logo" />
                <h2 class="mt-10 text-center text-2xl font-extrabold leading-9 tracking-tight text-gray-900 font-gothic">
                    BECOME A RESORTHUB MEMBER
                </h2>
                <p class="mt-6 text-center font-light text-sm text-gray-500 px-4">
                    Create your ResortHub Member profile and get first access to the very
                    best of Nike products, inspiration and community.
                </p>
                <form class="space-y-4 items-center" >
                    <div class="my-2 w-9/12 mx-auto">
                         <input
                            type="text"
                            autoComplete="current-password"
                            placeholder="Customer ID"
                            required
                            class="block w-full rounded border-0 py-1.5 px-4 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6 my-4"
                            />
                          <input
                            type="text"
                            autoComplete="current-password"
                            placeholder="Full Name"
                            required
                            class="block w-full rounded border-0 py-1.5 px-4 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6 my-4"
                            />
                           <input
                            type="date"
                  
                            placeholder="Birthday"
                            required
                            class="block w-full rounded border-0 py-1.5 px-4 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6 my-4"
                            />
                        <input
                            id="email"
                            name="email"
                            type="email"
                            autoComplete="email"
                            placeholder="Email address"
                            required
                            class="items-center block w-full rounded border-0 py-1.5 px-4 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6 my-4"
                            />
                        <input
                            id="password"
                            name="password"
                            type="password"
                            autoComplete="current-password"
                            placeholder="Password"
                            required
                            class="block w-full rounded border-0 py-1.5 px-4 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6 my-4"
                            />
                       
                       
                    

                        <div class="flex items-center">
                            <input
                                id="remember-me"
                                name="remember-me"
                                type="checkbox"
                                class="h-10 w-10 rounded border-gray-200 text-indigo-600 focus:ring-indigo-600"
                                />
                            <label
                                htmlFor="remember-me"
                                class="text-xs leading-6 text-gray-500 font-light mx-2"
                                >
                                Sign up for emails to get offers and Member benefits
                            </label>
                        </div>
                    </div>
                    <div>
                        <div class="">
                            <p class="text-center font-light text-sm text-gray-500 py-3 px-4">
                                By creating an account, you agree to Resort Hub&apos;s 
                                <span class="underline">Privacy Policy</span> and
                                <span class="underline"> Terms of Use</span>.
                            </p>
                        </div>
                    </div>

                    <div>
                        <button
                            type="submit"
                            class="flex w-full justify-center rounded-sm bg-black px-3 py-2 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-gray-600 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
                            >
                            JOIN US
                        </button>
                    </div>
                </form>


                <p class="mt-10 text-center text-sm text-gray-500">
                    Already a member?
                    <a href="/ResortHub/pages/Auth/login.jsp" class=" leading-6 text-black underline">
                        Sign in.
                    </a>
                </p>
            </div>
        </div>

        <jsp:include page="../../layout/footer.jsp"/>  
    </body>
</html>

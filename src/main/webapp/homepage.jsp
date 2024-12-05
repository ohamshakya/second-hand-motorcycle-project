<%-- 
    Document   : homepage
    Created on : Nov 8, 2024, 12:48:07 PM
    Author     : ohams
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="style.css" rel="stylesheet">
  <script src="https://cdn.tailwindcss.com"></script>
   <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>

<body class="font-mono">
  <!-- top navbar -->
  <div class="top-header-wrapper border-b-4">
    <div class="top-header flex justify-between gap-10">
      <div class="top-header_left flex  gap-5">
        <div class="phone border-r-4 ml-4 flex gap-1 items-center">
          <svg class="w-4" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
            stroke="currentColor" class="size-6">
            <path stroke-linecap="round" stroke-linejoin="round"
              d="M2.25 6.75c0 8.284 6.716 15 15 15h2.25a2.25 2.25 0 0 0 2.25-2.25v-1.372c0-.516-.351-.966-.852-1.091l-4.423-1.106c-.44-.11-.902.055-1.173.417l-.97 1.293c-.282.376-.769.542-1.21.38a12.035 12.035 0 0 1-7.143-7.143c-.162-.441.004-.928.38-1.21l1.293-.97c.363-.271.527-.734.417-1.173L6.963 3.102a1.125 1.125 0 0 0-1.091-.852H4.5A2.25 2.25 0 0 0 2.25 4.5v2.25Z" />
          </svg>

          <p>(+977) 90101010101</p>
        </div>
        <div class="contact flex gap-1 items-center">
          <svg class="w-4" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
            stroke="currentColor" class="size-6">
            <path stroke-linecap="round" stroke-linejoin="round"
              d="M21.75 6.75v10.5a2.25 2.25 0 0 1-2.25 2.25h-15a2.25 2.25 0 0 1-2.25-2.25V6.75m19.5 0A2.25 2.25 0 0 0 19.5 4.5h-15a2.25 2.25 0 0 0-2.25 2.25m19.5 0v.243a2.25 2.25 0 0 1-1.07 1.916l-7.5 4.615a2.25 2.25 0 0 1-2.36 0L3.32 8.91a2.25 2.25 0 0 1-1.07-1.916V6.75" />
          </svg>

          <p>store@secondhand.com</p>
        </div>

      </div>
      <div class="top-header_right">
        <nav class="top-header_nav mr-4">
          <ul class="flex gap-10">
            <li>


              <a href="#" class="flex gap-1">
                <svg class="w-4" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                  stroke="currentColor" class="size-6">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M15 10.5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M19.5 10.5c0 7.142-7.5 11.25-7.5 11.25S4.5 17.642 4.5 10.5a7.5 7.5 0 1 1 15 0Z" />
                </svg>
                Store Location</a>
            </li>
            <li class="flex items-center justify-center gap-1">
                <a href="login.jsp" class="flex items-center justify-center gap-1">
                <svg class="w-4" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                  stroke="currentColor" class="size-6">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M15.75 6a3.75 3.75 0 1 1-7.5 0 3.75 3.75 0 0 1 7.5 0ZM4.501 20.118a7.5 7.5 0 0 1 14.998 0A17.933 17.933 0 0 1 12 21.75c-2.676 0-5.216-.584-7.499-1.632Z" />
                </svg>
                Login</a>
            </li>
          </ul>
        </nav>
      </div>
    </div>
  </div>
  <!-- Navbar section -->
  <header class="header border-b-4 p-3">
    <div class="header-wrapper flex justify-around items-center gap-14">
      <div class="logo">
          <img src="./assets/images/background.png" class="w-16 ml-4" alt="">
      </div>
      <div class="search_box">
        <form action="post">
          <div class="icon-wrapper flex items-center">
            <input type="text" name="search" class="w-[350px] border-2 rounded-lg p-1" placeholder="search Item">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
              stroke="currentColor" class="size-6">
              <path stroke-linecap="round" stroke-linejoin="round"
                d="m21 21-5.197-5.197m0 0A7.5 7.5 0 1 0 5.196 5.196a7.5 7.5 0 0 0 10.607 10.607Z" />
            </svg>

          </div>
        </form>
      </div>
      <div class="wrapper_logo ml-14">
        <div class="logo-wrapper">
          <ul class="flex items-center gap-14">
            <li>
              <a href="#"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                  stroke="currentColor" class="size-6">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M12 6v6h4.5m4.5 0a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z" />
                </svg></a>
            </li>
            <li>
              <a href="#">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                  stroke="currentColor" class="size-6">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12Z" />
                </svg>
              </a>
            </li>
            <li>
              <a href="#">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                  stroke="currentColor" class="size-6">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M2.25 3h1.386c.51 0 .955.343 1.087.835l.383 1.437M7.5 14.25a3 3 0 0 0-3 3h15.75m-12.75-3h11.218c1.121-2.3 2.1-4.684 2.924-7.138a60.114 60.114 0 0 0-16.536-1.84M7.5 14.25 5.106 5.272M6 20.25a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0Zm12.75 0a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0Z" />
                </svg>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </header>

  <!-- -------------Banner------------------------------- -->
  <main class="banner_wrapper bg-background-Banner h-80">
    <div class="banner flex justify-around items-center p-5">
      <div class="left-content">
          <img class="h-[300px]" src="./assets/images/Web-Banner-Dec-2023-1200x627-Generic.webp" alt="banner"/>

      </div>
      <div class="button flex flex-col">
        <button type="submit" name="browse" class="w-56 p-2  bg-[#090963]   border rounded-md text-white pt-2 pr-5 m-2">Browse bikes</button>
        <a href="seller.jsp" class="w-56 p-2  bg-[#090963]  border rounded-md  text-white">Seller</a>
      </div>
    </div>
  </main>

  <!-- Featured bikes -->
    <div class="container mx-auto mt-10 p-5">
        <h1 class="text-3xl font-bold mb-6 text-center">Featured Bikes</h1>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            <!-- Featured Bike 1 -->
            <div class="bg-white rounded-lg shadow-md overflow-hidden">
                <img src="./assets/images/secondhand1.jfif" alt="Mountain Bike" class="w-full h-48 object-cover">
                <div class="p-4">
                    <h2 class="text-xl font-semibold">R15</h2>
                    <p class="text-gray-700">Perfect for reving </p>
                    <p class="text-lg font-bold mt-2">150000</p>
                    <button class="mt-4 bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600 transition">
                        View Details
                    </button>
                </div>
            </div>

            <!-- Featured Bike 2 -->
            <div class="bg-white rounded-lg shadow-md overflow-hidden">
                <img src="./assets/images/secohand3.jfif" alt="Road Bike" class="w-full h-48 object-cover">
                <div class="p-4">
                    <h2 class="text-xl font-semibold">NS200</h2>
                    <p class="text-gray-700">Naked sport.</p>
                    <p class="text-lg font-bold mt-2">175000</p>
                    <button class="mt-4 bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600 transition">
                        View Details
                    </button>
                </div>
            </div>

            <!-- Featured Bike 3 -->
            <div class="bg-white rounded-lg shadow-md overflow-hidden">
                <img src="./assets/images/bike2.jfif" alt="" class="w-full h-48 object-cover">
                <div class="p-4">
                    <h2 class="text-xl font-semibold">NS 200</h2>
                    <p class="text-gray-700">A versatile bike for both road and trails.</p>
                    <p class="text-lg font-bold mt-2">210000</p>
                    <button class="mt-4 bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600 transition">
                        View Details
                    </button>
                </div>
            </div>

            <!-- Featured Bike 4 -->
            <div class="bg-white rounded-lg shadow-md overflow-hidden">
                <img src="./assets/images/bike1.jfif" alt="yamaha fz" class="w-full h-48 object-cover">
                <div class="p-4">
                    <h2 class="text-xl font-semibold">Fz</h2>
                    <p class="text-gray-700">Effortless riding </p>
                    <p class="text-lg font-bold mt-2">200000</p>
                    <button class="mt-4 bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600 transition">
                        View Details
                    </button>
                </div>
            </div>

            <!-- Featured Bike 5 -->
            <div class="bg-white rounded-lg shadow-md overflow-hidden">
                <img src="./assets/images/secondhand1.jfif" alt="fz" class="w-full h-48 object-cover">
                <div class="p-4">
                    <h2 class="text-xl font-semibold">r15</h2>
                    <p class="text-gray-700">A bike for riding on the road.</p>
                    <p class="text-lg font-bold mt-2">150000</p>
                    <button class="mt-4 bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600 transition">
                        View Details
                    </button>
                </div>
            </div>

            <!-- Featured Bike 6 -->
            <div class="bg-white rounded-lg shadow-md overflow-hidden">
                <img src="./assets/images/bike1.jfif" alt="Cruiser Bike" class="w-full h-48 object-cover">
                <div class="p-4">
                    <h2 class="text-xl font-semibold">Cruiser Bike</h2>
                    <p class="text-gray-700">Stylish and comfortable for leisurely rides.</p>
                    <p class="text-lg font-bold mt-2">200000</p>
                    <button class="mt-4 bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600 transition">
                        View Details
                    </button>
                </div>
            </div>
        </div>
    </div>
  
   <section>
    <div class="works-wrapper p-5 text-center m-5">
      <h2 class="text-center font-semibold text-2xl">How It Works</h2>
     <div class="steps-wrapper flex justify-around p-3">
      <div class="steps w-[30%]">
        <h3 class="font-bold">1.Browse</h3>
        <p class="mt-4">Explore our selection of bikes available for sale</p>
      </div>
      <div class="steps w-[30%]">
        <h3 class="font-bold">2. Buy</h3>
        <p class="mt-4">Contact sellers and negotiate the price.</p>
      </div>
      <div class="steps w-[30%]">
        <h3 class="font-bold">3. Sell</h3>
        <p class="mt-4">List your bike and connect with interested buyers.</p>
      </div>
     </div>

    </div>
   </section>

  <!---------------------------------------- Footer----------------------------------- -->
  <footer class="footer bg-[#FFF8F8] h-64">
    <div class="footer_wrapper p-1 flex justify-between items-center">
      <div class="brand">
        <h2 class="brand-head text-xl font-bold">Brand</h2>
        <p>Lorem ipsum</p>
        <div class="social-links">

        </div>
      </div>
      <div class="Information">
        <div class="information-wrap">
          <h3 class="text-xl font-bold">Informations</h3>
          <ul class="flex flex-col gap-2">
            <li>
              <a href="#">About us</a>
            </li>
            <li>
              <a href="#">Information</a>
            </li>
            <li>
              <a href="#">Terms & Conditions</a>
            </li>
            <li>
              <a href="#">Help center</a>
            </li>
          </ul>
        </div>

      </div>
      <div class="customer-service">
        <h3 class="text-xl font-bold">Customer Services</h3>
        <div class="customer-wrap">
          <ul class="flex flex-col gap-2">
            <li>
              <a href="#">My Account</a>
            </li>
            <li>
              <a href="#">Wishlist</a>
            </li>
            <li>
              <a href="#">Newsletter</a>
            </li>
            <li>
              <a href="#">Contact us</a>
            </li>
          </ul>
        </div>

      </div>
      <div class="MyAccount">
        <h3 class="text-xl font-bold">My Account</h3>
        <div class="account-wrap">
          <ul class="flex flex-col gap-2">
            <li>
              <a href="#">My account</a>
            </li>
            <li>
              <a href="#">Order history</a>
            </li>
            <li>
              <a href="#">wish list</a>
            </li>
            <li>
              <a href="#">news letter</a>
            </li>
          </ul>
        </div>

      </div>
    </div>
    <div class="copyright m-5">
      <p class="text-center">&copy;
        <script>document.write(new Date().getFullYear())</script> All rights reserved
      </p>
    </div>
  </footer>

</body>

</html>

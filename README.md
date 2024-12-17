# About
This is a small E-commerce project developed to demonstrate my skills in modern web development technologies.   
The application consists of a .NET 8 backend and an Angular 18 frontend, utilizing various tools and frameworks to provide a seamless and functional experience.

# Stacks of this project

__Backend__
- .NET 8
- Entity Framework Core (Migrations)
- Identity Provider
- MySQL
- Redis - _(to store the cart)_
- SingalR - _(to notify the frontend the payment status)_
- Stripe Webhook - _(to notify when the payment status changes)_
- REST Api
- Swagger
- Visual Studio Community 2022
- Google Chrome (using React DevTools) - main browser

  
__Frontend - Angular 18__
- Angular Material - _(https://material.angular.io/)_
- Tailwind CSS - _(https://tailwindcss.com/)_
- Stripe - Payment Gateway
- mkcert - localhost certificate - _(https://github.com/FiloSottile/mkcert)_
- Visual Studio Code - Extensions (Angular Language Service, Tailwind CSS IntelliSense, Auto Rename Tag)

# Screenshots

### Screenshots

<div align="center">
    <img src="screenshots/home.jpg" width="30%">
    <img src="screenshots/cart-empty.jpg" width="30%">
    <img src="screenshots/cart-full.jpg" width="30%">
    <img src="screenshots/catalog-products-filter-search.jpg" width="30%">
    <img src="screenshots/catalog-products-filter-sort.jpg" width="30%">
    <img src="screenshots/catalog-products-filter.jpg" width="30%">
    <img src="screenshots/catalog-products-pagination.jpg" width="30%">
    <img src="screenshots/catalog-products.jpg" width="30%">
    <img src="screenshots/logged-menu.jpg" width="30%">
    <img src="screenshots/logged-order-history-detail.jpg" width="30%">
    <img src="screenshots/logged-order-history.jpg" width="30%">
    <img src="screenshots/login.jpg" width="30%">
    <img src="screenshots/register.jpg" width="30%">
    <img src="screenshots/checkout-address.jpg" width="30%">   
    <img src="screenshots/checkout-shipping.jpg" width="30%">    
    <img src="screenshots/checkout-credit-card.jpg" width="30%">
    <img src="screenshots/checkout-confirmation.jpg" width="30%">    
    <img src="screenshots/checkout-processing.jpg" width="30%">  
    <img src="screenshots/checkout-processed-success.jpg" width="30%">
    <img src="screenshots/stripe-transaction.jpg" width="30%">
</div>

# Backend - Setting up the application

1 - For Redis, I created a free database on the website https://cloud.redis.io and connect locally using "Redis Insight"
<div align="center">  

  <img src="https://github.com/user-attachments/assets/56ead3aa-eb82-4e20-a21d-d1f9943b885a" width="40%">
  <img src="https://github.com/user-attachments/assets/834f047b-aaca-47f9-bc8c-43b0d4a2badd" width="40%">
</div>

2 - For Gateway Payments, I'm using "Stripe" as developement account
<div align="center">
    <img src="https://github.com/user-attachments/assets/9c38809a-4cf9-4452-8050-51706311d21b" width="40%">
    <img src="https://github.com/user-attachments/assets/36a98c9f-ab7a-43f7-8dbb-d6292d89691e" width="40%">
</div>

# Frontend - Setting up the application

1 - Install the Angular Material to work with template components  
```VS Code terminal
ng add @angular/material
```
Choose the options bellow during the angular installation <br>
✔ Choose a prebuilt theme name, or "custom" for a custom theme: Azure/Blue  
✔ Set up global Angular Material typography styles? no  
✔ Include the Angular animations module? Include and enable animations  

2 - Install Tailwind CSS  
```VS Code terminal
npm install -D tailwindcss postcss autoprefixer
```
```VS Code terminal
npx tailwindcss init
```
 
3 - It will generate the file "tailwind.config.js".  
Open it and add the code bellow
```VS Code terminal
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/**/*.{html,js}"],
  theme: {
    extend: {},
  },
  plugins: [],
}
```  

4 - Now open the styles.scss and add the code bellow as well  
```VS Code terminal
@tailwind base;
@tailwind components;
@tailwind utilities;
```

5 - Add signalR   
```VS Code terminal
npm install @microsoft/signalr
```

6 - Executes the command bellow to run the application  

```VS Code terminal
stripe listen --forward-to https://localhost:6001/api/v1/payment/webhook -e payment_intent.succeeded
```

```VS Code terminal
ng serve
```

# Frontend - Setting up  Stripe Webhook

1 - Donwload the stripe windows zip file and extract it   
https://docs.stripe.com/stripe-cli?install-method=windows

2 - Open the windows CMD with the download path   
```CMD
cd C:\Users\Wellington\Downloads\stripe_1.22.0_windows_x86_64
```

3 - Exec the stripe.exe
```CMD
stripe.exe
```

4 - Exec the login command
```CMD
stripe login
```   
It will appears a endpoint to access and authorize such as   
"https://dashboard.stripe.com/stripecli/confirm_auth?t=6DLIJiUX8lakQdxKRXcoVH5La191HoNt"

4 - After the authorization you need to run the command following the documentation above   

https://docs.stripe.com/webhooks/quickstart?lang=dotnet

```CMD
stripe listen --forward-to https://localhost:6001/api/v1/payment/webhook -e payment_intent.succeeded
```
It return the "whsec_". Copy it and add in your appsettings.json

# Installing Browser Certificate
Angular works better with a broser certificate. Because of that we need to generate a free localhost certificate

Run the commands bellow to install it.

```VS Code terminal
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
iwr -useb get.scoop.sh | iex
```

```VS Code terminal
scoop bucket add extras
```  

```VS Code terminal
scoop install mkcert
```

Create a root folder called 'ssl' get inside it  

```VS Code terminal
cd ssl
```  

```VS Code terminal
mkcert -install
```  

```VS Code terminal
mkcert localhost
```  

it will generate the certificates files  
![image](https://github.com/user-attachments/assets/44ba92ab-ab47-42df-a4b8-ffe2c3fd8ed0)

Open the "angular.json" file and add the "options" code bellow inside the property "serve"  
```VS Code terminal
"serve": {
  "builder": "@angular-devkit/build-angular:dev-server",
  "options": {
    "ssl": true,
    "sslCert": "ssl/localhost.pem",
    "sslKey": "ssl/localhost-key.pem"
  },
```  

Run the application using https://localhost:myport

Before certificate  
![image](https://github.com/user-attachments/assets/b71c1f5d-003f-4a3a-98c2-9a8f8e41d2ea)  

After certificate setup  
![image](https://github.com/user-attachments/assets/350d503a-9550-4711-a037-c2592c4457a0)  


# Deploy the application

### Frontend
1 - Create folder where the frontend will publish it.   
In my case I created a file named "wwwroot" inside the application "poc.fullstack.angular.guitarshop.api"

2 - Open the file "angular.json" and change the path where you'll deploy the frontend application in the directory bellow   
projects -> architect -> build -> options -> outputPath
```angular.json
"outputPath": {
   "base": "../poc.fullstack.angular.guitarshop.api/wwwroot",
  "browser": ""
}
```

3 - We also needs to change the propertiies "maximumWarning": "1MB" and "maximumError": "2MB". To avoid error during the angular build.   

4- Run the command bellow to generate the build.
```VS Code
ng buld
```

### Backend
1 - We need to configure the middleware in the Program.cs adding the code bellow

```Program.cs
app.UseDefaultFiles();
app.UseStaticFiles();
```

2 - Add the code bellow befero we created the new controller.
```
app.MapFallbackToController("Index", "Fallback");
```

3 - We also need create a new controller named "FallbackController.cs"
```
public sealed class FallbackController : Controller
{
    public IActionResult Index() =>
        PhysicalFile(Path.Combine(Directory.GetCurrentDirectory(),
            "wwwroot", "index.html"), "text/HTML");
}
```
4 - On the Azure Server, creates a new resource group named "poc-angular-guitarshop-rg"
![image](https://github.com/user-attachments/assets/47d64aeb-6a3d-4dbc-9570-49dcaee1e207)

5 - On the Azure Server, creates a new "Web App"
![image](https://github.com/user-attachments/assets/cc91cdc6-34a2-40b5-a428-aaf3aac9a169)


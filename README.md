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
<p align="center">
  

  <img src="![Descrição da imagem](https://raw.githubusercontent.com/seu-repositorio/imagens/image1.png)" width="32%">
  <img src="https://github.com/user-attachments/assets/308d6490-e910-461e-99d3-b70ca2192238" width="32%">
  <img src="https://github.com/user-attachments/assets/308d6490-e910-461e-99d3-b70ca2192238" width="32%">
</p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/308d6490-e910-461e-99d3-b70ca2192238" alt="Screenshot 1" width="32%" />
  <img src="https://github.com/user-attachments/assets/ea9cc5ce-6683-43fc-9b63-6efcdbc5eab1" alt="Screenshot 2" width="32%" />
  <img src="https://github.com/user-attachments/assets/f893037e-3559-4122-86c0-ab49cd68804c" alt="Screenshot 3" width="32%" />
</p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/308d6490-e910-461e-99d3-b70ca2192238" alt="Screenshot 1" width="32%" />
  <img src="https://github.com/user-attachments/assets/ea9cc5ce-6683-43fc-9b63-6efcdbc5eab1" alt="Screenshot 2" width="32%" />
  <img src="https://github.com/user-attachments/assets/f893037e-3559-4122-86c0-ab49cd68804c" alt="Screenshot 3" width="32%" />
</p>




# Backend - Setting up the application


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



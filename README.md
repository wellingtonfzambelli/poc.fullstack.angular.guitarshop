# About

# Stacks of this project

__Backend__
- .NET 8
- Entity Framework Core (Migrations)
- MySQL
- Web Api
- Swagger
- Visual Studio Community 2022
- Google Chrome (using React DevTools) - main browser

  
__Frontend - Angular 18__
- mkcert - localhost certificate - _(https://github.com/FiloSottile/mkcert)_
- Angular Material - _(https://material.angular.io/)_
- Tailwind CSS - _(https://tailwindcss.com/)_

# Backend - Setting up the application
1 - Run migration commands
```Migrations
dotnet ef migrations add SeedProducts
```
```Migrations
dotnet ef database update
```
2 - Run the application once (press F5) and stop it!

It'll run the SEED logic on the "Progran.cs" file for the initial data in the 'Products' table
![image](https://github.com/user-attachments/assets/845848f5-9687-4c3d-ac5f-c4cc93b4ebca)

3 - Install the SQLite extension for Visual Studio
![image](https://github.com/user-attachments/assets/88ab2ade-e37e-4d34-9b90-1efc4d550612)

4 - Open the SQLite window and you're ready to run the queries
![image](https://github.com/user-attachments/assets/5a2fdebe-30b6-4d15-bab9-1c0dc71f2a4c)

# Frontend - Setting up the application
1 - Open the workspace "poc.fullstack.guitarshop.frontend" on the Visual Studio Code

2 - Install the node.js

3 - On the terminal execute the commands bellow

```VS Code terminal
npm install
```

```VS Code terminal
node --version
```

```VS Code terminal
npm --version
```

```VS Code terminal
npm install -g @angular/cli
```

```VS Code terminal
ng version
```

```VS Code terminal
ng new client
```

Choose the options bellow during the angular installation <br>
✔ Which stylesheet format would you like to use? Sass (SCSS) <br>
✔ Do you want to enable Server-Side Rendering (SSR) and Static Site Generation (SSG/Prerendering)? no <br><br/>

4 - After the installation, get in the new angular folder   
```VS Code terminal
cd poc.fullstack.angular.guitarshop.frontend
```

5 - Install the Angular Material to work with template components  
```VS Code terminal
ng add @angular/material
```
Choose the options bellow during the angular installation <br>
✔ Choose a prebuilt theme name, or "custom" for a custom theme: Azure/Blue  
✔ Set up global Angular Material typography styles? no  
✔ Include the Angular animations module? Include and enable animations  

6 - Executes the command bellow to run the application  
```VS Code terminal
ng serve
```

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



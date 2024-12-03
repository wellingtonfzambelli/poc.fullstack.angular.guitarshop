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

  
__Frontend - Angular__


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

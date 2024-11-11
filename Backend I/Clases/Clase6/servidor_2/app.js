import express from "express";

const PORT = 8080;
const app = express();

//Endpoints
app.get("/saludo", (request, response)=>{
    response.send("<h1>Hola Mundo desde Express</h1>");
});

app.get("/bienvenida", (request, response)=>{
    response.send("<h1 style='color:red';>Bienvenidos</h1>");
});

app.get("/users", (request, response)=>{
    const user = {
        first_name:'Juan',
        age: 25
    };

    const userJSON = JSON.stringify(user);
    response.json(userJSON);
});


app.listen(PORT, ()=>{
    console.log(`Executándose en http://localhost:${PORT}`);
    
});
/*
    Dado un arreglo de objetos de tipo usuario
    realizar un servidor en express que permita
    obtener dichos usuarios

    La ruta raiz "/" debe devolver todos los usuarios

    La ruta /:userId debe devolver solo al usuario con dicho Id


*/ 

import express from "express";
import usuarios from "./usuarios.js";

const PORT = 8080;
const app = express();

//Query params ?
app.get("/", (request, response)=>{
    const {country} = request.query; //?country=ARG, & para mas de uno
    
    let usersResponse = usuarios
    console.log(usuarios);
    
    if (country) {
        usersResponse = usuarios.filter((usuario) =>usuario.country === country)
    }
    
    const usersJson = JSON.stringify(usersResponse);
    response.json(usersJson);
})

//Path params /:userID
app.get("/:userId", (request, response)=>{
    const {userId} = request.params;

    const userFound = usuarios.find((usuario)=> usuario.id === Number(userId))
    if (!userFound) {
        return response.json(JSON.stringify({msg:"ID NOT FOUND"}));
    }    
    response.json(JSON.stringify(userFound));
});



app.listen(PORT, ()=>{
    console.log(`Executándose en http://localhost:${PORT}`);
    
});
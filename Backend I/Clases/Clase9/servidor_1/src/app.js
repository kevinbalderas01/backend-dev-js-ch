import express from 'express';
import routerPets from './routes/pets.router.js';
import routerUsers from './routes/users.router.js';


const app = express()
const PORT = 8080

//Para codificar json en post
app.use(express.json())
app.use(express.urlencoded({extended:true}))

app.use("/api/pets", routerPets);
app.use("/api/users", routerUsers);

app.use("/api/public",express.static("./src/public"))


//Se levanta el servidor oyendo en puerto definido
app.listen(PORT, ()=>{
    console.log(`Ejecutándose en http://localhost:${PORT}`); 
});




import express from 'express';
import paths from './utils/paths.js';
import {routerProducts} from './routes/products.router.js';
import routerCarts from "./routes/carts.router.js";
import routerViewHome from './routes/home.view.router.js';

import { config as configHandlebars } from "./config/handlebars.config.js";
import { config as configWebsocket } from "./config/websocket.config.js";
import { connectDB } from './config/mongoose.config.js';



const app = express()
const PORT = 8080

connectDB();

//Para codificar json en post
app.use(express.json())
app.use(express.urlencoded({extended:true}))
configHandlebars(app)


app.use("/api/products", routerProducts);
app.use("/api/carts", routerCarts);
app.use("/", routerViewHome);

app.use("/api/public",express.static(paths.public))

app.use("*", (req, res) =>{
    res.status(404).render("error404", {title:"Error 404"})
})


//Se levanta el servidor oyendo en puerto definido
const httpServer = app.listen(PORT, ()=>{
    console.log(`Ejecutándose en http://localhost:${PORT}`); 
});

configWebsocket(httpServer)




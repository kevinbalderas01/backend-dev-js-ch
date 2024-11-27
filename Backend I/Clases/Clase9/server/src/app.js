import express from 'express';
import paths from './utils/paths.js';
import routerProducts from './routes/products.router.js';
import routerViewProducts from './routes/products.view.router.js';
import routerCarts from "./routes/carts.router.js";
import { config as configHandlebars } from "./config/handlebars.config.js";


const app = express()
const PORT = 8080

//Para codificar json en post
app.use(express.json())
app.use(express.urlencoded({extended:true}))
configHandlebars(app)


app.use("/api/products", routerProducts);
app.use("/api/carts", routerCarts);
app.use("/api/public",express.static(paths.public))

app.use("/products", routerViewProducts);

app.use("*", (req, res)=>{
    res.status(404).render("error404", {title:"Error 404"})
} );


//Se levanta el servidor oyendo en puerto definido
app.listen(PORT, ()=>{
    console.log(`Ejecutándose en http://localhost:${PORT}`); 
});




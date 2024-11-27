import { Router } from "express";
import uploader from "../utils/uploader.js";
import ProductManager from "../managers/productManager.js";

const router = Router();
const productManager = new ProductManager();


router.get('/:id', async (req, res)=>{
    try {
        const product = await productManager.getOneById(req.params.id)        
        res.status(200).render("product", {title: "Datos del Producto", product});
    } catch (error) {
        res.status(error.code || 500).send(`<h1>Error</h1><h3>${error.message}</h3>`);

    }
})

router.get('/', async (req, res)=>{
    try {
        const products = await productManager.getAll()        
        res.status(200).render("products", {title: "Lista Productos", products});
    } catch (error) {
        res.status(error.code || 500).send(`<h1>Error</h1><h3>${error.message}</h3>`);

    }
})

export default router;
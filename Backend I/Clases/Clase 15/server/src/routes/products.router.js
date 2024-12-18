import { Router } from "express";
import uploader from "../utils/uploader.js";
import ProductManager from "../managers/productManager.js";

export const routerProducts = Router();
export const productManager = new ProductManager();


//----------------------------------------GET Methods
routerProducts.get('/', async(req, res)=>{
    try {
        const products = await productManager.getAll(req.query)
        res.status(200).json({status:'success', payload: products});
    } catch (error) {
        res.status(error.code || 500).json({status:'error',  message: error.message});

    }
})

routerProducts.get('/:pid', async(req, res)=>{
    try {
        const product = await productManager.getOneById(req.params?.pid) 
        res.status(200).json({status:'success', payload: product});
    } catch (error) {
        res.status(error.code || 500).json({status:'error',  message: error.message});

    }
})

routerProducts.post('/',uploader.single('file') ,async(req, res)=>{
    try {
        const product = await productManager.insertOne(req.body, req)
        res.status(201).json({status:'success', payload: product});
    } catch (error) {
        res.status(error.code || 500).json({status:'error',  message: error.message});

    }
})

routerProducts.put('/:pid', uploader.single('file'), async(req, res)=>{
    try {
        const product = await productManager.updateOneById(req.params?.pid, req.body, req)
        res.status(200).json({status:'success', payload: product});
    } catch (error) {
        res.status(error.code || 500).json({status:'error',  message: error.message});

    }
})

routerProducts.delete('/:pid', async(req, res)=>{
    try {
        const product = await productManager.deleteOneById(req.params?.pid)
        res.status(200).json({status:'success'});
    } catch (error) {
        res.status(error.code || 500).json({status:'error',  message: error.message});

    }
})


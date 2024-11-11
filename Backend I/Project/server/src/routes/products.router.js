import { Router } from "express";
import uploader from "../utils/uploader.js";
import ProductManager from "../managers/productManager.js";

const router = Router();
const productManager = new ProductManager();


//----------------------------------------GET Methods
router.get('/', async(req, res)=>{
    try {
        const products = await productManager.getAll()
        res.status(200).json({status:'success', payload: products});
    } catch (error) {
        res.status(error.code || 500).json({status:'error',  message: error.message});

    }
})

router.get('/:pid', async(req, res)=>{
    try {
        const product = await productManager.getOneById(req.params?.pid) //Optional chaining
        res.status(200).json({status:'success', payload: product});
    } catch (error) {
        res.status(error.code || 500).json({status:'error',  message: error.message});

    }
})

router.post('/',uploader.single('file') ,async(req, res)=>{
    try {
        const product = await productManager.insertOne(req.body, req)
        res.status(201).json({status:'success', payload: product});
    } catch (error) {
        res.status(error.code || 500).json({status:'error',  message: error.message});

    }
})

router.put('/:pid', uploader.single('file'), async(req, res)=>{
    try {
        const product = await productManager.updateOneById(req.params?.pid, req.body, req)
        res.status(200).json({status:'success', payload: product});
    } catch (error) {
        res.status(error.code || 500).json({status:'error',  message: error.message});

    }
})

router.delete('/:pid', async(req, res)=>{
    try {
        const product = await productManager.deleteOneById(req.params?.pid)
        res.status(200).json({status:'success'});
    } catch (error) {
        res.status(error.code || 500).json({status:'error',  message: error.message});

    }
})

export default router;
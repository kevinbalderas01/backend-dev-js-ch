import { Router } from "express";
import uploader from "../utils/uploader.js";
import CartManager from "../managers/cartManager.js";

const router = Router();
const cartManager = new CartManager();

//----------------------------------------GET Methods
router.get('/', async(req, res)=>{
    try {
        const carts = await cartManager.getAll()
        res.status(200).json({status:'success', payload: carts});
    } catch (error) {
        res.status(error.code || 500).json({status:'error',  message: error.message});

    }
})

router.get('/:pid', async(req, res)=>{
    try {
        const cart = await cartManager.getOneById(req.params?.pid) //Optional chaining
        res.status(200).json({status:'success', payload: cart});
    } catch (error) {
        res.status(error.code || 500).json({status:'error',  message: error.message});

    }
})

//---------------------------------------POST Methods
router.post('/',uploader.single('file') ,async(req, res)=>{
    try {
        const cart = await cartManager.insertOne()
        res.status(201).json({status:'success', payload: cart});
    } catch (error) {
        res.status(error.code || 500).json({status:'error',  message: error.message});

    }
})

router.post('/:cid/product/:pid',uploader.single('file') ,async(req, res)=>{
    try {
        const cart = await cartManager.insertOnAnother(req.params?.cid , req.params?.pid)
        res.status(201).json({status:'success', payload: cart});
    } catch (error) {
        res.status(error.code || 500).json({status:'error',  message: error.message});

    }
})

export default router;
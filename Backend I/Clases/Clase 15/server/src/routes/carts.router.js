import { Router } from "express";
import uploader from "../utils/uploader.js";
import CartManager from "../managers/cartManager.js";

const router = Router();
const cartManager = new CartManager();

//----------------------------------------GET Methods
router.get('/', async(req, res)=>{
    try {
        const carts = await cartManager.getAll(req.query)
        res.status(200).json({status:'success', payload: carts});
    } catch (error) {
        res.status(error.code || 500).json({status:'error',  message: error.message});

    }
})

router.get('/:cid', async(req, res)=>{
    try {
        const cart = await cartManager.getOneById(req.params?.cid) 
        res.status(200).json({status:'success', payload: cart});
    } catch (error) {
        res.status(error.code || 500).json({status:'error',  message: error.message});

    }
})

//---------------------------------------POST Methods
router.post('/',async(req, res)=>{
    try {
        const cart = await cartManager.insertOne(req.body)
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


router.put('/:cid', async(req, res)=>{
    try {
        const cart = await cartManager.updateOne(req.body, req.params?.cid) 
        res.status(200).json({status:'success', payload: cart});
    } catch (error) {
        res.status(error.code || 500).json({status:'error',  message: error.message});

    }
})

router.put('/:cid/products/:pid', async(req, res)=>{
    try {
        const cart = await cartManager.updateOnAnother(req.body, req.params?.cid , req.params?.pid ) 
        res.status(200).json({status:'success', payload: cart});
    } catch (error) {
        res.status(error.code || 500).json({status:'error',  message: error.message});

    }
})

router.delete('/:cid/product/:pid',async(req, res)=>{
    try {
        const cart = await cartManager.deleteOnAnother(req.params?.cid , req.params?.pid)
        res.status(200).json({status:'success', payload: cart});
    } catch (error) {
        res.status(error.code || 500).json({status:'error',  message: error.message});

    }
})

router.delete('/:cid/products',async(req, res)=>{
    try {
        const cart = await cartManager.deleteAll(req.params?.cid)
        res.status(200).json({status:'success', payload: cart});
    } catch (error) {
        res.status(error.code || 500).json({status:'error',  message: error.message});

    }
})

export default router;
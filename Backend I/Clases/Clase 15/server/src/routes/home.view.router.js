import { Router } from "express";

const router = Router();

router.get('/', async(req, res)=>{
    try {
        res.render("home", {title: "Inicio"})
    } catch (error) {
        res.status(500).send(`<h1>Error</h1><h3>${error.message}</h3>`)
    }
})

router.get('/carts/:cid', async(req, res)=>{
    try {
        res.render("home2", {title: "Inicio", cid:req.params?.cid})
    } catch (error) {
        res.status(500).send(`<h1>Error</h1><h3>${error.message}</h3>`)
    }
})

router.get('/realTimeProducts', async(req, res)=>{
    try {
        res.render("realTimeProducts", {title: "Tiempo Real"})
    } catch (error) {
        res.status(500).send(`<h1>Error</h1><h3>${error.message}</h3>`)
    }
})

export default router
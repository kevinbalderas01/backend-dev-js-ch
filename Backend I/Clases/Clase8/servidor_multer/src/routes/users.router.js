import { Router } from "express";

const router = Router();

const users = [];

router.get('/', (req, res)=>{
    res.status(200).json({status:'success', payload: users});
})

router.post('/', (req, res)=>{
    const {name, surname}= req.body;
    const user = {
        name,
        surname
    }
    users.push(user)
    res.status(201).json({status:'success', payload: user});
}) 

export default router;
/*
    200- Status ok
    400- Error de cliente
    500- Error de servidor
*/ 
import express from 'express';
import {users, generateId} from './usuarios.js';

const app = express()
const PORT = 8080

//Para codificar json en post
app.use(express.json())


app.get('/api/users', (req, res)=>{
    res.status(200).json({status:'sucess', users})
})

app.get('/api/user/:id', (req, res)=>{
    const {id} = req.params;
    const user = users.find((user)=>user.id === Number(id))


    if (isNaN(id)) {
        return res.status(400).json({status:'error', msg:'ID debe ser un número entero'})
    }

    if (!user) {
        return res.status(404).json({status:'error', msg:'ID no encontrado'})
    }
    res.status(200).json({status:'sucess', user})
})

app.post('/api/users', (req, res)=>{
    const {firstName, lastName, age, email, country} = req.body
    if (!firstName || !lastName || !age || !email || !country) {
        return res.status(400).json({status:'error', msg:'Faltan datos obligatorios'})
    }
    const user = {
        id: generateId(),
        firstName,
        lastName,
        age,
        email,
        country
    }
    users.push(user)
    res.status(201).json({status:'sucess', user})
})

app.put('/api/users/:id', (req, res)=>{
    const {id} = req.params;
    const {firstName, lastName, age, email, country} = req.body
    const index = users.findIndex((user)=>user.id === Number(id))

    if (isNaN(id)) {
        return res.status(400).json({status:'error', msg:'ID debe ser un número entero'})
    }
    if (index<0) {
        return res.status(404).json({status:'error', msg:'ID no encontrado'})
    }
    if (!firstName || !lastName || !age || !email || !country) {
        return res.status(400).json({status:'error', msg:'Faltan datos obligatorios'})
    }
    //Sobreescribir con spread operator
    const user = {
        ...users[index],
        firstName,
        lastName,
        age,
        email,
        country
    }
    users[index] = user;
    res.status(200).json({status:'sucess', user})
})


app.delete('/api/users/:id', (req, res)=>{
    const {id} = req.params;
    const index = users.findIndex((user)=>user.id === Number(id))

    if (isNaN(id)) {
        return res.status(400).json({status:'error', msg:'ID debe ser un número entero'})
    }

    if (index<0) {
        return res.status(404).json({status:'error', msg:'ID no encontrado'})
    }

    users.splice(index,1);
    res.status(200).json({status:'sucess'})
})

//Se levanta el servidor oyendo en puerto definido
app.listen(PORT, ()=>{
    console.log(`Ejecutándose en http://localhost:${PORT}`); 
});




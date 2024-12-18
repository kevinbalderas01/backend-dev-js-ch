import {connect, Types} from 'mongoose';

export const connectDB = async()=>{
    const URL = "mongodb+srv://balderaskevin011:UeKYDVh2i7eMBc8r@cluster0.6af9n.mongodb.net/prueba";
    try {
        await connect(URL);
        console.log("Conectado a MongoDB");
    } catch (error) {
        console.log("Error al conectar con MongoDB", error.message);
    }
};

export const isValidId = (id)=>{
    return Types.ObjectId.isValid(id)
};
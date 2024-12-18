import {Schema, model} from 'mongoose';
import paginate from "mongoose-paginate-v2";

const productSchema = new Schema({
    title: {
        type: String, 
        required: [true, "El nombre es obligatorio"]
    },

    description: {
        type: String, 
        required: [true, "La descripcion es obligatoria"]
    },

    code: {
        type: String, 
        required: [true, "El codigo es obligatorio"]
    },
    price : {
        type: Number, 
        min: [0, "El precio debe ser un numero mayor a 0"]
    },

    status : {
        type: Boolean, 
    },

    stock : {
        type: Number, 
        min: [0, "El stock debe ser un numero mayor a 0"]
    },

    category: {
        type: String, 
        required: [true, "La categoria es obligatorio"]
    },

    thumbnail: {
        type: String, 
    },

});

productSchema.plugin(paginate)

const ProductModel = model("products",productSchema);

export default ProductModel;
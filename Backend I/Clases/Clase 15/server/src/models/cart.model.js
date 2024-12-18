import {Schema, model} from 'mongoose';
import paginate from "mongoose-paginate-v2";

const courseSchema = new Schema({
    products: [
        {
            product: {
                type: Schema.Types.ObjectId,
                ref: "products",
                required: [ true, "El nombre del priducto es obligatorio" ],
            },
            quantity: {
                type: Number,
                required: [ true, "La cantidad del ingrediente es obligatoria" ],
                min: [ 1, "La cantidad debe ser mayor que 0" ],
            },
            
        },
    ],
}, {
    timestamps: true, // Añade timestamps para generar createdAt y updatedAt
    versionKey: false, // Elimina el campo __v de versión
});

courseSchema.plugin(paginate)

const CartModel = model("carts",courseSchema);

export default CartModel;
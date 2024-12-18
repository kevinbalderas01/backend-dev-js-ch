import ErrorManager from "./errorManager.js";

import CartModel from "../models/cart.model.js";
import { isValidId } from "../config/mongoose.config.js";

import { productManager } from "../routes/products.router.js";


export default class CartManager{

    #cartModel;
    #carts

    constructor(){
        this.#cartModel = CartModel;
    }

    async $findOneById(id){
        if (!isValidId(id)) {
            throw new ErrorManager('ID no valido', 400)
        }

        const cart = await this.#cartModel.findById(id).populate("products.product");
        if (!cart) {
            throw new ErrorManager("ID no encontrado", 404)
        }
        return cart
    }

    async getAll(params){
        try {
            const paginationOptions = {
                limit:params?.limit || 10,
                page:params?.page || 1,
                lean: true
            }
            this.#carts = await this.#cartModel.paginate({}, paginationOptions)
            return this.#carts
        } catch (error) {
            throw new ErrorManager(error.message, error.code)
        }
    }

    async getOneById(id){
        try {
            const cart = await this.$findOneById(id)
            return cart
        } catch (error) {
            throw ErrorManager.handleError(error)
        }
    } 

    async insertOne(data) {
        try {
            const cart = await this.#cartModel.create(data);
            return cart;
        } catch (error) {
            throw ErrorManager.handleError(error);
        }
    }

    async insertOnAnother(cid, pid){
        try {
            //Revisamos tanto carrito como producto que existan ya
            const cartFound = await this.getOneById(cid);  
            const productFound = await productManager.getOneById(pid)            
          
            // Buscamos si el producto esta en el carrito
            const productArray = cartFound.products.findIndex((item) => String(item.product._id) === pid) 
            
            if (productArray >= 0) {
                cartFound.products[productArray].quantity++;
            } else {
                cartFound.products.push({ product: pid, quantity: 1 });
            }
            await cartFound.save();
            return cartFound;
        } catch (error) {
            throw new ErrorManager(error.message, error.code)
        }
    }

    async updateOne(data, cid) {
        try {
            const cartFound = await this.getOneById(cid);
            const productFound = await productManager.getOneById(data.products[0].product)                       
            cartFound.products = data.products;
            await cartFound.save();
            return cartFound
        } catch (error) {
            throw ErrorManager.handleError(error);
        }
    }

    async updateOnAnother(data, cid, pid) {
        try {
            const cartFound = await this.getOneById(cid);
            const productFound = await productManager.getOneById(pid); 
            const productArray = cartFound.products.findIndex((item) => String(item.product._id) === pid)
            if (productArray >=0) {
                cartFound.products[productArray].quantity = data.quantity
            } 
            await cartFound.save();
            return cartFound            
        } catch (error) {
            throw ErrorManager.handleError(error);
        }
    }


    async deleteOnAnother(cid, pid){
        try {
            const cartFound = await this.getOneById(cid);  
            const productFound = await productManager.getOneById(pid)            
          
            // Buscamos si el producto esta en el carrito
            const productArray = cartFound.products.findIndex((item) => String(item.product._id) === pid) 
            
            if (productArray >=0) {
                cartFound.products.splice(productArray,1)
            }
            await cartFound.save();
            return cartFound
        } catch (error) {
            throw new ErrorManager(error.message, error.code)
        }
    }

    async deleteAll(cid){
        try {
            const cartFound = await this.getOneById(cid);  
            cartFound.products = []
            await cartFound.save();
            return cartFound
        } catch (error) {
            throw new ErrorManager(error.message, error.code)
        }
    }

    

    
}
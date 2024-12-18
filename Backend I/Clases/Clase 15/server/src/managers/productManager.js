import ErrorManager from "./errorManager.js";

import ProductModel from "../models/product.model.js";
import { isValidId } from "../config/mongoose.config.js";

export default class ProductManager{

    #productModel;
    #products

    constructor(){
        this.#productModel = ProductModel;
    }

    async $findOneById(id){
        if (!isValidId(id)) {
            throw new ErrorManager('ID no valido', 400)
        }

        const product = await this.#productModel.findById(id);
        if (!product) {
            throw new ErrorManager("ID no encontrado", 404)
        }
        return product
    }

    async getOneById(id){
        try {
            const product = await this.$findOneById(id)
            return product
        } catch (error) {
            throw ErrorManager.handleError(error)
        }
    } 

    async getAll(params){
        try {
            const $and = [];
            if (params?.stock) {
                $and.push({stock: {$gt: params.stock}})
            }
            const filters = $and.length >0 ? {$and} : {};
            const sort = {
                asc: {price:1},
                desc: {price: -1}
            }
            
            const paginationOptions = {
                limit:params?.limit || 10,
                page:params?.page || 1,
                sort: sort[params?.sort] || {},
                lean: true
            }
            this.#products = await this.#productModel.paginate(filters, paginationOptions)
            return this.#products
        } catch (error) {
            throw new ErrorManager(error.message, error.code)
        }
    }

    

    async insertOne(data, data_file){
        try {
            const {title, description, code, price, status, stock, category}= data;
            let file;
            if (data_file === undefined) {
                file = null
            } else {
                file = data_file.file
            }
            const product = {
                title,
                description,
                code,
                price: Number(price),
                status:  status==='false' ? false : true,
                stock: Number(stock),
                category,
                thumbnail: file === null ? null : file.filename 
            }
            const product_ = await this.#productModel.create(product)
            return product_ 
        } catch (error) {
            throw new ErrorManager(error.message, error.code)
        }
    }

    async updateOneById(id, data, data_file){
        try {
            const {title, description, code, price, status, stock, category}= data;
            let file;
            if (data_file === undefined) {
                file = null
            } else {
                file = data_file.file
            }

            const productFound= await this.$findOneById(id)
        
            const product = {
                title: title?title: productFound.title,
                description: description?description: productFound.description,
                code: code?code: productFound.code,
                price: price? Number(price): productFound.price,
                status:  status? (status==='false' ? false : true) : productFound.status,
                stock: stock? Number(stock): productFound.stock,
                category: category? category: productFound.category,
                thumbnail: file === null ? productFound.thumbnail : file.filename 
            }

            productFound.set(product)
            productFound.save()
            return product
        } catch (error) {
            throw new ErrorManager(error.message, error.code)
        }
    }

    async deleteOneById(id){
        try {
            const product = await this.$findOneById(id)
            await product.deleteOne()
        } catch (error) {
            throw new ErrorManager(error.message, error.code)
        }
    }
}
import { readJsonFile, writeJsonFile } from "../utils/fileHandler.js";
import paths from "../utils/paths.js"
import ErrorManager from "./errorManager.js";
import { generateId } from "../utils/generate_id.js";

export default class ProductManager{

    #jsonFilename;
    #products

    constructor(){
        this.#jsonFilename = 'products.json';
    }

    async $findOneById(id){
        this.#products = await this.getAll()
        const productFound = this.#products.find((item)=> item.id===Number(id))

        if (!productFound) {
            throw new ErrorManager("ID no encontrado", 404)
        }

        return productFound
    }

    async getAll(){
        try {
            this.#products = await readJsonFile(paths.files , this.#jsonFilename)
            return this.#products
        } catch (error) {
            throw new ErrorManager(error.message, error.code)
        }
    }

    async getOneById(id){
        try {
            const product = await this.$findOneById(id)
            return product
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
            console.log(file);
            
            if (!title || !description || !code || !price || !stock || !category) {
                throw new ErrorManager("Faltan datos obligatorios", 400)
            }

            const product = {
                id: generateId(await this.getAll()),
                title,
                description,
                code,
                price: Number(price),
                status:  status==='false' ? false : true,
                stock: Number(stock),
                category,
                thumbnail: file === null ? null : file.filename 
            }
            this.#products.push(product)
            await writeJsonFile(paths.files, this.#jsonFilename, this.#products)
            return product
        } catch (error) {
            throw new ErrorManager(error.message, error.code)
        }
    }

    async updateOneById(id, data, data_file){
        try {
            const {title, description, code, price, status, stock, category}= data;
            const {file} = data_file;

            const productFound= await this.$findOneById(id)
            const index = this.#products.findIndex((item)=> item.id === Number(id))

            if (!title || !description || !code || !price || !stock || !category) {
                throw new Error("Faltan datos obligatorios")
            }
            const product = {
                id: productFound.id,
                title: title?title: productFound.title,
                description: description?description: productFound.description,
                code: code?code: productFound.code,
                price: price? Number(price): productFound.price,
                status:  status? (status==='false' ? false : true) : productFound.status,
                stock: stock? Number(stock): productFound.stock,
                category: category? category: productFound.category,
                thumbnail: file.filename
            }
            this.#products[index] = product

            await writeJsonFile(paths.files, this.#jsonFilename, this.#products)
            return product
        } catch (error) {
            throw new ErrorManager(error.message, error.code)
        }
    }

    async deleteOneById(id){
        try {
            await this.$findOneById(id)
            const index = this.#products.findIndex((item)=> item.id === Number(id))
            this.#products.splice(index,1)
            await writeJsonFile(paths.files, this.#jsonFilename, this.#products)
        } catch (error) {
            throw new ErrorManager(error.message, error.code)
        }
    }
}
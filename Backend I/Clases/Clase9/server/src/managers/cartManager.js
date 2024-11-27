import { readJsonFile, writeJsonFile } from "../utils/fileHandler.js";
import paths from "../utils/paths.js"
import ErrorManager from "./errorManager.js";
import { generateId } from "../utils/generate_id.js";

export default class CartManager{

    #jsonFilename;
    #carts

    constructor(){
        this.#jsonFilename = 'carts.json';
    }

    async $findOneById(id){
        this.#carts = await this.getAll()
        const cartFound = this.#carts.find((item)=> item.id===Number(id))

        if (!cartFound) {
            throw new ErrorManager("ID no encontrado", 404)
        }

        return cartFound
    }

    async getAll(){
        try {
            this.#carts = await readJsonFile(paths.files , this.#jsonFilename)
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
            throw new ErrorManager(error.message, error.code)
        }
    }

    async insertOne(){
        try {
            const cart = {
                id: generateId(await this.getAll()),
                products : []
            }
            this.#carts.push(cart)
            await writeJsonFile(paths.files, this.#jsonFilename, this.#carts)
            return cart
        } catch (error) {
            throw new ErrorManager(error.message, error.code)
        }
    }

    async insertOnAnother(cid, pid){
        try {
            const cartFound = await this.getOneById(cid);
            const productArray = cartFound.products.findIndex((item) => item.pid === pid) //Index de array
            const index = this.#carts.findIndex((item)=> item.id === Number(cid))  //Index de carrito

            const pedido = {
                pid:pid,
                quantity:0
            }
            if (productArray === -1) {
                pedido.pid = pid
                pedido.quantity = 0
                this.#carts[index].products.push(pedido)
            } else {
                pedido.pid = cartFound.products[productArray].pid,
                pedido.quantity= Number(cartFound.products[productArray].quantity) + 1
                this.#carts[index].products[productArray]= pedido

            }
            await writeJsonFile(paths.files, this.#jsonFilename, this.#carts)
            return cartFound
        } catch (error) {
            throw new ErrorManager(error.message, error.code)
        }
    }

    
}
import { generarId } from "./funciones.js"
import { AdminPedidos } from "./classes/Pedidos.js"
import { email } from "./selectores.js"

const costoBase = 19.99 //USD
const carrerasDisponibles = ['FrontEnd ', 'BackEnd', 'Data Science'] 


let editando = {
  value: false
}
//Pedido individual
const pedidoCurso = {
  id: generarId(),
  nombre : '',
  email : '',
  edad : '',
  pais : '',
  carrera : '',
  costoFinal : 0
}

//Expresiones Regulares para validación
const emailRegExp = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
const letrasRegExp = /^[a-zA-Z\s]+$/;
const numeroRegExp = /^[1-9][0-9]*$/;

//Instanciamos objeto clase
const pedidos_ = new AdminPedidos()

export {
    costoBase,
    carrerasDisponibles,
    editando,
    pedidoCurso,
    emailRegExp,
    letrasRegExp,
    numeroRegExp,
    pedidos_
}
import { carrerasDisponibles, pedidoCurso, costoBase , editando, pedidos_} from "./variables.js";
import { form } from "./selectores.js";
import { nombreCompleto, email, pais, edad, carrera , btnAgregar, selectOption} from "./selectores.js";

export function sincronizarStorage() {
    console.log(pedidos_.pedidos)
    localStorage.setItem('pedidos', JSON.stringify(pedidos_.pedidos))
}

export function handleDato(event, expr, selector) {
    const isValid = event.target.value.length === 0 || expr.test(event.target.value);
    if (isValid) {
      selector.classList.add("valid");
      selector.classList.remove("invalid");
      //Añadimos al objeto global de pedidos
      pedidoCurso[event.target.name] = event.target.value
    } else {
      selector.classList.add("invalid");
      selector.classList.remove("valid");
    }
    
}

export function regresarCarrera(numero){
    if (numero === 0) {
        const aux = costoBase *1.10
        pedidoCurso.costoFinal = Number(aux.toFixed(2));
        pedidoCurso.carrera = carrerasDisponibles[numero]
    } else if (numero === 1){
        const aux = costoBase * 1.15
        pedidoCurso.costoFinal = Number(aux.toFixed(2));
        pedidoCurso.carrera = carrerasDisponibles[numero]
    } else if (numero === 2){
        const aux = costoBase * 1.20
        pedidoCurso.costoFinal = Number(aux.toFixed(2));
        pedidoCurso.carrera = carrerasDisponibles[numero]
    } 
}

export function handleSubmit(event) {
    event.preventDefault();
    if (editando.value) {
      pedidos_.editar({...pedidoCurso})
    } else {
      pedidos_.agregar({...pedidoCurso});
  
    }
    btnAgregar.disabled = true
    btnAgregar.value = 'Comprar'
    editando.value = false
    reiniciarObjetoPedido()
    form.reset()
}

export function checkButtonDisabled(e) {
    if (nombreCompleto.classList.contains('valid') && email.classList.contains('valid') && pais.classList.contains('valid') && edad.classList.contains('valid') && carrera.value !== '') {
      btnAgregar.disabled = false
    } else {
      btnAgregar.disabled = true
    }
}



export function handleEdit(pedido) {
  Object.assign(pedidoCurso, pedido)
  nombreCompleto.value = pedido.nombre
  pais.value = pedido.pais
  edad.value = pedido.edad
  selectOption.value = String(carrerasDisponibles.indexOf(pedido.carrera))
  email.value = pedido.email

  editando.value = true

  btnAgregar.value = 'Guardar'
}

export function generarId() {
  return Math.random().toString(36).substring(2)+ Date.now();
}

export function reiniciarObjetoPedido(){
  Object.assign(pedidoCurso, {
      id: generarId(),
      nombre : '',
      email:'',
      edad : '',
      pais : '',
      carrera : '',
      costoFinal : 0
  })
}

  

import { carrerasDisponibles, pedidoCurso, costoBase , editando, pedidos_, regionesDisponibles} from "./variables.js";
import { form, region } from "./selectores.js";
import { nombreCompleto, email, pais, edad, carrera , btnAgregar, selectOption, selectRegion} from "./selectores.js";


function fromSettoHTML(set) {
  const setArray = Array.from(set);  
  let html = ''  
  for (let index = 0; index < setArray.length; index++) {
    const element = setArray[index];
    if (index === 0) {
      html += "<option value=''>" + 'Selecciona una región' + "</option>"
    }
    html += "<option value=" + index  + ">" +element + "</option>"
    
  }
  const regionName = document.getElementById('regionName')
  regionName.innerHTML = html

  
}

export  function  getAPICountry() {
  const setRegion = new Set();
  fetch('./js/countries.json')
    .then( (resp) => resp.json())
    .then( (data) => {
      const arrayObject =Object.values(data.data) 
      arrayObject.forEach((item)=>{
        setRegion.add(item.region)
      })
      fromSettoHTML(setRegion)
    })
    
}


export function arrojarAlerta(title, text, status) {
  Swal.fire({
    title: title,
    text: text,
    icon: status
  });
}

export function sincronizarStorage() {
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

export function regresarRegion(numero){
  pedidoCurso.region = regionesDisponibles[numero]
  console.log(pedidoCurso);
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
    if (nombreCompleto.classList.contains('valid') && email.classList.contains('valid') && pais.classList.contains('valid') && edad.classList.contains('valid') && carrera.value !== '' && region.value !== '') {
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
  selectRegion.value = String(regionesDisponibles.indexOf(pedido.region))
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
      costoFinal : 0,
      region:''
  })
}

  

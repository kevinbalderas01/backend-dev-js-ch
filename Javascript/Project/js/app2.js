import { nombreCompleto, pais, edad, carrera, email, form , region } from "./selectores.js"
import { handleDato, regresarCarrera, handleSubmit, checkButtonDisabled, getAPICountry, regresarRegion } from "./funciones.js"
import { letrasRegExp, numeroRegExp, emailRegExp, pedidos_ } from "./variables.js"

//Event Listeners
document.addEventListener('DOMContentLoaded', ()=>{
  pedidos_.pedidos = JSON.parse(localStorage.getItem('pedidos')) || []
  getAPICountry()
  pedidos_.mostrar()
})

nombreCompleto.addEventListener('input', (event) => {
  handleDato(event, letrasRegExp , nombreCompleto)
})
pais.addEventListener('input', (event) => {
  handleDato(event, letrasRegExp, pais)
})
edad.addEventListener('input', (event) =>{
  handleDato(event, numeroRegExp, edad)
})
email.addEventListener('input', (event) =>{
  handleDato(event, emailRegExp, email)
})
carrera.addEventListener('input', (event) =>{
  //Actualizamos precio
  regresarCarrera(Number(event.target.value))
})

region.addEventListener('input', (event) =>{
  //Actualizamos region
  regresarRegion(Number(event.target.value))
  
})

form.addEventListener('change', checkButtonDisabled)


form.addEventListener('submit', handleSubmit)












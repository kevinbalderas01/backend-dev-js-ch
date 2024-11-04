import { container_citas } from "../selectores.js"
import { sincronizarStorage, handleEdit } from "../funciones.js"

//Conjunto de pedidos como Clase
export class AdminPedidos{
    constructor(){
      this.pedidos = []
    }
    agregar(pedido){
      this.pedidos = [...this.pedidos, pedido]
      this.mostrar()
    }
  
    eliminar(id){
      this.pedidos = this.pedidos.filter(pedido => pedido.id !== id) //Filter genera nuevo array
      this.mostrar()
    }
  
    editar(pedidoAct){
      this.pedidos = this.pedidos.map(pedido => pedido.id === pedidoAct.id ? pedidoAct : pedido)
      this.mostrar()
    }
  
    mostrar(){
      //Limpiar HTML
      while(container_citas.firstChild){
        container_citas.removeChild(container_citas.firstChild)
      }
  
      //Generando las citas para mostrar
      this.pedidos.forEach(pedido =>{
        const divCita = document.createElement('DIV')
  
        const pedidoind = document.createElement('P')
        pedidoind.classList.add("itim-regular")
        pedidoind.innerHTML = `<span class="font-bold uppercase">Pedido: </span>${pedido.nombre}`
  
        const edadind = document.createElement('P')
        edadind.classList.add("itim-regular")
        edadind.innerHTML = `<span class="font-bold uppercase">Edad: </span>${pedido.edad}`
  
        const paisind = document.createElement('P')
        paisind.classList.add("itim-regular")
        paisind.innerHTML = `<span class="font-bold uppercase">País: </span>${pedido.pais}`
  
        const carreraind = document.createElement('P')
        carreraind.classList.add("itim-regular")
        carreraind.innerHTML = `<span class="font-bold uppercase">Carrera: </span>${pedido.carrera}`
  
        const emailind = document.createElement('P')
        emailind.classList.add("itim-regular")
        emailind.innerHTML = `<span class="font-bold uppercase">Correo electronico: </span>${pedido.email}`
  
        const costoTotalInd = document.createElement('P')
        costoTotalInd.classList.add("itim-regular")
        costoTotalInd.innerHTML = `<span class="font-bold uppercase">Costo Total: </span>${pedido.costoFinal}`
  
        //Inyectamos botones de editar y eliminar
        const btnEditar = document.createElement('button')
        btnEditar.classList.add('btn-editar')
        btnEditar.innerHTML = `Editar`
        btnEditar.style.width = '6rem';
        btnEditar.style.backgroundColor = '#4CAF50';
        btnEditar.style.color = 'white';
        btnEditar.style.padding = '14px 20px';
        btnEditar.style.margin = '3px 2px';
        btnEditar.style.border = 'none';
        btnEditar.style.borderRadius = '4px';
        btnEditar.style.cursor = 'pointer';
        btnEditar.style.fontSize  = '1rem';
        //Event handlers para debido a que todo se genera en el dom la primera vez que carga
        //Como estamos afectando y creando componentes luego de agregar pedido, no lo lee
        //Asi que no podemos usar un addeventlistener como normalmente hariamos
        btnEditar.onclick = () => handleEdit({...pedido})
  
        const btnEliminar = document.createElement('button')
        btnEliminar.classList.add('btn-eliminar')
        btnEliminar.innerHTML = `Eliminar`
        btnEliminar.style.width = '6rem';
        btnEliminar.style.backgroundColor = '#e54415';
        btnEliminar.style.color = 'white';
        btnEliminar.style.padding = '14px 20px';
        btnEliminar.style.margin = '3px 2px';
        btnEliminar.style.border = 'none';
        btnEliminar.style.borderRadius = '4px';
        btnEliminar.style.cursor = 'pointer';
        btnEliminar.style.fontSize  = '1rem';
  
        btnEliminar.onclick = () => this.eliminar(pedido.id)
  
        
      //Inyectamos en HTML
        divCita.appendChild(pedidoind)
        divCita.appendChild(edadind)
        divCita.appendChild(paisind)
        divCita.appendChild(carreraind)
        divCita.appendChild(emailind)
        divCita.appendChild(costoTotalInd)
        //botones
        divCita.appendChild(btnEditar)
        divCita.appendChild(btnEliminar)
        //linea para dividir pedidos
        divCita.appendChild(document.createElement('HR'))
  
  
  
        container_citas.appendChild(divCita)
  
        
      })
      //Agregamos a LocalStorage
      sincronizarStorage()
    }
  }
  
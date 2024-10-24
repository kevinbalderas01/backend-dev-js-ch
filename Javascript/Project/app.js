//Objetos global
let pedidos; 

let costoBase = 19.99 //USD

let container = document.getElementById("container")

const carrerasDisponibles = ['FrontEnd ', 'BackEnd', 'Data Science']

//Pedido individual
const pedidoCurso = {
    nombrePersona : '',
    edad : 0,
    pais : '',
    carrera : '',
    costoFinal : 0
}

//Conjunto de pedidos
let arregloPedidosCursos = []


//Funciones
function validarEdad(edad) {
    //Funcion que compara lo ingresado en edad en base a si es Nan 
    if (!Number.isNaN(edad)){
        console.log(`Edad de ${edad} ingresada correctamente.`)
        return edad
    }
    return 0
    
}

function pedirNumeroPedidos() {
    //Logica prinpcial
    alert('Bienvenido a nuestro sitio de cursos!')
    while (true) {
        pedidos = parseInt(prompt('¿Cuántos pedidos deseas hacer?'))
        const re = /[0-9]+/;
        const resultado =re.test(pedidos)
        if (resultado === true) {
            break 
        }
    }
    return pedidos
}

function validarCadenaSoloTexto(texto) {
    //Utilice expresión regular que asegura tenga solo letras lo ingresado por usuario.
    //Es decir, si existen numeros en la cadena, devuelve positivo, por lo que invertimos el resultado
    const re = /[0-9]+/;
    const resultado =re.test(texto)
    if (!resultado) {
        console.log(`Pais ${texto} ingresado correctamente.`)
        pedidoCurso.pais = texto
    }
    return !resultado 
    
}

function regresarCarrera(numero){
    if (numero === 1) {
        costoBase *= 1.10
        pedidoCurso.costoFinal = Number(costoBase.toFixed(2));
        console.log(`Cursa HTML, CSS, JS Y VUE con costo de: ${costoBase}`)
        pedidoCurso.carrera = carrerasDisponibles[numero-1]
        return true
    } else if (numero === 2){
        costoBase *= 1.15
        pedidoCurso.costoFinal = Number(costoBase.toFixed(2));
        console.log(`Cursa SQL, PYTHON y NODE con costo de: ${costoBase}`)
        pedidoCurso.carrera = carrerasDisponibles[numero-1]

        return true
    } else if (numero === 3){
        costoBase *= 1.20
        pedidoCurso.costoFinal = Number(costoBase.toFixed(2));
        console.log(`Cursa SQL, PYTHON y MATEMATICAS con costo de: ${costoBase}`)
        pedidoCurso.carrera = carrerasDisponibles[numero-1]

        return true
    } 
    return false
}

function main() {
    
    alert('Vamos a hacerte unas preguntas primero !')

    const nombre = prompt('Cuál es tu nombre?')
    console.log(`Nombre ${nombre} ingresado correctamente.`)

    //Bucle para la entrada/validación de edad
    let edad;
    do {
        edad = validarEdad(parseInt(prompt('Cuál es tu edad?')))
    } while (edad===0);

    //Bucle para verificar pais de origen
    let pais = validarCadenaSoloTexto(prompt('Cuál es tu país de origen?'))
    while (!pais) {
        pais = validarCadenaSoloTexto(prompt('Cuál es tu país de origen?- Sólo letras'))

    }

    //Bucle para verificar entrada y devolver carrera
    let carrera = false
    while (!carrera) {
        carrera = regresarCarrera(parseInt(prompt('Ingresa el número de la ruta interesada: 1- FrontEnd , 2-BackEnd, 3-Data Science')))
    }

    //Fase final, se muestran datos en consola y en un alert
    alert(`Datos finales: ${nombre.toUpperCase()} de ${edad} años de edad y costo de ruta final de ${costoBase}`)
    alert('Gracias por elegirnos!')

    //Luego de esto, vamos añadiendo información a nuestro objeto y de ahí la mostramos al HTML
    pedidoCurso.nombrePersona = nombre
    pedidoCurso.edad = edad

    let parrafo = document.createElement("p");
    parrafo.innerHTML = `
    <h2>Nombre : ${pedidoCurso.nombrePersona}</h2>
    <p> Edad : ${pedidoCurso.edad}</p>
    <p> Pais : ${pedidoCurso.pais}</p>
    <p> Carrera : ${pedidoCurso.carrera}</p>
    <b> Costo Final : ${pedidoCurso.costoFinal}</b>
    `;
    container.appendChild(parrafo)

    //Añadimos al array de objetos
    //Es importante pasar {...objeto} sino se copia sólo el ultimo valor en todo el arreglo
    arregloPedidosCursos.push({...pedidoCurso})
    console.log(arregloPedidosCursos)


}

//Función que se utiliza para limpiar el HTML del contenedor que tenemos para los pedidos
function limpiarHTML() {
    while (container.firstChild) {
        container.removeChild(container.firstChild)
    }
}

function sumaCostosPedido() {
    let sumatoria = 0;
    arregloPedidosCursos.forEach( (objeto) => {
        sumatoria += objeto.costoFinal
    })
    return sumatoria;
}


//----------------------------------------Lógica principal------------------

// Se tendra la oportunidad de hacer 3 pedidos inicialmente
limpiarHTML()

//Función que pide numero de pedidos
pedidos = pedirNumeroPedidos()

//Veces que se ejecuta el main
for (let index = 0; index < pedidos; index++) {
    main()
    
}

//Obtenemos costo total del pedido
let costoTotal = sumaCostosPedido()
costoTotal = Number(costoTotal.toFixed(2));
let parrafo = document.createElement("p");
parrafo.innerHTML = `<h2>Costo Del Pedido : \$ ${costoTotal}</h2>`
costoHTML = document.getElementById('costoFinalLabel')
costoHTML.appendChild(parrafo)

//--------------------------------------------------------------------------




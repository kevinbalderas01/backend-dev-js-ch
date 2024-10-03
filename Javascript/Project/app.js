//Funciones
function validarEdad(edad) {
    //Funcion que compara lo ingresado en edad en base a si es Nan 
    if (!Number.isNaN(edad)){
        console.log(`Edad de ${edad} ingresada correctamente.`)
        return edad
    }
    return 0
    
}

function validarCadenaSoloTexto(texto) {
    //Utilice expresión regular que asegura tenga solo letras lo ingresado por usuario.
    //Es decir, si existen numeros en la cadena, devuelve positivo, por lo que invertimos el resultado
    const re = /[0-9]+/;
    const resultado =re.test(texto)
    if (!resultado) {
        console.log(`Pais ${texto} ingresado correctamente.`)
    }
    return !resultado
    
}

function regresarCarrera(numero){
    if (numero === 1) {
        console.log('Cursa HTML, CSS, JS Y VUE')
        return true
    } else if (numero === 2){
        console.log('Cursa SQL, JS, PYTHON, NODE')
        return true
    } else if (numero === 3){
        console.log('Cursa SQL, PYTHON, MATEMATICAS')
        return true
    } 
    return false
}

//Logica prinpcial
alert('Bienvenido a nuestro sitio de cursos!')
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



//Fase final, se muestran datos en consola
alert('Gracias por elegirnos!')
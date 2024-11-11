// NO REASIGNABLE != INMUTABLE

//let y const
const saludo = 'Hola Mundo';
console.log(saludo);

//const y objetos
const colors = ['rojo', 'azul', 'verde'];
colors.push("blanco");
console.log(colors);
console.table(colors); //forma de imprimir tablas

//arrays y objeto declararlos con const
const pet = {
    name:'Jake',
    age:1,
    tipo:'Perro'
}
pet.name = 'Bobby'
console.log(pet)

//Closure
//Funcion padre
const operador = function (a) {
    //Funcion hijo
    const sumar = (b, c) => {
        return a+b+c
    }

    return sumar
}

const sumar = operador(10)
console.log(sumar(5,2))
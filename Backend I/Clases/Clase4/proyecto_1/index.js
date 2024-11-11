/*
    1- Crear un proyecto en node que genere 10000 numeros aleatorios en un
    rango de 1-20. Indicar por consola la finalización de la operacion
    con un mensaje
    2-Meidante Promesas, crar un objeto cuyas claves sean los números obtenidos
    y el valor asociado a cada clave será la cantidad de veces que
    salió cada número. Representar por consola resultados

    NOTA: DE FORMA ASINCRONA

*/

const generateRandomNumbersBetween1and20 = () =>{
    return new Promise((resolve) => {

    const randomNumbers = {};
    for (let i = 1; i <= 10000; i++) {
        const randomNumber = Math.floor(Math.random() * 20 + 1);

        if (randomNumbers[randomNumber] != undefined) {
            randomNumbers[randomNumber]++
        }else{
            randomNumbers[randomNumber] = 1
        }

    }
    resolve(randomNumbers);
    })
}


//Primera manera
generateRandomNumbersBetween1and20()
    .then((response) => console.log("resultado", response));

//Segunda manera
/*
const execute = async ()=>{
    const results = await generateRandomNumbersBetween1and20()
    console.log(results);
    
}
*/
console.log("Soy el hilo principal");



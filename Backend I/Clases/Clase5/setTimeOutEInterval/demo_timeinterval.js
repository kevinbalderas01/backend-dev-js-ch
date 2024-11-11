let counter = 0;

const intervalo = setInterval(() => {
    counter++

    console.log(`Salgo al toque ${counter}`);

    if (counter == 3) {
        clearInterval(intervalo);
    }
}, 1000);

console.log('Hello Mundo');

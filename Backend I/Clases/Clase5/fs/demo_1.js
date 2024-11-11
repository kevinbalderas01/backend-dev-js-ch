import fs from "fs";


const filepath = "./files/ejemplo.txt"

const writeText = (content)=>{
    fs.writeFile(filepath, content, (error)=>{
        if (error) {
            console.log('Se produjo un error al escribir en archivo');
        }
    })
}

const readText = ()=>{
    fs.readFile(filepath, "utf8", (error, result)=>{
        if (error) {
            console.log('Se produjo un error al leer en archivo');
        }
        console.log("Lectura: ", result);
        
    })
}

const appendText = (content)=>{
    fs.appendFile(filepath, content, (error)=>{
        if (error) {
            console.log('Se produjo un error al agregar contenido en archivo');
        }
    })
}

writeText('Hola Mundo')
readText()
appendText("Adios")
readText()

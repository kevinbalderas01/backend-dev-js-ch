import fs from "fs";

const filepath = "./files/ejemplo.txt"
const writeText = async(content)=>{
    try {
        await fs.promises.writeFile(filepath, content)
    } catch (error) {
        console.log("Error al escribir en archivo",error.message);  
    }
}
const readText = async()=>{
    try {
        return await fs.promises.readFile(filepath, "utf8")
    } catch (error) {
        console.log("Error al leer en archivo",error.message);
    }
}

const appendText = async(content)=>{
    try {
        await fs.promises.appendFile(filepath, content)
    } catch (error) {
        console.log("Error al añadir en archivo",error.message);
    }
}

const deleteFile = async()=>{
    try {
        await fs.promises.unlink(filepath)
    } catch (error) {
        console.log("Error al eliminar en archivo",error.message);
    }
}

/*
writeText('Hola Mundo Promises')
readText()
appendText("\nAdios Promises")
readText()
*/

//
const execute = async()=>{
    await writeText("Hola Mundo")
    const content1 = await readText()
    console.log("\nInsert: ", content1);

    await writeText("\nBIenvenido")
    const content2 = await readText()
    console.log("\nAppend: ", content2);

    await deleteFile()
}

execute()


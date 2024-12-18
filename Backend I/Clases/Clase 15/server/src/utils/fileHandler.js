import path from "path";
import fs from "fs";

const validateFilePathAndName =(filepath, filename) =>{
    if (!filepath) throw new Error("Ruta de archivo no proporcionada")
    if (!filename) throw new Error("Nombre de archivo no proporcionado")

}

export const readJsonFile = async(filepath, filename)=>{
    validateFilePathAndName(filepath, filename)

    try {
        const contenido = await fs.promises.readFile(path.join(filepath, filename), "utf8");
        return JSON.parse(contenido || "[]");
    } catch (error) {
        throw new Error("Error al leer el archivo");
    }
}

export const writeJsonFile = async(filepath, filename, content)=>{
    validateFilePathAndName(filepath, filename)

    if (!content) throw new Error("Contenido no proporcionado")
    

    try {
        await fs.promises.writeFile(path.join(filepath, filename), JSON.stringify(content, null, "\t"), "utf8");
    } catch (error) {
        throw new Error("Error al escribir en el archivo");
    }
}
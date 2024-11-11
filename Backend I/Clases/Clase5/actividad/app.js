import fs from 'fs';

const filepathPackageJson = './package.json'
const filepathInfoJson = './info.json'

const writeText = async(content, filepath)=>{
    try {
        await fs.promises.writeFile(filepath, content)
    } catch (error) {
        console.log("Error al escribir en archivo",error.message);  
    }
}
const readText = async(filepath)=>{
    try {
        return await fs.promises.readFile(filepath, "utf8")
    } catch (error) {
        console.log("Error al leer en archivo",error.message);
    }
}


const execute = async()=>{
    //Leer contenido de package json
    const contentPackageJson = await readText(filepathPackageJson)

    //Tener contenido en objeto info
    const info={
        contenidoStr:contentPackageJson,
        contenidoObj:JSON.parse(contentPackageJson),
        size: new Blob([contentPackageJson]).size
    }
    console.log(info);

    //Escribimos de nuevo en otro archivo 
    await writeText(JSON.stringify(info, null, "\t"), filepathInfoJson)
}

execute()

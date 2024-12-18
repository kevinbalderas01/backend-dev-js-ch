import moment from "moment";
import path from "path";

export const generateNumber = (startNumber, endNumber)=>{
    if (startNumber > endNumber) {
        throw new Error("El numero inicial no puede ser mayor que el final")
    }
    return Math.floor(Math.random()*(endNumber-startNumber+1)+startNumber);
}

export const generateName = (filename)=>{
    if (!filename || filename.indexOf(".") === -1) {
        throw new Error("Nombre de archivo invalido")
    }
    const randomNumber= generateNumber(1000, 9999);
    const datetime = moment().format("DDMMYYYY_HHmmss");
    const extension = path.extname(filename);
    return `file_${randomNumber}_${datetime}${extension}`;
}

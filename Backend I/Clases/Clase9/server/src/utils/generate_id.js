export const generateId = (array) =>{
    let maxId = 0
    array.forEach((item)=>{
        if (item.id > maxId) {
            maxId = item.id
        }
    })

    return maxId+1
}
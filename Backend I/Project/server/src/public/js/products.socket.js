const socket = io();

socket.on("connect", ()=>{
    console.log("Conectado al Server");
})

socket.on("disconnect", ()=>{
    console.log("Se desconecto el server");
})


const productsList = document.getElementById("products-list");
const productsForm = document.getElementById("products-form");
const errorMessage = document.getElementById("error-message");

const IdProduct = document.getElementById("input-product-id");
const btnDelete = document.getElementById("btn-delete-product");


socket.on('products-list', (data)=>{
    const products = data.products || []
    productsList.innerText ="";

    products.forEach((product) => {
        productsList.innerHTML += `
        <li>
        Id: ${product.id} , 
        Titulo: ${product.title} , 
        Descripcion: ${product.description} , 
        Codigo: ${product.code} , 
        Precio: ${product.price} , 
        Status: ${product.status} , 
        Stock: ${product.stock} , 
        Categoria: ${product.category} ,
        </li>`
    });
})

productsForm.addEventListener('submit', (event)=>{
    event.preventDefault();
    const formulario = event.target
    const formData = new FormData(formulario)
    console.log(formData);
    
    errorMessage.innerText = ''
    formulario.reset()

    socket.emit('insert-product', {
        title: formData.get("title"),
		description: formData.get("description"),
		code: formData.get("code"),
		price: formData.get("price"),
		status: formData.get("status") || 'false',
		stock: formData.get("stock"),
		category: formData.get("category"),
    })
})

socket.on('error-message', (data)=>{
    errorMessage.innerText = data.message
})

btnDelete.addEventListener('click', (event)=>{
    const id = IdProduct.value
    IdProduct.innerText = ''
    errorMessage.innerText = ''
    if (id > 0) {
        socket.emit('delete-product', {id})
    }
})




const productsList = document.getElementById("products-list");
const btnRefresh = document.getElementById("btn-refresh-products-list");


const loadProductsList = async()=>{
    const response = await fetch("/api/products", {method:'GET'});
    const data = await response.json();
    const products = data.payload || [];

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
}

btnRefresh.addEventListener('click', ()=>{
    loadProductsList()
})


loadProductsList()
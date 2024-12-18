let carritoID;
let carritoGlobal;
carritoDetail = document.getElementById('carritoSpec')
console.log(carritoDetail.attributes.href.value);


function checkSessionStorage() {
    if (sessionStorage.length === 0) {
        return false
    }
    return true
}


async function createCart(){
    if (checkSessionStorage()) {
        carritoID = sessionStorage.getItem('carrito')
        carritoDetail.attributes.href.value = `/carts/${carritoID}`
        return
    }   
    try {
        const response = await fetch("/api/carts", {
            method:'POST',
            body: JSON.stringify({
                "products": [ 
                    ]
            })
        });
        const payload = await response.json()
        carritoID = payload.payload._id
        carritoGlobal = payload; 
        carritoDetail.attributes.href.value = `/carts/${carritoID}`
        sessionStorage.setItem("carrito", carritoID)
    } catch (error) {
        console.log('Error al crear un carrito ');   
    }   
}

async function addCarrito(pid) {
    try {
        const response = await fetch(`/api/carts/${carritoID}/product/${pid}`, {method:'POST'});
        const payload = await response.json()
        console.log(payload);
    } catch (error) {
        console.log('Error al agregar producto al carrito ');   
    } 
}

async function clearShop(){
    carritoID =sessionStorage.getItem('carrito')
    try {
        const response = await fetch(`/api/carts/${carritoID}/products`, {method:'DELETE'})
        const payload = await response.json()
        console.log(payload);
    } catch (error) {
        console.log('Error al eliminar productos del carrito ');   
    } 
}

class UsersPagination {
    constructor() {
        this.currentPage = 1;
        this.limit = 10;
        this.totalPages = 0;
        
        // Cache DOM elements
        this.usersList = document.getElementById('products-list');
        this.prevButton = document.getElementById('prev-page');
        this.nextButton = document.getElementById('next-page');
        this.pageInfo = document.getElementById('page-info');
        this.detailsProducts = document.getElementById("details-prods");
        this.detailsProducts.innerHTML = `<p>Sin detalles por mostrar.</p>`

        this.clearCarrito = document.getElementById('clear-carrito')
        

        // Bind event listeners
        this.prevButton.addEventListener('click', () => this.loadPage(this.currentPage - 1));
        this.nextButton.addEventListener('click', () => this.loadPage(this.currentPage + 1));
        this.clearCarrito.addEventListener('click', ()=>clearShop())
        
        // Initial load
        this.loadPage(1); 
    }
    
    

    async loadPage(page) {
        try {
            const response = await fetch(`/api/products?page=${page}&limit=${this.limit}`);
            const data = await response.json();

            const products = data.payload.docs || [];
            const payload = data.payload;
            
            this.currentPage = payload.page;
            this.totalPages = payload.totalPages;
            
            // Update UI
            this.renderUsers(products);
            this.updatePaginationControls(payload);
            
        } catch (error) {
            console.error('Error loading users:', error);
            this.usersList.innerHTML = '<p>Error loading users</p>';
        }
    }
    
    renderUsers(products) {
        this.usersList.innerHTML = products.map(product => `
            <div class="user-item">
                <li>
                Id: ${product.id} , 
                Titulo: ${product.title} , 
                Codigo: ${product.code} ,
                <a href="#" id="${product.id}">Detalles</a>&nbsp&nbsp&nbsp&nbsp&nbsp
                <button class="btn-carrito" id="${product.id}">Añadir</button>
                </li>
            </div>
        `).join('');

        //Check anchor and details view
        this.details = document.querySelectorAll('a');
        this.viewDetails(this.details);

        this.btnCarrito = document.querySelectorAll('.btn-carrito');
        this.handleCarrito(this.btnCarrito) 
    }
    
    updatePaginationControls(data) {
        this.prevButton.disabled = !data.hasPrevPage;
        this.nextButton.disabled = !data.hasNextPage;
        this.pageInfo.textContent = `Page ${data.page} of ${data.totalPages}`;
    }

    viewDetails(anchors){
        anchors.forEach(element => {
            element.addEventListener('click', async (event)=>{
                try {
                    const response = await fetch(`/api/products/${event.target.id}`);
                    const data = await response.json();
                    const payload = data.payload;
                    this.detailsProducts.innerHTML = `
                    <ul>
                        <li>Titulo: ${payload.title}</li> 
                        <li>Descripción: ${payload.description}</li>
                        <li>Codigo: ${payload.code}</li>
                        <li>Precio: ${payload.price}</li>
                        <li>Status: ${payload.status}</li>
                        <li>Stock: ${payload.stock}</li>
                        <li>Categoría: ${payload.category}</li>
                    </ul>
                    <img src="api/public/imgs/${payload.thumbnail}" alt="Imagen del producto especifico">

                    `
                } catch (error) {
                    this.detailsProducts.innerHTML = `<p>Error obteniendo producto</p>`
                }
            })
        });
    }

    handleCarrito(botones){
        botones.forEach(boton => {
            boton.addEventListener('click', (event)=>{
                const idProd = event.target.id
                addCarrito(idProd)

                
            })
        });

    }
}

// Initialize pagination when DOM is loaded
document.addEventListener('DOMContentLoaded', () => {
    new UsersPagination();
    createCart();
});
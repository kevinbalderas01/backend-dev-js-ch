const cardId = document.querySelector('span')
const carts = document.querySelector('.carts-list')

traerInfo(sessionStorage.getItem('carrito'))

async function traerInfo(cardId) {
    try {
        const response = await fetch(`/api/carts/${cardId}`, {method:'GET'});
        const payload = await response.json()
        console.log(payload.payload.products);
        
        carts.innerHTML = payload.payload.products.map(product => `
            <div class="user-item">
                <li>
                Id: ${product.product._id},
                Titulo: ${product.product.title} , 
                Cantidad: ${product.quantity}
                </li>
            </div>
        `).join('');
        
        
        
    } catch (error) {
        console.log('Error al mostrar detalles del carrito');
        
    }
}
## Projecto Backend con JS - Etapa 1
Se propone la creación de una API REST mediante Javascript, utilizando Node JS y Express como framework principal. Se tienen dos rutas principales formando una arquitectura de Carrito-Producto, propia de comercios electrónicos. 
Primero veamos la estructura de las dos rutas principales:
* */api/products/*
    * GET / Deberá listas los productos base.
![](./Project/screenshots/1.png)  

    * GET /:pid Deberá traer sólo el producto con el ID correspondiente.
![](./Project/screenshots/2.png)  

    * POST / Deberá agregar un nuevo producto con los campos:
        * id: Número
        * title: String
        * description: String
        * code: String
        * price: Number
        * status: Boolean --> True por defecto
        * stock: Number
        * category: String
        * thumbnail: Ruta de imagen seleccionada
![](./Project/screenshots/4.png)  

    * PUT /:pid Deberá tomar los campos del método POST, pero ahora para actualizar el registro.
![](./Project/screenshots/7.png)  
    * DELETE /:pid Deberá eliminar el producto con el pid indicado.
![](./Project/screenshots/5.png)  

Ahora, añadiendo un tercer producto, y dejando el status como no requerido, vemos el cambio, pues ahora se paso a true como valor booleano.
![](./Project/screenshots/8.png)  

Por otro lado, si intentamos eliminar otro que no está en nuestra lista de productos.
![](./Project/screenshots/9.png)  



* */api/carts/*
    * POST / Crea un nuevo carrito con nuevo ID y un arreglo vacio al inicio (implementación personal) para que así al momento de hacer el POST no se mande nada como parametro, al fin que el id se generá en automático y no me pareció viable pasar un arreglo vacio en el POST, asi que lo creé desde un inicio así.
![alt text](./Project/screenshots/12.png)

    * GET / Obtiene todos los carritos con todos los productos en cada uno de ellos.
![alt text](./Project/screenshots/11.png)
    * GET /:cid Obtiene para un sólo carrito, el ID y el arreglo de objetos con los productos propios del carrito.
![alt text](./Project/screenshots/14.png)


    * POST /:cid/product/:pid Agrega un nuevo producto al carrito en cuestión, es decir, utilizando ambos ID, añade el producto con el id pid al carrito con el id de cid. Sin duda este método fue el más laborioso de implementar, porque ya afecta ambos objetos y su interacción no es tan trivial.
![alt text](./Project/screenshots/13.png)

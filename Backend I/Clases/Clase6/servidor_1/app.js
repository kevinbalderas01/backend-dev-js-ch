import http from 'http';

const PORT = 8080;

const app = http.createServer((request, response)=>{
    response.setHeader("Content-Type", "text/html; charset=utf8");
    response.end('<h1>Hola Mundo</h1>');
})

app.listen(PORT, ()=>{
    console.log(`Executándose en http://localhost:${PORT}`);
    
});
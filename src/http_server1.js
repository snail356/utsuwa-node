const http = require('http');

const server = http.createServer((req, res)=>{
    res.writeHead(200, {
        'Content-Type': 'text/html; charset=utf-8'
    });
    res.end(`
        <h2>Hello 哈囉 123</h2>
        <p>${req.url}</p>
    `);
})

server.listen(3000)


const http = require('http');
const fs = require('fs');

const server = http.createServer((req, res)=>{
    fs.promises.writeFile(__dirname + '/headers3.txt', JSON.stringify(req.headers))
        .then(()=>{
            console.log('bbbb');
            res.end('ok');
        })
        .catch(ex=>{
            res.end('error:' + ex);
        })
    console.log('aaaa');

})

server.listen(3000)


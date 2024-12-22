import http from 'node:http'
import { json } from 'node:stream/consumers'

http.createServer((req, res) => {
    let body = []
    req.pipe()
    req
    .on('error',err => console.error(err))
    .on('data',chunk => body.push(chunk))
    .on('end',() => {
        body = Buffer.concat(body).toString()
        console.log(body)
    })

    res.statusCode = 200;
    res.setHeader('Content-Type', 'application/json');
    res.write(JSON.stringify({
        hello: 'world'
    }))
    res.end()

}).listen(3000)
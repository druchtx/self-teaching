import http from 'node:http'

http.createServer((req,res)=>{
    console.time('request')
    req.pipe(res)
    console.timeEnd('request')
})

.on('listening',()=>console.log('listening on port 3000'))
.listen(3000)
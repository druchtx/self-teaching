import fs from "node:fs";

// 如果存在会覆盖
fs.writeFile('log', 'hello world', err => {
    if (err) {
        console.error(err)
        return
    }
    console.log('文件写入成功')
})

// 通过修改flag边跟写入行为
fs.writeFile('log', '\nhello-world', { flag: 'a+' }, _err => { })


fs.appendFile('log', 'appended contents', _err =>{})

// 可以包含0个和多个await， 返回一个promise
async function asyncFunc(params) {
    return params
}


async function main() {
    const result = await asyncFunc(1)
    console.log(result)
}

const promiseFunc = new Promise((_res, rej) => {
    setTimeout(() => {
        rej(1)
    }, 1000);
})


try {
    await promiseFunc
} catch (e) {
    console.error(e)
}
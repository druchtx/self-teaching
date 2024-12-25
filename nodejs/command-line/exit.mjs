import process from 'node:process';

// 调用process.exit()不会出出触发beforeExit事件
process.on('beforeExit', code => {
    console.log(`about to exit with code ${code}`)
})



process.on('exit', code => {
    console.log(`exiting with code ${code}`)
})

console.log('This message is displayed first.');

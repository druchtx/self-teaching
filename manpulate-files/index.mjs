import fs from "node:fs";

fs.stat('/Users/hsulzz/.zshrc',(err,stats)=>{
    if (err){
        console.error(err)
    }else{

        console.log(stats)
    }

})
import path from "node:path";

const notes = '/Users/hsulzz/notes.txt';
path.dirname(notes)
path.basename(notes)
path.extname(notes) 
path.join('/','Users','hsulzz','notes.txt')
// 计算绝对路径
path.resolve('notes.txt')
// 计算包含相对路径的路径返回实际路径
path.normalize('/Users/..//notes.txt')

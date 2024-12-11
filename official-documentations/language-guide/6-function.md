# [函数](https://doc.swiftgg.team/documentation/the-swift-programming-language-----/functions/)

## 定义和调用函数

```swift
func greet(person: String) -> String{
    let greeting = "hello," + person + "!"
    return greeting
}
```

## 函数的参数与返回值

```swift
// 无参函数
func sayHelloWorld() -> String{
    return "hello,world!"
}

// 多参数函数
func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted{
        return greetAgain(person: person)
    }else{
        return greet(person: person)
    }
}

// 无返回值函数， 会返回一个Void类型的特殊值，他是一个空元祖，写成()
func greet(person: String) {
    print("Hello, \(person)!")
}

// 多重返回值函数， 使用元祖类型让多个值作为一个符合值从函数中返回
func minMax(array: [Int]) -> (min: Int max: Int){
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count]{
        if value < currentMin{
            currentMin =value
        }else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
let bounds = minMax(array: [9,1,23,-1])
// 函数返回值的命名在函数返回值中已经定义，可以使用名字访问
print("min is \(bounds.min) and max is \(bounds.max)")

// 可选元祖返回类型，函数返回的整个元祖都没有值，可以使用可选元祖
(Int, Int)?  // 在元组最后放置问号
(String, Int, Bool)?

// 可选元祖类型和元祖包含可选类型不一样
(Int?, Int?)

//上面的函数中，使用index访问array，如果array为空时，则会报错，可以使用可选元祖返回类型 来安全处理空数组
func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
// 也可以使用可选绑检查函数是否返回实际元祖还是nil
if let bounds = minMax(array: [9,13,1]){
    print("min is \(bounds.min) and max is \(bounds.max)")
}

// 隐式返回的函数，函数整个主题是一个表达式，则函数隐式返回该表达式
// 下面两个函数行为相同
func greeting(for person: String) -> String {
    "Hello, " + person + "!"
}
func anotherGreeting(for person: String) -> String {
    return "Hello, " + person + "!"
}

// 函数的参数标签和参数名
// 每个函数的参数都有一个 参数标签 和 参数名称
// 参数标签： 调用函数时，需要写在对应的参数前面。
// 参数名称：用于函数的实现；
// 默认情况下，函数参数使用参数名称来作为它们的参数标签。
func someFunction(firstParameterName: Int, secondParameterName: Int){
    // 在函数体内，firstParameterName 和 secondParameterName 代表参数中的第一个和第二个参数值
}
// 函数调用
someFunction(firstParameterName: 1, secondParameterName: 2)

// 省略参数标签， 使用 _ 来代替该参数的显式参数标签
func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
    // 在函数体内，firstParameterName 和 secondParameterName 代表参数中的第一个和第二个参数值
}
someFunction(1, secondParameterName: 2)

// 默认参数值， 没有缺省值的参数放在参数列表后面
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    // 如果你在调用时候不传第二个参数，parameterWithDefault 会值为 12 传入到函数体中。
}
someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6) // parameterWithDefault is 6
someFunction(parameterWithoutDefault: 4) // parameterWithDefault is 12

// 可变参数，使用...表示可选参数，可以接受0个和多个指定类型的值
// 可选参数在函数体中将变为相应类型的数组

func arithmeticMean(_ numbers: Double...) -> Double{
    var total: Double = 0
    for number in numbers {
        total +=number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5) // 返回 3.0，是这 5 个数的平均数
arithmeticMean(3, 8.25, 18.75) // 返回 10.0，是这 3 个数的平均数

// 输入输出参数
// 函数参数默认为常量。在函数体中更改函数参数的值会导致编译时错误。这意味着您不能错误地更改参数的值。如果您希望函数修改参数的值，并希望这些更改在函数调用结束后仍然有效，请将该参数定义为 in-out parameter（输入输出参数）
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

// 请注意，someInt 和 anotherInt 在传递给 swapTwoInts(_：_:) 函数前，都加了 & 前缀
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
```

## 函数类型

每个函数都有一个特定的 函数类型，由函数的参数类型和返回类型组成。

```swift
// 下面两个函数的类型都是 (Int, Int) -> Int
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

// 下面函数的类型为 () -> Void
func printHelloWorld() {
    print("hello, world")
}

// 使用函数类型
var mathFunction: (Int, Int) -> Int = addTwoInts
print("Result: \(mathFunction(2, 3))")

// 与非函数类型相同，具有相同匹配类型的不同函数也可以分配给同一个变量
mathFunction = multiplyTwoInts
print("Result: \(mathFunction(2, 3))")

// 与其他类型一样，当您将函数赋值给常量或变量时，可以让 Swift 来推断函数类型
let anotherMathFunction = addTwoInts // anotherMathFunction 被推断为 (Int, Int) -> Int 类型

// 函数类型作为参数类型
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)

// 函数类型作为返回类型
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}
```

## 嵌套函数

可以在其他函数的主体中定义函数，即 嵌套函数

```swift
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}
var currentValue = -4
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
// moveNearerToZero 现在引用了嵌套的 stepForward() 函数
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
```

// 无需入口函数
print("Hello, world!")

// 定义变量 ，支持类型推导
var myVariable = 2

myVariable = 3

// 定义常量
let myConstant = 4.0

// 明确指定类型
let unit: String = "pixel"

// 必须强制转换类型
let widthWithUnit = String(myConstant) + unit

// 在字符串中插入变量的简便写法 \(variable)
let summary = "I have \(myConstant) apples."

// """ 包含多行字符串 """
let quotation = """
            Line 1
            Line 2
            Line 3
               Line \(myConstant)
    """

// [] 创建数组或者字典类型
var fruits = ["apple", "limes", "orange"]
fruits[1] = "grapes"

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]
occupations["Jayne"] = "Public Relations"

// 数组追加元素
fruits.append("blueberries")
print(fruits)

// 空数组
fruits = []

// 空字典
occupations = [:]

// 定义空数组 必须指定类型
let emptyArr: [String] = []

//定义空字典 必须指定类型
let emptyDic: [String: String] = [:]

// 条件语句的()可以省略， 包裹循环体的{}不可省略
let individualSores = [10, 20, 30, 11, 44]
var teamScore = 0
for s in individualSores {
    if s > 30 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

// 条件部分必须是布尔表达式，可以将if或者switch语句放在=右侧
let ScoreDecoration =
    if teamScore >= 50 {
        "😭"
    } else {
        ""
    }
print("Score:", teamScore, ScoreDecoration)

// 可选参数 在类型后使用?
var optionalString: String? = "Hello"
print(optionalString == nil)  // false

// 可选参数 可以包含一个值或者nil（表示值缺失）
var OptinalName: String? = nil
var greeting = "Hello!"
// 可选值为nil时，则改条件为false
if let name = OptinalName {
    greeting = "Hello, \(name)"
}
print(greeting)  // "Hello!"

// 处理可选值的另一种方式，使用??传递默认值
let nickname: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickname ?? fullName)"

// switch 语句支持任意类型，以及各种比较操作符
// 执行到匹配类型后会自动返回，无需break
let vegetable: String = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case let x where x.hasSuffix("red"):
    print("Is it a spicy \(x) ?")
default:
    print("Everything tastes good in soup.")
}

// 使用 for-in 循环遍历字典
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (_, numbers) in interestingNumbers {
    for numbers in numbers {
        if numbers > largest {
            largest = numbers
        }
    }
}

// while前置
var n = 2
while n < 100 {
    n *= 2
}
print(n)

// while后置,保证至少执行一次
var m = 2
repeat {
    m *= 2
} while m < 100
print(m)

// range的写法
// 1..<5,半开区间，不包括5
// 1...5,闭合区间，包括5
for i in 1..<5 {
    print(i)
}

// 函数 func name(arg: type) -> returnType {body}
func greet(person: String) -> String {
    return "Hello, \(person)!"
}
_ = greet(person: "John Appleseed")

// 参数标签，可以使用 _ 省略标签，或自定义标签
func greet1(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
_ = greet1("John Appleseed", on: "Wednesday")

// 使用元组返回值
// 可以使用名称，也可以使用位置访问值
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0

    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }

    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)  // Prints "120"
print(statistics.2)  // Prints "120"

// 函数可以嵌套
func returnFifteen() -> Int {
    var y = 10
    func add() {
        // 嵌套函数可以访问外部函数的变量
        y += 5
    }
    add()
    return y
}
_ = returnFifteen()  // 15

// 函数是一等类型，函数可以返回函数
func makeIncrementer() -> (Int) -> Int {
    func addOne(number: Int) -> Int {
        return number + 1
    }
    return addOne
}
let incrementer = makeIncrementer()
_ = incrementer(7)  // 8

// 函数也可以做为另一个函数的参数
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
_ = hasAnyMatches(list: numbers, condition: lessThanTen)

// 使用({})创建闭包
_ = numbers.map({ (number: Int) -> Int in
    return 3 * number
})
// 简写 如果类型已知，可以省略类型
_ = numbers.map({ number in 3 * number })
// 简写 按照位置访问
_ = numbers.map({ 3 * $0 })
// 简写 ，可以省略()
_ = numbers.sorted { $0 > $1 }

// 对象和类 声明属性与声明常量，变量，方法的方式一致
class Shape {
    var numberOfSides = 0
    let PI = 3.1415926
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

// 使用()实例化，使用.访问属性
var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()

// 使用init方法用于对象的实例化时的初始化
class NamedShape {
    var numberOfSides: Int = 0
    var name: String

    init(name: String) {
        self.name = name
    }

    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
// 必须在实例化时传递初始化所需的值
var namedShape = NamedShape(name: "yes")

// 子类  在:后面加上父类
class Square: NamedShape {
    var sideLength: Double
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        // super.init  调用父类初始化方法
        super.init(name: name)
        numberOfSides = 4
    }

    func area() -> Double {
        return sideLength * sideLength
    }
    // 重写父类方法必须使用override关键字
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)"
    }
}

// 可以给属性设置getter setter
class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }

    var perimeter: Double {
        get {
            return 3 * sideLength
        }
        set {
            sideLength = newValue / 3
        }
    }
}

// 如果不想计算属性，可以使用willSet和didSet
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
// Prints "10.0"
print(triangleAndSquare.triangle.sideLength)
// Prints "10.0"
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)
// Prints "50.0"

// 可选值
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength

// 枚举, 跟类一样可以有方法
enum Rank: Int {
    case ace = 1  // 默认从0开始，也可以指定特定的值改变行为
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king

    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        default:
            return String(self.rawValue)
        }
    }
}

let ace = Rank.ace
let aceRawValue = ace.rawValue

enum Suit {
    case spades, hearts, diamonds, clubs

    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()

// 另一种枚举，在实例化时关联具体值
enum ServerResponse {
    case result(String, String)
    case failure(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")

switch success {
case let .result(sunrise, sunset):
    print("Sunrise at \(sunrise) and sunset at \(sunset).")
case let .failure(message):
    print("Failure... \(message)")
}

// 结构体 和类很相似，包括方法和初始化器
// 最大的一点区别是 struct是值传递，而方法是引用传递

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

let threeOfSpades = Card(rank: .three, suit: .spades)
let trheeOfSpadesDescription = threeOfSpades.simpleDescription()

// 并发 使用async关键字表示异步
func fetchUserID(from server: String) async -> Int {
    if server == "primary" {
        return 1
    } else {
        return 0
    }
}
// await关键字等待异步函数返回
func fetchUsername(from server: String) async -> String {
    let userID = await fetchUserID(from: server)
    if userID == 501 {
        return "John Appleseed"
    } else {
        return "Anonymous"
    }
}

// async let 关键字 用于同步执行
func connectUser(to server: String) async {
    async let username = fetchUsername(from: server)
    async let userID = fetchUserID(from: server)
    let greeting = await "Hello, \(username), user ID \(userID)"
    print(greeting)
}

// 使用Task调用异步函数 ,无需等待返回
Task {
    await connectUser(to: "primary")
}

// 使用Task组合多个异步函数
let userIDs = await withTaskGroup(of: Int.self) { group in
    for server in ["primary", "secondary", "development"] {
        group.addTask {
            return await fetchUserID(from: server)
        }
    }

    var results: [Int] = []
    for await result in group {
        results.append(result)
    }
    return results
}

// 演员与类相似，只是它们确保不同的异步函数可以同时与同一演员的实例安全地交互。
actor ServerConnection {
    var server: String = "primary"
    private var activeUsers: [Int] = []
    func connect() async -> Int {
        let userID = await fetchUserID(from: server)
        // ... communicate with server ...
        activeUsers.append(userID)
        return userID
    }
}

// 使用await关键字 表示等待其他已经在跟actor交互的函数完成
let server = ServerConnection()
let userID = await server.connect()

// protocols 和extensions

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

// 类，枚举和结构体都可以遵循协议
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

// extension 可以为已经存在的类型添加新的功能
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)  // Prints "The number 7"

// 错误处理 使用Error协议
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

// 使用throws关键字，抛出错误
func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}

// 使用do-catch语句处理错误
do {
    let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
    print(printerResponse)
} catch {
    print(error)
}

// 使用多个catch语句捕捉不同类型的错误
do {
    let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}

// 使用try?将错误转换为可选值
let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")

// defer语句 在函数return前执行，不管是否抛出错误
var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }

    let result = fridgeContent.contains(food)
    return result
}
if fridgeContains("banana") {
    print("Found a banana")
}
print(fridgeIsOpen)  // Prints "false"

// 泛型
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result: [Item] = []
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
_ = makeArray(repeating: "knock", numberOfTimes: 4)

// enum 使用范型
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)

// 使用where语句 限制泛型
func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
where T.Element: Equatable, T.Element == U.Element {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
_ = anyCommonElements([1, 2, 3], [3])

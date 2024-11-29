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

// [] 创建数字或者字典类型
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


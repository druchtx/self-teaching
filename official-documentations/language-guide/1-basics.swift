// 基本类型
// Int , Double , String , Bool

// 集合类型
// Array , Dictionary , Set

// 其他高级类型
// Optional , Tuple, ...
// 
// 
// 
// 常量 和 变量
// let 声明常量 
let maximumNumberOfLoginAttempts = 10
// var 声明变量
var currentLoginAttempt = 0
// 可以一行声明多个常量或变量
// let a = 1, b = 2, c = 3
// var d = 4, e = 5, f = 6
// 
// 
// 
// 类型注解 格式 变量: 类型
var welcomeMessage: String
// 变量: 类型 = 值
welcomeMessage = "Hello, world!"
// 可以将同类型变量一起声明
var red, green, blue: Double
// 实际开发中，很少需要写类型注解， swift支持类型推导
// 上面的welcomeMessage 没有初始化，无法判断值类型，必须提供类型注解
// 
// 
// 
// 变量和常量命名
// 可以包含所有字符，包括unicode字符
let π = 3.14159
let 你好 = "你好，世界"
let 🐶🐮 = "dogcow"
// 不能包含空白字符，数学符号，箭头，private-use的unicode标量，line- and box-drawing
// 不能以数字开头
// 声明变量或常量后，无法再次使用同名称声明，也无法改变值类型，无法将变量跟常量相互转换

// 变量可以改变
var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!"
// 常量不可以改变
let languageName = "Swift"
// languageName = "Swift++"  // compile-time error: languageName cannot be changed.
// 
// 
// 
// 打印变量或者常量 print(_:separator:terminator:)
// print是一个全局函数，会以合适的方式输出，在xcode中，会答应在控制台
// separator是分隔符，默认是空格,terminator是换行符 默认是换行符
print(friendlyWelcome) // Prints "Bonjour!" 
// 替换换行符
print(friendlyWelcome, terminator: "")
// 字符串插值 \(someValue)
print("The welcome message is: \(friendlyWelcome)")
// 
// 
// 
// 注释
// 单行注释 
// This is a comment.
// 多行注释
/*
 This is a
 multiline comment.
 */
// swift中的注释可以嵌套
/* 
    This is the start of the first multiline comment.
    /* This is the second, nested multiline comment. */
    This is the end of the first multiline comment. 
*/
// 
// 
// 
// 分号（semicolon）
// swift中无需在代码结尾写分号，只有在多行写在一行时才需要
let cat = "🐱 "; print(cat)
// 
// 
// 
// 整数 Integers
// swift 提供有符号和无符号的 8，16，32，64 位整数类型
// 无符号8bit整数
var age: UInt8 = 25
// 有符号8bit整数
var score: Int8 = -128
// Integer的边界值
let minInt8 = UInt8.min // 0
let maxInt8 = UInt8.max // 255
// 
// 
//
// Int类型，与系统整数类型相同
// 32位系统中，Int类型为Int32
// 64位系统中，Int类型为Int64
//
//
//
// UInt类型，与系统无符号整数类型相同
// 32位系统中，UInt类型为UInt32
// 64位系统中，UInt类型为UInt64
// 除非需要特别声明无符号整数，否则建议使用Int
// 
// 
// 
// Float-Point Numbers
// Float 表示32-bit单精度浮点数，
// Double 表示64-bit双精度浮点数
// 双精度可以提供小数点后15位精度，单精度可以提供小数点后6位精度
// 推荐使用Double
// 
// 
// 
// 类型安全和类型推导
// swift是强类型，类型安全的
// 整数类型会被推导为Int
let meaningOfLife = 42 // 推导为Int
// 浮点数类型会被推导为Double
let pi = 3.14159 // 推导为Double
// 表达式中包含整数和浮点数是，会被推导为Double
let anotherPi = 3 + 0.14159 // 推导为Double
// 
// 
// 
// 
// 数字字面量
// 
// 整数
// 十进制，没有前缀
let three = 3
// 二进制，以0b开头
let threeInBinary = 0b11
// 八进制，以0o开头
let threeInOctal = 0o3
// 十六进制，以0x开头
let threeInHex = 0x3
//
// 浮点数
// 浮点数有十进制跟十六进制两种表达方式
// 十进制 无前缀，小数点前后都必须有值，可以包含科学计数法用e表示
let threePointOne = 3.1
// 十六进制 以0x开头，必须包含指数，使用p或者P表示
let threePointOneInHex = 0x1.1p1 // 1.1 * 2^1 = 1.1
// 整数和浮点数都可以使用0填充，或者_增加阅读性
let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1
// 
// 数值类型转换
// 使用Int类型来表示整数，即便知道不会为负数，这样可以使得类型与类型推导一致
// 除非特别需要，比如外部接口指定长度，性能，内存优化等。
//
// 整数转换
// 每个整数类型都有相应的值范围，给对应变量赋值超出范围会导致编译错误
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
// 因为 twoThousand 和one 都被转换成了UInt16，所以twoThousandsAndOne的类型被推导为UInt16
let twoThousandsAndOne = twoThousand + UInt16(one)
// 使用SomeType(someValue)来调用初始化器转换成相应类型，UInt16包含了一个接受UInt8的初始化器
// 可以使用extensions来添加初始化器来接受其他类型。
//
//
//
// 整数和小数的转换
// 整数转换成浮点数，需要明确指定类型
let oneHundred = 100
let pointOne = 0.1
let overOneHundred = Double(oneHundred) + pointOne // 101.1
// 浮点数转整数，需要明确指定类型，会舍弃小数点部分
let oneHundredPointOne = 100.1
let oneHundredInt = Int(oneHundredPointOne) // 100
// 数字字面量可以直接计算，因为他们只有在被编译器解释时才进行类型推断
let numbericLiteral = 8 + 1.11
// 
// 
// 
// 类型别名
//  为已经存在的类型指定别名
typealias AudioLevel = Int16
var maxAmplitudeFound = AudioLevel.min
// 
// 
//
// 布尔值 Bool 
// swift中有两个布尔值，true和false
let something = true
let nothing: Bool = false
//
//
//
// 元组 Tuples
// 元组将多个值联合到一个值中，可以使用任意类型，多个值之间的类型可以不同。
let http404Error = (404, "Not Found")
// 元组解构
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)") // Prints "The status code is 404"
print("The status message is \(statusMessage)") // Prints "The status message is Not Found"
// 可以使用_来忽略不需要的值
let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)") // Prints "The status code is 404"
// 也可以使用index来访问元组中的值
print("The status code is \(http404Error.0)") // Prints "The status code is 404"
print("The status message is \(http404Error.1)") // Prints "The status message is Not Found"
// 可以为元组个元素命名，可以使用名称访问元素
let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode)") // Prints "The status code is 200"
print("The status message is \(http200Status.description)") // Prints "The status message is OK"
// 
// 
// 
// 可选值
// 可选值有两种可能
// 1. 没有指定类型的值
// 2. 解开可选的来访问该值，或者根本没有值。
// 下方代码，convertedNumber就是一个可选值
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber) 
// 可选值在类型后面加一个问号，如 Int? 表示是一个Int或者没有值
//
//
//
// nil 表示一个可选值时无值的； nil 不能用于非可选值
var serverResponseCode: Int? = 404 // serverResponseCode contains an actual Int value of 404
serverResponseCode = nil // serverResponseCode now contains no value
// 如果定义了一个可选值，但是没有赋值，那么这个可选值就是nil
var surveyAnswer: String? // surveyAnswer is automatically set to nil
// 使用 == 或者!=判断可选值是否有值
if  convertedNumber != nil{
   print("convertedNumber contains some integer value.")
}
//
//
//
// 可选值绑定 Optional Binding
// if let <#constantName#> = <#someOptional#> {
//    <#statements#>
// }
// 可以使用可选值绑定来判断可选值是否有值而不是强制解包
if let actualNumber = Int(possibleNumber) {
    print("The string \"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("The string \"\(possibleNumber)\" couldn't be converted to an integer")
}
// 如果您在访问包含的值后不需要引用原始、可选常量或变量，您可以为新常量或变量使用相同的名称：
let myNumber = Int(possibleNumber)
// Here, myNumber is an optional integer
if let myNumber = myNumber {
    // Here, myNumber is a non-optional integer
    print("My number is \(myNumber)")
}
// 上面的简写
 if let myNumber {
    print("My number is \(myNumber)")
 }

// 可选值绑定 也可以用作变量，只需将if let改成if var
// if 条件语句可以包含多个bool条件，用逗号分隔，只要有一个是false则整个if语句为false    
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100") // Prints "4 < 42 < 100"
}

if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100") // Prints "4 < 42 < 100"
        }
    }
}

// 可选值绑定中创建的常量和变量 值在if语句中可以被访问
//
//
//
// 提供一个回退值(fallback value)
// 另一个处理缺失值的方式是提供一个 空值合并运算符??
// 当在??左侧的可选值不是nil，则改值会被拆箱，否则使用右侧值
let name: String? = nil
let greeting = "Hello, " + (name ?? "friend") + "!"
print (greeting) // Prints "Hello, friend!"
//
//
//
// 强制拆包
// 当nil表示无法恢复的故障时，例如程序员错误或损坏状态，您可以通过添加感叹号（！）来访问底层值到可选名称的末尾。这被称为强制解包装可选值。当您强制解包装非nil值时，结果是其解包装值。强制解包装nil值会触发运行时错误。
// 这个！实际上，是fatalError(_:file:line:)的较短的拼写。例如，下面的代码显示了两种等效的方法：
let possibleNumber1 = "123"
let convertedNumber1 = Int(possibleNumber)

let number = convertedNumber!
guard let number = convertedNumber else {
    fatalError("The number was invalid")
}

/*


隐式展开可选值
 
有时，从程序的结构中可以清楚地看出，在该值首次设置后，可选值将始终有一个值。在这些情况下，消除每次访问时检查和解开可选值的需要是有用的，因为可以安全地假设它一直有一个值。
这些类型的可选被定义为隐式未包装的可选。你通过放置一个感叹号（String！）来写一个隐式解包装的可选选项而不是问号（字符串？）在您想要选择的类型之后。当您使用可选名称时，不要在可选名称后放置一个感叹号，而是在声明时在可选名称后放置一个感叹号。
当可选值在首次定义后立即确认存在时，隐式解包装的可选值很有用，并且可以肯定地假定在此后的每个点都存在。如“未拥有的引用”和“隐式未包装的可选属性”中所述，Swift中隐式解包装选项的主要用途是在类初始化期间。
隐式解包装的可选是幕后的正常可选，但也可以作为非可选值使用，无需每次访问时解开可选值。以下示例显示了可选字符串和隐式未包装的可选字符串在作为显式字符串访问其包装值时的行为差异：
*/
let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // Requires explicit unwrapping


let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString // Unwrapped automatically

/*
# 错误处理


*/
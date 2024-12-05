# 控制流

## for-in 循环

使用 for-in 循环来遍历一个集合中的所有元素

```swift
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}
// Hello, Anna!
// Hello, Alex!
// Hello, Brian!
// Hello, Jack!
```

可以通过遍历一个字典来访问它的键值对

```swift
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}
// cats have 4 legs
// ants have 6 legs
// spiders have 8 legs
```

for-in 循环还可以使用数字范围

```swift
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
// 1 times 5 is 5
// 2 times 5 is 10
// 3 times 5 is 15
// 4 times 5 is 20
// 5 times 5 is 25
```

使用 stride(from:to:by:) 来跳过不需要的值

```swift
let minuteInterval = 5
for tickMark in stride(from: 0, to: 60, by: minuteInterval){
    // 每5分钟渲染一个刻度线（0, 5, 10, 15 ... 45, 50, 55）
}
```

可以在闭区间使用 stride(from:through:by:) 起到同样作用：

```swift
for tickMark in stride(from: 0, through: 60, by: minuteInterval){
    // 每5分钟渲染一个刻度线（0, 5, 10, 15 ... 45, 50, 55, 60）
}
```

## while 循环

swift提供了2种while循环：

- while循环 ：每次在循环开始时评估条件是否符合
- repeat-while循环 ： 每次在循环结束时评估条件是否符合。

```swift
while <#condition#> {
   <#statements#>
}

repeat {
    <#statements#>
} while <#condition#>
``` 

## 条件语句

Swift 提供两种类型的条件语句：

- if 语句 
- switch 语句

### if

```swift
// 单个条件
var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
}

// 2个条件
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else {
    print("It's not that cold. Wear a T-shirt.")
}

// 2个以上条件
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
} else {
    print("It's not that cold. Wear a T-shirt.")
}
```

if表达式

```swift
let weatherAdvice = if temperatureInCelsius <= 0 {
    "It's very cold. Consider wearing a scarf."
} else if temperatureInCelsius >= 30 {
    "It's really warm. Don't forget to wear sunscreen."
} else {
    "It's not that cold. Wear a T-shirt."
}
```

分支中返回nil时，可以显式声明nil的类型

```swift
let freezeWarning = if temperatureInCelsius <= 0 {
    "It's below freezing. Watch for ice!"
} else {
    nil as String?
}
```

if 表达式可以通过抛出错误或调用如 fatalError（_：file：line：） 来响应没有返回值的意外失败

```swift
let weatherAdvice = if temperatureInCelsius > 100 {
    throw TemperatureError.boiling
} else {
    "It's a reasonable temperature."
}
```

### switch

switch 语句会尝试把某个值与若干个模式（pattern）进行匹配

```swift
switch <#some value to consider#> {
case <#value 1#>:
    <#respond to value 1#>
case <#value 2#>,
    <#value 3#>:
    <#respond to value 2 or 3#>
default:
    <#otherwise, do something else#>
}
```

switch 也有表达式形式：

```swift
let anotherCharacter: Character = "a"
let message = switch anotherCharacter {
case "a", "A":
    "The letter A"
case "b", "B":
    "The letter B"
default:
    "Something else"
}
print(message)
// message is "The letter A"
```

匹配区间

```swift
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
let naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")
// 输出 "There are dozens of moons orbiting Saturn."
```

#### 匹配元组

我们可以使用元组在同一个 switch 语句中测试多个值。可以针对不同的值或值区间来测试元组的每个元素。另外，使用下划线（_）通配符来匹配所有可能的值。

```swift
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}
// 输出 "(1, 1) is inside the box"
```

#### 值绑定

switch 的 case 分支允许将匹配的值声明为临时常量或变量，并且在 case 分支体内使用。

```swift
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}
// 输出 "on the x-axis with an x value of 2"
```

#### where 语句

case 分支可以使用 where 从句来判断附加的条件。

```swift
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}
// 输出 "(1, -1) is on the line x == -y"
```

### 复合型cases

共享同一主体的多个 switch case 可以通过在 case 后编写多个模式来组合，每个模式之间用逗号隔开。当 case 后面的任意一种模式匹配的时候，这条分支就会被匹配。并且，如果匹配列表过长，还可以分行书写：

```swift
let someCharacter: Character = "e"
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
    "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) isn't a vowel or a consonant")
}
// 输出 "e is a vowel"

// 复合cases的值绑定
let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}
```

## 控制转移语句

swift提供了5种

- continue
- break
- fallthrough
- return
- throw

### continue 语句

停止当前循环，重新开始下次循环

```swift
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]
for character in puzzleInput {
    if charactersToRemove.contains(character) {
        continue
    }
    puzzleOutput.append(character)
}
print(puzzleOutput)
// 输出 "grtmndsthnklk"
```

### break 语句

跳出循环

### fallthrough 语句

在 Swift 中，switch 语句不会从上一个 case 分支跳转到下一个 case 分支中,使用fallthrough语句可以跳转到下一个case分支

### 带标签的语句

在循环前使用 前导关键字 label 为循环添加标签，并在循环中显示指定标签
在复杂嵌套的循环中，为了更好地控制循环，可以使用标签

```swift
gameLoop: while square != finalSquare {
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    switch square + diceRoll {
    case finalSquare:
        // 骰子数刚好使玩家移动到最终的方格里，游戏结束。
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        // 骰子数将会使玩家的移动超出最后的方格，那么这种移动是不合法的，玩家需要重新掷骰子
        continue gameLoop
    default:
        // 有效移动，做正常的处理
        square += diceRoll
        square += board[square]
    }
}
print("Game over!")
```

### 提前退出

像 if 语句一样，guard 语句的执行取决于一个表达式的布尔值。guard 来要求条件必须为真时才会执行 guard 语句后的代码。不同于 if 语句，guard 语句总是有一个 else 从句，如果条件不为真则执行 else 从句中的代码。

```swift
func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }


    print("Hello \(name)!")


    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }


    print("I hope the weather is nice in \(location).")
}


greet(person: ["name": "John"])
// 输出 "Hello John!"
// 输出 "I hope the weather is nice near you."
greet(person: ["name": "Jane", "location": "Cupertino"])
// 输出 "Hello Jane!"
// 输出 "I hope the weather is nice in Cupertino."
```

### 延迟执行操作

在defer块中的代码 在函数返回前执行，defer始终会执行，
多个defer按照定义位置逆序执行

```swift
var score = 1
if score < 10 {
    defer {
        print(score)
    }
    score += 5
}
// 输出 "6"
```

### 检测api可用性

```swift
if #available(iOS 10, macOS 10.12, *) {
    // 在 iOS 使用 iOS 10 的 API, 在 macOS 使用 macOS 10.12 的 API
} else {
    // 使用先前版本的 iOS 和 macOS 的 API
}
```
当你在 guard 语句中使用可用性条件时，它将细化用于该代码块中其余代码的可用性信息。

```swift
@available(macOS 10.12, *)
struct ColorPreference {
    var bestColor = "blue"
}


func chooseBestColor() -> String {
    guard #available(macOS 10.12, *) else {
       return "gray"
    }
    let colors = ColorPreference()
    return colors.bestColor
}
```

除了 #available 以外， Swift 还支持通过不可用性条件来进行不可用性检查。举例如下，两种检查都能实现同样的效果：

```swift
if #available(iOS 10, *) {
} else {
    // 回退代码
}


if #unavailable(iOS 10) {
    // 回退代码
}
```
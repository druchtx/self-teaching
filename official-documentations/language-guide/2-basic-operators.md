# 基本操作符

> 赋值，算数操作符，比较操作符等。

## 术语

运算符是一元(unary)、二元(binary)或三元(ternary):

- 单运算符在单个目标（如-a）上操作。一元前缀运算符出现在其目标的正前面（例如!B），并且一元后缀运算符紧随其目标之后出现（例如c!）。
- 二元运算符在两个目标（如2 + 3）上操作，并且是固定的，因为它们出现在两个目标之间。
- 三元操作符在三个目标上操作。像C一样，Swift只有一个三元运算符，三元条件运算符（a?B:c）。

运算符影响的值是操作数(operands)。在表达式1 + 2中，+符号是一个内缀运算符，其两个操作数是值1和2。

## 赋值操作符

赋值运算符（a = b）用b的值初始化或更新a的值：

```swift
let b = 10
var a = 5
a = b   // 现在a等于10
```

如果赋值的右侧是具有多个值的元组，则其元素可以同时分解为多个常量或变量：

```swift
let (x, y ) =(1, 2) // x 等于 1，y 等于 2
```

与C和Objective-C中的赋值运算符不同，Swift中的赋值运算符本身不会返回值。以下声明无效：

```swift
if x = y {
    // 无效,因为 x = y 不会返回值
}
```

## 算数操作符

Swift支持所有数字类型的四个标准算术运算符：

- 加法(+)
- 减法(-)
- 乘法(*)
- 除法(/)

```swift
1 + 2       // equals 3
5 - 3       // equals 2
2 * 3       // equals 6
10.0 / 2.5  // equals 4.0
```

与C和Objective-C中的算术运算符不同，Swift算术运算符默认**不允许值溢出**。您可以使用Swift的溢出运算符（如a &+ b）来选择值溢出行为。

字符串连接也支持加法运算符：

```swift
"hello, " + "world"  // equals "hello, world"
```

## 余数运算符

余数运算符（a % b）算出b的倍数将适合a内，并返回剩余的值（称为余数）。

```swift
10 % 3  // equals 1 (因为 10 = 3 * 3 + 1)
```
为了确定a % b的答案，%运算符计算以下方程，并返回余数作为其输出：

A = (b x 一些乘数) + 余数

其中，某个乘数是适合a内的b的最大倍数。

将9和4插入到这个方程中得出：

9 = (4 x 2) + 1

在计算负值的余数时，也适用相同的方法：

```swift
-9 % 4  // equals -1 (因为 -9 = -4 * 2 + 1)
```

## 一元负号运算符

数值的符号可以使用前缀-切换，称为一元减算子：

```swift
let three = 3
let minusThree = -three  // minusThree 等于 -3
let plusThree = -minusThree  // plusThree 等于 3
```
一元减号运算符（-）直接在其操作的值前面，没有任何空格。

## 一元加号运算符

一元加运算符（+）只是返回它操作的值，没有任何变化：

```swift
let minusSix = -6
let alsoMinusSix = +minusSix  // alsoMinusSix equals -6
```
虽然一元加运算符实际上没有任何用，但当对负数使用一元减运算符时，您可以使用它在代码中为正数提供对称性。

## 复合赋值运算符

像C语言一样，Swift提供了复合赋值运算符，它将赋值（=）与其他操作结合在一起。一个例子是加法赋值运算符（+=）：

```swift
var a = 1
a += 2  // a 现在等于 3
```
表达式a += 2是a = a + 2的简写。实际上，加法和赋值被组合成一个运算符，同时执行两个任务。

> 复合赋值运算符不返回值。例如，你不能写let b = a += 2

## 比较运算符

Swift支持以下比较运算符：

- 等于（a == b）
- 不等于（a！= b）
- 大于（a > b）
- 小于（a < b）
- 大于或等于（a >= b）
- 小于或等于（a <= b）

> Swift还提供了两个身份运算符（===和!==），您使用它来测试两个对象引用是否都引用同一对象实例。有关更多信息，请参阅身份运算符。

每个比较运算符都返回一个布尔值，以指示该语句是否为真：

```swift
1 == 1   // true because 1 is equal to 1
2 != 1   // true because 2 isn't equal to 1
2 > 1    // true because 2 is greater than 1
1 < 2    // true because 1 is less than 2
1 >= 1   // true because 1 is greater than or equal to 1
2 <= 1   // false because 2 isn't less than or equal to 1
```

比较运算符通常用于条件语句，例如if语句：

```swift
let name = "world"
if name == "world" {
    print("hello, world")
} else {
    print("I'm sorry \(name), but I don't recognize you")
}
// Prints "hello, world", because name is indeed equal to "world".
```

如果两个元组具有相同的类型和相同的值数，您可以比较它们。元组从左到右进行比较，一次一个值，直到比较发现两个不相等的值。比较这两个值，比较的结果决定了元组比较的总体结果。如果所有元素都相等，那么元组本身是相等的。例如：

```swift
(1, "zebra") < (2, "apple")   // true because 1 is less than 2; "zebra" and "apple" aren't compared
(3, "apple") < (3, "bird")    // true because 3 is equal to 3, and "apple" is less than "bird"
(4, "dog") == (4, "dog")      // true because 4 is equal to 4, and "dog" is equal to "dog"
```
在上面的例子中，您可以看到第一行的从左到右比较行为。因为1小于2，所以(1, "zebra")被认为小于(2, "apple")，无论元组中的其他值是什么。"zebra"并不小于"apple"并不重要，因为比较已经由元组的第一个元素决定。然而，当元组的第一个元素相同时，它们的第二个元素会被比较——这就是在第二行和第三行发生的情况。

只有当给定的运算符可以应用于各自元组中的每个值时，元组才能够使用该运算符进行比较。例如，如下面的代码所示，您可以比较两个类型为(String, Int)的元组，因为String和Int值都可以使用<运算符进行比较。相反，两个类型为(String, Bool)的元组不能使用<运算符进行比较，因为<运算符不能应用于Bool值。

```swift
("blue", -1) < ("purple", 1)        // OK, evaluates to true
("blue", false) < ("purple", true)  // Error because < can't compare Boolean values
```
> Swift标准库包括少于七个元素的元组的元组比较运算符。要将元组与七个或更多元素进行比较，您必须自己实现比较运算符。

## 三元条件运算符

三元条件运算符是一个特殊的运算符，包含三个部分，其形式为：问？答1：答2。它是根据问题是真还是假来评估两个表达式之一的简化方法。如果问题为真，它将计算答1并返回其值；否则，它将计算答2并返回其值。

三元条件运算符是下面代码的简写：

```swift
if question {
    answer1
} else {
    answer2
}
```

这是一个计算表行高度的示例。如果行有标题，则行高应比内容高度高50分，如果行没有标题，则行高20分：
```swift
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
// rowHeight is equal to 90
```
上面的例子是以下代码的简写：

```swift
let contentHeight = 40
let hasHeader = true
let rowHeight: Int
if hasHeader {
    rowHeight = contentHeight + 50
} else {
    rowHeight = contentHeight + 20
}
```
第一个示例使用三元条件运算符意味着可以在一行代码上将rowHeight设置为正确的值，这比第二个示例中使用的代码更简洁。

三元条件运算符为决定考虑两个表达式中的哪一个提供了一个有效的速记。然而，请谨慎使用三元条件运算符。如果过度使用，它的简洁性可能会导致难以阅读的代码。避免将三元条件运算符的多个实例组合成一个复合语句。

## nil合并操作符

nil合并运算符（a ?? b）会解包一个可选类型 a，如果它包含一个值；如果 a 为 nil，则返回默认值 b。表达式 a 必须始终是可选类型，表达式 b 必须与 a 内部存储的类型匹配。nil合并运算符是下面代码的简写：

```swift
a != nil ? a! : b
```

上述代码使用三元条件运算符和强制拆包（a!）当a不是nil时，访问a中包裹的值，否则返回b。零集合运算符提供了一种更优雅的方式，以简洁易读的形式封装这种条件检查和拆包。

> 如果a的值为非nil，则b的值不会被评估。这被称为短路评估。

以下示例使用nil合并操作符在默认颜色名称和可选用户定义的颜色名称之间进行选择：

```swift
let defaultColorName = "red"
var userDefinedColorName: String?   // defaults to nil


var colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName is nil, so colorNameToUse is set to the default of "red"
```

userDefinedColorName变量被定义为可选字符串，默认值为nil。由于userDefinedColorName是可选类型，您可以使用nil合并操作符来考虑其值。在上述示例中，运算符用于确定名为colorNameToUse的字符串变量的初始值。因为用户定义颜色名称为零，所以表达式用户定义颜色名称??defaultColorName返回defaultColorName或“red”的值。

如果您为userDefinedColorName分配一个非nil值，并再次执行nil合并操作符检查，则使用userDefinedColorName中包装的值，而不是默认值：

```swift
let defaultColorName = "red"
var userDefinedColorName: String?   // defaults to nil
userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName is "green", so colorNameToUse is set to the value "green"
```

## 范围操作符

Swift包含几个范围运算符，这些运算符是表示值范围的快捷方式。

### 闭合区间运算符 

(a...b) 定义了一个从 a 到 b 的范围，并包括值 a 和 b。a 的值不能大于 b。当您想要在一个范围内使用所有值时，闭合区间运算符非常有用，例如在 for-in 循环中。

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

### 半开区间运算符

半开范围运算符（a..<b）定义了从a到b的范围，但不包括b。据说它是半开的，因为它包含第一个值，但没有最终值。与闭合范围运算符一样，a的值不得大于b。如果a的值等于b，那么结果范围将为空。

当您处理数组等零基列表时，半开放范围特别有用，其中计数（但不包括）列表的长度是有用的：

```swift
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \((i + 1)) is called \(names[i])")
}
// Person 1 is called Anna
// Person 2 is called Alex
// Person 3 is called Brian
// Person 4 is called Jack
```

请注意，该数组包含四个项目，但0..<count只计算到3（数组中最后一个项目的索引），因为它是一个半开范围。

### 单边区间(one-sided ranges)

闭合范围运算符有一个替代形式，用于尽可能向一个方向持续的范围——例如，一个包含从索引2到数组末尾的数组所有元素的范围。在这些情况下，您可以从范围运算符的一侧省略值。这种范围被称为单边范围，因为运算符只在一侧有一个值。例如：

```swift
for name in names[2...] {
    print(name)
}
// Brian
// Jack


for name in names[...2] {
    print(name)
}
// Anna
// Alex
// Brian
```

半开范围运算符还有一个单边形式，只写入其最终值。就像你在两边都包含一个值一样，最终值不是范围的一部分。例如：

```swift
for name in names[..<2] {
    print(name)
}
// Anna
// Alex
```

单边范围可以用于其他上下文，而不仅仅是在下标中。您不能在省略第一个值的单边范围内迭代，因为不清楚迭代应该从哪里开始。您可以迭代省略其最终值的单边范围；但是，由于范围无限期持续，请确保为循环添加显式结束条件。您还可以检查单边范围是否包含特定值，如下代码所示。

```swift
let range = ...5
range.contains(7)   // false
range.contains(4)   // true
range.contains(-1)  // true
```

## 逻辑操作符

逻辑运算符修改或组合布尔逻辑值true和false。Swift支持基于C的语言中的三个标准逻辑运算符：

- 逻辑非（!A）
- 逻辑与（a && b）
- 逻辑或（a || b）

### 逻辑非

逻辑非运算符（!A）反转布尔值，以便真变为假，假变为真。

逻辑非运算符是一个前缀运算符，出现在它操作的值之前，没有任何空格。它可以被解读为“不是a”，如以下示例所示：

```swift
let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}
// Prints "ACCESS DENIED"
```
短语如果！allowedEntry可以读作“如果不允许进入”。仅当“不允许进入”为真时，才会执行后续行；即如果允许进入为假。

就像本例一样，仔细选择布尔常量和变量名称有助于保持代码的可读性和简洁性，同时避免双重否定或令人困惑的逻辑语句。

### 逻辑与

逻辑与运算符（a && b）创建逻辑表达式，其中两个值都必须为真，整体表达式也为真。

如果任一值为假，则整体表达式也将为假。事实上，如果第一个值为false，第二个值甚至不会被计算，因为它不可能使整体表达式等同于true。这被称为短路评估。

本例考虑两个布尔值，只有在两个值都为真时才允许访问：

```swift
let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "ACCESS DENIED"
```

### 逻辑或  

逻辑或 运算符（a || b）是由两个相邻的管道字符组成的内缀运算符。你用它来创建逻辑表达式，其中两个值中只有一个为真，整个表达式才为真。

与上面的逻辑AND运算符一样，逻辑OR运算符使用短路评估来考虑其表达式。如果逻辑OR表达式的左侧为真，则不会对右侧进行评估，因为它无法更改整体表达式的结果。

在下面的示例中，第一个布尔值（hasDoorKey）为false，但第二个值（knowsOverridePassword）为true。由于一个值为真，整体表达式也评估为真，并允许访问：

```swift
let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "Welcome!"
```

### 结合逻辑运算符

您可以组合多个逻辑运算符来创建更长的复合表达式：

```swift
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "Welcome!"
```

本例使用多个&&和||运算符来创建一个更长的复合表达式。然而，&&和||运算符仍然只在两个值上运行，因此这实际上是三个较小的表达式链在一起。这个例子可以读作：

如果我们输入了正确的门密码并通过了视网膜扫描，或者我们有有效的门钥匙，或者我们知道紧急覆盖密码，那么允许访问。

基于entertDoorCode、passedRetinaScan和hasDoorKey的值，前两个子表达式为false。然而，紧急覆盖密码是已知的，因此整体复合表达式仍然评估为真。

> Swift逻辑运算符&&和||是左关联的，这意味着具有多个逻辑运算符的复合表达式首先评估最左边的子表达式。

### 显式括号

有时，当不需要括号时，包含括号是有用的，以使复杂表达式的意图更容易阅读。在上面的门访问示例中，在复合表达式的第一部分周围添加括号，以明确其意图是有用的：

```swift
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "Welcome!"
```

括号清楚地表明，前两个值被视为整体逻辑中单独可能状态的一部分。复合表达的输出没有改变，但整体意图对读者来说更清晰。可读性总是优于简洁；使用括号来帮助明确你的意图。
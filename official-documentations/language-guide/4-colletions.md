#  [集合类型](https://doc.swiftgg.team/documentation/the-swift-programming-language-----/collectiontypes)

> 使用数组、集合和字典组织数据。

----

swift提供了三种主要的集合类型：

- 数组Array: 有序的值集合
- 集合Set: 无序的唯一值集合
- 字典Dictionary: 无序的键值对关联集合

## 集合的可变性

- 集合类型赋值给变量，则是可变的
- 赋值给常量，则改集合不可变，大小和内容无法更改

## 数组

存储相同类型的一组有序的值，相同值可多次出现。

### 数组类型的简写

完整写法 Array<Element>
简写写法 [Element]

### 创建空数组

```swift
var someInts: [Int] = []
print("someInts is of type [Int] with \(someInts.count) items.")
// 打印 "someInts is of type [Int] with 0 items."
```

### 使用默认值创建数组

```swift
// 创建一个包含 3 个 Double 值的新数组
var threeDoubles = Array(repeating: 0.0, count: 3)
// threeDoubles 的类型是 [Double]，并且等于 [0.0, 0.0, 0.0]
```

### 通过合并两个数组创建新数组

```swift
// 使用 + 运算符合并两个数组
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
// anotherThreeDoubles 的类型是 [Double]，并且等于 [2.5, 2.5, 2.5]

var sixDoubles = threeDoubles + anotherThreeDoubles
// sixDoubles 被推断为 [Double] 类型，并且等于 [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]
```

### 使用数组字面量创建数组

```swift
[<#value 1#>, <#value 2#>, <#value 3#>

var shoppingList: [String] = ["Eggs", "Milk"]
// shoppingList 已经用两个初始项进行了初始化]
```

### 访问和修改数组

```swift
// 要找出数组中的项数，可以检查其只读属性 count：
print("The shopping list contains \(shoppingList.count) items.")// 打印 “The shopping list contains 2 items.“

// 使用布尔值 isEmpty 属性作为检查 count 属性是否等于 0 的快捷方式：
if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list isn't empty.")
} // 打印 “The shopping list isn't empty.“

// 您可以通过调用数组的 append(_:) 方法将新元素添加到数组的末尾：
shoppingList.append("Flour") // shoppingList 现在包含 3 项，而有人正在做煎饼

// 或者，可以使用加法赋值运算符（+=）将一个或多个兼容项的数组追加到现有数组中：
shoppingList += ["Baking Powder"] // shoppingList 现在包含 4 项
shoppingList += ["Chocolate Spread", "Cheese", "Butter"] // shoppingList 现在包含 7 项

// 使用 下标语法 从数组中检索值，在数组名称后面的方括号内传递要检索的值的索引
var firstItem = shoppingList[0] // firstItem 的值为 “Eggs”

// 使用下标语法来更改给定索引处的现有值
shoppingList[0] = "Six eggs" // 列表中的第一个项现在是 “Six eggs” 而不是 “Eggs”

// 使用范围值，一次性修改多个值，即使替换值集的长度与要替换的范围不同
var fruits = ["apple", "banana", "strawberry", "pear"]
print(fruits) // ["apple", "banana", "strawberry", "pear"]
fruits[1...3] = ["kiwi","dragon eye"]
print(fruits) // ["apple", "kiwi", "dragon eye"]

// 将项目插入数组中指定索引处，请调用数组的 insert(_:at:) 方法
shoppingList.insert("Maple Syrup", at: 0)
// shoppingList 现在包含 7 项
// ”Maple Syrup“ 现在是列表中的第一项

// 使用 remove(at:) 方法从数组中删除项目
let mapleSyrup = shoppingList.remove(at: 0)
// 索引 0 处的项刚刚被移除了
// shoppingList 现在包含 6 项，且不包含 Maple Syrup
// mapleSyrup 常量现在等于已移除的 “Maple Syrup” 字符串

// 删除最后一项使用 removeLast() 方法，返回以删除项目的值
let apples = shoppingList.removeLast()
// 数组中的最后一项刚刚被移除了
// shoppingList 现在包含 5 项，且不包含 apples
// apples 常量现在等于已移除的 “Apples” 字符串
```

### 遍历数组

您可以使用 for-in 循环遍历数组中整个的值的集合：

```swift
for item in shoppingList {
    print(item)
}
// Six eggs
// Milk
// Flour
// Baking Powder
// Bananas
```

使用 enumerated() 方法遍历数组，访问项目的整数索引及其值，enumerated() 方法返回一个由整数和项组成的元组。

```swift
for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}
// Item 1: Six eggs
// Item 2: Milk
// Item 3: Flour
// Item 4: Baking Powder
// Item 5: Bananas
```

## 集合

集合 将相同类型的不同值存储在没有定义序列化的集合中。当项的顺序不重要，或者需要确保项只出现一次时，可以使用集合而不是数组。

### 集合类型的哈希值

一个类型必须是 可哈希的 才能存储在集合中，Swift 的所有基本类型（如 String、Int、Double 和 Bool）默认都是可哈希的，可以用作集合的值类型或字典的键类型。没有关联值的枚举 case 值（如 枚举 中描述的那样）默认也是可哈希的。

自定义类型可以通过实现Hashable协议来指定自己的哈希值。

### 集类型语法

集合类型写作 Set<Element>, 没有简写

### 创建和初始化一个空集

```swift
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")
// 打印 “letters is of type Set<Character> with 0 items.“
```

### 使用数组字面量创建集合

```swift
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
// favoriteGenres 已经用三个初始元素进行了初始化

//  Swift 的类型推断功能，如果你使用一个只包含单一类型值的数组字面量进行初始化，就无需写出集合元素的类型
var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]
```

### 访问和修改集合

```swift
// 你可以用 count 属性来计算集合中的项目数量
print("I have \(favoriteGenres.count) favorite music genres.")
// 打印 “I have 3 favorite music genres.”

// 使用isEmpty属性来检查集合是否为空
if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
} else {
    print("I have particular music preferences.")
} // 打印 “I have particular music preferences.”

// 使用 insert(_:) 方法来添加元素
favoriteGenres.insert("Jazz")
// favoriteGenres 现在包含 4 项

// 使用 remove(_:) 方法来删除元素
favoriteGenres.remove("Rock")
// favoriteGenres 现在包含 3 项

// 使用 contains(_:) 方法来检查集合是否包含特定的值
if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
} // 打印 “It's too funky in here.” 
```

### 遍历集合

您可以使用 for-in 循环遍历集合中的值。

```swift
for genre in favoriteGenres {
    print(genre)
}
// Classical
// Hip hop
// Jazz

// sorted()方法，返回一个有序数组，使用<运算符排序
for genre in favoriteGenres.sorted() {
    print("\(genre)")
}
// Classical
// Hip hop
// Jazz
```

### 基本集合操作

- 使用 intersection(_:) 方法创建一个只包含两个集合共有值的新集合。
- 使用 symmetricDifference(_:) 方法创建一个包含两个集合中存在但不同时存在的值的新集合。
- 使用 union(_:) 方法创建一个包含两个集合中所有值的新集合。
- 使用 subtracting(_:) 方法创建一个不包含指定集合中值的新集合。

```swift
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]


oddDigits.union(evenDigits).sorted()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.intersection(evenDigits).sorted()
// []
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// [1, 9]
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
// [1, 2, 9]
```

### 集合成员关系与相等

超集，子集，不相交

- 使用 “等于” 运算符 （==）判断两个集合是否包含相同的所有值。
- 使用 isSubset(of:) 方法判断一个集合的所有值是否包含在指定集合中。
- 使用 isSuperset(of:) 方法判断一个集合是否包含指定集合中的所有值。
- 使用 isStrictSubset(of:) 或 isStrictSuperset(of:) 方法判断一个集合是否是指定集合的子集或超集（但不相等）。
- 使用 isDisjoint(with:) 方法判断两个集合是否没有共同的值。

```swift
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]


houseAnimals.isSubset(of: farmAnimals)
// true
farmAnimals.isSuperset(of: houseAnimals)
// true
farmAnimals.isDisjoint(with: cityAnimals)
// true
```

## 字典

字典 将相同类型的键与集合中相同类型的值之间的关联存储在集合中，没有定义顺序。

### 简写

Dictionary<Key, Value> 写作 [Key: Value]
 - Key 是可以用作字典键的值类型
 - Value 是字典为这些键存储的值类型

 ### 创建和初始化一个空字典

```swift
var namesOfIntegers: [Int: String] = [:]
var nameOfIntegers: Dictionary<Int, String> = [:]
var nameOfIntegers = [Int: String]()


namesOfIntegers[16] = "sixteen" // namesOfIntegers 现在包含 1 个键值对
namesOfIntegers = [:] // namesOfIntegers 再次成为一个类型为 [Int: String] 的空字典
```

### 使用字典字面量创建字典

```swift
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
```

### 访问和修改字典

```swift
// 使用只读属性 count 查看字典中的项数
print("The airports dictionary contains \(airports.count) items.")

// 使用isEmpty属性检查字典是否为空
if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary contains \(airports.count) items.")
} // 打印 “The airports dictionary contains 2 items.”

// 您可以使用下标语法向字典添加新元素
airports["LHR"] = "London"

// 也可以用下标语法 更新值
airports["LHR"] = "London Heathrow"

// 使用 updateValue(_:, forKey:) 方法来更新值
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}

// APL 已经从字典中删除
airports["APL"] = nil

// 使用 removeValue(forKey:) 方法来删除值
if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary doesn't contain a value for DUB.")
}

```

### 遍历字典

```swift
// 使用for-in便利字典 ，返回(key, value)元组
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

// 可以单独遍历，keys或者values

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

for airportName in airports.values {
    print("Airport name: \(airportName)")
}

// 可以使用keys，values属性初始化一个数组
let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)
// swift中的dictionary是无序的，使用sorted排序
let sortedCodes = [String](airports.keys).sorted()

```
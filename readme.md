# swiftui-learn

## ui

### 生命周期

## state

## router

## network

## db

## 模式

## SwiftUI 实现原理

### 单表达式隐式返回值

```swift
// before swift 5.0 
struct Rectangle {
    var width = 0.0, height = 0.0
    var area1: Double {
        return width * height
    }
    
    func area2() -> Double {
        return width * height 
    }
}

// after switft 5.1
struct Rectangle {
    var width = 0.0, height = 0.0
    var area1: Double { width * height }
    
    func area2() -> Double { width * height }
}
```

### @propertyWarpper

```swift
// before swift 5.0 
struct User {
    static var usesTouchID: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "USES_TOUCH_ID")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "USES_TOUCH_ID")
        }
    }
    static var isLoggedIn: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "LOGGED_IN")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "LOGGED_IN")
        }
    }
}

// after switft 5.1 
@propertyWrapper
struct UserDefault<T> {
    // 这里的属性 key 和 defaultValue 还有 init 方法都是实际业务中的业务代码
    let key: String
    let defaultValue: T

    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
        UserDefaults.standard.register(defaults: [key: defaultValue])
    }

    // wrappedValue 是 @propertyWrapper 必须实现的属性。
    // 当操作我们包裹的属性时，其具体的set get 方法走这里。
    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ??  defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}

struct User {
    @UserDefault("USES_TOUCH_ID", defaultValue: false)
    static var usesTouchID: Bool

    @UserDefault("LOGGED_IN", defaultValue: false)
    var isLoggedIn: Bool
}
let user = User()
User.usesTouchID = true
let usesTouchID = User.$usesTouchID
let isLoggedIn = user.$isLoggedIn
```

实际上属性包装器是在编译时期翻译为一下的代码, 并且编译器禁止使用 `$` 开头的标识符

```dart
struct User {
    static var $usesTouchID = UserDefault<Bool>("USES_TOUCH_ID", defaultValue: false)
    
    static var usesTouchID: Bool {
        set {
            $usesTouchID.value = newValue
        }
        get {
            $usesTouchID.value 
        }
    }

    @UserDefault("LOGGED_IN", defaultValue: false)
    var isLoggedIn: Bool
}
```

#### 如何理解 `@State` `@Binding`、`@EnvironmentObject` 和 `@ObjectBinding`?

### opaque result type
在 Swift 5.0 之前我们如果想返回抽象类型一般使用 Generic Type 或者 Protocol, 使用泛型会显示的暴露一些信息给 API 使用者，不是完整的类型抽象

但是使用 Protocol 也有几个限制: 泛型返回值在运行时都是一个容器，效率较差，返回值不能调用自身类型的方法，协议不允许拥有关联类型，由于编译时丢失了类型信息，编译器无法推断类型，导致无法使用 `==` 运算符。

这个特性使用 `some` 修饰协议返回值，具有一下特性:

* 所有的条件分支只能返回一个特定类型，不同则会编译报错
* 方法使用者依旧无法知道类型，（使用方不透明）
* 编译器知情具体类型，因此可以使用类型推断。

### @ViewBuilder & @_functionBuilder

## 参考阅读
* [系列文章深度解读|SwiftUI 背后那些事儿](https://developer.aliyun.com/article/706780)
* [干货 | 关于SwiftUI，看这一篇就够了](https://cloud.tencent.com/developer/article/1511093)






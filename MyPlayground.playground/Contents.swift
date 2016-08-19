//: Playground - noun: a place where people can play

import UIKit

//var str: String?
//
//let str1 = str ?? "Hello, playground"
//
//let str2 = str != nil ? str : "Hello, playground"

var str: String?
str = "Hello, playground"
print(str?.characters.count)

// using optinal binding
if let count = str?.characters.count {
    print(count)
}

struct Person {
    var name: String
    var age: Int
}

let xiaoming = Person(name: "xiaoming", age: 19)
let r = Mirror(reflecting: xiaoming)
let count = r.children.count

dump(xiaoming)
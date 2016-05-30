//
//  ViewController.swift
//  swift-day06-枚举
//
//  Created by 万安 on 16/4/27.
//  Copyright © 2016年 penglei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //******************************枚举************************
        //Swift 中的枚举更加灵活，不必给每一个枚举成员提供一个值。如果给枚举成员提供一个值（称为“原始”值），则该值的类型可以是字符串，字符，或是一个整型值或浮点数,使用enum关键词来创建枚举并且把它们的整个定义放在一对大括号内,这些枚举成员的名字大写字母开头
        enum CompassPonit {
             case North
             case South
             case East
             case West
            }
        //枚举中定义的值（如 North，South，East和West）是这个枚举的成员值（或成员）。你使用case关键字来定义一个新的枚举成员值
        //多个成员值可以出现在同一行上，用逗号隔开
        enum  CompassPonit1{
        
            case North,South,East, West
        
        }
        //directionToHead的类型可以在它被CompassPoint的某个值初始化时推断出来。一旦directionToHead被声明为CompassPoint类型，你可以使用更简短的点语法将其设置为另一个CompassPoint的值：
        var directionToHead = CompassPonit.West
        //当directionToHead的类型已知时，再次为其赋值可以省略枚举类型名。在使用具有显式类型的枚举值时，这种写法让代码具有更好的可读性
        directionToHead = .East
        //使用switch语句匹配单个枚举值
        switch directionToHead {
        case .North:
            print("North");
        case .East:
             print("East")
        case .South:
              print("South")
        case .West:
             print("west")
        
        
        }
        //关联值：Swift 枚举来存储任意类型的关联值，如果需要的话，每个枚举成员的关联值类型可以各不相同。枚举的这种特性跟其他语言中的可识别联合（discriminated unions），标签联合（tagged unions），或者变体（variants）相似。
        enum Barcode{
           case MARK1(Int,Int,Int)
           case MARK2(String,Int)
        }
        var pruduct = Barcode.MARK1(1, 2, 3)
        pruduct = .MARK2("hhh", 3)
        switch pruduct{
        case .MARK1(let number1, let number2,let number3):
            print("mark1:\(number1),\(number2),\(number3)");
        case .MARK2(let string , let number):
            print("mark2:\(string),\(number)")
        
        }
        //如果一个枚举成员的所有关联值都被提取为常量，或者都被提取为变量，为了简洁，你可以只在成员名称前标注一个let或者var
        switch pruduct{
        case let .MARK1(number1, number2, number3):
            print("mark1:\(number1),\(number2),\(number3)");
        case let .MARK2( string ,  number):
            print("mark2:\(string),\(number)")
            
        }
        //原始值:在关联值小节的条形码例子中，演示了如何声明存储不同类型关联值的枚举成员。作为关联值的替代选择，枚举成员可以被默认值（称为原始值）预填充，这些原始值的类型必须相同。原始值可以是字符串，字符，或者任意整型值或浮点型值。每个原始值在枚举声明中必须是唯一的,原始值和关联值是不同的。原始值是在定义枚举时被预先填充的值。对于一个特定的枚举成员，它的原始值始终不变。关联值是创建一个基于枚举成员的常量或变量时才设置的值，枚举成员的关联值可以变化
        enum testName:String{
          case one = "1"
          case two = "2"
          case three = "3"
        
        }
        //原始值的隐式赋值,在使用原始值为整数或者字符串类型的枚举时，不需要显式地为每一个枚举成员设置原始值，Swift 将会自动为你赋值
        //使用整数作为原始值时，隐式赋值的值依次递增1
        enum Planet:Int{
         
          case number1 = 1,number2,number3,number
        
        }
        //当使用字符串作为枚举类型的原始值时，每个枚举成员的隐式原始值为该枚举成员的名称。使用枚举成员的rawValue属性可以访问该枚举成员的原始值
        enum testPoint:String{
            case North
            case South
            case East
            case West
        
        }
        let planet1 = Planet.number.rawValue;
        let test1 = testPoint.North.rawValue;
        print("planet1 = \(planet1),test1 = \(test1)");//打印结果：planet1 = 4,test1 = North
        //如果在定义枚举类型的时候使用了原始值，那么将会自动获得一个初始化方法，这个方法接收一个叫做rawValue的参数，参数类型即为原始值类型，返回值则是枚举成员或nil。你可以使用这个初始化方法来创建一个新的枚举实例
        let possiblePlanet = Planet(rawValue: 3)
       //possiblePlanet 类型为 Planet? 值为 Planet.number3,并非所有Int值都可以找到一个匹配的行星。因此，原始值构造器总是返回一个可选的枚举成员。在上面的例子中，possiblePlanet是Planet?类型，或者说“可选的Planet”。
        print(possiblePlanet!)//打印结果:number3
        //递归枚举：递归枚举（recursive enumeration）是一种枚举类型，它有一个或多个枚举成员使用该枚举类型的实例作为关联值。使用递归枚举时，编译器会插入一个间接层。你可以在枚举成员前加上indirect来表示该成员可递归。
        enum ArithmeticExpression{
           case NUmber(Int)
           indirect case Addition(ArithmeticExpression,ArithmeticExpression)
           indirect case Mutiplication(ArithmeticExpression,ArithmeticExpression)
         
        
        }
        //你也可以在枚举类型开头加上indirect关键字来表明它的所有成员都是可递归的
       indirect  enum ArithmeticExpression1{
            case NUmber(Int)
            case Addition(ArithmeticExpression1,ArithmeticExpression1)
            case Mutiplication(ArithmeticExpression1,ArithmeticExpression1)
            
            
        }
        //要操作具有递归性质的数据结构，使用递归函数是一种直截了当的方式
        func evaluate(expression:ArithmeticExpression)-> Int{
            
            switch expression {
            case .NUmber(let value):
                return value;
            case .Addition(let left, let right):
                return evaluate(left) + evaluate(right)
            case .Mutiplication(let left , let right):
                 return evaluate(left)*evaluate(right)
            
            }
        
        }
        //计算 （50+2）*10
        let five = ArithmeticExpression.NUmber(50)
        let four = ArithmeticExpression.NUmber(2)
        let sum = ArithmeticExpression.Addition(five, four)
        let product = ArithmeticExpression.Mutiplication(sum, ArithmeticExpression.NUmber(10))
        print("(50+2)*10 = \(evaluate(product))")//打印结果：(50+2)*10 = 520
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


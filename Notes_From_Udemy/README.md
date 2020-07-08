# Notes From Udemy
### To organize what I learned from Udemy such as theories and tips.
* Computed Properties

Getter

A getter will execute the code in order to get the value of its property.
You don’t need to create an extra method.

e.g. 
```swift
var calcNumber: Int {
    get {
        return calcNumber - 4
    }
}
```

Setter 

A setter allows you to specify some code that should be executed when its value is set.

Called the exact moment that the property is set with a new value.

newValue is predefined in the setter.

e.g. 
```swift
var calcNumber: Int {
    get {
        return calcNumber - 4
    }
    set {
        print(“calcNumber has a new value, \(newValue)”)
    }
}    

calcNumber = 12
```

Complete e.g. with Pizza Calculator
```swift
import Foundation

let pizzaInches: Int = 12
var numberOfPeople: Int = 4
let slicesPerPerson: Int = 4

var numberOfSlices: Int {
    get {
        return pizzaInches - 4
    }
}

var numberOfPizza: Int {
    get {
        let numberOfPeopleFedPerPizza = numberOfSlices / slicesPerPerson
        return numberOfPeople / numberOfPeopleFedPerPizza
    }
    set {
        let totalSlices = numberOfSlices * newValue
        numberOfPeople = totalSlices / slicesPerPerson
    }
}

numberOfPizza = 2
print(numberOfPeople)

Observed Properties

willSet { executing first }
didSet { coming straight afterwards }

e.g. var pizzaInches: Int = 12 {
    willSet {
    }
    didSet {
        if pizzaInches >= 18 {
            print("Invalid size specified, pizzaInInches set to 18.")
            pizzaInches = 18
        }
    }
}

pizzaInches = 33
print(pizzaInches)
```

Challenge

e.g. 
```swift
import Foundation

var width: Float = 1.5
var height: Float = 2.3

var bucketOfPaint: Int {
    get {
        let area = width * height
        let areaCoveredPerBucket: Float = 1.5
        let numberOfBuckets = area / areaCoveredPerBucket
        let roundedBuckets = ceilf(numberOfBuckets) // round up
        return Int(roundedBuckets)
    }
    set {
        let areaCanCover = Double(newValue) * 1.5
        print("This amount of paint can cover an area of \(areaCanCover)")
    }
}

print(bucketOfPaint)

bucketOfPaint = 2
```

**Computed Properties is useful in cutting down on unnecessary functions and methods and it also makes your code a lot easier to maintain.**

* Difference between Cocoa Touch Class and Swift File

Cocoa Touch Class: When you want subclass

Swift File: When you create your own custom class

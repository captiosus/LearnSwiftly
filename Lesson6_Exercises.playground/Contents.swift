//: ## Lesson 6 Exercises - Classes, Properties and Methods

import UIKit

//: __Problem 1__
//:
//: __1a.__
//: The compiler is complaining because the class Animal has no initializers. Write an init method for the Animal class and quiet this error. Include a mechanism to initialize the length of the Animal's tail using the Tail struct provided.
struct Tail {
    let lengthInCm: Double
}

class Animal {
    let species: String
    let tail: Tail
    
    init(species: String, tail: Double) {
        self.species = species
        self.tail = Tail(lengthInCm: tail)
    }
}
//: __1b.__
//: Instantiate and initialize a few different Animals.
var cat = Animal.init(species: "Cat", tail: 100)
var dog = Animal.init(species: "Dog", tail: 150)
//: __Problem 2__
//:
//: Below are the beginnings of the Peach class.
class Peach {
    let variety: String
    
    // Softness is rated on a scale from 1 to 5, with 5 being the softest
    var softness: Int
    
    let varieties = [String]()
    
    init(variety: String, softness: Int) {
        self.variety = variety
        self.softness = softness
    }
    func ripen() {
        if self.softness++ > 4 {
            print("Ripe")
        }
        else {
            print("Nope")
        }
    }
}
var peach = Peach.init(variety: "Georgia", softness: 3)
peach.ripen()
//: __2a.__
//: Add a type property to the Peach class called "varieties". It should hold an array of different types of peaches.
//:
//: __2b.__
//: Add an instance method called ripen() that increases the value of the stored property, softness, and returns a string indicating whether the peach is ripe.
//:
//: __2c.__
//: Create an instance of the Peach class and call the method ripen().

//: __Problem 3__
//:
//: __3a.__
//:Add the computed property, "cuddlability", to the class, FluffyDog. Cuddlability should be computed based on the values of the stored properties, fluffiness and droolFactor.
class FluffyDog {
    let name: String
    let fluffiness: Int
    let droolFactor: Int
    let cuddlability: Int
    
    init(name: String, fluffiness: Int, droolFactor: Int) {
        self.name = name
        self.fluffiness = fluffiness
        self.droolFactor = droolFactor
        self.cuddlability = fluffiness - droolFactor
    }
    
    func chase(wheeledVehicle: String)-> String {
        return "Where are you going, \(wheeledVehicle)? Wait for me! No, don't go! I will catch you!"
    }
}
//: __3b.__
//: Instantiate and initialize an instance of the class, FluffyDog. Use it to call the method, chase().
var doggy = FluffyDog.init(name: "Leon", fluffiness: 3, droolFactor: 2)
print(doggy.chase("Car"))

//: __Problem 4__
//:
//: __4a.__
//: Write an instance method, bark(), that returns a different string based on the value of the stored property, size.
enum Size: Int {
    case Small
    case Medium
    case Large
}

class ChattyDog {
    let name: String
    let breed: String
    let size: Size
    
    init(name: String, breed: String, size: Size) {
        self.name = name
        self.breed = breed
        self.size = size
    }
    func bark(size: Size) -> String{
        switch size {
        case .Small:
            return "woof"
        case .Medium:
            return "bark"
        case .Large:
            return "BAAARRK"
        }
    }
    func speak(size: Size) -> String{
        switch size {
        case .Small:
            return "woof"
        case .Medium:
            return "bark"
        case .Large:
            return "BAAARRK"
        }
    }

}
//: __4b.__
//: Create an instance of ChattyDog and use it to call the method, bark().
var woofdog = ChattyDog(name: "Leon", breed: "Trash", size: .Medium)
woofdog.bark(woofdog.size)
//: __4c.__
//: Rewrite the method, bark(), as a type method and rename it speak(). Call your type method to test it out.
woofdog.speak(.Medium)
//: __Problem 5__
//:
//:__5a.__
//: Write an initialization method for the House class below.
enum Quality {
    case Poor, Fair, Good, Excellent
}

enum NaturalDisaster {
    case Earthquake
    case Wildfire
    case Hurricane
}

class House {
    let numberOfBedrooms: Int
    let location: Quality
 
    init(numberOfBedrooms: Int, location: Quality) {
        self.numberOfBedrooms = numberOfBedrooms
        self.location = location
    }
    
    func willStayStanding(naturalDisaster:NaturalDisaster)-> Bool {
        switch naturalDisaster {
        case .Earthquake:
            return true
        case .Wildfire:
            return true
        case .Hurricane:
            return false
        }
    }
    func worthyOfAnOffer() -> Bool {
        if numberOfBedrooms > 3 {
            switch location {
            case .Excellent:
                return true;
            case .Good:
                return true;
            default:
                return false;
            }
        }
        else {
            return false;
        }
    }
}

//: __5b.__
//: Create an instance of the House class and use it to call the method, willStayStanding().  This method takes in a parameter of type NaturalDisaster and return a Bool indicating whether the house will stay standing in a given natural disaster.
var house = House(numberOfBedrooms: 5, location: .Good)
house.willStayStanding(.Earthquake)
//: __5c.__
//: Add a computed property called, "worthyOfAnOffer". This property should be a Bool, whose return value is dependent upon some combination of the stored properties, numberOfBedrooms and location.
house.worthyOfAnOffer()

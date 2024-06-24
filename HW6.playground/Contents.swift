import UIKit

class Person {
    var fullName: String
    var age: Int
    var passport: Passport?
    
    init(fullName: String, age: Int) {
        self.fullName = fullName
        self.age = age
        print("person \(fullName) init")
    }
    deinit {
        print("person \(fullName) deinit")
    }
}

class Passport {
    var series: Int
    var number: Int
    var Date: String
    weak var owner: Person?
    
    init(series: Int, number: Int, Date: String, owner: Person) {
        self.series = series
        self.number = number
        self.Date = Date
        self.owner = owner
        print("Passport \(series) \(number) init")
    }
    
    deinit {
        print("Passport \(series) \(number) deinit")
    }
}

class Factory {
    private var titleFactory: String
    private var customers: [Person] = []
    private var typeMaterials: [Material] = []
    
    init(title: String) {
        self.titleFactory = title
        print("Factory \(titleFactory) initialized")
    }
    
    func addCustomer(_ customer: Person) {
        customers.append(customer)
    }
    
    func addMaterial(_ material: Material) {
        typeMaterials.append(material)
    }
    
    deinit {
        print("Factory \(titleFactory) deinitialized")
    }
}

class Material {
    var name: String
    var price: Double
    var count: Int
    
    
    init(name: String, price: Double, count: Int) {
        self.name = name
        self.price = price
        self.count = count
        print("Material \(name) initialized")
    }
    
    deinit {
        print("Material \(name) deinitialized")
    }
}

func testFactoryAndPerson() {
    var vasiliy = Person(fullName: "Vasiliy", age: 18)
    var passportVasiliy = Passport(series: 8888, number: 777777, Date: "19.10.1999", owner: vasiliy)
    
    var steel = Material(name: "Steel", price: 9.99, count: 10)
    
    var FactorySteel = Factory(title: "Steel Factory")

}

testFactoryAndPerson()

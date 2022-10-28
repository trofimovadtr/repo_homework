import Foundation
struct Queue<T: Comparable>{
    private var elements: [T] = []
    mutating func push(_ element: T){
        elements.append(element)
    }
    mutating func pop()-> T{
        return elements.removeFirst()
    }
    subscript (index: Int) -> T? {
        return (index < elements.count ? elements[index] : nil)
    }
    func SortAZ() -> [T]{
        return elements.sorted(by: <)
    }
    func founder(element: T){
        print ("Naideni \(elements.filter{$0 == element})")
    }
}
var family = Queue<String> ()
    family.push("Trofimov")
    family.push("Ivanov")
    family.push("Sidorov")
    family.push("Petrov")
print(family)
family.pop()
print(family)
family.push("Konev")
family.push("Konev")
family.pop()
print(family)
print(family[1]!)
print(family.SortAZ())
var numbers = Queue<Int>()
numbers.push(12)
numbers.push(4)
numbers.push(60)
family.founder(element: "Konev")


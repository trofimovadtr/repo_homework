import Foundation

//Написать функцию, которая определяет, четное число или нет.
func chetnost(_ x: Int) -> Bool{
    if ((Float(x)/2 > Float(x/2))&&(x>0))||((Float(x)/2 < Float(x/2))&&(x<0)) {
        //print("Nechetnoe")
        return false
    }
    else if (x==0){
        //print("Vi vveli 0")
        return false
    }
    else {
        //print("Chetnoe")
        return true
    }
    }
var vvod: Int
chetnost(-100)
//Написать функцию, которая определяет, делится ли число без остатка на 3.
func trio(_ x: Int) -> Bool {
    if ((Float(x)/3 > Float(x/3))&&(x>0))||((Float(x)/3 < Float(x/3))&&(x<0)) {
        //print("Ne delitsa na 3 bez ostatka")
        return false
    }
    else {
        //print("Delitsa na 3 bez ostatka")
        return true
    }
}
trio(97)
//Создать возрастающий массив из 100 чисел.
var SomeInts = [Int]()
for i in 0 ... 99 {
    SomeInts.append(i)
}
print(SomeInts)

//Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
var counter: Int = 0
while counter < SomeInts.count {
    if chetnost(SomeInts[counter])||(!trio(SomeInts[counter])) {
        SomeInts.remove(at: counter)
    }
    else{
        counter+=1
    }
}
print(SomeInts)
//Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.
var newAR = [Int]()
//newAR.append(0)
func fibonac (_ ArrayFiB: inout [Int],numberElement key: Int){
    var newfibon: Int
    if (key >= 1) && (ArrayFiB.count >= 2) {
        for _ in 1...key {
            newfibon = ArrayFiB[ArrayFiB.count-1]+ArrayFiB[ArrayFiB.count-2]
            ArrayFiB.append(newfibon)
        }
    }
    else if (key >= 1) && (ArrayFiB.count == 1) {
        if key == 1{
            ArrayFiB.append(1)
        }else {
            ArrayFiB.append(1)
            for _ in 1...key-1 {
                newfibon = ArrayFiB[ArrayFiB.count-1]+ArrayFiB[ArrayFiB.count-2]
                ArrayFiB.append(newfibon)
            }
        }
        
    }
    else if (key >= 1) && (ArrayFiB.count == 0){
        if key == 1 {
            ArrayFiB.append(0)
        }
        else if key == 2{
            ArrayFiB.append(0)
            ArrayFiB.append(1)
        }
        else{
            ArrayFiB.append(0)
            ArrayFiB.append(1)
            for _ in 1...key {
                newfibon = ArrayFiB[ArrayFiB.count-1]+ArrayFiB[ArrayFiB.count-2]
                ArrayFiB.append(newfibon)
            }
        }
        
    }
}
fibonac(&newAR, numberElement: 6)
print(newAR)
print(SomeInts)
/*Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
b. Пусть переменная p изначально равна двум — первому простому числу.
c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p..
d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
e. Повторять шаги c и d, пока возможно.*/
var PrimeNumber = [Int]()
func AddPrimeNumbers(_ SomeArray: inout [Int],NumberofElements key: Int){
    var p: Int = 3
    SomeArray.append(2)
    var k: Int = 0
    for _ in 1 ... key-1 {
        let Razmer: Int = SomeArray.count
        while SomeArray.count == Razmer {
            if p % SomeArray[k] == 0 {
                p+=1
                k = 0
            }
            else if k==SomeArray.count-1{
                SomeArray.append(p)
                k = 0
            }
            else {
                k+=1
            }
        }
        }
}
    
AddPrimeNumbers(&PrimeNumber, NumberofElements: 100)
print(PrimeNumber, PrimeNumber.count)


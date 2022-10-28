import Foundation
//решение квадратного уравнения
let a: Float = 2
let b: Float = 4
let c: Float = 2
var d: Float = b*b-4*a*c
if d > 0  {
    print("Корни уравнения:\nX1=",(-b+sqrt(d))/(2*a),"\nX2=",(-b-sqrt(d))/(2*a))
}
else if d == 0 {
    print("Корень уравнения:\nX=",(-b)/(2*a))
}
else {
    print("Корней нет")
}
//Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника
let katet1: Float = 3
let katet2: Float = 4
var gipotenuza: Float = sqrt(katet1*katet1+katet2*katet2)
print("Площадь треугольника S=:", katet1*katet2/2, "\nГипотенуза треугольника С =",gipotenuza, "\nДлина периметра P=",katet1+katet2+gipotenuza)
    //Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет
let summ: Float = 5
let procent: Float = 10
var itog: Float = summ
for _ in 1 ... 5 {
itog=itog*(1+procent/100)
}
print("Сумма по вкладу через 5 лет составит:", String(format:"%.2f", itog))





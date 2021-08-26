//
//  Question.swift
//  WWTBAB
//
//  Created by Lev Bazhkov on 25.08.2021.
//

import Foundation

struct Question {
    let question: String
    let answerOne: (Bool, String)
    let answerTwo: (Bool, String)
    let answerThree: (Bool, String)
    let answerFour: (Bool, String)
    let image: String
    let questionCost: Int
}

let questionOne = Question(question: "На каком инструменте, как считается, играл древнерусский певец и сказитель Боян?", answerOne: (true, "На гуслях"), answerTwo: (false, "На виолончели"), answerThree: (false, "На баяне"), answerFour: (false, "На гитаре"), image: "https://dropi.ru/img/uploads/test/2019-03-13/ccb415836c40b73ca8cd185ea633f9bc.jpeg", questionCost: 1)
let questionTwo = Question(question: "В какой из этих стран один из официальных языков - французский?", answerOne: (true, "Республика Гаити"), answerTwo: (false, "Кения"), answerThree: (false, "Эквадор"), answerFour: (false, "Венесуэла"), image: "https://dropi.ru/img/uploads/test/2019-03-13/f6aff354da9556bc39b3c6db8b2b9b41.jpeg", questionCost: 10)
let questionThree = Question(question: "В каком из этих фильмов не снимался Александр Абдулов?", answerOne: (false, "Карнавал"), answerTwo: (true, "Московские каникулы"), answerThree: (false, "Чародеи"), answerFour: (false, "Убить дракона"), image: "https://dropi.ru/img/uploads/test/2019-03-13/613057f2e3b0427e5324a997c81297ce.jpeg", questionCost: 50)
let questionFour = Question(question: "В каком году произошла Куликовская битва?", answerOne: (true, "1380"), answerTwo: (false, "1569"), answerThree: (false, "1616"), answerFour: (false, "1773"), image: "https://dropi.ru/img/uploads/test/2019-03-13/457825ae807ab549d7eb4bb8ef070b5d.jpeg", questionCost: 100)
let questionFive = Question(question: "Кто автор музыки к детской песенке Чунга-Чанга?", answerOne: (true, "Шаинский"), answerTwo: (false, "Зацепин"), answerThree: (false, "Дербенёв"), answerFour: (false, "Шпиц"), image: "https://dropi.ru/img/uploads/test/2019-03-13/0d25f5d08f3cb7cbcb48039632b6bfad.jpeg", questionCost: 1000)
let questionSix = Question(question: "Какая картина Малевича находится в Русском музее?", answerOne: (true, "Красный квадрат"), answerTwo: (false, "Белый квадрат"), answerThree: (false, "Чёрный квадрат"), answerFour: (false, "Точильщик"), image: "https://dropi.ru/img/uploads/test/2019-03-13/7de4dafff80886fb1f1d640a1c3efc99.jpeg", questionCost: 10_000)
let questionSeven = Question(question: "Шкала Сковилла - это шкала оценки...", answerOne: (false, "Качества атмосферного воздуха"), answerTwo: (false, "Привлекательности женщин"), answerThree: (true, "Остроты перца"), answerFour: (false, "Уровня моря"), image: "https://dropi.ru/img/uploads/test/2019-03-13/c64dd1015d600f68265e6555c58dcfe3.jpeg", questionCost: 100_000)
let questionEight = Question(question: "Какой титул имел Дон Кихот?", answerOne: (false, "Барон"), answerTwo: (false, "Маркиз"), answerThree: (true, "Идальго"), answerFour: (false, "Вождь"), image: "https://dropi.ru/img/uploads/test/2019-03-13/68070712a146108eef82f725b8c22f44.jpeg", questionCost: 1_000_000)
let questionNine = Question(question: "Кто автор антиутопического романа «О дивный новый мир?»", answerOne: (true, "Олдос Хаксли"), answerTwo: (false, "Рэй Брэдбери"), answerThree: (false, "Джордж Оруэлл"), answerFour: (false, "Сомерсет Моэм"), image: "https://dropi.ru/img/uploads/test/2019-03-13/68f6758f5a51b7c3145c8db23c71596e.jpeg", questionCost: 10_000_000)
let questionTen = Question(question: " Как называется самая глубокая точка поверхности Земли, находящаяся на дне Марианской впадины?", answerOne: (false, "Филиппинская плита"), answerTwo: (true, "Бездна Челленджера"), answerThree: (false, "Кермадек"), answerFour: (false, "Черное Логово"), image: "https://dropi.ru/img/uploads/test/2019-03-13/185a7872c4fddfc2b8b0d3c780a21e49.jpeg", questionCost: 1_000_000_000)

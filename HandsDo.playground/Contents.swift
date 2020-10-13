
struct Services: Codable {
    let headerService: String
    let services: [String]
    
    static let headersServicesTemp = [
        "Основные работы",
        "Ремонт и отделочные работы",
        "Установить или починить",
        "По комнатам"
    ]
    
    static let servicesTemp = [
        ["Электроника", "Сантехника", "Мелкий ремонт"],
        ["Двери", "Окна, балконы, лоджии", "Стены", "Пол", "Потолок", "Проекты и сметы"],
        ["Мебель", "IKEA", "Бытовая техника", "Кондиционеры, вентиляция", "Компьютеры, цифровая техника"],
        ["Гостиная", "Кухни", "Туалет и ванная", "Спальня", "Прихожая", "Кабинет"]
    ]
    
    static func getServices() -> [Services] {
        var myArray = [Services]()
        for value in 0..<headersServicesTemp.count {
            myArray.append(Services(headerService: headersServicesTemp[value], services: servicesTemp[value]))
        }
        
        return myArray
    }
}

for element in Services.getServices() {
    print("— \(element.headerService)")
    for value in element.services {
        print(value)
    }
    
    
}

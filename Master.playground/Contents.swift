

struct CitiesTable: Codable {
    let city: String
    let description: String
    
    static let cityTemp = ["Краснодар", "Volgograd", "Arkhangelsk", "Brooklyn", "Samara", "Rostov on Don", "Ryazan", "Батуми", "Москва", "Texas", "Krasnodar", "Тампа", "Алушта", "Sochi", "Тюмень", "Тольяти"]
    static let descriptionTemp = ["Все услуги", "IKEA: соберём, установим, повесим", "IKEA и другая мебель: соберём, установим, повесим", "IKEA: соберём, установим, повесим", "IKEA: соберём, установим, повесим", "IKEA: соберём, установим, повесим", "IKEA и другая мебель: соберём, установим, повесим", "IKEA: соберём, установим, повесим", "IKEA: соберём, установим, повесим", "IKEA: соберём, установим, повесим", "Все услуги", "IKEA и другая мебель: соберём, установим, повесим", "IKEA: соберём, установим, повесим", "IKEA: соберём, установим, повесим", "IKEA: соберём, установим, повесим", "IKEA: соберём, установим, повесим"]
    
    static func getCitiesModel() -> [CitiesTable]{
        var dataModel = [CitiesTable]()
        
        for index in 0..<cityTemp.count {
            dataModel.append(CitiesTable(city: cityTemp[index], description: descriptionTemp[index]))
        }
//        print(dataModel)
        return dataModel
    }
    
    static func getCityPrefix() -> [String] {
        var citySectionTitles = [String]()
        var cityDictionary = [String : [String]]()
        
        for city in cityTemp {
            let cityKey = String(city.prefix(1))
            if var cityValues = cityDictionary[cityKey] {
                cityValues.append(city)
                cityDictionary[cityKey] = cityValues
            } else {
                cityDictionary[cityKey] = [city]
            }
        }
        
        citySectionTitles = [String](cityDictionary.keys)
        citySectionTitles = citySectionTitles.sorted(by: <) // column of letters to the right
//        print(citySectionTitles)
        return citySectionTitles
    }
    
    
}
print(CitiesTable.getCitiesModel())
//CitiesTable.getCityPrefix()

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

for value in 0..<Services.headersServicesTemp.count {
//    print(Services.headersServicesTemp[value])
//    print(Services.servicesTemp[value])
}

for element in Services.getServices() {
//    print("— \(element.headerService)")
    for value in element.services {
//        print(value)
    }
    
    
}

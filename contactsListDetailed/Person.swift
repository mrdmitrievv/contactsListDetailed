struct Person {
    var name: String
    var surname: String
    var mail: String
    var telephoneNumber: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
}

extension Person {
    static func getContacts() -> [Person] {
        var contactsList = [Person]()
        
        let names = DataManager.shared.names.shuffled()
        let surnames = DataManager.shared.surnames.shuffled()
        let emails = DataManager.shared.emails.shuffled()
        let telephoneNumbers = DataManager.shared.telephoneNumbers.shuffled()
        
        for index in (0..<names.count) {
            let person = Person(name: names[index], surname: surnames[index], mail: emails[index], telephoneNumber: telephoneNumbers[index])
            contactsList.append(person)
        }
        
        return contactsList
    }
}

